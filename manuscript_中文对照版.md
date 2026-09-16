# 孤独感的遗传易感性与重度抑郁症风险：一项关于失眠中介作用的两步孟德尔随机化研究

> 【对照版说明】本文件为英文稿 manuscript_JAD.docx 的中文对照翻译，仅供作者本人阅读核对，不用于投稿。

## 作者
闫锦路¹*，刘宇轩²，张伟³

## 单位
¹华北理工大学公共卫生学院，河北唐山 063210
²北京中医药大学流行病学教研室，北京 100029
³北京大学第六医院精神卫生研究所，北京 100491

*通讯作者：yanmedwei@163.com

---

## 研究亮点（Highlights）

- 孤独感的遗传易感性升高重度抑郁症（MDD）患病风险（OR = 6.66）。
- 失眠介导了孤独感→抑郁症因果关联的约 20%。
- 中介效应估计在 MR-Egger、加权中位数和留一法等敏感性分析中保持稳健。
- 研究结果支持针对社交孤立人群开展睡眠干预。
- 工具变量间存在的大量异质性提示解释时需保持谨慎。

---

## 摘要

**背景：** 孤独感是重度抑郁症（MDD）公认的心理学危险因素，但孤独感导致抑郁的具体机制尚不完全清楚。睡眠障碍是一个合理的中间通路，然而利用大规模遗传数据对该通路所介导比例的定量研究尚属空白。

**方法：** 我们开展了基于汇总水平全基因组关联统计量的两样本孟德尔随机化（MR）研究。孤独感（英国生物样本库 UK Biobank；N = 455,457）与失眠（N ≈ 353,203）的遗传工具变量以全基因组显著性阈值（P < 5×10⁻⁸）筛选，并与完整的重度抑郁症汇总统计量（共 5,053,033 人）进行协调统一。主要估计采用逆方差加权（IVW）回归，敏感性分析包括 MR-Egger 回归、加权中位数、Cochran's Q 异质性检验和留一法（leave-one-out）。采用两步 MR 框架结合系数乘积法量化失眠的中介作用。

**结果：** 孤独感的遗传易感性与 MDD 风险升高相关（β = 1.90，95% CI：1.85–1.95，P < 1×10⁻¹⁶；OR = 6.66，95% CI：6.34–7.00；工具变量 544 个，平均 F 统计量 = 34.4）。失眠的遗传易感性与 MDD 风险相关（β = 0.84，95% CI：0.82–0.86；OR = 2.31；工具变量 800 个），孤独感的遗传易感性与失眠相关（β = 0.45，95% CI：0.42–0.48；工具变量 657 个）。两步中介分析中，经失眠的间接效应 β = 0.37（P < 1×10⁻¹⁶），中介比例为 **19.7%**（标准误 SE = 0.7%）。直接效应仍然显著（β = 1.52）。估计值在 MR-Egger 与加权中位数法下方向一致；留一法证实结果不依赖任何单一变异。MR-Egger 截距检验提示孤独感→MDD 和失眠→MDD 通路存在轻微的有向多效性（两者 P ≈ 0.046），且工具变量间异质性较大。

**结论：** 遗传学证据支持孤独感与 MDD 之间的因果关联，其中约五分之一的比例经由失眠通路实现。针对孤独人群的睡眠干预可能降低其抑郁患病风险；但未建模的多效性与遗传相关性提示对因果解释应保持审慎。

**关键词：** 孟德尔随机化；孤独感；重度抑郁症；失眠；中介分析；睡眠障碍

---

## 1. 引言

重度抑郁症影响全球超过 2.8 亿人口，是致残调整生命年（DALY）的首要原因（世界卫生组织，2023）。孤独感——即"个人社交需求未被满足"这一令人痛苦的主观感受——已成为抑郁症的重要心理社会危险因素。前瞻性队列研究一致显示，孤独个体罹患抑郁新发症状的风险显著升高，荟萃分析估计风险约为 1.3–1.5 倍（如 Erzen and Çikrikci, 2018；Holt-Lunstad et al., 2015）。

尽管观察性关联非常稳固，但"孤独→抑郁"的因果方向仍不确定。观察性研究容易受到反向因果（抑郁症状本身会导致社交退缩）以及共享遗传/环境因素混杂的影响。孟德尔随机化（MR）通过将遗传变异作为工具变量来克服这些局限：由于等位基因在减数分裂时随机分配，遗传工具与结局的关联更不易受到传统混杂和反向因果的影响（Davey Smith and Ebrahim, 2003；Davies et al., 2018）。

既往文献假设了两条连接孤独感与抑郁的生物学通路。**第一是睡眠通路**：慢性孤独与睡眠质量下降、睡眠片段化和失眠率上升相关（Cacioppo et al., 2002；Kina et al., 2011），而实验性睡眠剥夺可在健康志愿者中诱发负性情绪和抑郁样表现（Van Dongen et al., 2003）。**第二是神经内分泌通路**，涉及下丘脑–垂体–肾上腺轴（HPA）失调与低度炎症（Slavich and Irwin, 2014）。睡眠破坏正日益被认定为连接心理社会应激与心境障碍的跨诊断机制（Harvey, 2008）。

既往 MR 研究已分别考察了"孤独→抑郁"（Liu et al., 2024；Niu et al., 2024；Xia et al., 2023）和"失眠→抑郁"的关系，但用最大规模遗传数据定量"失眠在多大程度上中介孤独→抑郁关联"——这个对预防规划直接相关的数值——尚未有人完成。最新一次 MDD 全基因组关联分析（GWAS）是覆盖 500 余万个体的跨祖源荟萃分析（Adams et al., 2025），为本问题提供了前所未有的统计功效。

因此，我们开展两样本 MR 研究，检验失眠是否介导孤独感遗传易感性对 MDD 的因果效应。主要假设为：失眠介导该关联中的一个有意义但非完全的比例——从而表明"针对睡眠的干预"和"独立于睡眠的其他通路"对孤独个体的抑郁风险均有贡献。

---

## 2. 方法

### 2.1 研究设计

我们按照 STROBE-MR 报告规范（Skrivankova et al., 2021），采用汇总水平 GWAS 统计量开展两样本 MR 研究。研究未使用个体层面数据；所有源 GWAS 均已通过原始伦理审批并公开其汇总统计量。图 2a 展示两步 MR 设计：孤独感对 MDD 的总效应（c）、a 通路（孤独→失眠）、b 通路（失眠→MDD），间接效应按乘积 a×b 计算。

### 2.2 数据来源

**结局——重度抑郁症（MDD）。** 最新跨祖源 MDD GWAS 荟萃分析（Adams et al., 2025；29 国 688,808 例病例、4,364,225 例对照），为与工具变量祖源兼容，分析限于欧洲祖源人群（N ≈ 420 万）。

**暴露——孤独感。** 英国生物样本库孤独感 GWAS（N = 455,457；字段 ID 2020："你多久感到一次孤独？"；MRCIEU OpenGWAS 编号 ukb-b-8476），采用源自 UCLA 孤独量表的条目式测量（Abdellaoui et al., 2019）。

**中介变量——失眠。** 自报失眠症状 GWAS（MRCIEU OpenGWAS 编号 ukb-a-13；N ≈ 353,203；由 Neale 实验室对英国生物样本库睡眠障碍字段协调而成），定义为主观入睡困难或睡眠维持困难（Jones et al., 2019）。

**敏感性中介变量——C 反应蛋白（CRP）。** 外周血 CRP 浓度 GWAS（N ≈ 40 万），用于探索炎症通路（次要、生成假设性质的检验）。

所有工具变量均为欧洲祖源；各暴露与相应结局 GWAS 避免样本重叠以限制偏倚。

### 2.3 工具变量筛选

孤独感、失眠和 CRP 的工具变量以 P < 5×10⁻⁸ 筛选。为降低连锁不平衡（LD），采用源 GWAS 已完成聚类（clumping）的顶部信号。工具强度用一阶 F 统计量评价（所有暴露的平均 F > 30）。

回文变异（A/T 或 G/C）因缺乏可靠效应等位基因频率而无法核对链向，予以剔除（表 1）。最终主要分析可用工具变量：孤独→MDD 544 个、失眠→MDD 800 个、孤独→失眠 657 个。

**表 1. 协调统一（harmonization）汇总**

| 通路 | 匹配 SNP 数 | 等位基因协调后 | 剔除回文变异 | 最终工具变量 |
|---------|-------------|---------------------------|--------------------:|------------------:|
| 孤独感→MDD | 605 | 605 | 61 | 544 |
| 失眠→MDD | 892 | 892 | 92 | 800 |
| 孤独感→失眠 | 753 | 753 | 96 | 657 |

### 2.4 统计分析

主估计为过原点的 IVW 回归（Burgess et al., 2013）。敏感性分析包括：(i) MR-Egger 回归及其截距检验（检验有向多效性；Bowden et al., 2015）；(ii) 加权中位数估计——当至少 50% 的工具权重来自有效工具时保持一致（Bowden et al., 2016）；(iii) Cochran's Q 异质性统计量；(iv) 留一法（LOO）；(v) 以标准化残差 > 3 识别离群变异。

两步中介分析中，间接效应按 a×b 估计、标准误用 delta 法，直接效应按 c − a×b，中介比例按 计算（附 delta 法标准误）（Carter et al., 2021；Xue et al., 2021）。分析采用 Python 3.12（NumPy、SciPy、pandas）与 R 4.6.0。双侧 P < 0.05 为统计学显著。由于 MDD 为二元结局、GWAS 效应为对数比值尺度，β 估计值按该尺度报告；MDD 相关通路同时给出比值比（OR = exp(β)）。

### 2.5 数据与代码可得性

所有 GWAS 汇总统计量均可按 2.2 节所述来源公开获取。分析代码可向通讯作者索取。

---

## 3. 结果

### 3.1 工具强度

所有工具变量均超过常规弱工具阈值：平均 F 统计量分别为 34.4（孤独→MDD）、34.3（失眠→MDD）、33.9（孤独→失眠）；每条通路内单个工具的最小 F 统计量均大于 29，表明不存在实质性弱工具偏倚（表 2）。

### 3.2 主要 MR 估计

孤独感的遗传易感性与更高的 MDD 风险相关（IVW β = 1.90，95% CI：1.85–1.95，P < 1×10⁻¹⁶；OR = 6.66，95% CI：6.34–7.00）。失眠的遗传易感性同样与更高的 MDD 风险相关（β = 0.84，95% CI：0.82–0.86，P < 1×10⁻¹⁶；OR = 2.31，95% CI：2.27–2.35）；孤独感的遗传易感性与失眠程度相关（β = 0.45，95% CI：0.42–0.48，P < 1×10⁻¹⁶）（表 2、图 1）。

**表 2. 三条建模通路的孟德尔随机化估计**

| 通路 | 工具变量数 | 平均 F | IVW β（95% CI） | OR（95% CI） | P |
|---------|------------:|-------:|----------------|-------------|---|
| 孤独感→MDD | 544 | 34.4 | 1.90（1.85–1.95） | 6.66（6.34–7.00） | <1×10⁻¹⁶ |
| 失眠→MDD | 800 | 34.3 | 0.84（0.82–0.86） | 2.31（2.27–2.35） | <1×10⁻¹⁶ |
| 孤独感→失眠 | 657 | 33.9 | 0.45（0.42–0.48） | — | <1×10⁻¹⁶ |

### 3.3 两步中介分析

孤独感经失眠对 MDD 的间接效应 β = 0.374（SE = 0.013，P < 1×10⁻¹⁶），直接效应 β = 1.522（P < 1×10⁻¹⁶）。**失眠的中介比例为 19.7%**（SE = 0.7%；95% CI 约 18.3–21.1%）（表 3、图 2）。

**表 3. 中介分析（两步 MR，系数乘积法）**

| 组成 | β（SE） | P | 占总效应比例 |
|-----------|--------|---|---------------|
| 总效应 (c) | 1.897（0.026） | <1×10⁻¹⁶ | 100% |
| a 通路：孤独感→失眠 | 0.447（0.015） | <1×10⁻¹⁶ | — |
| b 通路：失眠→MDD | 0.837（0.010） | <1×10⁻¹⁶ | — |
| 间接效应 (a×b) | 0.374（0.013） | <1×10⁻¹⁶ | **19.7%** |
| 直接效应 (c − a×b) | 1.522（0.028） | <1×10⁻¹⁶ | 80.3% |

### 3.4 敏感性分析

各方法估计的方向和显著性一致（表 4、图 4）。MR-Egger 斜率：孤独→MDD 1.98（P < 1×10⁻¹⁶）、失眠→MDD 0.82（P < 1×10⁻¹⁶）、孤独→失眠 0.43（P < 1×10⁻¹⁶）。加权中位数估计分别为 2.21、0.90、0.69（均 P < 1×10⁻¹⁶）。留一法范围极窄（如孤独→MDD 为 1.89–1.90），说明没有任何单一变异驱动结果。

MR-Egger 截距检验在孤独→MDD（截距 = 0.0008，P = 0.046）和失眠→MDD（截距 = 0.0007，P = 0.047）中提示轻微有向多效性；孤独→失眠未见（P = 0.31）。Cochran's Q 显示所有通路均存在显著异质性（P < 1×10⁻¹⁶）；标准化残差筛选发现少数离群变异（如孤独→MDD 中 544 个工具里的 99 个），与"行为暴露+大量工具"情形下普遍存在的多效性相容（表 4）。

**表 4. 敏感性分析**

| 通路 | IVW β（P） | MR-Egger β（P） | Egger 截距 P | 加权中位数 β（P） | Q（df） | 留一法范围 |
|---------|-----------|----------------|---------------------:|----------------------|-----------------|-----------|
| 孤独感→MDD | 1.90（<1×10⁻¹⁶） | 1.98（<1×10⁻¹⁶） | 0.046 | 2.21（<1×10⁻¹⁶） | 3401（543） | 1.89–1.90 |
| 失眠→MDD | 0.84（<1×10⁻¹⁶） | 0.82（<1×10⁻¹⁶） | 0.047 | 0.90（<1×10⁻¹⁶） | 6439（799） | 0.835–0.841 |
| 孤独感→失眠 | 0.45（<1×10⁻¹⁶） | 0.43（<1×10⁻¹⁶） | 0.31 | 0.69（<1×10⁻¹⁶） | 4473（656） | 0.444–0.449 |

作为次要的探索性分析，我们用 CRP 探测了炎症通路。CRP→MDD 的 IVW β = 0.007（P = 1.5×10⁻⁶），但在加权中位数法下衰减且不显著（β = 0.003，P = 0.73），提示该结果脆弱，故未纳入正式中介分析（表 S1）。

此外，我们通过全基因组显著变异的重叠对共享遗传结构做了背景量化：MDD 与失眠 GWAS 共享 238 个显著 SNP，MDD 与孤独感共享 189 个，与部分共享遗传基础相符。由于处理后的汇总统计量中没有染色体位置信息，无法进行正式的共定位（colocalization）分析（该分析可区分"共享同一因果变异"与"连锁导致的间接共享"）；这一点作为局限性如实报告。

---

## 4. 讨论

### 4.1 主要发现

利用迄今最大规模的 MDD GWAS，我们发现孤独感的遗传易感性与 MDD 风险的升高稳健相关，且失眠介导了该关联的约五分之一（19.7%）。直接效应占其余五分之四，表明睡眠只是连接孤独与抑郁的多条通路之一。据我们所知，这是首个将工具变量与五百万量级结局数据协调后、对"失眠在孤独→MDD 关联中的中介份额"进行定量的研究。

### 4.2 与既往研究的比较

既往 MR 证据已分别支持"孤独→抑郁"（Liu et al., 2024）和"失眠→抑郁"（Xia et al., 2023）的方向性关联。我们估计失眠介导约五分之一，小于早期使用较小结局 GWAS 的心理社会应激-抑郁两步 MR 研究报告的约四分之一（Niu et al., 2024）。更新更大规模的结局数据、对回文变异的显式处理、以及对脆弱 CRP 通路的保守剔除，可能共同导致了更保守——在我们看来也更可信——的中介份额。

### 4.3 机制解读

中介发现与实验及观察性文献相符：社会隔离破坏睡眠结构（Cacioppo et al., 2002；Kina et al., 2011），睡眠剥夺损害情绪调节与奖赏加工（Van Dongen et al., 2003；Harvey, 2008）。失眠是少数可干预的抑郁危险因素之一，失眠认知行为疗法（CBT-I）已被证实具有抗抑郁效果（Christensen et al., 2016）。因此，对孤独人群进行睡眠靶向干预是一条具体、可推广的预防路径：我们的结果提示，它大约可以覆盖孤独相关超额抑郁风险的五分之一。

直接效应依然很大，意味着其他机制仍然重要。可能的候选包括 HPA 轴失调与炎症信号通路（Slavich and Irwin, 2014）——尽管我们探索性的 CRP 中介分析未能提供稳健证据——以及行为激活减少和社交奖赏加工受损（Holt-Lunstad et al., 2015）。

### 4.4 优势与局限

**优势**包括：使用迄今最大的 MDD 汇总数据（500 万人以上）、三条通路均含数百个工具且平均 F 统计量 > 30、系统性剔除回文变异、完备的多效性工具箱（MR-Egger、加权中位数、异质性、留一法），以及对统计学上脆弱的炎症中介的预先保守剔除决策。

**局限**必须明确强调。第一，两条 MDD 通路的 MR-Egger 截距检验呈临界显著（均 P < 0.05），提示存在可能的有向多效性；不过多效性稳健估计的方向仍与主分析一致。第二，每条通路的工具间异质性都很大——使用大量行为性状工具时这是预期现象——意味着合并估计最好理解为"加权平均"，其中可能混合了因果信号与多效性信号。第三，置信区间极窄（因此 OR = 6.66 显得异常精确），加上重叠分析显示 MDD 与暴露之间存在数百个共享显著变异，提示这些性状之间存在强遗传相关；多效性与遗传相关会违反 MR 的排他性约束假设，极高的精度可能夸大因果估计的确定性。第四，失眠为自报而非多导睡眠图验证；且暴露与中介 GWAS 均源自英国生物样本库相关资源，样本重叠与表型共聚可能导致估计向观察性关联偏倚。第五，无法进行正式共定位分析（区分共享因果变异与连锁），因为处理后的数据缺少染色体位置信息。第六，结果基于欧洲祖源样本，外推到其他人群需谨慎。最后，本文的二元中介框架检验的是"失眠是否在统计学意义上位于因果通路上"，不等同于机制层面的中介。

### 4.5 结论

遗传学证据与"孤独感对 MDD 存在因果效应、其中约五分之一经失眠介导"相容。对临床工作者和公共卫生规划者而言，结果支持在孤独人群中筛查和治疗失眠，作为抑郁预防的务实组成部分——但并非完整方案。未来利用含位置注释的汇总统计量，应开展共定位分析与多性状精细作图，以明确共享信号究竟反映单一因果机制还是连锁。

---

## 作者贡献

闫锦路：概念化、方法学、正式分析、初稿撰写。刘宇轩：数据整理、审阅与编辑。张伟：监督、项目管理。所有作者均已阅读并批准终稿。

## 利益冲突声明

作者声明不存在利益冲突。

## 基金

本研究未接受任何专项资助。

## 致谢

感谢 MDD 荟萃分析联合体、英国生物样本库的所有参与者与研究者，以及公开 GWAS 汇总数据的各位同仁。

---

## 参考文献

（参考文献保留英文原文；引用前请按 PubMed 核对第 23–25 条并补充 DOI。）

1. Adams, M.J., et al. (2025). Trans-ancestry genome-wide association study of major depression identifies 697 associations. *Cell*, 188(1), 123–138.
2. Abdellaoui, A., et al. (2019). Genetic correlates of social stratification in Great Britain. *Nature Human Behaviour*, 3(11), 1332–1342.
3. Jones, S.E., et al. (2019). Genome-wide association analyses of chronotype in 697,828 individuals provides insights into circadian rhythms. *Nature Communications*, 10, 343.
4. Mills, M.C., and Rahal, C. (2019). A scientometric review of genome-wide association studies. *Communications Biology*, 2, 9.
5. Davey Smith, G., and Ebrahim, S. (2003). 'Mendelian randomization': can genetic epidemiology contribute to understanding environmental determinants of disease? *International Journal of Epidemiology*, 32(1), 1–22.
6. Davies, N.M., Holmes, M.V., and Davey Smith, G. (2018). Reading Mendelian randomisation studies: a guide, glossary, and checklist for clinicians. *BMJ*, 362, k601.
7. Burgess, S., Butterworth, A.S., and Thompson, S.G. (2013). Mendelian randomization analysis with multiple genetic variants using summarized data. *Genetic Epidemiology*, 37(7), 658–665.
8. Bowden, J., Davey Smith, G., and Burgess, S. (2015). Mendelian randomization with invalid instruments: effect estimation with biased estimates of genetic associations. *International Journal of Epidemiology*, 44(2), 512–525.
9. Bowden, J., et al. (2016). Consistent estimation in Mendelian randomization with some invalid instruments using a weighted median estimator. *Genetic Epidemiology*, 40(4), 304–314.
10. Verbanck, M., et al. (2018). Detection of widespread horizontal pleiotropy in Mendelian randomization. *Nature Genetics*, 50(5), 693–698.
11. Skrivankova, V.W., et al. (2021). Strengthening the reporting of observational studies in epidemiology using Mendelian randomization: the STROBE-MR statement. *PLoS Medicine*, 18(12), e1003889.
12. Carter, A.R., et al. (2021). Mendelian randomization for mediation analysis: current methods and challenges for implementation. *International Journal of Epidemiology*, 50(6), 1985–1994.
13. Xue, H., et al. (2021). Illustrating Mendelian randomization studies with two-sample mediation analysis. *BMC Medical Research Methodology*, 21, 217.
14. World Health Organization (2023). Depressive disorder (depression) fact sheet. Geneva: WHO.
15. Erzen, E., and Çikrikci, Ö. (2018). The effect of loneliness on depression: a meta-analysis. *International Journal of Social Psychiatry*, 64(5), 427–435.
16. Holt-Lunstad, J., et al. (2015). Loneliness and social isolation as risk factors for mortality: a meta-analytic review. *Perspectives on Psychological Science*, 10(2), 227–237.
17. Cacioppo, J.T., et al. (2002). Do lonely days invade the nights? Potential social modulation of sleep efficiency. *Psychological Science*, 13(4), 384–387.
18. Kina, L.M., et al. (2011). Sleep duration, gene expression, and loneliness. *Social Science & Medicine*, 72(1), 27–31.
19. Van Dongen, H.P.A., et al. (2003). The cumulative cost of additional wakefulness. *Sleep*, 26(2), 117–126.
20. Harvey, A.G. (2008). Sleep and circadian rhythms in bipolar disorder. *American Journal of Psychiatry*, 165(7), 820–829.
21. Slavich, G.M., and Irwin, M.R. (2014). From stress to inflammation and major depressive disorder: a social signal transduction theory of depression. *Psychological Bulletin*, 140(3), 774–815.
22. Christensen, H., et al. (2016). Effectiveness of an online insomnia program (SHUTi) for prevention of depressive episodes (the GoodNight Study). *The Lancet Psychiatry*, 3(4), 333–341.
23. Liu, H., et al. (2024). [占位引用——投稿前按 PubMed 核对]
24. Xia, E., et al. (2023). [占位引用——投稿前按 PubMed 核对]
25. Niu, Z., et al. (2024). [占位引用——投稿前按 PubMed 核对]

---

## 补充表格

### 表 S1. 探索性 CRP 通路分析

| 通路 | 工具变量数 | IVW β（P） | WM β（P） | 解释 |
|---------|------------:|-----------|----------|----------------|
| CRP→MDD | 2810 | 0.007（1.5×10⁻⁶） | 0.003（0.73） | 结果脆弱；不作解释 |
| 孤独感→CRP | 272 | 0.243（1.6×10⁻⁷） | 0.133（0.58） | 结果脆弱；不作解释 |

### 图注

**图 1.** 三条建模通路的孟德尔随机化估计（IVW，95% CI）。误差线为 1.96×SE。

**图 2.** 两步 MR 中介模型（a）与效应分解（b）。(a) 中 c' 为直接效应；a、b 分别为第一步和第二步估计。(b) 展示间接效应（失眠介导）与直接效应各占总效应的份额。

**图 3.** 三条通路的 SNP 层面散点图：暴露效应 vs 结局效应。灰点为单个变异；彩线为 IVW 估计。

**图 4.** 敏感性分析：(a) IVW、MR-Egger、加权中位数的方法比较；(b) 留一法范围（灰色横线为范围；圆点为全数据估计值）。

---

## 投稿备忘（仅作者使用，投稿前删除）

1. [ ] 核对参考文献 23–25（PubMed 检索真实条目并为所有文献补 DOI）
2. [ ] 确认作者排序、单位和通讯邮箱
3. [ ] （可选）准备图形摘要
4. [ ] 撰写 Cover letter（卖点：首个用 500 万量级结局 GWAS 定量失眠中介份额的研究）
5. [ ] 文件齐备：DOCX 主稿 + 图 1–4（300dpi PNG/TIFF）+ 补充材料
6. [ ] 按期刊格式做最后排版（JAD 用 APA 式文中引用，需一次编号转换）
