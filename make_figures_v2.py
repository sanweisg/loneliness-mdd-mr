import os, json, numpy as np
from matplotlib import pyplot as plt
import pandas as pd

plt.rcParams['font.family'] = 'Arial'
plt.rcParams['font.size'] = 16
plt.rcParams['axes.spines.right'] = False
plt.rcParams['axes.spines.top'] = False
plt.rcParams['axes.linewidth'] = 2.5
plt.rcParams['svg.fonttype'] = 'none'

PALETTE = {
    "blue_main": "#0F4D92",
    "blue_secondary": "#3775BA",
    "green_3": "#8BCF8B",
    "red_strong": "#B64342",
    "neutral": "#CFCECE",
    "teal": "#42949E",
}

# Load data
with open(r'C:\Users\闫\Desktop\depression_paper_submission\enhanced_mr_results.json') as f:
    E = json.load(f)
mr = E['mr_ivw']
mp = E['mrpresso']
st = E['steiger']
gc = E['genetic_correlation']
med = E['mediation']

OUT = r'C:\Users\闫\Desktop\depression_paper_submission\R_figs'
os.makedirs(OUT, exist_ok=True)

# =====================================================================
# FIG 3 — Scatter plot (Loneliness -> MDD)
# =====================================================================
print("Generating Fig3...")
cols = ['SNP','A1','A2','BETA','SE','P']
lon = pd.read_csv(r'C:\Users\闫\Desktop\depression_paper_submission\loneliness_full.csv')[cols]
mdd = pd.read_csv(r'C:\Users\闫\Desktop\depression_paper_submission\mdd_gwas.csv')[cols]

# Extract IVs
lon_ivs = lon[lon['P'] < 5e-8][['SNP','A1','A2','BETA','SE']].copy()
lon_ivs.columns = ['SNP','A1_lon','A2_lon','BETA_lon','SE_lon']
mdd_out = mdd[['SNP','A1','A2','BETA','SE']].copy()
mdd_out.columns = ['SNP','A1_mdd','A2_mdd','BETA_mdd','SE_mdd']

merged = lon_ivs.merge(mdd_out, on='SNP', how='inner')

# Allele harmonization
same = (merged['A1_lon'] == merged['A1_mdd']) & (merged['A2_lon'] == merged['A2_mdd'])
flip = (merged['A1_lon'] == merged['A2_mdd']) & (merged['A2_lon'] == merged['A1_mdd'])
merged = merged[same | flip].copy()
mask_flip = flip[same | flip].values
merged['BETA_lon'] = merged['BETA_lon'].copy()
merged.loc[mask_flip, 'BETA_lon'] = -merged.loc[mask_flip, 'BETA_lon']

# Remove palindromic
pali = ((merged['A1_lon']=='A')&(merged['A2_lon']=='T')) | \
       ((merged['A1_lon']=='T')&(merged['A2_lon']=='A')) | \
       ((merged['A1_lon']=='G')&(merged['A2_lon']=='C')) | \
       ((merged['A1_lon']=='C')&(merged['A2_lon']=='G'))
merged = merged[~pali]

fig, ax = plt.subplots(figsize=(8, 7))
ax.scatter(merged['BETA_lon'], merged['BETA_mdd'], alpha=0.3, s=18,
           color=PALETTE['neutral'], zorder=1)

# Highlight outliers
resid = (merged['BETA_mdd'] - mr['lon_mdd']['beta'] * merged['BETA_lon']).abs()
top_idx = resid.nlargest(50).index
ax.scatter(merged.loc[top_idx, 'BETA_lon'], merged.loc[top_idx, 'BETA_mdd'],
           alpha=0.7, s=30, color=PALETTE['red_strong'], zorder=2, label='Outliers')

# IVW line
x_range = np.array([-0.6, 0.6])
y_ivw = mr['lon_mdd']['beta'] * x_range
ax.plot(x_range, y_ivw, color=PALETTE['blue_main'], linewidth=2.5,
        label='IVW b=' + format(mr['lon_mdd']['beta'], '.2f'))

ax.axvline(0, color='gray', linestyle='--', linewidth=1, alpha=0.5)
ax.axhline(0, color='gray', linestyle='--', linewidth=1, alpha=0.5)
ax.set_xlabel('b Loneliness (per SNP)', fontsize=12)
ax.set_ylabel('b MDD (per SNP)', fontsize=12)
ax.set_title('Scatter plot: Loneliness -> MDD', fontsize=14, fontweight='bold', pad=10)
ax.legend(fontsize=11, frameon=False)
fig.tight_layout()
fig.savefig(os.path.join(OUT, 'fig3_scatter_v2.png'), dpi=600, facecolor='white')
plt.close(fig)
print("  fig3_scatter_v2.png done")

# =====================================================================
# FIG 4 — Funnel plot
# =====================================================================
print("Generating Fig4...")
merged['wald'] = merged['BETA_mdd'] / merged['BETA_lon']
merged['se_wald'] = np.sqrt(
    (merged['SE_mdd']/merged['BETA_lon'])**2 +
    (merged['BETA_mdd']*merged['SE_lon']/merged['BETA_lon']**2)**2
)
merged['weight'] = 1 / merged['se_wald']**2

fig, ax = plt.subplots(figsize=(8, 7))
ax.scatter(merged['wald'], merged['weight'], alpha=0.3, s=15,
           color=PALETTE['neutral'], zorder=1)
ax.scatter(merged.loc[top_idx, 'wald'], merged.loc[top_idx, 'weight'],
           alpha=0.7, s=25, color=PALETTE['red_strong'], zorder=2, label='Outliers')

ivw_wald = mr['lon_mdd']['beta']
ax.axvline(ivw_wald, color=PALETTE['blue_main'], linewidth=2,
           label='IVW=' + format(ivw_wald, '.2f'))
ax.set_xlabel('Wald ratio (b_out / b_exp)', fontsize=12)
ax.set_ylabel('1/SE (weight)', fontsize=12)
ax.set_title('Funnel plot: pleiotropy assessment', fontsize=14, fontweight='bold', pad=10)
ax.legend(fontsize=11, frameon=False)
fig.tight_layout()
fig.savefig(os.path.join(OUT, 'fig4_funnel_v2.png'), dpi=600, facecolor='white')
plt.close(fig)
print("  fig4_funnel_v2.png done")

# =====================================================================
# FIG 5 — Mediation bubble chart
# =====================================================================
print("Generating Fig5...")
components = ['Total (c)', 'a-path\n(Lon->Ins)', 'b-path\n(Ins->MDD)',
              'Indirect\n(a*b)', 'Direct\n(c\')']
betas = [med['c'], med['a'], med['b'], med['indirect'], med['direct']]
props = [100, None, None, med['prop_med'], 100 - med['prop_med']]
colors_b = [PALETTE['neutral'], PALETTE['blue_main'], PALETTE['green_3'],
            PALETTE['teal'], PALETTE['red_strong']]
sizes = []
for p in props:
    if p is not None:
        sizes.append(p * 8 + 5)
    else:
        sizes.append(5)

fig, ax = plt.subplots(figsize=(8, 5))
for i, (comp, beta, prop, clr) in enumerate(zip(components, betas, props, colors_b)):
    ax.scatter([i], [beta], s=sizes[i], c=clr, alpha=0.8,
               edgecolors='black', linewidth=1.5, zorder=3)
    label = format(beta, '.2f')
    if prop is not None:
        label += '\n(' + format(prop, '.1f') + '%)'
    ax.text(i, beta + 0.08, label, ha='center', fontsize=10, fontweight='bold',
            bbox=dict(boxstyle='round,pad=0.25', facecolor='white',
                      edgecolor='gray', alpha=0.8))

ax.axhline(0, color='gray', linestyle='--', linewidth=1, alpha=0.5)
ax.set_ylabel('b (effect size)', fontsize=12)
ax.set_title('Mediation effect decomposition', fontsize=14, fontweight='bold', pad=10)
ax.set_xticks(range(len(components)))
ax.set_xticklabels(components, fontsize=9)
fig.tight_layout()
fig.savefig(os.path.join(OUT, 'fig5_mediation_bubble_v2.png'), dpi=600, facecolor='white')
plt.close(fig)
print("  fig5_mediation_bubble_v2.png done")

# =====================================================================
# FIG 6 — Genetic correlation heatmap
# =====================================================================
print("Generating Fig6...")
traits = ['MDD', 'Loneliness', 'Insomnia']
rg_matrix = np.array([
    [1.000, gc['mdd_lon'], gc['mdd_ins']],
    [gc['mdd_lon'], 1.000, gc['lon_ins']],
    [gc['mdd_ins'], gc['lon_ins'], 1.000]
])

fig, ax = plt.subplots(figsize=(5, 5))
im = ax.imshow(rg_matrix, vmin=-0.3, vmax=0.3, cmap='RdBu_r', aspect='auto')
ax.set_xticks(range(3))
ax.set_yticks(range(3))
ax.set_xticklabels(traits, fontsize=12)
ax.set_yticklabels(traits, fontsize=12)
for i in range(3):
    for j in range(3):
        val = rg_matrix[i, j]
        txt = ax.text(j, i, format(val, '.3f'), ha='center', va='center',
                      fontsize=14, fontweight='bold',
                      color='white' if abs(val) > 0.5 else 'black')
plt.colorbar(im, ax=ax, label='rg', shrink=0.8)
ax.set_title('Genetic correlations', fontsize=14, fontweight='bold', pad=10)
fig.tight_layout()
fig.savefig(os.path.join(OUT, 'fig6_genetic_corr_v2.png'), dpi=600, facecolor='white')
plt.close(fig)
print("  fig6_genetic_corr_v2.png done")

# =====================================================================
# FIG 7 — Bidirectional MR causal diagram
# =====================================================================
print("Generating Fig7...")
fig, axes = plt.subplots(1, 2, figsize=(14, 5))

# Left: path diagram
ax = axes[0]
ax.set_xlim(0, 10)
ax.set_ylim(0, 8)
ax.axis('off')

# Nodes
node_props = dict(fc=PALETTE['blue_main'], ec='white', lw=2)
ax.add_patch(plt.Rectangle((1, 5.5), 2.5, 1, fc=PALETTE['blue_main'], ec='white', lw=2))
ax.text(2.25, 6, 'Loneliness', ha='center', va='center',
        fontsize=12, fontweight='bold', color='white')

ax.add_patch(plt.Rectangle((4.5, 5.5), 2.5, 1, fc=PALETTE['teal'], ec='white', lw=2))
ax.text(5.75, 6, 'Insomnia', ha='center', va='center',
        fontsize=12, fontweight='bold', color='white')

ax.add_patch(plt.Rectangle((8, 5.5), 2.5, 1, fc=PALETTE['red_strong'], ec='white', lw=2))
ax.text(9.25, 6, 'MDD', ha='center', va='center',
        fontsize=12, fontweight='bold', color='white')

# Forward arrows
ax.annotate('', xy=(4.5, 6), xytext=(3.5, 6),
            arrowprops=dict(arrowstyle='->', lw=2.5, color='black'))
ax.text(4, 6.4, 'b=0.45***', ha='center', fontsize=10, fontweight='bold')

ax.annotate('', xy=(8, 6), xytext=(7, 6),
            arrowprops=dict(arrowstyle='->', lw=2.5, color='black'))
ax.text(7.5, 6.4, 'b=0.84***', ha='center', fontsize=10, fontweight='bold')

# Reverse arrows (dashed)
ax.annotate('', xy=(3.5, 4.5), xytext=(8, 4.5),
            arrowprops=dict(arrowstyle='->', lw=1.5, color=PALETTE['neutral'],
                            linestyle='dashed'))
ax.text(5.75, 4.1, 'MDD->Lon: b=0.09*', ha='center', fontsize=9,
        color=PALETTE['neutral'])

ax.annotate('', xy=(7, 4.5), xytext=(8, 4.5),
            arrowprops=dict(arrowstyle='->', lw=1.5, color=PALETTE['neutral'],
                            linestyle='dashed'))
ax.text(7.5, 4.1, 'MDD->Ins: b=0.15*', ha='center', fontsize=9,
        color=PALETTE['neutral'])

ax.set_title('(a) Bidirectional MR pathways', fontsize=13, fontweight='bold', pad=10)

# Right: Steiger bars
ax = axes[1]
steig_labels = ['Lon->MDD', 'Ins->MDD', 'Lon->Ins']
steig_vals = [st['lon_mdd']['prop'] * 100,
              st['ins_mdd']['prop'] * 100,
              st['lon_ins']['prop'] * 100]
bars = ax.bar(steig_labels, steig_vals,
              color=[PALETTE['blue_main'], PALETTE['green_3'], PALETTE['teal']],
              edgecolor='black', linewidth=1.5, width=0.6)
for bar, val in zip(bars, steig_vals):
    ax.text(bar.get_x() + bar.get_width() / 2, bar.get_height() + 1,
            format(val, '.1f') + '%', ha='center', fontsize=12, fontweight='bold')
ax.axhline(50, color=PALETTE['red_strong'], linestyle='--', linewidth=1.5,
           alpha=0.7, label='Null (50%)')
ax.set_ylabel('Prop. SNPs directional', fontsize=11)
ax.set_title('(b) Steiger directionality', fontsize=13, fontweight='bold', pad=10)
ax.set_ylim(0, 110)
ax.legend(fontsize=10, frameon=False)
fig.tight_layout(pad=2)
fig.savefig(os.path.join(OUT, 'fig7_bidirectional_v2.png'), dpi=600, facecolor='white')
plt.close(fig)
print("  fig7_bidirectional_v2.png done")

# =====================================================================
# Summary
# =====================================================================
print("\n=== ALL FIGURES GENERATED ===")
for fname in sorted(os.listdir(OUT)):
    if fname.endswith('.png'):
        fpath = os.path.join(OUT, fname)
        size_kb = os.path.getsize(fpath) // 1024
        print(f"  {fname} ({size_kb} KB)")
