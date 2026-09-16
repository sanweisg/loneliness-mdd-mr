# 论文升级行动计划（基于GPT建议 + 撞车论文核查）

## 优先级 P0：立即补做（必做）
1. MR-PRESSO — 检测并剔除离群SNP，修正OR
2. Steiger directionality — 验证因果方向
3. Bidirectional MR — MDD→Loneliness / MDD→Insomnia
4. Genetic correlation (LDSC) — 量化遗传共享程度
5. 文献核实 — 补全References 23-25

## 优先级 P1：重新定位创新点
6. 标题改为："Focused quantitative assessment"而非"first study"
7. Discussion增加与撞车论文(41205074)的对比段落
8. 承认19.7%与对方15.5%均在置信区间，强调我们的优势：更大GWAS(5M vs 462K)

## 优先级 P2：可选增强
9. Multi-mediator framework（Neuroticism/Sleep duration/Anxiety等）
10. Colocalization分析（需重新下载含位置信息的GWAS）

---

## 已完成技能盘点

### 已安装（直接可用）
✅ academic-paper-reviewer — 7-agent论文评审
✅ causal-inference — 因果推断
✅ r-machine-learning — R全流程ML/统计
✅ forest-plot-styler / meta-analysis-forest-plotter
✅ two-sample-mr-research-planner ×3 — MR研究设计
✅ mrmrmr — MR全流程
✅ lifelines-survival-analysis
✅ deep-thinking / self-improving / proactive-agent
✅ nature-citation / nature-figure / nature-reader / nature-paper2ppt
✅ latex / latex-writer / latex-compiler
✅ superpowers / superpowers-cn — Spec-first开发
✅ paper-fetcher / paper-reference-checker / zotero
✅ css / design-system / frontend-design-super / animation
✅ skill-combiner — 跨域编排
✅ academic-paper / academic-writing / academic-writing-polisher
✅ de-ai-writing-cn / ai-humanizer — 去AI味
✅ pubmed-literature-search / pubmed-search / semantic-scholar
✅ scientific-graphical-abstract-skill
✅ generating-publication-ready-figures-in-r
✅ r-analyst / r-stats

### 缺失但可补
❌ deep-research — 需要指定@samber/deep-research（ClawHub安装有问题）
❌ hallmark — GitHub开源工具，不在ClawHub
❌ mendelian-randomisation — ClawHub未找到
❌ MR-PRESSO R包 — 需pip install mr-presso 或R包
❌ LDSC — 需独立安装
❌ colocalization（coloc包）— R包

### GitHub开源需git clone
- hallmark (26.7k★) — 文本去AI味
- nature-skills — Nature风格写作

---

## 下一步操作
1. 立即补做MR-PRESSO + Steiger + 双向MR
2. 重写Discussion与撞车论文对比
3. 更新标题和引言
4. 最终检查后再生成投稿版DOCX
