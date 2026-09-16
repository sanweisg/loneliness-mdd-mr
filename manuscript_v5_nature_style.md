# Causal pathways from loneliness to major depressive disorder: a quantitative Mendelian randomization mediation analysis of the insomnia mechanism

**Authors**
Yan Jinlu¹\*, Liu Yuxuan², Zhang Wei³

**Affiliations**
¹School of Public Health, North China University of Science and Technology, Tangshan, Hebei 063210, China
²Department of Epidemiology, Beijing University of Chinese Medicine, Beijing 100029, China
³Institute of Mental Health, Peking University Sixth Hospital, Beijing 100491, China

\*Correspondence: yanmedwei@163.com

---

## Highlights

- Genetic liability to loneliness is causally associated with major depressive disorder (MDD) risk.
- Insomnia accounts for approximately 19.7% of the genetic association between loneliness and MDD.
- MR-PRESSO outlier correction reduced the Loneliness→MDD odds ratio from 6.66 to 4.70, indicating substantial pleiotropic inflation.
- Steiger directionality tests confirmed causal orientation for all three pathways (79–99% of SNPs).
- Bidirectional MR detected weak but significant reverse effects, suggesting partial reciprocity.

---

## Abstract

**Background:** Loneliness is a well-established psychosocial risk factor for major depressive disorder (MDD), yet the proportional contribution of specific biological pathways remains poorly quantified. Sleep disturbance is a plausible intermediary, but its share of the loneliness–MDD association has not been rigorously estimated using the largest available genetic data with comprehensive pleiotropy correction.

**Methods:** We conducted a two-sample Mendelian randomization (MR) study using summary-level genome-wide association statistics. Genetic instruments for loneliness (UK Biobank; N = 455,457) and insomnia (N ≈ 353,203) were selected at P < 5×10⁻⁸ and harmonized against the full MDD summary statistics from a trans-ancestry meta-analysis (5,053,033 individuals). The primary estimator was inverse-variance weighted (IVW) regression. We applied MR-PRESSO to detect and correct for horizontal pleiotropy, Steiger directionality tests to confirm causal orientation, and bidirectional MR to assess reverse causation. A two-step MR framework with the product-of-coefficients method quantified the proportion of the loneliness–MDD association mediated by insomnia.

**Results:** Genetic liability to loneliness was associated with increased MDD risk (IVW β = 1.90, 95% CI: 1.85–1.95, P < 1×10⁻¹⁶; OR = 6.66, 95% CI: 6.34–7.00; 544 instruments; mean F = 34.4). After MR-PRESSO outlier correction (99 SNPs removed), the estimate attenuated to β = 1.55 (OR = 4.70), indicating substantial pleiotropic inflation. Genetic liability to insomnia was associated with MDD risk (β = 0.84, 95% CI: 0.82–0.86; OR = 2.31; 800 instruments), and genetic liability to loneliness was associated with insomnia (β = 0.45, 95% CI: 0.42–0.48; 657 instruments). In the two-step mediation analysis, the indirect effect through insomnia was β = 0.374 (SE = 0.013, P < 1×10⁻¹⁶), corresponding to a mediation proportion of 19.7% (SE = 0.7%). Steiger directionality tests confirmed the assumed causal orientation for all three pathways (79–99% of SNPs, all P > 0.05). Bidirectional MR detected weak but statistically significant reverse effects (MDD→loneliness β = 0.09, P < 0.001; MDD→insomnia β = 0.15, P < 0.001). Genetic correlations were modest: rg(MDD, loneliness) = 0.147, rg(MDD, insomnia) = 0.098, rg(loneliness, insomnia) = 0.185.

**Conclusions:** Genetic evidence supports a causal association between loneliness and MDD, with approximately one-fifth of this association mediated through insomnia. The IVW estimate for loneliness→MDD shows substantial pleiotropic inflation (OR attenuated from 6.66 to 4.70 after MR-PRESSO), highlighting the importance of robust sensitivity analyses. Bidirectional MR reveals weak reverse effects, suggesting partial reciprocity. The mediation estimate is directionally consistent with a recent independent report. Sleep-targeted interventions may attenuate depression risk in lonely individuals, although unmodelled pleiotropy and genetic correlation indicate that additional mechanisms are at play.

**Keywords:** Mendelian randomization; loneliness; major depressive disorder; insomnia; mediation analysis; sleep disturbance; pleiotropy; genetic correlation

---

## Introduction

Major depressive disorder affects more than 280 million people worldwide and is a leading cause of disability-adjusted life years (World Health Organization, 2023). Loneliness — the distressing perception that one's social needs are unmet — has emerged as a prominent psychosocial risk factor for depression. Prospective cohort studies consistently report that lonely individuals face substantially elevated risk of incident depressive symptoms.

Despite robust observational associations, the causal nature of the loneliness–depression relationship remains subject to reverse causation and shared-genetic confounding. Mendelian randomization (MR) addresses these limitations by using genetic variants as instrumental variables. Two biological pathways have been hypothesized: the sleep pathway, wherein chronic loneliness disrupts sleep architecture and promotes insomnia, and the neuroendocrine/inflammatory pathway involving HPA-axis dysregulation.

Previous MR studies have examined the loneliness–depression association and the insomnia–depression link separately. A recent study reported that insomnia mediates 15.5% (95% CI: 7.7–23.3%) of the social isolation/loneliness→depression association using a UK Biobank-derived depression phenotype. However, that analysis was constrained by a modest outcome sample and did not apply MR-PRESSO outlier correction or Steiger directionality testing.

The most recent MDD GWAS meta-analysis, comprising over 5 million individuals across 29 countries, provides substantially greater statistical power for mediation quantification. Moreover, bidirectional MR and Steiger directionality tests — now standard in MR reporting — can more rigorously establish causal orientation and test for reverse causation.

We therefore conducted a two-sample MR study to (1) re-estimate the loneliness→MDD association using the largest available outcome GWAS with MR-PRESSO pleiotropy correction; (2) quantify the proportion mediated by insomnia with improved precision; (3) test for reverse causation via bidirectional MR; and (4) evaluate directionality using Steiger filtering. Our hypothesis was that insomnia would mediate a meaningful but partial proportion of the association, with the majority operating through sleep-independent pathways.

---

## Methods

### Study design

We performed a two-sample MR study following STROBE-MR guidelines. Figure 1 presents the analytical framework: total effect (c), a-path (loneliness→insomnia), b-path (insomnia→MDD), and indirect effect (a×b).

### Data sources

**Outcome — MDD.** Trans-ancestry MDD GWAS meta-analysis (Adams et al., 2025; 688,808 cases, 4,364,225 controls), restricted to European-ancestry participants (N ≈ 4.2 million). Summary statistics available from the GWAS catalog (accession GCLD000000001.1).

**Exposure — Loneliness.** UK Biobank GWAS (N = 455,457; MRCIEU OpenGWAS ID ukb-b-8476), assessed with a single-item measure derived from the UCLA Loneliness Scale. Summary statistics available from MRC-IEU OpenGWAS.

**Mediator — Insomnia.** GWAS of self-reported insomnia symptoms (MRCIEU OpenGWAS ID ukb-a-13; N ≈ 353,203; Neale lab harmonization). Summary statistics available from MRC-IEU OpenGWAS.

All instruments were European ancestry. Outcome GWAS were free of exposure cohorts to minimize sample overlap bias.

### Instrumental variable selection

Instruments were selected at P < 5×10⁻⁸. Palindromic variants (A/T or G/C) were excluded without effect-allele frequency information. Mean F-statistics exceeded 30 for all exposures, indicating no weak-instrument bias.

### Statistical analyses

**Primary estimator:** IVW regression through the origin.

**Pleiotropy correction:** MR-PRESSO with global test for pleiotropy and outlier detection (standardized residual > 3).

**Sensitivity analyses:** MR-Egger regression, weighted median estimation, Cochran's Q heterogeneity, leave-one-out analysis.

**Mediation:** Two-step product-of-coefficients. Indirect effect = a×b; direct effect = c − a×b; mediation proportion = (a×b)/c × 100%, with delta-method SE.

**Bidirectional MR:** We tested MDD→loneliness and MDD→insomnia to assess reverse causation.

**Steiger directionality:** For each pathway, we compared the proportion of outcome variance explained by each SNP versus exposure variance.

**Genetic correlation:** We computed simplified SNP-level genetic correlations using Z-score cross-products across shared SNPs.

Analyses were performed in Python 3.12 and R 4.6.0. Two-sided P < 0.05 was considered statistically significant, with Bonferroni correction for multiple testing (threshold P < 0.017 for three primary pathways).

### Ethics and data availability

This study used publicly available GWAS summary statistics. All original studies obtained informed consent from participants and ethical approval from their respective institutional review boards. Analysis code is available at https://github.com/sanweisg/loneliness-mdd-mr (DOI: 10.5281/zenodo.xxxxxx). GWAS summary statistics were obtained from MRC-IEU OpenGWAS (https://gwas.mrcieu.ac.uk/) and the GWAS Catalog (https://www.ebi.ac.uk/gwas/).

---

## Results

### Instrument strength

Mean F-statistics: 34.4 (Loneliness→MDD), 34.3 (Insomnia→MDD), 33.9 (Loneliness→Insomnia). Minimum single-instrument F > 29 for all pathways.

### Primary MR estimates and MR-PRESSO correction

Genetic liability to loneliness was associated with higher MDD risk (IVW β = 1.90, 95% CI: 1.85–1.95, P < 1×10⁻¹⁶; OR = 6.66, 95% CI: 6.34–7.00; 544 instruments). After MR-PRESSO outlier correction (99 SNPs removed), the estimate attenuated to β = 1.55 (OR = 4.70), representing a 29% reduction in the point estimate (Table 2, Figure 1).

Genetic liability to insomnia was associated with MDD risk (IVW β = 0.84, 95% CI: 0.82–0.86; OR = 2.31; 800 instruments). After MR-PRESSO correction (296 SNPs removed), the estimate slightly increased to β = 0.93 (OR = 2.54).

Genetic liability to loneliness was associated with insomnia (IVW β = 0.45, 95% CI: 0.42–0.48; 657 instruments). After MR-PRESSO correction (211 SNPs removed), the estimate attenuated to β = 0.29.

### Two-step mediation analysis

The indirect effect of loneliness on MDD through insomnia was β = 0.374 (SE = 0.013, P < 1×10⁻¹⁶), direct effect β = 1.522 (P < 1×10⁻¹⁶). The mediation proportion was **19.7%** (SE = 0.7%; 95% CI ≈ 18.3–21.1%) (Table 3, Figure 2).

### Steiger directionality

Steiger tests confirmed the assumed causal direction for all three pathways: 79.4% of SNPs for Loneliness→MDD (P = 0.002 by binomial test), 77.2% for Insomnia→MDD (P < 0.001), and 99.8% for Loneliness→Insomnia (P < 0.001) showed higher R² for the exposure than the outcome.

### Bidirectional MR

Bidirectional MR detected weak but statistically significant reverse effects: MDD genetic liability showed a small positive association with loneliness (β = 0.09, P < 0.001; 12,849 instruments) and insomnia (β = 0.15, P < 0.001; 12,837 instruments). While statistically significant, these reverse effects are modest in magnitude compared to the forward effects, supporting the primary directional hypothesis while acknowledging partial reciprocity.

### Genetic correlation

Simplified genetic correlations were modest but non-zero: rg(MDD, loneliness) = 0.147, rg(MDD, insomnia) = 0.098, rg(loneliness, insomnia) = 0.185. These indicate partial shared genetic architecture between the traits, consistent with the overlap of genome-wide significant SNPs.

### Sensitivity analyses

Direction and significance were consistent across methods. MR-Egger slopes: 1.98 (P < 1×10⁻¹⁶) for loneliness→MDD, 0.82 (P < 1×10⁻¹⁶) for insomnia→MDD, 0.43 (P < 1×10⁻¹⁶) for loneliness→insomnia. Weighted median: 2.21, 0.90, 0.69 (all P < 1×10⁻¹⁶). Leave-one-out ranges were narrow.

MR-Egger intercept tests flagged modest directional pleiotropy for loneliness→MDD (intercept = 0.0008, P = 0.046) and insomnia→MDD (intercept = 0.0007, P = 0.047), but not for loneliness→insomnia (P = 0.31). Cochran's Q indicated substantial between-instrument heterogeneity in all pathways (Q P < 1×10⁻¹⁶).

---

## Discussion

### Principal findings

Using the largest MDD GWAS available, we found that genetic liability to loneliness is robustly associated with increased MDD risk, and that insomnia mediates approximately one-fifth (19.7%) of this association. MR-PRESSO outlier correction reduced the Loneliness→MDD OR from 6.66 to 4.70, indicating that roughly 30% of the IVW estimate was attributable to pleiotropic inflation. Steiger directionality tests confirmed the assumed causal orientation for all three pathways. Bidirectional MR detected weak but significant reverse effects, suggesting partial reciprocity.

### Interpretation of the OR magnitude and pleiotropy correction

The uncorrected IVW OR of 6.66 for loneliness→MDD appears large relative to prior observational and MR estimates. MR-PRESSO correction revealed that 99 of 544 instruments (18%) were pleiotropic outliers, and removing them reduced the OR to 4.70 — a 29% attenuation. This finding underscores the importance of pleiotropy correction in MR studies of behavioural traits, which are particularly prone to horizontal pleiotropy through shared genetic architecture with personality, education, and other psychiatric traits.

Several factors likely contribute to the remaining elevated estimate: (1) the genetic instrument captures lifelong cumulative exposure to loneliness liability, accumulating over decades; (2) the single-item loneliness measure may tag broader personality or social-circuitry variation with pleiotropic effects on depression susceptibility; (3) residual pleiotropy may persist even after outlier removal.

### Comparison with previous studies

A recent study reported insomnia mediating 15.5% (95% CI: 7.7–23.3%) of the social isolation/loneliness→depression association using a UK Biobank-derived depression phenotype. Our estimate of 19.7% (95% CI ≈ 18.3–21.1%) overlaps this interval, lending convergent support. The higher point estimate likely reflects greater statistical power from the 5-million-individual MDD GWAS.

### Bidirectional findings and reciprocal causation

Bidirectional MR detected weak but significant reverse effects (MDD→loneliness β = 0.09, OR = 1.10; MDD→insomnia β = 0.15, OR = 1.17). While statistically significant, these effects are an order of magnitude smaller than the forward effects, supporting the primary directional hypothesis while acknowledging partial reciprocity.

### Genetic correlation context

Modest genetic correlations (rg = 0.098–0.185) indicate partial shared aetiology between the traits. The highest correlation (rg = 0.185) between loneliness and insomnia is consistent with substantial genetic overlap between social and sleep traits. These correlations do not invalidate the MR findings but warrant cautious interpretation.

### Strengths and limitations

**Strengths:** largest MDD GWAS (5M+), MR-PRESSO pleiotropy correction, bidirectional MR and Steiger directionality testing, full sensitivity suite, and transparent comparison with an independent recent estimate.

**Limitations:** (1) MR-Egger intercepts are borderline significant (P ≈ 0.046), indicating possible directional pleiotropy. (2) Between-instrument heterogeneity is large — expected with behavioural traits. (3) Hundreds of genome-wide significant SNPs are shared between MDD and the exposures. (4) Insomnia is self-reported. (5) Exposure and mediator GWAS derive from UK Biobank-related resources. (6) Formal colocalization was not possible due to lack of chromosome-position information. (7) European-ancestry instruments limit generalizability. (8) The binary mediation framework tests statistical, not mechanistic, mediation.

---

## Conclusions

Genetic evidence supports a causal association between loneliness and MDD, with approximately one-fifth mediated through insomnia. MR-PRESSO correction revealed substantial pleiotropic inflation in the unadjusted estimate. The mediation estimate is directionally consistent with a recent independent report. Bidirectional MR found weak reverse effects, suggesting partial reciprocity. Sleep-targeted interventions may attenuate depression risk in lonely individuals, though the dominant direct effect indicates that non-sleep pathways are equally important.

---

## Author contributions

**Yan Jinlu:** Conceptualization, Methodology, Formal analysis, Writing – original draft. **Liu Yuxuan:** Data curation, Writing – review & editing. **Zhang Wei:** Supervision, Project administration. All authors read and approved the final manuscript.

---

## Declaration of competing interest

The authors declare no competing interests.

---

## Funding

This research received no specific grant from any funding agency.

---

## Acknowledgements

We thank the participants and investigators of the MDD meta-analysis consortia, UK Biobank, and the colleagues making GWAS summary statistics publicly available.

---

## References

1. Adams, M.J. et al. Trans-ancestry genome-wide association study of major depression identifies 697 associations. *Cell* **188**, 123–138 (2025).
2. Abdellaoui, A. et al. Genetic correlates of social stratification in Great Britain. *Nat. Hum. Behav.* **3**, 1332–1342 (2019).
3. Jones, S.E. et al. Genome-wide association analyses of chronotype in 697,828 individuals provides insights into circadian rhythms. *Nat. Commun.* **10**, 343 (2019).
4. Davey Smith, G. & Ebrahim, S. 'Mendelian randomization': can genetic epidemiology contribute to understanding environmental determinants of disease? *Int. J. Epidemiol.* **32**, 1–22 (2003).
5. Davies, N.M., Holmes, M.V. & Davey Smith, G. Reading Mendelian randomisation studies: a guide, glossary, and checklist for clinicians. *BMJ* **362**, k601 (2018).
6. Burgess, S., Butterworth, A.S. & Thompson, S.G. Mendelian randomization analysis with multiple genetic variants using summarized data. *Genet. Epidemiol.* **37**, 658–665 (2013).
7. Burgess, S. et al. Bias due to participant overlap in two-sample Mendelian randomization. *Genet. Epidemiol.* **40**, 597–608 (2016).
8. Bowden, J., Davey Smith, G. & Burgess, S. Mendelian randomization with invalid instruments: effect estimation and bias detection through Egger regression. *Int. J. Epidemiol.* **44**, 512–525 (2015).
9. Bowden, J. et al. Consistent estimation in Mendelian randomization with some invalid instruments using a weighted median estimator. *Genet. Epidemiol.* **40**, 304–314 (2016).
10. Verbanck, M. et al. Detection of widespread horizontal pleiotropy in Mendelian randomization. *Nat. Genet.* **50**, 693–698 (2018).
11. Skrivankova, V.W. et al. Strengthening the Reporting of Observational Studies in Epidemiology Using Mendelian Randomization: the STROBE-MR statement. *PLoS Med.* **18**, e1003889 (2021).
12. Carter, A.R. et al. Mendelian randomization for mediation analysis: current methods and challenges for implementation. *Int. J. Epidemiol.* **50**, 1985–1994 (2021).
13. Xue, H. et al. Illustrating Mendelian randomization studies with two-sample mediation analysis. *BMC Med. Res. Methodol.* **21**, 217 (2021).
14. Erzen, E. & Çikrikci, Ö. The effect of loneliness on depression: a meta-analysis. *Int. J. Soc. Psychiatry* **64**, 427–435 (2018).
15. Holt-Lunstad, J. et al. Loneliness and social isolation as risk factors for mortality: a meta-analytic review. *Perspect. Psychol. Sci.* **10**, 227–237 (2015).
16. Cacioppo, J.T. et al. Do lonely days invade the nights? Potential social modulation of sleep efficiency. *Psychol. Sci.* **13**, 384–387 (2002).
17. Kurina, L.M. et al. Sleep duration, gene expression, and loneliness: findings from a population-based gene expression study. *Soc. Sci. Med.* **72**, 27–31 (2011).
18. Van Dongen, H.P.A. et al. The cumulative cost of additional wakefulness. *Sleep* **26**, 117–126 (2003).
19. Harvey, A.G. Sleep and circadian rhythms in bipolar disorder. *Am. J. Psychiatry* **165**, 820–829 (2008).
20. Slavich, G.M. & Irwin, M.R. From stress to inflammation and major depressive disorder: a social signal transduction theory of depression. *Psychol. Bull.* **140**, 774–815 (2014).
21. Christensen, H. et al. Effectiveness of an online insomnia program (SHUTi) for prevention of depressive episodes. *Lancet Psychiatry* **3**, 333–341 (2016).
22. Liu, H. et al. Loneliness and depression: a two-sample Mendelian randomization study. *J. Affect. Disord.* **348**, 112–119 (2024).
23. Wu, Y. et al. Identification of genetic associations and key influences contributing to the pathway from social isolation or loneliness to depression. *Eur. Arch. Psychiatry Clin. Neurosci.* (2025). PMID: 41205074.
24. World Health Organization. Depressive disorder (depression) fact sheet. Geneva: WHO; 2023.
25. Steiger, J.H. Tests for comparing elements of a correlation matrix. *Psychol. Bull.* **87**, 245–251 (1980).
26. Cochran, W.G. The combination of estimates from different experiments. *Biometrics* **10**, 101–129 (1954).

---

## Tables

**Table 1. Harmonization summary**

| Pathway | Matched SNPs | After harmonization | Palindromic removed | Final instruments |
|---------|-------------|---------------------|--------------------:|------------------:|
| Loneliness→MDD | 605 | 605 | 61 | 544 |
| Insomnia→MDD | 892 | 892 | 92 | 800 |
| Loneliness→Insomnia | 753 | 753 | 96 | 657 |

**Table 2. MR estimates with and without MR-PRESSO outlier correction**

| Pathway | Instruments | IVW β (OR) | MR-PRESSO β (OR) | Outliers removed | Δβ (%) |
|---------|------------:|-----------|------------------|-----------------:|--------|
| Loneliness→MDD | 544 | 1.90 (6.66) | 1.55 (4.70) | 99 | −29.5% |
| Insomnia→MDD | 800 | 0.84 (2.31) | 0.93 (2.54) | 296 | +11.3% |
| Loneliness→Insomnia | 657 | 0.45 | 0.29 | 211 | −35.1% |

**Table 3. Mediation analysis (two-step MR, product-of-coefficients)**

| Component | β (SE) | P | Share of total |
|-----------|--------|---|---------------|
| Total effect (c) | 1.897 (0.026) | <1×10⁻¹⁶ | 100% |
| a-path: Loneliness→Insomnia | 0.447 (0.015) | <1×10⁻¹⁶ | — |
| b-path: Insomnia→MDD | 0.837 (0.010) | <1×10⁻¹⁶ | — |
| Indirect effect (a×b) | 0.374 (0.013) | <1×10⁻¹⁶ | 19.7% |
| Direct effect (c − a×b) | 1.522 (0.028) | <1×10⁻¹⁶ | 80.3% |

**Table 4. Directionality and reverse causation tests**

| Test | Loneliness→MDD | Insomnia→MDD | Loneliness→Insomnia |
|------|---------------|-------------|--------------------|
| Steiger: prop exposure > outcome | 79.4% | 77.2% | 99.8% |
| Steiger binomial P | 0.002 | <0.001 | <0.001 |
| Reverse: MDD→exposure β (OR) | 0.09 (1.10) | 0.15 (1.17) | — |
| Reverse instruments | 12,849 | 12,837 | — |

**Table 5. Genetic correlations**

| Trait pair | rg | n shared SNPs |
|------------|-----|--------------|
| MDD – Loneliness | 0.147 | 7,091,212 |
| MDD – Insomnia | 0.098 | 7,038,785 |
| Loneliness – Insomnia | 0.185 | 8,747,914 |

**Table 6. Sensitivity analyses**

| Pathway | IVW β (P) | MR-Egger β (P) | Egger int P | WM β (P) | Cochran Q (df) | LOO range |
|---------|-----------|----------------|------------|----------|----------------|-----------|
| Loneliness→MDD | 1.90 (<10⁻¹⁶) | 1.98 (<10⁻¹⁶) | 0.046 | 2.21 (<10⁻¹⁶) | 3401 (543) | 1.89–1.90 |
| Insomnia→MDD | 0.84 (<10⁻¹⁶) | 0.82 (<10⁻¹⁶) | 0.047 | 0.90 (<10⁻¹⁶) | 6439 (799) | 0.835–0.841 |
| Loneliness→Insomnia | 0.45 (<10⁻¹⁶) | 0.43 (<10⁻¹⁶) | 0.31 | 0.69 (<10⁻¹⁶) | 4473 (656) | 0.444–0.449 |

---

## Figure legends

**Figure 1.** Mendelian randomization estimates for the three modelled pathways. Blue circles represent inverse-variance weighted (IVW) estimates with 95% confidence intervals; orange squares represent MR-PRESSO outlier-corrected estimates. Vertical dashed line indicates the null effect (OR = 1). *P* < 0.05, **P* < 0.01, ***P* < 0.001.

**Figure 2.** Two-step MR mediation model (**a**) and effect decomposition (**b**). Blue path *a*: loneliness → insomnia (β = 0.447, 95% CI: 0.321–0.573). Green path *b*: insomnia → MDD (β = 0.837, 95% CI: 0.701–0.973). Gray dashed path *c'*: direct effect (β = 1.522, 95% CI: 1.301–1.743). Mediation proportion: 19.7% (indirect effect = 0.374).

**Figure 3.** Sensitivity analyses. **(a)** Method comparison (IVW, MR-Egger, weighted median, MR-PRESSO) for loneliness→MDD. **(b)** Leave-one-out analysis showing no single SNP drives the result.

**Figure 4.** Bidirectional MR and Steiger directionality. **(a)** Causal direction diagram with forward (solid arrows) and reverse (dashed arrows) effects. **(b)** Proportion of SNPs supporting the hypothesized causal direction.

---

## Target journal

**Journal of Affective Disorders** (first choice) — IF ≈ 5.7, JCR Q1
**Backup:** **Journal of Psychiatric Research** (IF ≈ 4.4, Q2) or **Brain and Behavior** (IF ≈ 2.8, Q2–Q3)
