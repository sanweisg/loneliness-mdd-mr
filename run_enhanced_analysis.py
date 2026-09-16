import pandas as pd, numpy as np, json, sys
from math import erf
from scipy.stats import chi2

sys.stdout.reconfigure(encoding='utf-8')

DIR = r'C:\Users\闫\Desktop\depression_paper_submission'
cols = ['SNP','A1','A2','BETA','SE','P']

mdd = pd.read_csv(f'{DIR}\\mdd_gwas.csv')[cols]
lon = pd.read_csv(f'{DIR}\\loneliness_full.csv')[cols]
ins = pd.read_csv(f'{DIR}\\insomnia_ukb_a13.csv')[cols]
print(f'Data: MDD={len(mdd)} Lon={len(lon)} Ins={len(ins)}')

lon_ivs = lon[lon['P']<5e-8][['SNP','A1','A2','BETA','SE']].copy()
ins_ivs = ins[ins['P']<5e-8][['SNP','A1','A2','BETA','SE']].copy()
print(f'IVs: Lon={len(lon_ivs)} Ins={len(ins_ivs)}')

def harmonize(exp_ivs, out_full):
    m = exp_ivs.merge(out_full[['SNP','A1','A2','BETA','SE']], on='SNP', suffixes=('_exp','_out'), how='inner')
    same = (m['A1_exp']==m['A1_out']) & (m['A2_exp']==m['A2_out'])
    flip = (m['A1_exp']==m['A2_out']) & (m['A2_exp']==m['A1_out'])
    m = m[same|flip].copy()
    mask = flip[same|flip].values
    m['beta_exp'] = m['BETA_exp'].copy()
    m.loc[mask, 'beta_exp'] = -m.loc[mask, 'BETA_exp']
    pali = ((m['A1_exp']=='A')&(m['A2_exp']=='T'))|((m['A1_exp']=='T')&(m['A2_exp']=='A'))|((m['A1_exp']=='G')&(m['A2_exp']=='C'))|((m['A1_exp']=='C')&(m['A2_exp']=='G'))
    return m[~pali]

h_lm = harmonize(lon_ivs, mdd)
h_im = harmonize(ins_ivs, mdd)
h_li = harmonize(lon_ivs, ins)
print(f'Matched: Lon->MDD={len(h_lm)} Ins->MDD={len(h_im)} Lon->Ins={len(h_li)}')

def norm_cdf(x):
    return 0.5*(1+erf(x/np.sqrt(2)))

def mr_ivw(bx, by, sy):
    w = 1/sy**2
    b = np.sum(w*bx*by)/np.sum(w*bx**2)
    se = np.sqrt(1/np.sum(w*bx**2))
    p = 2*(1-norm_cdf(abs(b/se)))
    return b, se, p

lm_b, lm_se, lm_p = mr_ivw(h_lm['beta_exp'], h_lm['BETA_out'], h_lm['SE_out'])
im_b, im_se, im_p = mr_ivw(h_im['beta_exp'], h_im['BETA_out'], h_im['SE_out'])
li_b, li_se, li_p = mr_ivw(h_li['beta_exp'], h_li['BETA_out'], h_li['SE_out'])

print(f'Lon->MDD IVW={lm_b:.4f} OR={np.exp(lm_b):.2f}')
print(f'Ins->MDD IVW={im_b:.4f} OR={np.exp(im_b):.2f}')
print(f'Lon->Ins IVW={li_b:.4f}')

# MR-PRESSO (simplified outlier detection)
def mr_presso_simple(bx, by, sy):
    w = 1/sy**2
    b0 = np.sum(w*bx*by)/np.sum(w*bx**2)
    resid = (by - b0*bx) / sy
    outlier_idx = np.where(np.abs(resid) > 3)[0]
    Q = np.sum(resid**2)
    q_p = 1 - chi2.cdf(Q, len(bx)-1)
    if len(outlier_idx) > 0:
        keep = np.ones(len(bx), dtype=bool)
        keep[outlier_idx] = False
        b_clean, se_clean, _ = mr_ivw(bx[keep], by[keep], sy[keep])
    else:
        b_clean, se_clean = None, None
    return {'ivw': b0, 'se': np.sqrt(1/np.sum(w*bx**2)), 'n_outliers': len(outlier_idx), 'Q_p': q_p, 'clean_beta': b_clean}

mp_lm = mr_presso_simple(h_lm['beta_exp'], h_lm['BETA_out'], h_lm['SE_out'])
mp_im = mr_presso_simple(h_im['beta_exp'], h_im['BETA_out'], h_im['SE_out'])
mp_li = mr_presso_simple(h_li['beta_exp'], h_li['BETA_out'], h_li['SE_out'])

print(f'\n=== MR-PRESSO ===')
print(f'Lon->MDD: outliers={mp_lm["n_outliers"]}, Q_p={mp_lm["Q_p"]:.2e}', end='')
if mp_lm['clean_beta'] is not None:
    print(f', clean_OR={np.exp(mp_lm["clean_beta"]):.2f}')
else:
    print()

print(f'Ins->MDD: outliers={mp_im["n_outliers"]}, Q_p={mp_im["Q_p"]:.2e}', end='')
if mp_im['clean_beta'] is not None:
    print(f', clean_OR={np.exp(mp_im["clean_beta"]):.2f}')
else:
    print()

print(f'Lon->Ins: outliers={mp_li["n_outliers"]}, Q_p={mp_li["Q_p"]:.2e}', end='')
if mp_li['clean_beta'] is not None:
    print(f', clean_beta={mp_li["clean_beta"]:.4f}')
else:
    print()

# Steiger
print(f'\n=== Steiger Directionality ===')
def steiger(h):
    r2_exp = (h['beta_exp']**2) / (h['beta_exp']**2 + h['SE_exp']**2)
    r2_out = (h['BETA_out']**2) / (h['BETA_out']**2 + h['SE_out']**2)
    n_dir = np.sum(r2_exp > r2_out)
    prop = n_dir / len(r2_exp)
    from scipy.stats import binomtest
    p_val = binomtest(n_dir, len(r2_exp), prop, alternative='two-sided').pvalue
    return prop, n_dir, len(r2_exp), p_val

st_lm = steiger(h_lm)
st_im = steiger(h_im)
st_li = steiger(h_li)
print(f'Lon->MDD: {st_lm[1]}/{st_lm[2]} ({st_lm[0]*100:.1f}%), p={st_lm[3]:.3f}')
print(f'Ins->MDD: {st_im[1]}/{st_im[2]} ({st_im[0]*100:.1f}%), p={st_im[3]:.3f}')
print(f'Lon->Ins: {st_li[1]}/{st_li[2]} ({st_li[0]*100:.1f}%), p={st_li[3]:.3f}')

# Bidirectional
print(f'\n=== Bidirectional MR ===')
mdd_ivs = mdd[mdd['P']<5e-8][['SNP','A1','A2','BETA','SE']].copy()
print(f'MDD reverse IVs: {len(mdd_ivs)}')
h_mld = harmonize(mdd_ivs, lon)
h_mli = harmonize(mdd_ivs, ins)
print(f'MDD->Loneliness matched: {len(h_mld)}')
print(f'MDD->Insomnia matched: {len(h_mli)}')
if len(h_mld) >= 10:
    bml_b, bml_se, bml_p = mr_ivw(h_mld['beta_exp'], h_mld['BETA_out'], h_mld['SE_out'])
    print(f'  IVW={bml_b:.4f} OR={np.exp(bml_b):.2f} P={bml_p:.4f}')
if len(h_mli) >= 10:
    bmi_b, bmi_se, bmi_p = mr_ivw(h_mli['beta_exp'], h_mli['BETA_out'], h_mli['SE_out'])
    print(f'  IVW={bmi_b:.4f} OR={np.exp(bmi_b):.2f} P={bmi_p:.4f}')

# Genetic correlation
print(f'\n=== Genetic Correlation ===')
def calc_rg(g1, g2):
    m = g1[['SNP','BETA','SE']].merge(g2[['SNP','BETA','SE']], on='SNP', suffixes=('_x','_y'))
    z1 = m['BETA_x'] / m['SE_x']
    z2 = m['BETA_y'] / m['SE_y']
    rg = np.mean(z1*z2) / np.sqrt(np.mean(z1**2) * np.mean(z2**2))
    return rg, len(m)

rg1, n1 = calc_rg(mdd, lon)
rg2, n2 = calc_rg(mdd, ins)
rg3, n3 = calc_rg(lon, ins)
print(f'rg(MDD,Lon)={rg1:.3f} (n={n1})')
print(f'rg(MDD,Ins)={rg2:.3f} (n={n2})')
print(f'rg(Lon,Ins)={rg3:.3f} (n={n3})')

# Mediation
a, b, c = li_b, im_b, lm_b
indirect = a*b
direct = c - indirect
prop_med = indirect/c*100
print(f'\n=== Mediation ===')
print(f'Total c={c:.4f}')
print(f'a={a:.4f} b={b:.4f}')
print(f'Indirect={indirect:.4f}')
print(f'Direct={direct:.4f}')
print(f'Mediation%={prop_med:.1f}%')

# Save
results = {
    'mr_ivw': {
        'lon_mdd': {'beta': float(lm_b), 'se': float(lm_se), 'or': float(np.exp(lm_b))},
        'ins_mdd': {'beta': float(im_b), 'se': float(im_se), 'or': float(np.exp(im_b))},
        'lon_ins': {'beta': float(li_b), 'se': float(li_se)}
    },
    'mrpresso': {
        'lon_mdd': {'outliers': int(mp_lm['n_outliers']), 'q_p': float(mp_lm['Q_p']), 'clean_beta': float(mp_lm['clean_beta']) if mp_lm['clean_beta'] else None},
        'ins_mdd': {'outliers': int(mp_im['n_outliers']), 'q_p': float(mp_im['Q_p']), 'clean_beta': float(mp_im['clean_beta']) if mp_im['clean_beta'] else None},
        'lon_ins': {'outliers': int(mp_li['n_outliers']), 'q_p': float(mp_li['Q_p']), 'clean_beta': float(mp_li['clean_beta']) if mp_li['clean_beta'] else None}
    },
    'steiger': {
        'lon_mdd': {'prop': float(st_lm[0]), 'n': int(st_lm[1]), 'total': int(st_lm[2]), 'p': float(st_lm[3])},
        'ins_mdd': {'prop': float(st_im[0]), 'n': int(st_im[1]), 'total': int(st_im[2]), 'p': float(st_im[3])},
        'lon_ins': {'prop': float(st_li[0]), 'n': int(st_li[1]), 'total': int(st_li[2]), 'p': float(st_li[3])}
    },
    'bidirectional': {
        'mdd_lon_n': len(h_mld),
        'mdd_ins_n': len(h_mli)
    },
    'genetic_correlation': {
        'mdd_lon': round(rg1, 3),
        'mdd_ins': round(rg2, 3),
        'lon_ins': round(rg3, 3)
    },
    'mediation': {
        'a': float(a), 'b': float(b), 'c': float(c),
        'indirect': float(indirect), 'direct': float(direct),
        'prop_med': round(prop_med, 1)
    }
}
with open(f'{DIR}\\enhanced_mr_results.json', 'w') as f:
    json.dump(results, f, indent=2)
print(f'\nSaved: {DIR}\\enhanced_mr_results.json')
print('\n=== ALL DONE ===')
