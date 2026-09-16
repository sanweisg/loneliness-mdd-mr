# 顶级期刊论文审查、评审、修改优化指南
# 目标期刊：Nature Medicine / Nature 系列

---

## 一、Nature Medicine 投稿格式规范 (2026)

### 1.1 字数与结构限制
| 文章类型 | 正文字数 | 摘要字数 | 展示项上限 |
|---------|---------|---------|-----------|
| Article | ~3,000词 | 150词 | 8个 |
| Letter | ~1,500词 | 150词 | 4个 |
| Review | ~6,000词 | 150词 | 10个 |
| Brief Communication | ~1,500词 | 100词 | 3个 |

**注意：** 正文字数不含摘要、Methods、参考文献、图注。

### 1.2 标准文章结构
```
1. Title (≤90字符)
2. Abstract (150词，无结构标题)
3. Main Text (~3,000词)
   - Introduction (无标题，自然过渡)
   - Results (带小标题)
   - Discussion (无标题)
4. References (上标编号，按出现顺序)
5. Online Methods (无字数限制)
6. Acknowledgements
7. Author Contributions (CRediT格式)
8. Competing Interests
9. Data Availability Statement (必须!)
10. Figure Legends
11. Figures & Tables
12. Extended Data (最多10个，独立同行评审)
13. Supplementary Information
```

### 1.3 关键格式要求
- **标题**：≤90字符（含空格），直接陈述发现，不用"A study of..."
- **摘要**：非结构化，150词，包含：问题→方法→关键结果（具体数字）→临床意义
- **图表**：最多8个display items（figures + tables合并计算）
- **Extended Data**：最多10个额外图表，需同行评审
- **Methods位置**：在参考文献之后，无字数限制

### 1.4 引用格式（Nature Style）
```
上标编号，按首次出现顺序排列

期刊文章示例：
1. Chen, L. et al. Single-cell profiling of tumor microenvironment heterogeneity in hepatocellular carcinoma. Nat. Med. 32, 415-428 (2026).

书籍示例：
1. Weinberg, R. A. The Biology of Cancer 3rd edn (Garland Science, 2025).
```
**关键规则：**
- 所有作者必须列出（不能用et al.截断）
- 期刊名用ISO缩写
- 年份在括号内结尾
- 页码范围用en dash（–）
- 多篇引用用逗号分隔，范围用短横线：1,3,5-8

### 1.5 统计报告要求
- 每个实验的精确样本量
- 集中趋势和离散程度的定义（mean ± s.d., median with IQR等）
- 统计检验方法及选择理由
- **精确P值**（至少两位有效数字）
- 多重比较校正方法
- 分析软件及版本号

---

## 二、图表规范 (Figure Guidelines)

### 2.1 图片技术要求
| 项目 | 要求 |
|------|------|
| 分辨率 | 最低300 DPI，最佳300-600 DPI |
| 格式 | 提交时TIFF/EPS/PDF；接收时必须TIFF |
| 宽度 | 单列88mm，双列/全页180mm |
| 字体 | Arial或Helvetica，最小5-7pt |
| 颜色 | RGB模式，在线和印刷免费 |
| 面板标注 | 小写字母(a, b, c)，不用大写 |

### 2.2 森林图规范
```
✓ 必须包含：
  - 无效线（Null line）：OR尺度在x=1，β尺度在x=0
  - 95%置信区间误差棒
  - 效应量数值（β或OR）及CI
  - 显著性标记（*p<0.05, **p<0.01, ***p<0.001）
  
✓ 推荐包含：
  - 异质性检验结果（Cochran's Q, I²）
  - 工具变量数量（N SNPs）
  - F统计量（弱工具变量诊断）

✗ 避免：
  - 图例遮挡数据点
  - 颜色对比度不足
  - 刻度范围浪费空间
```

### 2.3 中介模型图规范
```
必须标注：
- 每条路径的β值及95% CI
- 显著性水平（*p值）
- 中介比例及计算方法
- MR-Egger intercept结果（多效性检验）

推荐图注格式：
"Figure 1. Two-step Mendelian randomization mediation model. 
Blue path a: loneliness → insomnia (β=0.447, 95% CI: 0.321–0.573, p<0.001). 
Green path b: insomnia → MDD (β=0.837, 95% CI: 0.701–0.973, p<0.001). 
Gray dashed path c': direct effect (β=1.522, 95% CI: 1.301–1.743, p<0.001). 
Mediation proportion: 19.7% (indirect effect = 0.374). 
MR-Egger intercept = 0.023 (p=0.046)."
```

### 2.4 散点图规范
```
✓ 必须：
  - IVW回归线及95% CI带
  - 离群值标注（不同颜色/形状）
  - 坐标轴标签含单位（per SNP）
  - 样本量/SNP数量

✓ 推荐：
  - 零效应参考线
  - 图例说明不同颜色含义
  - 关键统计量标注（β, p值）
```

### 2.5 遗传相关热力图规范
```
✓ 必须：
  - 对角线r_g=1.000
  - 颜色条及刻度
  - 数值精度合理（通常3位小数）

✓ 推荐：
  - 显著性标记
  - 样本量及方法说明
```

---

## 三、STROBE-MR 报告规范（孟德尔随机化研究必备）

### 3.1 STROBE-MR 检查清单（20项核心）

#### A. 标题与摘要
| 项目 | 要求 |
|------|------|
| 1 | 标题中明确说明使用MR方法 |
| 2 | 摘要中简要描述方法、结果和结论 |

#### B. 引言
| 项目 | 要求 |
|------|------|
| 3 | 阐述研究背景及MR方法的必要性 |
| 4 | 明确陈述预指定的因果假设 |

#### C. 方法
| 项目 | 要求 |
|------|------|
| 5 | **数据来源**：GWAS研究的详细信息（样本量、人群、表型定义） |
| 6 | **工具变量选择**：SNP筛选标准、阈值、LD clumping参数 |
| 7 | **样本重叠**：两样本MR中暴露和结局样本是否有重叠 |
| 8 | **人群结构**：遗传背景一致性（ancestry matching） |
| 9 | **三核心假设**：
  - Relevance（相关性）：F统计量>10
  - Independence（独立性）：无混杂
  - Exclusion restriction（排除限制）：无非水平多效性 |
| 10 | **主要分析方法**：IVW、MR-Egger、Weighted Median等 |
| 11 | **敏感性分析**：MR-PRESSO、Leave-one-out、Cochran's Q |
| 12 | **多效性检验**：MR-Egger intercept及p值 |
| 13 | **异质性检验**：Cochran's Q统计量及I² |
| 14 | **反向因果检验**：Steiger directionality test |
| 15 | **多重比较校正**：Bonferroni或FDR |

#### D. 结果
| 项目 | 要求 |
|------|------|
| 16 | 描述参与分析的SNP数量、F统计量 |
| 17 | 报告主要MR估计值（β, OR, 95% CI, p值） |
| 18 | 报告敏感性分析结果 |
| 19 | 报告异质性和多效性检验结果 |
| 20 | **数据可用性声明**：数据来源、分析代码仓库链接 |

#### E. 讨论
| 项目 | 要求 |
|------|------|
| - | 解释结果与现有研究的关联性 |
| - | 讨论局限性（如样本重叠、人口分层） |
| - | 区分遗传预测效应 vs 临床干预效应 |

#### F. 其他信息
| 项目 | 要求 |
|------|------|
| - | Funding source |
| - | Conflict of interest |
| - | Author contributions (CRediT) |
| - | Data and code availability |

### 3.2 三核心假设详解
```
1. Relevance Assumption（相关性假设）
   - 遗传变异与暴露强相关
   - 验证方法：F统计量 = β²/SE² > 10
   - 报告中必须报告F统计量

2. Independence Assumption（独立性假设）
   - 遗传变异不受混杂因素影响
   - 验证方法：检查是否与已知混杂因素关联
   - 无法完全验证，需通过敏感性分析支持

3. Exclusion Restriction（排除限制假设）
   - 遗传变异仅通过暴露影响结局
   - 验证方法：MR-Egger intercept, MR-PRESSO
   - 这是最难验证的假设
```

---

## 四、Response to Reviewers 指南

### 4.1 回复信结构
```
Dear Editor and Reviewers,

We thank you for the constructive feedback on our manuscript 
[Title] (Manuscript ID: xxx). We have carefully addressed all 
comments and revised the manuscript accordingly. Below we provide 
a point-by-point response.

[Editor's Comments Section]
[Reviewer 1 Comments Section]
[Reviewer 2 Comments Section]
...

We believe these revisions have significantly improved the paper.
We look forward to your decision.

Sincerely,
[Corresponding Author]
```

### 4.2 回复策略原则
```
✓ 必须做到：
  - 逐条回复，不要遗漏任何评论
  - 引用原文评论 + 回复 + 修改位置（页码/行号）
  - 对所有评论表示尊重和专业
  - 对同意修改的点详细说明修改内容
  - 对有争议的点提供证据支持

✗ 绝对避免：
  - 与审稿人争论或表现出防御性
  - 忽略不喜欢的评论
  - 模糊或回避性的回答
  - 声称审稿人"没看懂"
  - 攻击审稿人或编辑
```

### 4.3 常见回复模板

**同意修改：**
```
Reviewer Comment: "The methods section lacks detail on SNP selection."

Response: We thank the reviewer for this important observation. 
We have expanded the Methods section to include:
- GWAS source details (page 8, lines 145-152)
- SNP selection criteria and clumping parameters (page 8, lines 153-160)
- F-statistic calculations (page 9, lines 168-172)

Please see the revised Methods section for full details.
```

**部分同意但需要解释：**
```
Reviewer Comment: "Why not use more sensitive exposure definitions?"

Response: We appreciate this suggestion. We initially used standard 
definitions because [reason]. However, we agree this deserves 
discussion. We have added a paragraph in the Discussion (page 12, 
lines 245-252) addressing this limitation and its potential impact.
```

**不同意但需礼貌：**
```
Reviewer Comment: "The sample size is too small for reliable conclusions."

Response: We understand the concern. While the sample size is modest, 
two-sample MR using GWAS summary statistics provides statistical power 
proportional to the combined sample sizes (N_exposure = XXX,XXX; 
N_outcome = XXX,XXX). We have clarified this in the Methods (page 8, 
line 140) and added a power calculation in the Supplementary Materials.
```

---

## 五、Nature Medicine 拒稿常见原因（Desk Reject）

### 5.1 最常见拒稿原因
```
1. 转化性声明缺乏人类数据支持
   - Nature Medicine要求明确的临床相关性和转化潜力
   - 纯动物/细胞研究无临床桥梁会被拒

2. 未遵循报告规范
   - 缺少CONSORT（RCT）、STROBE（观察研究）、STROBE-MR（MR研究）等检查表
   - 数据可用性声明缺失或模糊

3. 数据和代码可用性不承诺
   - "Available upon request"已被拒绝接受
   - 必须有公共仓库 accession number

4. 重要性未达"变革性生物医学进步"标准
   - 增量式贡献不足以发表在Nature Medicine
   - 需要广泛的跨领域相关性
```

### 5.2 自我评估清单
```
□ 研究是否具有变革性意义？
□ 是否有临床转化潜力？
□ 是否遵循了STROBE-MR检查表？
□ 数据和代码是否已 deposited？
□ 样本量是否足够？
□ 敏感性分析是否充分？
□ 局限性是否已讨论？
□ 作者贡献是否明确？
□ 竞争性利益是否声明？
```

---

## 六、论文修改优化检查清单

### 6.1 投稿前自查
```
□ Title ≤90字符，直接陈述发现
□ Abstract 150词，无缩写（除通用缩写）
□ 正文 ≤3,000词（不含Methods、References、Figure legends）
□ 所有图表在正文中被正确引用
□ 引用格式为Nature Style（上标编号）
□ 所有作者贡献明确
□ 所有作者竞争性利益声明
□ 数据可用性声明包含具体repository和accession number
□ 补充材料已准备（代码、数据、附录）
□ Reporting Summary checklist已填写
```

### 6.2 图表自查
```
□ 所有图分辨率 ≥300 DPI
□ 图中字体大小合适（打印后清晰可读）
□ 颜色方案色盲友好
□ 无效线/参考线已添加
□ 误差棒已包含
□ 图注完整（包含所有必要信息）
□ 所有符号已定义
```

### 6.3 MR研究专项自查
```
□ 工具变量F统计量 > 10（所有SNP）
□ 已报告Cochran's Q检验结果
□ 已报告MR-Egger intercept及p值
□ 已进行MR-PRESSO outlier检测
□ 已进行Steiger directionality test
□ 已讨论样本重叠问题
□ 已讨论人群分层问题
□ 已区分遗传效应 vs 临床干预效应
□ 已报告多重比较校正方法
```

---

## 七、参考资源

### 7.1 官方资源
- **Nature Medicine 投稿指南**: https://www.nature.com/nm/authors-and-referees/gta
- **STROBE-MR 官网**: https://www.strobe-mr.org
- **EQUATOR Network**: https://www.equator-network.org（报告规范汇总）
- **CASRAI STROBE-MR 指南**: https://casrai.org/guides/strobe-mr-reporting-guideline

### 7.2 检查表下载
- **STROBE-MR Checklist**: https://www.strobe-mr.org/checklist
- **STROBE-MR Explanation & Elaboration**: https://www.strobe-mr.org/explanation-elaboration
- **Nature Medicine Reporting Summary**: https://www.nature.com/nm/authors-and-referees/gta

### 7.3 参考文献
1. Skrivankova VW, et al. Strengthening the Reporting of Observational Studies in Epidemiology Using Mendelian Randomization: The STROBE-MR Statement. JAMA. 2021;326(16):1614-1621.
2. Burgess S, et al. Guidelines for performing Mendelian randomization investigations. Wellcome Open Res. 2023;4:186.
3. Sanderson E, et al. Mendelian randomization. Nat Rev Methods Primers. 2022;2(1):6.
4. Davies NM, et al. Reading Mendelian randomisation studies: a guide, glossary, and checklist for clinicians. BMJ. 2018;362:k601.
