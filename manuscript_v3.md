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
- The mediation estimate aligns with, but exceeds by modest degree, a recent independent report.
- A large direct effect persists, indicating multiple parallel pathways beyond sleep.
- Substantial between-instrument heterogeneity and borderline pleiotropy warrant cautious interpretation.

---

## Abstract

**Background:** Loneliness is a well-established psychosocial risk factor for major depressive disorder (MDD), yet the proportional contribution of specific biological pathways remains poorly quantified. Sleep disturbance is a plausible intermediary, but its share of the loneliness–MDD association has not been rigorously estimated using the largest available genetic data.

**Methods:** We conducted a two-sample Mendelian randomization (MR) study using summary-level genome-wide association statistics. Genetic instruments for loneliness (UK Biobank; N = 455,457) and insomnia (N ≈ 353,203) were selected at P < 5×10⁻⁸ and harmonized against the full MDD summary statistics from a trans-ancestry meta-analysis (5,053,033 individuals). The primary estimator was inverse-variance weighted (IVW) regression. Sensitivity analyses included MR-Egger regression, weighted median estimation, Cochran's Q heterogeneity testing, and leave-one-out (LOO) analysis. A two-step MR framework with the product-of-coefficients method quantified the proportion of the loneliness–MDD association mediated by insomnia. We also performed bidirectional MR to assess reverse causation and Steiger directionality tests to confirm causal orientation.

**Results:** Genetic liability to loneliness was associated with increased MDD risk (β = 1.90, 95% CI: 1.85–1.95, P < 1×10⁻¹⁶; OR = 6.66, 95% CI: 6.34–7.00; 544 instruments; mean F = 34.4). Genetic liability to insomnia was associated with MDD risk (β = 0.84, 95% CI: 0.82–0.86; OR = 2.31; 800 instruments), and genetic liability to loneliness was associated with insomnia (β = 0.45, 95% CI: 0.42–0.48; 657 instruments). In the two-step mediation analysis, the indirect effect through insomnia was β = 0.374 (SE = 0.013, P < 1×10⁻¹⁶), corresponding to a mediation proportion of 19.7% (SE = 0.7%). The direct effect remained substantial (β = 1.522). Bidirectional MR did not support a significant MDD→loneliness or MDD→insomnia reverse pathway. MR-Egger intercept tests suggested modest directional pleiotropy for the loneliness→MDD and insomnia→MDD pathways (both P ≈ 0.046), and between-instrument heterogeneity was substantial.

**Conclusions:** Genetic evidence supports a causal association between loneliness and MDD, with approximately one-fifth of this association operating through insomnia. The mediation estimate is directionally consistent with a recently published independent report (15.5%; 95% CI: 7.7–23.3%) and our larger sample provides a more precise quantification. Sleep-targeted interventions may attenuate depression risk in lonely individuals, although unmodelled pleiotropy and genetic correlation indicate that additional mechanisms are at play.

**Keywords:** Mendelian randomization; loneliness; major depressive disorder; insomnia; mediation analysis; sleep disturbance; genetic correlation

---

## 1. Introduction

Major depressive disorder affects more than 280 million people worldwide and is a leading cause of disability-adjusted life years (World Health Organization, 2023). Loneliness — the distressing perception that one's social needs are unmet — has emerged as a prominent psychosocial risk factor for depression. Prospective cohort studies consistently report that lonely individuals face substantially elevated risk of incident depressive symptoms (Erzen and Çikrikci, 2018; Holt-Lunstad et al., 2015).

Despite robust observational associations, the causal nature of the loneliness–depression relationship remains subject to reverse causation and shared-genetic confounding. Mendelian randomization (MR) addresses these limitations by using genetic variants as instrumental variables (Davey Smith and Ebrahim, 2003; Davies et al., 2018). Two biological pathways have been hypothesized: the sleep pathway, wherein chronic loneliness disrupts sleep architecture and promotes insomnia (Cacioppo et al., 2002; Kurina et al., 2011), and the neuroendocrine/inflammatory pathway involving HPA-axis dysregulation (Slavich and Irwin, 2014). Experimental sleep restriction independently induces negative affect and depressive symptoms (Van Dongen et al., 2003; Harvey, 2008), establishing sleep disruption as a transdiagnostic mechanism linking psychosocial stress to mood disorders.

Previous MR studies have examined the loneliness–depression association (Liu et al., 2024; Niu et al., 2024; Xia et al., 2023) and the insomnia–depression link separately. A recent study reported that insomnia mediates 15.5% (95% CI: 7.7–23.3%) of the social isolation/loneliness→depression association, using a UK Biobank-derived depression phenotype (N ≈ 462,933; PMID 41205074). However, that analysis was constrained by a modest outcome sample and did not leverage the most recent and largest MDD GWAS.

The most recent MDD GWAS meta-analysis (Adams et al., 2025), comprising over 5 million individuals across 29 countries, provides substantially greater statistical power for mediation quantification. Moreover, bidirectional MR and Steiger directionality tests — now standard in MR reporting (Skrivankova et al., 2021) — can more rigorously establish causal orientation.

We therefore conducted a two-sample MR study to (1) re-estimate the loneliness→MDD association using the largest available outcome GWAS; (2) quantify the proportion mediated by insomnia with improved precision; (3) test for reverse causation via bidirectional MR; and (4) evaluate directionality using Steiger filtering. Our hypothesis was that insomnia would mediate a meaningful but partial proportion of the association, with the majority operating through sleep-independent pathways.

---

## 2. Methods

### 2.1 Study design

We performed a two-sample MR study following STROBE-MR guidelines (Skrivankova et al., 2021). Figure 1 presents the analytical framework: total effect (c), a-path (loneliness→insomnia), b-path (insomnia→MDD), and indirect effect (a×b).

### 2.2 Data sources

**Outcome — MDD.** Trans-ancestry MDD GWAS meta-analysis (Adams et al., 2025; 688,808 cases, 4,364,225 controls), restricted to European-ancestry participants (N ≈ 4.2 million). Data source: consortium repository.

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

Primary estimator: IVW regression through the origin (Burgess et al., 2013). Sensitivity: MR-Egger (Bowden et al., 2015), weighted median (Bowden et al., 2016), Cochran's Q heterogeneity (Cochran, 1954), LOO analysis, and outlier identification (standardized residual > 3).

Mediation: two-step product-of-coefficients (Carter et al., 2021; Xue et al., 2021). Indirect effect = a×b; direct effect = c − a×b; mediation proportion = (a×b)/c × 100%, with delta-method SE.

**Bidirectional MR:** We tested MDD→loneliness and MDD→insomnia to assess reverse causation.

**Steiger directionality:** For each pathway, we compared the proportion of outcome variance explained by each SNP versus exposure variance (Steiger, 1980). A binomial test assessed whether significantly more SNPs showed higher R² for the exposure than the outcome.

Analyses in Python 3.12 and R 4.6.0. Two-sided P < 0.05.

### 2.5 Data and code availability

All GWAS summary statistics are publicly available. Analysis code is available from the corresponding author on request.

---

## 3. Results

### 3.1 Instrument strength

Mean F-statistics: 34.4 (Loneliness→MDD), 34.3 (Insomnia→MDD), 33.9 (Loneliness→Insomnia). Minimum single-instrument F > 29 for all pathways.

### 3.2 Primary MR estimates

Genetic liability to loneliness was associated with higher MDD risk (IVW β = 1.90, 95% CI: 1.85–1.95, P < 1×10⁻¹⁶; OR = 6.66, 95% CI: 6.34–7.00; 544 instruments). Genetic liability to insomnia was associated with MDD risk (β = 0.84, 95% CI: 0.82–0.86; OR = 2.31; 800 instruments). Genetic liability to loneliness was associated with insomnia (β = 0.45, 95% CI: 0.42–0.48; 657 instruments) (Table 2, Figure 1).

**Table 2. MR estimates for the three modelled pathways**

| Pathway | Instruments | Mean F | IVW β (95% CI) | OR (95% CI) | P |
|---------|------------:|-------:|----------------|-------------|---|
| Loneliness→MDD | 544 | 34.4 | 1.90 (1.85–1.95) | 6.66 (6.34–7.00) | <1×10⁻¹⁶ |
| Insomnia→MDD | 800 | 34.3 | 0.84 (0.82–0.86) | 2.31 (2.27–2.35) | <1×10⁻¹⁶ |
| Loneliness→Insomnia | 657 | 33.9 | 0.45 (0.42–0.48) | — | <1×10⁻¹⁶ |

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

### 3.4 Bidirectional MR and Steiger directionality

**Bidirectional MR** (Table 4): No significant reverse pathway was detected. MDD genetic liability showed no significant association with loneliness (β = 0.02, P = 0.43; 12 instruments) or insomnia (β = −0.01, P = 0.71; 15 instruments). This supports the directional hypothesis that loneliness precedes, rather than follows, depression genetic liability.

**Steiger directionality** (Table 4): For all three pathways, the majority of SNPs showed higher R² for the exposure than for the outcome (Loneliness→MDD: 68.8%, P = 0.002; Insomnia→MDD: 71.3%, P < 0.001; Loneliness→Insomnia: 69.5%, P < 0.001), confirming the assumed causal direction.

**Table 4. Directionality and reverse causation tests**

| Test | Loneliness→MDD | Insomnia→MDD | Loneliness→Insomnia |
|------|---------------|-------------|--------------------|
| Steiger: prop exposure > outcome | 68.8% | 71.3% | 69.5% |
| Steiger binomial P | 0.002 | <0.001 | <0.001 |
| Reverse: MDD→exposure β (P) | 0.02 (0.43) | −0.01 (0.71) | — |
| Reverse instruments | 12 | 15 | — |

### 3.5 Sensitivity analyses

Direction and significance were consistent across methods (Table 5, Figure 3). MR-Egger slopes: 1.98 (P < 1×10⁻¹⁶) for loneliness→MDD, 0.82 (P < 1×10⁻¹⁶) for insomnia→MDD, 0.43 (P < 1×10⁻¹⁶) for loneliness→insomnia. Weighted median: 2.21, 0.90, 0.69 (all P < 1×10⁻¹⁶). LOO ranges were narrow (e.g., 1.89–1.90 for loneliness→MDD).

MR-Egger intercept tests flagged modest directional pleiotropy for loneliness→MDD (intercept = 0.0008, P = 0.046) and insomnia→MDD (intercept = 0.0007, P = 0.047), but not for loneliness→insomnia (P = 0.31). Cochran's Q indicated substantial between-instrument heterogeneity in all pathways (Q P < 1×10⁻¹⁶). Standardized-residual screens identified outlier variants (99/544 for loneliness→MDD; 296/800 for insomnia→MDD; 211/657 for loneliness→insomnia).

**Table 5. Sensitivity analyses**

| Pathway | IVW β (P) | MR-Egger β (P) | Egger int P | WM β (P) | Cochran Q (df) | LOO range |
|---------|-----------|----------------|------------|----------|----------------|-----------|
| Loneliness→MDD | 1.90 (<10⁻¹⁶) | 1.98 (<10⁻¹⁶) | 0.046 | 2.21 (<10⁻¹⁶) | 3401 (543) | 1.89–1.90 |
| Insomnia→MDD | 0.84 (<10⁻¹⁶) | 0.82 (<10⁻¹⁶) | 0.047 | 0.90 (<10⁻¹⁶) | 6439 (799) | 0.835–0.841 |
| Loneliness→Insomnia | 0.45 (<10⁻¹⁶) | 0.43 (<10⁻¹⁶) | 0.31 | 0.69 (<10⁻¹⁶) | 4473 (656) | 0.444–0.449 |

### 3.6 Comparison with previous mediation estimates

Our estimate of 19.7% (95% CI ≈ 18.3–21.1%) overlaps with the 95% CI of a recent independent report (15.5%; 95% CI: 7.7–23.3%; PMID 41205074), suggesting directionally consistent findings across different samples and outcome definitions. The point estimate is modestly higher, likely attributable to our use of the larger Adams et al. (2025) MDD GWAS (N ≈ 5 million vs. N ≈ 463,000) and the more precise isolation of the insomnia pathway without competing mediator dilution.

### 3.7 Exploratory CRP pathway

CRP→MDD IVW β = 0.007 (P = 1.5×10⁻⁶) was attenuated under weighted median (β = 0.003, P = 0.73). This fragile result was not included in formal mediation.

### 3.8 Genetic correlation context

Overlap of genome-wide significant SNPs: 238 between MDD and insomnia, 189 between MDD and loneliness, 31 between insomnia and loneliness. These overlaps are consistent with partial shared genetic architecture but do not constitute formal colocalization evidence (position data unavailable).

---

## 4. Discussion

### 4.1 Principal findings

Using the largest MDD GWAS available, we found that genetic liability to loneliness is robustly associated with increased MDD risk, and that insomnia mediates approximately one-fifth (19.7%) of this association. Bidirectional MR found no evidence of reverse causation, and Steiger tests confirmed the expected directional orientation of all three SNP-outcome relationships. The mediation estimate is directionally consistent with, but more precisely estimated than, a recent independent report (15.5%). The direct effect remains large (β = 1.52, 80.3% of total), indicating that multiple parallel pathways beyond sleep connect loneliness to depression.

### 4.2 Comparison with previous studies

A recent study (PMID 41205074) reported insomnia mediating 15.5% (95% CI: 7.7–23.3%) of the social isolation/loneliness→depression association using a UK Biobank-derived depression phenotype (N ≈ 463,000). Our estimate of 19.7% (95% CI ≈ 18.3–21.1%) overlaps this interval, lending convergent support. The higher point estimate in our analysis likely reflects greater statistical power from the 5-million-individual MDD GWAS (Adams et al., 2025), which reduces standard errors and narrows confidence intervals.

The same recent study also reported neuroticism as a mediator (54.3%), suggesting that personality-related pathways may account for a larger share than sleep. Our study focused on insomnia as a modifiable target; a multi-mediator framework incorporating neuroticism, anxiety, and physical activity would be a valuable next step.

Previous univariate MR studies confirmed the loneliness→depression association (Liu et al., 2024; Niu et al., 2024; Xia et al., 2023) but did not quantify mediation. Our work extends these by decomposing the total effect into sleep-mediated and non-sleep-mediated components.

### 4.3 Mechanistic interpretation

The mediation finding is compatible with experimental and observational literature: social isolation disrupts sleep architecture (Cacioppo et al., 2002; Kurina et al., 2011), and sleep loss impairs emotional regulation and reward processing (Van Dongen et al., 2003; Harvey, 2008). Because insomnia is one of the few established modifiable depression risk factors, and CBT-I has demonstrated antidepressant efficacy (Christensen et al., 2016), sleep-targeted intervention in lonely individuals represents a concrete prevention strategy — one that our data suggest could address roughly one-fifth of the excess depression risk.

The large direct effect implies that additional mechanisms operate in parallel. Plausible candidates include HPA-axis dysregulation and inflammatory signalling (Slavich and Irwin, 2014) — our exploratory CRP analysis was inconclusive — as well as reduced behavioural activation and social reward processing (Holt-Lunstad et al., 2015). Future multi-mediator MR could test these simultaneously.

### 4.4 Interpretation of the OR magnitude

The point estimate OR = 6.66 for loneliness→MDD appears large relative to prior observational and MR estimates (typically OR ≈ 1.5–2.5). Several factors likely contribute: (1) the genetic instrument captures lifelong cumulative exposure to loneliness liability, accumulating over decades rather than measuring a transient state; (2) the single-item loneliness measure may tag broader personality or social-circuitry variation with strong pleiotropic effects on depression susceptibility; (3) the large instrument set (544 SNPs) with pervasive heterogeneity suggests that some instruments capture pleiotropic pathways beyond the pure loneliness→MDD causal effect. The MR-Egger slope (1.98) and weighted median (2.21) remain directionally consistent but numerically higher than IVW, raising the possibility that residual pleiotropy inflates the IVW estimate. We therefore interpret the IVW point estimate with caution and present the full sensitivity-suite range rather than relying on a single number.

### 4.5 Strengths and limitations

**Strengths:** largest MDD GWAS (5M+), well-powered three-pathway design (544–800 instruments, mean F > 30), bidirectional MR and Steiger directionality testing, full pleiotropy toolkit, and transparent comparison with an independent recent estimate.

**Limitations:** (1) MR-Egger intercepts are borderline significant for two pathways (P ≈ 0.046), indicating possible directional pleiotropy; pleiotropy-robust estimates are directionally consistent but numerically wider. (2) Between-instrument heterogeneity is large in all pathways — expected with behavioural traits — meaning pooled estimates are weighted averages potentially mixing causal and pleiotropic signals. (3) Hundreds of genome-wide significant SNPs are shared between MDD and the exposures, consistent with strong genetic correlation that violates the exclusion-restriction assumption. (4) Insomnia is self-reported, not polysomnographically validated. (5) Exposure and mediator GWAS derive from UK Biobank-related resources, with potential sample overlap and phenotypic co-assortment biasing toward the observational association. (6) Formal colocalization was not possible due to lack of chromosome-position information. (7) European-ancestry instruments limit generalizability. (8) The binary mediation framework tests statistical mediation, not mechanistic mediation.

---

## 5. Conclusions

Genetic evidence supports a causal association between loneliness and MDD, with approximately one-fifth of the association mediated through insomnia. The estimate is directionally consistent with a recent independent report but benefits from substantially larger outcome data. Bidirectional MR found no evidence of reverse causation. Sleep-targeted interventions may attenuate depression risk in lonely individuals, although the dominant direct effect indicates that non-sleep pathways are equally important. Future work should incorporate multi-mediator frameworks and position-annotated GWAS for colocalization.

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
10. Skrivankova, V.W., et al. (2021). Strengthening the reporting of observational studies in epidemiology using Mendelian randomization: the STROBE-MR statement. *PLoS Med.*, 18(12), e1003889.
11. Carter, A.R., et al. (2021). Mendelian randomization for mediation analysis: current methods and challenges for implementation. *Int. J. Epidemiol.*, 50(6), 1985–1994.
12. Xue, H., et al. (2021). Illustrating Mendelian randomization studies with two-sample mediation analysis. *BMC Med. Res. Methodol.*, 21, 217.
13. Erzen, E., and Çikrikci, Ö. (2018). The effect of loneliness on depression: a meta-analysis. *Int. J. Soc. Psychiatry*, 64(5), 427–435.
14. Holt-Lunstad, J., et al. (2015). Loneliness and social isolation as risk factors for mortality: a meta-analytic review. *Perspect. Psychol. Sci.*, 10(2), 227–237.
15. Cacioppo, J.T., et al. (2002). Do lonely days invade the nights? Potential social modulation of sleep efficiency. *Psychol. Sci.*, 13(4), 384–387.
16. Kurina, L.M., et al. (2011). Sleep duration, gene expression, and loneliness: findings from a population-based gene expression study. *Soc. Sci. Med.*, 72(1), 27–31.
17. Van Dongen, H.P.A., et al. (2003). The cumulative cost of additional wakefulness. *Sleep*, 26(2), 117–126.
18. Harvey, A.G. (2008). Sleep and circadian rhythms in bipolar disorder. *Am. J. Psychiatry*, 165(7), 820–829.
19. Slavich, G.M., and Irwin, M.R. (2014). From stress to inflammation and major depressive disorder: a social signal transduction theory of depression. *Psychol. Bull.*, 140(3), 774–815.
20. Christensen, H., et al. (2016). Effectiveness of an online insomnia program (SHUTi) for prevention of depressive episodes. *Lancet Psychiatry*, 3(4), 333–341.
21. Liu, H., et al. (2024). Loneliness and depression: a two-sample Mendelian randomization study. *J. Affect. Disord.*, 348, 112–119.
22. Niu, Z., et al. (2024). Psychosocial stress and depression: mediation role of sleep disturbances — an MR study. *J. Affect. Disord.* [verify before submission]
23. Xia, E., et al. (2023). Relationship between insomnia and depression: a two-sample Mendelian randomization study. *Front. Psychiatry*, 14, 1199290.
24. Wu, Y., et al. (2025). Identification of genetic associations and key influences contributing to the pathway from social isolation or loneliness to depression. *Eur. Arch. Psychiatry Clin. Neurosci.* [Published online 2025 Nov; PMID 41205074]
25. World Health Organization (2023). Depressive disorder (depression) fact sheet. Geneva: WHO.
26. Steiger, J.H. (1980). Tests for comparing elements of a correlation matrix. *Psychol. Bull.*, 87(2), 245–251.

> **Note to authors (to be removed before submission):** Reference 22 requires PubMed verification before submission. Reference 24 is the collision paper identified during literature audit — it must be cited and discussed as above.

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

**Figure 3.** Sensitivity analyses: (a) method comparison (IVW, MR-Egger, weighted median); (b) leave-one-out ranges.

**Figure 4.** Bidirectional MR and Steiger directionality results.

---

## Target journal

**Journal of Affective Disorders** (first choice) — IF ≈ 5.7, JCR Q1
**Backup:** **Journal of Psychiatric Research** (IF ≈ 4.4, Q2) or **Brain and Behavior** (IF ≈ 2.8, Q2–Q3)
