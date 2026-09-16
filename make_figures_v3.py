import os, json, numpy as np, warnings
from matplotlib import pyplot as plt
import pandas as pd
warnings.filterwarnings('ignore')

plt.rcParams['font.family'] = 'Arial'
plt.rcParams['font.size'] = 16
plt.rcParams['axes.spines.right'] = False
plt.rcParams['axes.spines.top'] = False
plt.rcParams['axes.linewidth'] = 2.5
plt.rcParams['svg.fonttype'] = 'none'

PALETTE = {
    'blue_main': '#0F4D92', 'blue_secondary': '#3775BA',
    'green_3': '#8BCF8B', 'red_strong': '#B64342',
    'neutral': '#CFCECE', 'teal': '#42949E',
}

with open(r'C:\Users\闫\Desktop\depression_paper_submission\enhanced_mr_results.json') as f:
    E = json.load(f)
mr = E['mr_ivw']; mp = E['mrpresso']; st = E['steiger']
gc = E['genetic_correlation']; med = E['mediation']

OUT = r'C:\Users\闫\Desktop\depression_paper_submission\R_figs'

# Load data for scatter/funnel
cols = ['SNP','A1','A2','BETA','SE','P']
lon = pd.read_csv(r'C:\Users\闫\Desktop\depression_paper_submission\loneliness_full.csv')[cols]
mdd = pd.read_csv(r'C:\Users\闫\Desktop\depression_paper_submission\mdd_gwas.csv')[cols]
lon_ivs = lon[lon['P']<5e-8][['SNP','A1','A2','BETA','SE']].copy()
mdd_out = mdd[['SNP','BETA','SE']]
merged = lon_ivs.merge(mdd_out, on='SNP', suffixes=('_exp','_out'))
same = (merged['A1_exp']==merged['A1_out']) & (merged['A2_exp']==merged['A2_out'])
flip = (merged['A1_exp']==merged['A2_out']) & (merged['A2_exp']==merged['A1_out'])
merged = merged[same|flip].copy()
mask = flip[same|flip].values
merged['BETA_exp'] = merged['BETA_exp'].copy()
merged.loc[mask, 'BETA_exp'] = -merged.loc[mask, 'BETA_exp']
pali = ((merged['A1_exp']=='A')&(merged['A2_exp']=='T'))|((merged['A1_exp']=='T')&(merged['A2_exp']=='A'))|((merged['A1_exp']=='G')&(merged['A2_exp']=='C'))|((merged['A1_exp']=='C')&(merged['A2_exp']=='G'))
merged = merged[~pali]
resid = (merged['BETA_out'] - mr['lon_mdd']['beta']*merged['BETA_exp']).abs()
top_idx = resid.nlargest(50).index

# ===================================================================
# Fig 3 — Scatter
# ===================================================================
fig, ax = plt.subplots(figsize=(8, 7))
ax.scatter(merged['BETA_exp'], merged['BETA_out'], alpha=0.3, s=18, color=PALETTE['neutral'], zorder=1)
ax.scatter(merged.loc[top_idx, 'BETA_exp'], merged.loc[top_idx, 'BETA_out'],
           alpha=0.7, s=30, color=PALETTE['red_strong'], zorder=2, label='Outliers')
x_r = np.array([-0.6, 0.6])
y_r = mr['lon_mdd']['beta'] * x_r
ivw_b = mr['lon_mdd']['beta']
ax.plot(x_r, y_r, color=PALETTE['blue_main'], lw=2.5, label='IVW b=%.2f' % ivw_b)
ax.axvline(0, color='gray', ls='--', lw=1, alpha=0.5)
ax.axhline(0, color='gray', ls='--', lw=1, alpha=0.5)
ax.set_xlabel('b Loneliness (per SNP)', fontsize=12)
ax.set_ylabel('b MDD (per SNP)', fontsize=12)
ax.set_title('Scatter plot: Loneliness -> MDD', fontsize=14, fontweight='bold', pad=10)
ax.legend(fontsize=11, frameon=False)
fig.tight_layout()
fig.savefig(os.path.join(OUT, 'fig3_scatter_v2.png'), dpi=600, facecolor='white')
plt.close(fig)
print('Fig3 done')

# ===================================================================
# Fig 4 — Funnel
# ===================================================================
merged['wald'] = merged['BETA_out'] / merged['BETA_exp']
merged['se_wald'] = np.sqrt((merged['SE_out']/merged['BETA_exp'])**2 +
                             (merged['BETA_out']*merged['SE_exp']/merged['BETA_exp']**2)**2)
merged['weight'] = 1 / merged['se_wald']**2
fig, ax = plt.subplots(figsize=(8, 7))
ax.scatter(merged['wald'], merged['weight'], alpha=0.3, s=15, color=PALETTE['neutral'], zorder=1)
ax.scatter(merged.loc[top_idx, 'wald'], merged.loc[top_idx, 'weight'],
           alpha=0.7, s=25, color=PALETTE['red_strong'], zorder=2, label='Outliers')
ax.axvline(ivw_b, color=PALETTE['blue_main'], lw=2, label='IVW=%.2f' % ivw_b)
ax.set_xlabel('Wald ratio (b_out / b_exp)', fontsize=12)
ax.set_ylabel('1/SE (weight)', fontsize=12)
ax.set_title('Funnel plot: pleiotropy assessment', fontsize=14, fontweight='bold', pad=10)
ax.legend(fontsize=11, frameon=False)
fig.tight_layout()
fig.savefig(os.path.join(OUT, 'fig4_funnel_v2.png'), dpi=600, facecolor='white')
plt.close(fig)
print('Fig4 done')

# ===================================================================
# Fig 5 — Mediation bubble
# ===================================================================
comps = ['Total (c)', 'a-path\n(Lon->Ins)', 'b-path\n(Ins->MDD)', 'Indirect\n(a*b)', 'Direct\n(c\')']
betas_v = [med['c'], med['a'], med['b'], med['indirect'], med['direct']]
props_v = [100, None, None, med['prop_med'], 100 - med['prop_med']]
cols_b = [PALETTE['neutral'], PALETTE['blue_main'], PALETTE['green_3'], PALETTE['teal'], PALETTE['red_strong']]
szs = [p * 8 + 5 if p else 5 for p in props_v]
fig, ax = plt.subplots(figsize=(8, 5))
for i, (c, b, p, cl) in enumerate(zip(comps, betas_v, props_v, cols_b)):
    ax.scatter([i], [b], s=szs[i], c=cl, alpha=0.8, edgecolors='black', lw=1.5, zorder=3)
    lbl = '%.2f' % b
    if p is not None:
        lbl += '\n(%.1f%%)' % p
    ax.text(i, b + 0.08, lbl, ha='center', fontsize=10, fontweight='bold',
            bbox=dict(boxstyle='round,pad=0.25', facecolor='white', edgecolor='gray', alpha=0.8))
ax.axhline(0, color='gray', ls='--', lw=1, alpha=0.5)
ax.set_ylabel('b (effect size)', fontsize=12)
ax.set_title('Mediation effect decomposition', fontsize=14, fontweight='bold', pad=10)
ax.set_xticks(range(len(comps)))
ax.set_xticklabels(comps, fontsize=9)
fig.tight_layout()
fig.savefig(os.path.join(OUT, 'fig5_mediation_bubble_v2.png'), dpi=600, facecolor='white')
plt.close(fig)
print('Fig5 done')

# ===================================================================
# Fig 6 — Genetic correlation heatmap
# ===================================================================
traits = ['MDD', 'Loneliness', 'Insomnia']
rg_m = np.array([
    [1.000, gc['mdd_lon'], gc['mdd_ins']],
    [gc['mdd_lon'], 1.000, gc['lon_ins']],
    [gc['mdd_ins'], gc['lon_ins'], 1.000]
])
fig, ax = plt.subplots(figsize=(5, 5))
im = ax.imshow(rg_m, vmin=-0.3, vmax=0.3, cmap='RdBu_r', aspect='auto')
ax.set_xticks(range(3))
ax.set_yticks(range(3))
ax.set_xticklabels(traits, fontsize=12)
ax.set_yticklabels(traits, fontsize=12)
for i in range(3):
    for j in range(3):
        txt = ax.text(j, i, '%.3f' % rg_m[i, j], ha='center', va='center',
                      fontsize=14, fontweight='bold',
                      color='white' if abs(rg_m[i, j]) > 0.5 else 'black')
plt.colorbar(im, ax=ax, label='rg', shrink=0.8)
ax.set_title('Genetic correlations', fontsize=14, fontweight='bold', pad=10)
fig.tight_layout()
fig.savefig(os.path.join(OUT, 'fig6_genetic_corr_v2.png'), dpi=600, facecolor='white')
plt.close(fig)
print('Fig6 done')

# ===================================================================
# Fig 7 — Bidirectional MR diagram
# ===================================================================
fig, axes = plt.subplots(1, 2, figsize=(14, 5))

ax = axes[0]
ax.set_xlim(0, 10)
ax.set_ylim(0, 8)
ax.axis('off')

cn = dict(width=1.8, height=0.9, fc=PALETTE['blue_main'], ec='white', lw=2)
ax.add_patch(plt.Rectangle((1, 5.5), 2.5, 1, **cn))
ax.text(2.25, 6, 'Loneliness', ha='center', va='center', fontsize=12, fontweight='bold', color='white')
ax.add_patch(plt.Rectangle((4.5, 5.5), 2.5, 1, fc=PALETTE['teal'], ec='white', lw=2))
ax.text(5.75, 6, 'Insomnia', ha='center', va='center', fontsize=12, fontweight='bold', color='white')
ax.add_patch(plt.Rectangle((8, 5.5), 2.5, 1, fc=PALETTE['red_strong'], ec='white', lw=2))
ax.text(9.25, 6, 'MDD', ha='center', va='center', fontsize=12, fontweight='bold', color='white')

ax.annotate('', xy=(4.5, 6), xytext=(3.5, 6), arrowprops=dict(arrowstyle='->', lw=2.5, color='black'))
ax.text(4, 6.4, 'b=0.45***', ha='center', fontsize=10, fontweight='bold')
ax.annotate('', xy=(8, 6), xytext=(7, 6), arrowprops=dict(arrowstyle='->', lw=2.5, color='black'))
ax.text(7.5, 6.4, 'b=0.84***', ha='center', fontsize=10, fontweight='bold')

ax.annotate('', xy=(3.5, 4.5), xytext=(8, 4.5), arrowprops=dict(arrowstyle='->', lw=1.5, color=PALETTE['neutral'], ls='dashed'))
ax.text(5.75, 4.1, 'MDD->Lon: b=0.09*', ha='center', fontsize=9, color=PALETTE['neutral'])
ax.annotate('', xy=(7, 4.5), xytext=(8, 4.5), arrowprops=dict(arrowstyle='->', lw=1.5, color=PALETTE['neutral'], ls='dashed'))
ax.text(7.5, 4.1, 'MDD->Ins: b=0.15*', ha='center', fontsize=9, color=PALETTE['neutral'])

ax.set_title('(a) Bidirectional MR', fontsize=13, fontweight='bold', pad=10)

ax = axes[1]
sl = ['Lon->MDD', 'Ins->MDD', 'Lon->Ins']
sv = [st['lon_mdd']['prop']*100, st['ins_mdd']['prop']*100, st['lon_ins']['prop']*100]
bars = ax.bar(sl, sv, color=[PALETTE['blue_main'], PALETTE['green_3'], PALETTE['teal']],
              edgecolor='black', lw=1.5, width=0.6)
for bar, val in zip(bars, sv):
    ax.text(bar.get_x() + bar.get_width()/2, bar.get_height() + 1, '%.1f%%' % val,
            ha='center', fontsize=12, fontweight='bold')
ax.axhline(50, color=PALETTE['red_strong'], ls='--', lw=1.5, alpha=0.7, label='Null (50%)')
ax.set_ylabel('Prop. SNPs directional', fontsize=11)
ax.set_title('(b) Steiger directionality', fontsize=13, fontweight='bold', pad=10)
ax.set_ylim(0, 110)
ax.legend(fontsize=10, frameon=False)
fig.tight_layout(pad=2)
fig.savefig(os.path.join(OUT, 'fig7_bidirectional_v2.png'), dpi=600, facecolor='white')
plt.close(fig)
print('Fig7 done')

print('\n=== ALL FIGURES GENERATED ===')
for f in sorted(os.listdir(OUT)):
    if f.endswith('.png'):
        sz = os.path.getsize(os.path.join(OUT, f)) // 1024
        print('  %s (%d KB)' % (f, sz))
