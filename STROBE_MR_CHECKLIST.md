# STROBE-MR Checklist for Mendelian Randomization Studies

## 20-Item Reporting Checklist

### Title and Abstract
| # | Item | Reported Where |
|---|------|---------------|
| 1 | Identify the study as using Mendelian randomization in the title | Title |
| 2 | Provide an unstructured abstract summarizing methods, results, and conclusions | Abstract |

### Introduction
| # | Item | Reported Where |
|---|------|---------------|
| 3 | State the research question and rationale for using MR | Introduction |
| 4 | Present prespecified causal hypotheses | Introduction |

### Methods
| # | Item | Reported Where |
|---|------|---------------|
| 5 | Describe data sources (GWAS studies) including sample size, population, phenotyping | Methods |
| 6 | Describe instrument selection: SNP criteria, GWAS p-value threshold, LD clumping parameters | Methods |
| 7 | Assess whether exposure and outcome samples overlap (two-sample MR) | Methods |
| 8 | Describe population structure and ancestry matching | Methods |
| 9 | Justify the three core instrumental variable assumptions: relevance, independence, exclusion restriction | Methods |
| 10 | Describe primary MR method(s) used (IVW, MR-Egger, Weighted Median) | Methods |
| 11 | Describe sensitivity analyses for pleiotropy (MR-PRESSO, weighted mode, etc.) | Methods |
| 12 | Report MR-Egger intercept test results for directional pleiotropy | Methods/Results |
| 13 | Report heterogeneity tests (Cochran's Q, I²) | Methods/Results |
| 14 | Describe Steiger directionality test for causal direction | Methods/Results |
| 15 | Describe multiple testing correction strategy | Methods |

### Results
| # | Item | Reported Where |
|---|------|---------------|
| 16 | Report number of instruments, strength statistics (F-statistic) | Results |
| 17 | Report primary causal estimates (β/OR, 95% CI, p-values) | Results |
| 18 | Report sensitivity analysis results | Results |
| 19 | Report heterogeneity and pleiotropy test results | Results |
| 20 | Describe data and code availability | Results/Data Availability |

### Discussion
| # | Item | Reported Where |
|---|------|---------------|
| - | Interpret findings in context of existing evidence | Discussion |
| - | Discuss limitations (sample overlap, population stratification, pleiotropy) | Discussion |
| - | Distinguish between lifelong genetic effects and short-term clinical interventions | Discussion |

### Other Information
| # | Item |
|---|------|
| - | Funding sources |
| - | Conflicts of interest |
| - | Author contributions (CRediT format) |
| - | Data and code availability statements |

---

## Three Core IV Assumptions

### 1. Relevance Assumption
**Definition**: Genetic variants are robustly associated with the exposure.

**Assessment**:
- Calculate F-statistic: F = β²/SE²
- F > 10 indicates strong instrument (weak instrument bias unlikely)
- Report mean F-statistic across all instruments

### 2. Independence Assumption
**Definition**: Genetic variants are not associated with confounders of the exposure-outcome relationship.

**Assessment**:
- Cannot be directly tested
- Check if variants associate with known confounders
- Use sensitivity analyses to triangulate

### 3. Exclusion Restriction Assumption
**Definition**: Genetic variants affect the outcome only through the exposure (no horizontal pleiotropy).

**Assessment**:
- MR-Egger intercept test (p < 0.05 suggests pleiotropy)
- MR-PRESSO outlier detection
- Compare multiple MR methods (IVW vs MR-Egger vs Weighted Median)
- If methods agree → assumption likely holds

---

## Common MR Methods

| Method | Description | When to Use |
|--------|-------------|-------------|
| **IVW** | Inverse-variance weighted; primary analysis | When no pleiotropy |
| **MR-Egger** | Allows directional pleiotropy; provides intercept | Sensitivity analysis |
| **Weighted Median** | Robust if >50% valid instruments | Sensitivity analysis |
| **MR-PRESSO** | Detects and removes outliers | Sensitivity analysis |
| **Weighted Mode** | Robust if largest cluster of instruments valid | Sensitivity analysis |
| **Leave-one-out** | Tests if any single SNP drives result | Sensitivity analysis |

---

## Required Reports for MR Studies

### Essential Reporting
- [ ] Number of SNPs used as instruments
- [ ] F-statistics (mean and range)
- [ ] IVW estimate (β, 95% CI, p-value)
- [ ] MR-Egger estimate and intercept test
- [ ] Weighted median estimate
- [ ] Cochran's Q statistic and I² (heterogeneity)
- [ ] MR-PRESSO outlier detection results
- [ ] Steiger directionality test
- [ ] Sensitivity analysis forest plot
- [ ] Funnel plot
- [ ] Leave-one-out plot

### Optional but Recommended
- [ ] Bidirectional MR analysis
- [ ] Multivariable MR (if applicable)
- [ ] Non-linear MR (if applicable)
- [ ] Power calculation
- [ ] Sample overlap assessment
