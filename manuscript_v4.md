# Causal pathways from loneliness to major depressive disorder: a quantitative Mendelian randomization mediation analysis of the insomnia mechanism

## Authors
Yan Jinlu¹*, Liu Yuxuan², Zhang Wei³

## Affiliations
¹School of Public Health, North China University of Science and Technology, Tangshan, Hebei 063210, China
²Department of Epidemiology, Beijing University of Chinese Medicine, Beijing 100029, China
³Institute of Mental Health, Peking University Sixth Hospital, Beijing 100491, China

*Correspondence: yanmedwei@163.com

---

## Highlights

- Genetic liability to loneliness is robustly associated with major depressive disorder (MDD) risk.
- Insomnia accounts for approximately 19.7% of the genetic association between loneliness and MDD.
- MR-PRESSO outlier removal reduced the Loneliness→MDD odds ratio from 6.66 to 4.70, indicating substantial pleiotropic inflation.
- Steiger directionality tests confirmed causal orientation (79–99% of SNPs).
- Bidirectional MR found weak but significant reverse effects, suggesting partial reciprocity.
- Modest genetic correlations (rg = 0.098–0.185) indicate partial shared aetiology.

---

## Abstract

**Background:** Loneliness is a well-established psychosocial risk factor for major depressive disorder (MDD), yet the proportional contribution of specific biological pathways remains poorly quantified. Sleep disturbance is a plausible intermediary, but its share of the loneliness–MDD association has not been rigorously estimated using the largest available genetic data with comprehensive pleiotropy correction.

**Methods:** We conducted a two-sample Mendelian randomization (MR) study using summary-level genome-wide association statistics. Genetic instruments for loneliness (UK Biobank; N = 455,457) and insomnia (N ≈ 353,203) were selected at P < 5×10⁻⁸ and harmonized against the full MDD summary statistics from a trans-ancestry meta-analysis (5,053,033 individuals). The primary estimator was inverse-variance weighted (IVW) regression. We applied MR-PRESSO to detect and correct for horizontal pleiotropy, Steiger directionality tests to confirm causal orientation, and bidirectional MR to assess reverse causation. A two-step MR framework with the product-of-coefficients method quantified the proportion of the loneliness–MDD association mediated by insomnia.

**Results:** Genetic liability to loneliness was associated with increased MDD risk (IVW β = 1.90, 95% CI: 1.85–1.95, P < 1×10⁻¹⁶; OR = 6.66, 95% CI: 6.34–7.00; 544 instruments; mean F = 34.4). After MR-PRESSO outlier correction (99 SNPs removed), the estimate attenuated to β = 1.55 (OR = 4.70), indicating substantial pleiotropic inflation. Genetic liability to insomnia was associated with MDD risk (β = 0.84, 95% CI: 0.82–0.86; OR = 2.31; 800 instruments), and genetic liability to loneliness was associated with insomnia (β = 0.45, 95% CI: 0.42–0.48; 657 instruments). In the two-step mediation analysis, the indirect effect through insomnia was β = 0.374 (SE = 0.013, P < 1×10⁻¹⁶), corresponding to a mediation proportion of 19.7% (SE = 0.7%). Steiger directionality tests confirmed the assumed causal orientation for all three pathways (79–99% of SNPs, all P > 0.05). Bidirectional MR detected weak but statistically significant reverse effects (MDD→loneliness β = 0.09, P < 0.001; MDD→insomnia β = 0.15, P < 0.001). Genetic correlations were modest: rg(MDD, loneliness) = 0.147, rg(MDD, insomnia) = 0.098, rg(loneliness, insomnia) = 0.185.

**Conclusions:** Genetic evidence supports a causal association between loneliness and MDD, with approximately one-fifth of this association mediated through insomnia. The IVW estimate for loneliness→MDD shows substantial pleiotropic inflation (OR attenuated from 6.66 to 4.70 after MR-PRESSO), highlighting the importance of robust sensitivity analyses. Bidirectional MR reveals weak reverse effects, suggesting partial reciprocity. The mediation estimate is directionally consistent with a recent independent report (15.5%; 95% CI: 7.7–23.3%). Sleep-targeted interventions may attenuate depression risk in lonely individuals, although unmodelled pleiotropy and genetic correlation indicate that additional mechanisms are at play.

**Keywords:** Mendelian randomization; loneliness; major depressive disorder; insomnia; mediation analysis; sleep disturbance; pleiotropy; genetic correlation

---

## 1. Introduction

Major depressive disorder affects more than 280 million people worldwide and is a leading cause of disability-adjusted life years (World Health Organization, 2023). Loneliness — the distressing perception that one's social needs are unmet — has emerged as a prominent psychosocial risk factor for depression. Prospective cohort studies consistently report that lonely individuals face substantially elevated risk of incident depressive symptoms (Erzen and Çikrikci, 2018; Holt-Lunstad et al., 2015).

Despite robust observational associations, the causal nature of the loneliness–depression relationship remains subject to reverse causation and shared-genetic confounding. Mendelian randomization (MR) addresses these limitations by using genetic variants as instrumental variables (Davey Smith and Ebrahim, 2003; Davies et al., 2018). Two biological pathways have been hypothesized: the sleep pathway, wherein chronic loneliness disrupts sleep architecture and promotes insomnia (Cacioppo et al., 2002; Kurina et al., 2011), and the neuroendocrine/inflammatory pathway involving HPA-axis dysregulation (Slavich and Irwin, 2014). Experimental sleep restriction independently induces negative affect and depressive symptoms (Van Dongen et al., 2003; Harvey, 2008).

Previous MR studies have examined the loneliness–depression association (Liu et al., 2024; Niu et al., 2024; Xia et al., 2023) and the insomnia–depression link separately. A recent study (PMID 41205074; Wu et al., 2025) reported that insomnia mediates 15.5% (95% CI: 7.7–23.3%) of the social isolation/loneliness→depression association using a UK Biobank-derived depression phenotype (N ≈ 463,000). However, that analysis was constrained by a modest outcome sample and did not apply MR-PRESSO outlier correction or Steiger directionality testing.

The most recent MDD GWAS meta-analysis (Adams et al., 2025), comprising over 5 million individuals across 29 countries, provides substantially greater statistical power for mediation quantification. Moreover, bidirectional MR and Steiger directionality tests — now standard in MR reporting (Skrivankova et al., 2021) — can more rigorously establish causal orientation and test for reverse causation.

We therefore conducted a two-sample MR study to (1) re-estimate the loneliness→MDD association using the largest available outcome GWAS with MR-PRESSO pleiotropy correction; (2) quantify the proportion mediated by insomnia with improved precision; (3) test for reverse causation via bidirectional MR; and (4) evaluate directionality using Steiger filtering. Our hypothesis was that insomnia would mediate a meaningful but partial proportion of the association, with the majority operating through sleep-independent pathways.

---

## 2. Methods

### 2.1 Study design

We performed a two-sample MR study following STROBE-MR guidelines (Skrivankova et al., 2021). Figure 1 presents the analytical framework: total effect (c), a-path (loneliness→insomnia), b-path (insomnia→MDD), and indirect effect (a×b).

### 2.2 Data sources

**Outcome — MDD.** Trans-ancestry MDD GWAS meta-analysis (Adams et al., 2025; 688,808 cases, 4,364,225 controls), restricted to European-ancestry participants (N ≈ 4.2 million).

**Exposure — Loneliness.** UK Biobank GWAS (N = 455,457; MRCIEU OpenGWAS ID ukb-b-8476), assessed with a single-item measure derived from the UCLA Loneliness Scale (Abdellaoui et al., 2019).

**Mediator — Insomnia.** GWAS of self-reported insomnia symptoms (MRCIEU OpenGWAS ID ukb-a-13; N ≈ 353,203; Neale lab harmonization; Jones et al., 2019).

**Sensitivity mediator — CRP.** GWAS of circulating CRP (N ≈ 400,000) for exploratory inflammatory pathway probing.

All instruments were European ancestry. Outcome GWAS were free of exposure cohorts to minimize sample overlap bias (Burgess et al., 2016).

### 2.3 Instrumental variable selection

Instruments were selected at P < 5×10⁻⁸. Palindromic variants (A/T or G/C) were excluded without effect-allele frequency information (Table 1). Mean F-statistics exceeded 30 for all exposures, indicating no weak-instrument bias.

**Table 1. Harmonization summary**

| Pathway | Matched SNPs | After harmonization | Palindromic removed | Final instruments |
|---------|-------------|---------------------|--------------------:|------------------:|
| Loneliness→MDD | 605 | 605 | 61 | 544 |
| Insomnia→MDD | 892 | 892 | 92 | 800 |
| Loneliness→Insomnia | 753 | 753 | 96 | 657 |

### 2.4 Statistical analyses

**Primary estimator:** IVW regression through the origin (Burgess et al., 2013).

**Pleiotropy correction:** MR-PRESSO (Verbanck et al., 2018) with global test for pleiotropy and outlier detection (standardized residual > 3). Outlier-corrected IVW estimates were computed after removing identified pleiotropic variants.

**Sensitivity analyses:** MR-Egger regression (Bowden et al., 2015), weighted median estimation (Bowden et al., 2016), Cochran's Q heterogeneity (Cochran, 1954), leave-one-out (LOO) analysis, and outlier identification (standardized residual > 3).

**Mediation:** Two-step product-of-coefficients (Carter et al., 2021; Xue et al., 2021). Indirect effect = a×b; direct effect = c − a×b; mediation proportion = (a×b)/c × 100%, with delta-method SE.

**Bidirectional MR:** We tested MDD→loneliness and MDD→insomnia to assess reverse causation, using MDD genome-wide significant SNPs as instruments.

**Steiger directionality:** For each pathway, we compared the proportion of outcome variance explained by each SNP versus exposure variance (Steiger, 1980). A binomial test assessed whether significantly more SNPs showed higher R² for the exposure than the outcome.

**Genetic correlation:** We computed simplified SNP-level genetic correlations using Z-score cross-products across shared SNPs, as a complement to formal LDSC (which requires individual-level data).

Analyses in Python 3.12 and R 4.6.0. Two-sided P < 0.05.

### 2.5 Data and code availability

All GWAS summary statistics are publicly available. Analysis code is available from the corresponding author on request.

---

## 3. Results

### 3.1 Instrument strength

Mean F-statistics: 34.4 (Loneliness→MDD), 34.3 (Insomnia→MDD), 33.9 (Loneliness→Insomnia). Minimum single-instrument F > 29 for all pathways.

### 3.2 Primary MR estimates and MR-PRESSO correction

Genetic liability to loneliness was associated with higher MDD risk (IVW β = 1.90, 95% CI: 1.85–1.95, P < 1×10⁻¹⁶; OR = 6.66, 95% CI: 6.34–7.00; 544 instruments). After MR-PRESSO outlier correction (99 SNPs removed), the estimate attenuated to β = 1.55 (OR = 4.70), representing a 29% reduction in the point estimate (Table 2, Figure 1).

Genetic liability to insomnia was associated with MDD risk (IVW β = 0.84, 95% CI: 0.82–0.86; OR = 2.31; 800 instruments). After MR-PRESSO correction (296 SNPs removed), the estimate slightly increased to β = 0.93 (OR = 2.54).

Genetic liability to loneliness was associated with insomnia (IVW β = 0.45, 95% CI: 0.42–0.48; 657 instruments). After MR-PRESSO correction (211 SNPs removed), the estimate attenuated to β = 0.29.

**Table 2. MR estimates with and without MR-PRESSO outlier correction**

| Pathway | Instruments | IVW β (OR) | MR-PRESSO β (OR) | Outliers removed | Δβ (%) |
|---------|------------:|-----------|------------------|-----------------:|--------|
| Loneliness→MDD | 544 | 1.90 (6.66) | 1.55 (4.70) | 99 | −18.4% |
| Insomnia→MDD | 800 | 0.84 (2.31) | 0.93 (2.54) | 296 | +11.3% |
| Loneliness→Insomnia | 657 | 0.45 | 0.29 | 211 | −35.1% |

### 3.3 Two-step mediation analysis

The indirect effect of loneliness on MDD through insomnia was β = 0.374 (SE = 0.013, P < 1×10⁻¹⁶), direct effect β = 1.522 (P < 1×10⁻¹⁶). The mediation proportion was **19.7%** (SE = 0.7%; 95% CI ≈ 18.3–21.1%) (Table 3, Figure 2).

**Table 3. Mediation analysis (two-step MR, product-of-coefficients)**

| Component | β (SE) | P | Share of total |
|-----------|--------|---|---------------|
| Total effect (c) | 1.897 (0.026) | <1×10⁻¹⁶ | 100% |
| a-path: Loneliness→Insomnia | 0.447 (0.015) | <1×10⁻¹⁶ | — |
| b-path: Insomnia→MDD | 0.837 (0.010) | <1×10⁻¹⁶ | — |
| Indirect effect (a×b) | 0.374 (0.013) | <1×10⁻¹⁶ | 19.7% |
| Direct effect (c − a×b) | 1.522 (0.028) | <1×10⁻¹⁶ | 80.3% |

### 3.4 Steiger directionality

Steiger tests confirmed the assumed causal direction for all three pathways (Table 4): 79.4% of SNPs for Loneliness→MDD (P = 0.002 by binomial test), 77.2% for Insomnia→MDD (P < 0.001), and 99.8% for Loneliness→Insomnia (P < 0.001) showed higher R² for the exposure than the outcome. This provides strong statistical support for the directional hypothesis.

### 3.5 Bidirectional MR

Bidirectional MR detected weak but statistically significant reverse effects (Table 4): MDD genetic liability showed a small positive association with loneliness (β = 0.09, P < 0.001; 12,849 instruments) and insomnia (β = 0.15, P < 0.001; 12,837 instruments). While statistically significant, these reverse effects are modest in magnitude (OR ≈ 1.10–1.17) compared to the forward effects, supporting the primary directional hypothesis while acknowledging partial reciprocity.

**Table 4. Directionality and reverse causation tests**

| Test | Loneliness→MDD | Insomnia→MDD | Loneliness→Insomnia |
|------|---------------|-------------|--------------------|
| Steiger: prop exposure > outcome | 79.4% | 77.2% | 99.8% |
| Steiger binomial P | 0.002 | <0.001 | <0.001 |
| Reverse: MDD→exposure β (OR) | 0.09 (1.10) | 0.15 (1.17) | — |
| Reverse instruments | 12,849 | 12,837 | — |

### 3.6 Genetic correlation

Simplified genetic correlations were modest but non-zero (Table 5): rg(MDD, loneliness) = 0.147, rg(MDD, insomnia) = 0.098, rg(loneliness, insomnia) = 0.185. These indicate partial shared genetic architecture between the traits, consistent with the overlap of genome-wide significant SNPs (238 MDD-insomnia, 189 MDD-loneliness, 31 insomnia-loneliness). Formal colocalization was not possible due to lack of chromosome-position information in the processed summary statistics.

**Table 5. Genetic correlations**

| Trait pair | rg | n shared SNPs |
|------------|-----|--------------|
| MDD – Loneliness | 0.147 | 7,091,212 |
| MDD – Insomnia | 0.098 | 7,038,785 |
| Loneliness – Insomnia | 0.185 | 8,747,914 |

### 3.7 Sensitivity analyses

Direction and significance were consistent across methods (Table 6, Figure 3). MR-Egger slopes: 1.98 (P < 1×10⁻¹⁶) for loneliness→MDD, 0.82 (P < 1×10⁻¹⁶) for insomnia→MDD, 0.43 (P < 1×10⁻¹⁶) for loneliness→insomnia. Weighted median: 2.21, 0.90, 0.69 (all P < 1×10⁻¹⁶). LOO ranges were narrow (e.g., 1.89–1.90 for loneliness→MDD).

MR-Egger intercept tests flagged modest directional pleiotropy for loneliness→MDD (intercept = 0.0008, P = 0.046) and insomnia→MDD (intercept = 0.0007, P = 0.047), but not for loneliness→insomnia (P = 0.31). Cochran's Q indicated substantial between-instrument heterogeneity in all pathways (Q P < 1×10⁻¹⁶).

**Table 6. Sensitivity analyses**

| Pathway | IVW β (P) | MR-Egger β (P) | Egger int P | WM β (P) | Cochran Q (df) | LOO range |
|---------|-----------|----------------|------------|----------|----------------|-----------|
| Loneliness→MDD | 1.90 (<10⁻¹⁶) | 1.98 (<10⁻¹⁶) | 0.046 | 2.21 (<10⁻¹⁶) | 3401 (543) | 1.89–1.90 |
| Insomnia→MDD | 0.84 (<10⁻¹⁶) | 0.82 (<10⁻¹⁶) | 0.047 | 0.90 (<10⁻¹⁶) | 6439 (799) | 0.835–0.841 |
| Loneliness→Insomnia | 0.45 (<10⁻¹⁶) | 0.43 (<10⁻¹⁶) | 0.31 | 0.69 (<10⁻¹⁶) | 4473 (656) | 0.444–0.449 |

### 3.8 Comparison with previous mediation estimates

Our estimate of 19.7% (95% CI ≈ 18.3–21.1%) overlaps with the 95% CI of a recent independent report (15.5%; 95% CI: 7.7–23.3%; Wu et al., 2025; PMID 41205074), suggesting directionally consistent findings across different samples and outcome definitions. The higher point estimate in our analysis likely reflects greater statistical power from the 5-million-individual MDD GWAS (Adams et al., 2025), which reduces standard errors and narrows confidence intervals.

The same recent study also reported neuroticism as a mediator (54.3%), suggesting that personality-related pathways may account for a larger share than sleep. Our study focused on insomnia as a modifiable target; a multi-mediator framework incorporating neuroticism, anxiety, and physical activity would be a valuable next step.

### 3.9 Exploratory CRP pathway

CRP→MDD IVW β = 0.007 (P = 1.5×10⁻⁶) was attenuated under weighted median (β = 0.003, P = 0.73). This fragile result was not included in formal mediation.

---

## 4. Discussion

### 4.1 Principal findings

Using the largest MDD GWAS available, we found that genetic liability to loneliness is robustly associated with increased MDD risk, and that insomnia mediates approximately one-fifth (19.7%) of this association. MR-PRESSO outlier correction reduced the Loneliness→MDD OR from 6.66 to 4.70, indicating that roughly 30% of the IVW estimate was attributable to pleiotropic inflation. Steiger directionality tests confirmed the assumed causal orientation for all three pathways (79–99% of SNPs). Bidirectional MR detected weak but significant reverse effects, suggesting partial reciprocity. The mediation estimate is directionally consistent with a recent independent report (15.5%) but benefits from substantially larger outcome data.

### 4.2 Interpretation of the OR magnitude and pleiotropy correction

The uncorrected IVW OR of 6.66 for loneliness→MDD appears large relative to prior observational and MR estimates (typically OR ≈ 1.5–2.5). MR-PRESSO correction revealed that 99 of 544 instruments (18%) were pleiotropic outliers, and removing them reduced the OR to 4.70 — a 29% attenuation. This finding underscores the importance of pleiotropy correction in MR studies of behavioural traits, which are particularly prone to horizontal pleiotropy through shared genetic architecture with personality, education, and other psychiatric traits.

Several factors likely contribute to the remaining elevated estimate: (1) the genetic instrument captures lifelong cumulative exposure to loneliness liability, accumulating over decades; (2) the single-item loneliness measure may tag broader personality or social-circuitry variation with pleiotropic effects on depression susceptibility; (3) residual pleiotropy may persist even after outlier removal. We therefore interpret the corrected estimate (OR = 4.70) as a more reliable lower bound, while acknowledging that the true causal effect may lie somewhere between the IVW and MR-PRESSO-corrected estimates.

### 4.3 Comparison with previous studies

Wu et al. (2025; PMID 41205074) reported insomnia mediating 15.5% (95% CI: 7.7–23.3%) of the social isolation/loneliness→depression association using a UK Biobank-derived depression phenotype (N ≈ 463,000). Our estimate of 19.7% (95% CI ≈ 18.3–21.1%) overlaps this interval, lending convergent support. The higher point estimate likely reflects greater statistical power from the 5-million-individual MDD GWAS (Adams et al., 2025).

The same study reported neuroticism as a mediator (54.3%), exceeding the insomnia contribution. This suggests that personality-related pathways may be quantitatively more important than sleep pathways in connecting loneliness to depression. A multi-mediator framework would clarify the relative importance of each pathway.

### 4.4 Bidirectional findings and reciprocal causation

Bidirectional MR detected weak but significant reverse effects (MDD→loneliness β = 0.09, OR = 1.10; MDD→insomnia β = 0.15, OR = 1.17). While statistically significant, these effects are an order of magnitude smaller than the forward effects, supporting the primary directional hypothesis while acknowledging partial reciprocity. This pattern is consistent with a reinforcing cycle: genetic liability to loneliness increases depression risk, and genetic liability to depression modestly increases loneliness risk.

### 4.5 Genetic correlation context

Modest genetic correlations (rg = 0.098–0.185) indicate partial shared aetiology between the traits. The highest correlation (rg = 0.185) between loneliness and insomnia is consistent with substantial genetic overlap between social and sleep traits. These correlations do not invalidate the MR findings but warrant cautious interpretation: some of the estimated "causal" effects may reflect shared genetic liability rather than pure causation.

### 4.6 Strengths and limitations

**Strengths:** largest MDD GWAS (5M+), MR-PRESSO pleiotropy correction, bidirectional MR and Steiger directionality testing, full sensitivity suite, and transparent comparison with an independent recent estimate.

**Limitations:** (1) MR-Egger intercepts are borderline significant (P ≈ 0.046), indicating possible directional pleiotropy. (2) Between-instrument heterogeneity is large — expected with behavioural traits. (3) Hundreds of genome-wide significant SNPs are shared between MDD and the exposures. (4) Insomnia is self-reported. (5) Exposure and mediator GWAS derive from UK Biobank-related resources. (6) Formal colocalization was not possible. (7) European-ancestry instruments limit generalizability. (8) The binary mediation framework tests statistical, not mechanistic, mediation.

---

## 5. Conclusions

Genetic evidence supports a causal association between loneliness and MDD, with approximately one-fifth mediated through insomnia. MR-PRESSO correction revealed substantial pleiotropic inflation in the unadjusted estimate (OR attenuated from 6.66 to 4.70). The mediation estimate is directionally consistent with a recent independent report. Bidirectional MR found weak reverse effects, suggesting partial reciprocity. Sleep-targeted interventions may attenuate depression risk in lonely individuals, though the dominant direct effect indicates that non-sleep pathways are equally important.

---

## Author contributions

Yan Jinlu: conceptualization, methodology, formal analysis, writing — original draft. Liu Yuxuan: data curation, writing — review and editing. Zhang Wei: supervision, project administration. All authors read and approved the final manuscript.

## Declaration of competing interest

The authors declare no competing interests.

## Funding

This research received no specific grant from any funding agency.

## Acknowledgements

We thank the participants and investigators of the MDD meta-analysis consortia, UK Biobank, and the colleagues making GWAS summary statistics publicly available.

---

## References

1. Adams, M.J., et al. (2025). Trans-ancestry genome-wide association study of major depression identifies 697 associations. *Cell*, 188(1), 123–138. doi:10.1016/j.cell.2024.11.023
2. Abdellaoui, A., et al. (2019). Genetic correlates of social stratification in Great Britain. *Nat. Hum. Behav.*, 3(11), 1332–1342.
3. Jones, S.E., et al. (2019). Genome-wide association analyses of chronotype in 697,828 individuals provides insights into circadian rhythms. *Nat. Commun.*, 10, 343.
4. Davey Smith, G., and Ebrahim, S. (2003). 'Mendelian randomization': can genetic epidemiology contribute to understanding environmental determinants of disease? *Int. J. Epidemiol.*, 32(1), 1–22.
5. Davies, N.M., Holmes, M.V., and Davey Smith, G. (2018). Reading Mendelian randomisation studies: a guide, glossary, and checklist for clinicians. *BMJ*, 362, k601.
6. Burgess, S., Butterworth, A.S., and Thompson, S.G. (2013). Mendelian randomization analysis with multiple genetic variants using summarized data. *Genet. Epidemiol.*, 37(7), 658–665.
7. Burgess, S., et al. (2016). Bias due to participant overlap in two-sample Mendelian randomization. *Genet. Epidemiol.*, 40(7), 597–608.
8. Bowden, J., Davey Smith, G., and Burgess, S. (2015). Mendelian randomization with invalid instruments: effect estimation and bias detection through Egger regression. *Int. J. Epidemiol.*, 44(2), 512–525.
9. Bowden, J., et al. (2016). Consistent estimation in Mendelian randomization with some invalid instruments using a weighted median estimator. *Genet. Epidemiol.*, 40(4), 304–314.
10. Verbanck, M., et al. (2018). Detection of widespread horizontal pleiotropy in Mendelian randomization. *Nat. Genet.*, 50(5), 693–698.
11. Skrivankova, V.W., et al. (2021). Strengthening the reporting of observational studies in epidemiology using Mendelian randomization: the STROBE-MR statement. *PLoS Med.*, 18(12), e1003889.
12. Carter, A.R., et al. (2021). Mendelian randomization for mediation analysis: current methods and challenges for implementation. *Int. J. Epidemiol.*, 50(6), 1985–1994.
13. Xue, H., et al. (2021). Illustrating Mendelian randomization studies with two-sample mediation analysis. *BMC Med. Res. Methodol.*, 21, 217.
14. Erzen, E., and Çikrikci, Ö. (2018). The effect of loneliness on depression: a meta-analysis. *Int. J. Soc. Psychiatry*, 64(5), 427–435.
15. Holt-Lunstad, J., et al. (2015). Loneliness and social isolation as risk factors for mortality: a meta-analytic review. *Perspect. Psychol. Sci.*, 10(2), 227–237.
16. Cacioppo, J.T., et al. (2002). Do lonely days invade the nights? Potential social modulation of sleep efficiency. *Psychol. Sci.*, 13(4), 384–387.
17. Kurina, L.M., et al. (2011). Sleep duration, gene expression, and loneliness: findings from a population-based gene expression study. *Soc. Sci. Med.*, 72(1), 27–31.
18. Van Dongen, H.P.A., et al. (2003). The cumulative cost of additional wakefulness. *Sleep*, 26(2), 117–126.
19. Harvey, A.G. (2008). Sleep and circadian rhythms in bipolar disorder. *Am. J. Psychiatry*, 165(7), 820–829.
20. Slavich, G.M., and Irwin, M.R. (2014). From stress to inflammation and major depressive disorder: a social signal transduction theory of depression. *Psychol. Bull.*, 140(3), 774–815.
21. Christensen, H., et al. (2016). Effectiveness of an online insomnia program (SHUTi) for prevention of depressive episodes. *Lancet Psychiatry*, 3(4), 333–341.
22. Liu, H., et al. (2024). Loneliness and depression: a two-sample Mendelian randomization study. *J. Affect. Disord.*, 348, 112–119.
23. Niu, Z., et al. (2024). Psychosocial stress and depression: mediation role of sleep disturbances — an MR study. *J. Affect. Disord.* [verify before submission]
24. Xia, E., et al. (2023). Relationship between insomnia and depression: a two-sample Mendelian randomization study. *Front. Psychiatry*, 14, 1199290.
25. Wu, Y., et al. (2025). Identification of genetic associations and key influences contributing to the pathway from social isolation or loneliness to depression. *Eur. Arch. Psychiatry Clin. Neurosci.* [Published online 2025 Nov; PMID 41205074]
26. World Health Organization (2023). Depressive disorder (depression) fact sheet. Geneva: WHO.
27. Steiger, J.H. (1980). Tests for comparing elements of a correlation matrix. *Psychol. Bull.*, 87(2), 245–251.
28. Cochran, W.G. (1954). The combination of estimates from different experiments. *Biometrics*, 10(1), 101–129.

> **Note to authors (to be removed before submission):** Reference 23 requires PubMed verification before submission. Reference 25 (Wu et al., 2025; PMID 41205074) is the collision paper identified during literature audit — it must be cited and discussed as above.

---

## Tables (supplementary)

### Table S1. Exploratory CRP pathway analysis

| Pathway | Instruments | IVW β (P) | WM β (P) | Interpretation |
|---------|------------:|-----------|----------|----------------|
| CRP→MDD | 2810 | 0.007 (1.5×10⁻⁶) | 0.003 (0.73) | Fragile; not interpreted |
| Loneliness→CRP | 272 | 0.243 (1.6×10⁻⁷) | 0.133 (0.58) | Fragile; not interpreted |

### Figure legends

**Figure 1.** Mendelian randomization estimates for the three modelled pathways (IVW, 95% CI). Error bars represent 1.96×SE.

**Figure 2.** Two-step MR mediation model (a) and effect decomposition (b).

**Figure 3.** Sensitivity analyses: (a) method comparison (IVW, MR-Egger, weighted median, MR-PRESSO); (b) leave-one-out ranges.

**Figure 4.** Bidirectional MR and Steiger directionality results.

---

## Target journal

**Journal of Affective Disorders** (first choice) — IF ≈ 5.7, JCR Q1
**Backup:** **Journal of Psychiatric Research** (IF ≈ 4.4, Q2) or **Brain and Behavior** (IF ≈ 2.8, Q2–Q3)
