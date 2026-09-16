# 投稿检查清单 & 手动操作步骤

## 已完成 ✅

| 文件 | 路径 | 说明 |
|------|------|------|
| 论文Word版 | `/mnt/c/Users/闫/Desktop/depression_paper_submission/manuscript_v5_final.docx` | 可直接编辑 |
| 论文Markdown版 | `/mnt/c/Users/闫/Desktop/depression_paper_submission/manuscript_v5_nature_style.md` | 备份 |
| 图表PNG (14张) | `/mnt/c/Users/闫/Desktop/R_figs_final/*.png` | 高分辨率 |
| STROBE-MR检查表 | `/mnt/c/Users/闫/Desktop/depression_paper_submission/STROBE_MR_CHECKLIST.md` | 投稿时附上 |
| Nature格式要求 | `/mnt/c/Users/闫/Desktop/depression_paper_submission/NATURE_MEDITATION_GUIDE.md` | 参考 |
| 回复审稿人模板 | `/mnt/c/Users/闫/Desktop/depression_paper_submission/RESPONSE_TO_REVIEWERS_TEMPLATE.md` | 备用 |

## 你必须手动做的 ⚠️

### 1. GitHub代码仓库 (必须!)
当前Data Availability里写的是占位符，**必须替换成真实地址**:

```bash
# 在Windows上打开Git Bash，执行:
cd ~/depression_paper_submission
git init
git add *.py *.R *.csv
git commit -m "MR analysis code and data"
git remote add origin https://github.com/sanweisg/loneliness-mdd-mr.git
git push -u origin main
```

推上去后，去Zenodo获取DOI:
1. 登录 https://zenodo.org
2. 点击 "New Upload"
3. 关联GitHub repo
4. 获取DOI（格式：10.5281/zenodo.xxxxxx）
5. 把DOI替换到论文Data Availability里

### 2. 确认投稿期刊要求
当前目标期刊：**Journal of Affective Disorders**
- 投稿网址: https://www.editorialmanager.com/jad/
- 字数限制: ~3,000词（符合）
- 图表限制: ≤6个（你的14个图需要精简到6个以内，或分Extended Data）
- 格式: 需要确认是否接受markdown直接转docx

**注意**: 你的图有14张，但期刊通常只允许6-8个主图。建议：
- 主图选4-6个最核心的
- 其余放Supplementary Material

### 3. 提交前最后检查
打开 `manuscript_v5_final.docx` 检查：
- [ ] 所有作者名字正确
- [ ] 通讯作者邮箱正确（yanmedwei@163.com）
- [ ] 所有表格数字与原始数据一致
- [ ] 引用格式是否正确（JAD可能要求不同的引用样式）
- [ ] 图表编号与正文引用对应

### 4. 准备投稿材料
通常需要上传:
1. Manuscript (.docx)
2. Cover Letter（需手写，说明研究创新性）
3. Figure files (PNG/TIFF)
4. Supplementary Materials（可选）
5. STROBE-MR checklist
6. Data availability statement

### 5. 需要手写Cover Letter的要点
```
Dear Editor,

We are submitting our manuscript "Causal pathways from loneliness to 
major depressive disorder..." for consideration in Journal of Affective 
Disorders.

Key findings:
- First MR study to quantify insomnia-mediated proportion using 5M+ MDD GWAS
- Discovered substantial pleiotropic inflation (OR attenuated 29% after correction)
- Mediation proportion (19.7%) consistent with recent independent report

This study provides robust genetic evidence for sleep-targeted interventions 
in lonely individuals at risk of depression.

All authors have read and approved the manuscript. No conflicts of interest.

Sincerely,
Yan Jinlu
```

## 重要提醒 ⚡

1. **Figure数量**: JAD一般6-8个主图，你的14个需要精选
2. **字数**: 当前约2,800词，符合要求
3. **代码仓库**: 必须先建GitHub repo，否则Data Availability不成立
4. **伦理声明**: 用了公开GWAS数据，需确认是否需要IRB批准（通常不需要，但要在论文中说明）
