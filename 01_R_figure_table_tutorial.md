# MR论文 R 作图 + 三线表教程（极简版）

> 数据路径：`C:\Users\闫\Desktop\depression_paper_submission\`
> 输出路径：`C:\Users\闫\Desktop\depression_paper_submission\R_figs\` 和 `R_tables\`
> 包：ggplot2, dplyr, tidyr, scales, patchwork, openxlsx, jsonlite

---

## 一、数据文件说明

| 文件 | 用途 |
|------|------|
| `mr_full_results.csv` | 已有MR结果（IVW/Egger/WM/Q/LOO） |
| `mediation_results.csv` | 中介分析结果 |
| `all_results.json` | 完整JSON（含coloc信息） |
| `enhanced_mr_results.json` | 增强分析结果（MR-PRESSO/Steiger/双向MR/遗传相关性） |
| `mdd_gwas.csv` / `loneliness_full.csv` / `insomnia_ukb_a13.csv` | GWAS原始数据（供散点图用） |

---

## 二、每张图用什么数据

### Figure 1 — 森林图（已有 fig1_forest.png）
**数据：** `mr_full_results.csv` 的 Lon→MDD / Ins→MDD / Lon→Ins 三行
**列：** pathway, ivw_beta, ivw_lo, ivw_hi, n_snps

### Figure 2 — 中介模型图（已有 fig2_mediation.png）
**数据：** `mediation_results.csv`（a/b/c/indirect/direct/prop_med）
**也参考：** `enhanced_mr_results.json` 里的 mediation 字段

### Figure 3 — 散点图（已有 fig3_scatter.png）
**数据：** `mdd_gwas.csv` + `loneliness_full.csv`（共享SNP做x-y散点）
**列：** SNP, BETA_x（孤独对SNP的效应）, BETA_y（MDD对SNP的效应）

### Figure 4 — 敏感性分析（已有 fig4_sensitivity.png）
**数据：** `mr_full_results.csv` 的所有估计方法行
**列：** pathway, method, beta, se, p

---

## 三、建议新增的图片（共5张）

### 新增 Figure 5 — 漏斗图（Pleiotropy Funnel Plot）
**数据：** `mr_full_results.csv`，每个SNP算出 Wald ratio = BETA_out/SE_out
**列：** exposure_beta/se, outcome_beta/se, pathway
**意义：** 审稿人必问 pleiotropy，漏斗图是最直观的回答

### 新增 Figure 6 — 多方法比较图（Forest plot with all estimators）
**数据：** `mr_full_results.csv` 的 IVW / Egger / WM 三行
**列：** pathway, method, beta, lo, hi
**意义：** 比原图4更直观，每条通路并排显示三种方法

### 新增 Figure 7 — 中介效应气泡图（Bubble plot of mediation）
**数据：** `mediation_results.csv`
**列：** component（Total/a/b/Indirect/Direct）, beta, lower, upper
**意义：** 替换原来的柱状图，更信息密度

### 新增 Figure 8 — 遗传相关性热图（Genetic correlation heatmap）
**数据：** `enhanced_mr_results.json` 的 genetic_correlation 字段
**三个变量：** MDD / Loneliness / Insomnia
**意义：** 展示trait间的遗传重叠，审稿人常问

### 新增 Figure 9 — 双向MR因果路径图（Directional path diagram）
**数据：** `enhanced_mr_results.json` 的 bidirectional 字段 + Steiger 字段
**意义：** 一张图展示所有因果方向及显著性

---

## 四、三线表（用R生成）

所有表格用 R + xlsx 包生成，输出为 `.xlsx` 或 `.csv`，投稿时转Word。

# ============================================================
#  第一步：安装/加载包
# ============================================================
# 只需运行一次：
# install.packages(c("ggplot2","dplyr","tidyr","scales","patchwork","openxlsx","jsonlite"),
#                  repos="https://mirrors.tuna.tsinghua.edu.cn/CRAN/")

library(ggplot2); library(dplyr); library(tidyr); library(scales)
library(patchwork); library(openxlsx); library(jsonlite)

DIR <- "C:/Users/闫/Desktop/depression_paper_submission"
FIG <- file.path(DIR, "R_figs")
TAB <- file.path(DIR, "R_tables")
dir.create(TAB, recursive=TRUE, showWarnings=FALSE)

# 加载数据
results <- read.csv(file.path(DIR, "mr_full_results.csv"))
mediation <- read.csv(file.path(DIR, "mediation_results.csv"))
enhanced <- fromJSON(file.path(DIR, "enhanced_mr_results.json"))

# Nature风格theme
theme_nature <- function() {
  theme_minimal(base_size=11, base_family="Arial") +
    theme(text=element_text(color="#1F2937"),
          plot.title=element_text(face="bold",size=13),
          axis.title=element_text(face="bold",size=11),
          axis.text=element_text(size=10),
          panel.grid.major=element_line(color="#F3F4F6"),
          panel.grid.minor=element_blank(),
          legend.position="bottom",
          plot.margin=margin(12,12,8,12))
}

COL <- c(loneliness="#1F6B9A", insomnia="#CA6B3A", MDD="#3A8C4E",
         direct="#8E44AD", indirect="#E08214", egger="#C0392B", wmedian="#2E86AB")

# ============================================================
#  图5: 漏斗图 — 每个SNP的Wald ratio做x，1/SE做y
# ============================================================
# 数据源：mdd_gwas.csv + loneliness_full.csv（取共享SNP）
lon_full <- read.csv(file.path(DIR, "loneliness_full.csv"))[,c("SNP","BETA","SE")]
mdd_full <- read.csv(file.path(DIR, "mdd_gwas.csv"))[,c("SNP","BETA","SE")]
shared <- merge(lon_full, mdd_full, by="SNP", suffixes=c("_lon","_mdd"))
shared$wald_ratio <- shared$BETA_mdd / shared$BETA_lon
shared$se_wald <- sqrt((shared$SE_mdd/shared$BETA_lon)^2 + 
                       (shared$BETA_mdd*shared$SE_lon/shared$BETA_lon^2)^2)
shared$weight <- 1/shared$se_wald^2

p5 <- ggplot(shared, aes(x=wald_ratio, y=weight)) +
  geom_point(alpha=0.3, size=1.5, color="#6B7280") +
  geom_vline(xintercept=results$ivw_beta[1], linetype="dashed", color="#E74C3C", linewidth=1) +
  labs(x="Wald ratio (β_MDD/β_loneliness)", y="1/SE (weight)",
       title="Funnel plot: pleiotropy assessment") +
  theme_nature()
ggsave(file.path(FIG,"fig5_funnel.png"), p5, width=7, height=5, dpi=300, bg="white")
cat("Saved: fig5_funnel.png\n")

# ============================================================
#  图6: 多方法比较森林图
# ============================================================
methods_df <- data.frame(
  pathway = rep(c("Loneliness→MDD","Insomnia→MDD","Loneliness→Insomnia"), 3),
  method = rep(c("IVW","MR-Egger","Weighted median"), each=3),
  beta = c(results$ivw_beta, results$egger_beta, results$wm_beta),
  se = c(results$ivw_se, results$egger_se, results$wm_se),
  stringsAsFactors = FALSE
)
methods_df$pathway <- factor(methods_df$pathway,
                              levels=c("Loneliness→MDD","Insomnia→MDD","Loneliness→Insomnia"))
methods_df$method <- factor(methods_df$method,
                              levels=c("IVW","MR-Egger","Weighted median"))

p6 <- ggplot(methods_df, aes(x=pathway, y=beta, fill=method)) +
  geom_col(position=position_dodge(width=0.8), width=0.7, colour="white", linewidth=0.6) +
  geom_errorbar(aes(ymin=beta-1.96*se, ymax=beta+1.96*se),
                position=position_dodge(width=0.8), width=0.15, linewidth=0.7) +
  scale_fill_manual(values=c(COL["loneliness"], COL["egger"], COL["wmedian"])) +
  labs(x=NULL, y="β estimate (95% CI)", title="MR estimates across methods") +
  theme_nature() +
  theme(axis.text.x=element_text(face="bold",size=9), legend.position="top")

ggsave(file.path(FIG,"fig6_multi_method.png"), p6, width=8, height=5, dpi=300, bg="white")
cat("Saved: fig6_multi_method.png\n")

# ============================================================
#  图7: 中介效应气泡图
# ============================================================
bubble_df <- data.frame(
  component = factor(c("Total (c)","a-path (Lon→Ins)","b-path (Ins→MDD)",
                       "Indirect (a×b)","Direct (c')"),
                     levels=c("Total (c)","a-path (Lon→Ins)","b-path (Ins→MDD)",
                              "Indirect (a×b)","Direct (c')")),
  beta = c(1.897, 0.447, 0.837, 0.374, 1.522),
  prop = c(100, NA, NA, 19.7, 80.3),
  color = c("#6B7280", COL["loneliness"], COL["insomnia"], COL["indirect"], COL["direct"])
)
bubble_df$size <- bubble_df$prop / max(bubble_df$prop, na.rm=TRUE) * 12 + 4

p7 <- ggplot(bubble_df, aes(x=component, y=beta, size=size, fill=color)) +
  geom_point(shape=21, colour="white", linewidth=0.8) +
  scale_size_identity() + scale_fill_identity() +
  geom_text(aes(label=paste0(round(beta,2)," (",round(prop,1),"%))")), vjust=-0.5, size=3.2)
  labs(x=NULL, y="β (95% CI)", title="Mediation effect decomposition") +
  theme_nature() +
  theme(axis.text.x=element_text(face="bold",size=8), legend.position="none")

ggsave(file.path(FIG,"fig7_mediation_bubble.png"), p7, width=7, height=5, dpi=300, bg="white")
cat("Saved: fig7_mediation_bubble.png\n")

# ============================================================
#  图8: 遗传相关性热图
# ============================================================
gc_df <- data.frame(
  Trait1 = c("MDD","MDD","Loneliness"),
  Trait2 = c("Loneliness","Insomnia","Insomnia"),
  rg = c(enhanced$genetic_correlation$mdd_lon,
         enhanced$genetic_correlation$mdd_ins,
         enhanced$genetic_correlation$lon_ins)
)

p8 <- ggplot(gc_df, aes(x=Trait1, y=Trait2, fill=rg)) +
  geom_tile(colour="white", linewidth=1.2) +
  geom_text(aes(label=sprintf("%.3f",rg)), size=5, fontface="bold", color="white") +
  scale_fill_gradient2(low="#3498DB", mid="#FFFFFF", high="#E74C3C",
                       midpoint=0, limits=c(-0.3,0.3)) +
  labs(x=NULL, y=NULL, title="Genetic correlations (rg)") +
  theme_nature() +
  theme(axis.text=element_text(face="bold",size=12), panel.grid=element_blank())

ggsave(file.path(FIG,"fig8_genetic_correlation.png"), p8, width=4.5, height=4, dpi=300, bg="white")
cat("Saved: fig8_genetic_correlation.png\n")

# ============================================================
#  图9: 双向MR因果路径图
# ============================================================
p9a <- ggplot() +
  geom_point(aes(x=2,y=7), shape=21, fill=COL["loneliness"], size=22,
             colour="white", stroke=2) +
  geom_point(aes(x=5,y=7), shape=21, fill=COL["indirect"], size=22,
             colour="white", stroke=2) +
  geom_point(aes(x=8,y=7), shape=21, fill=COL["MDD"], size=22,
             colour="white", stroke=2) +
  geom_text(aes(x=2,y=7,label="Loneliness"), colour="white", fontface="bold", size=4) +
  geom_text(aes(x=5,y=7,label="Insomnia"),   colour="white", fontface="bold", size=4) +
  geom_text(aes(x=8,y=7,label="MDD"),        colour="white", fontface="bold", size=4) +
  geom_segment(aes(x=2.5,y=7,xend=4.5,yend=7),
               arrow=arrow(type="closed",length=unit(0.22,"cm")),
               colour="#374151", linewidth=1.5) +
  geom_segment(aes(x=5.5,y=7,xend=7.5,yend=7),
               arrow=arrow(type="closed",length=unit(0.22,"cm")),
               colour="#374151", linewidth=1.5) +
  geom_text(aes(x=3.5,y=7.45,label="β=0.45 ***"), size=3) +
  geom_text(aes(x=6.5,y=7.45,label="β=0.84 ***"), size=3) +
  geom_curve(aes(x=2.3,y=6.3,xend=7.7,yend=6.3), curvature=0.2,
             arrow=arrow(type="closed",length=unit(0.15,"cm")),
             colour="#9CA3AF", linewidth=1, linetype="dashed") +
  geom_text(aes(x=5,y=5.7,label="MDD→Lon: β=0.09 | MDD→Ins: β=0.15"),
            size=2.8, colour="#6B7280") +
  coord_cartesian(xlim=c(0.5,9.5), ylim=c(4.5,8.5), expand=FALSE) +
  scale_x_continuous(NULL,breaks=NULL) + scale_y_continuous(NULL,breaks=NULL) +
  labs(title="(a) Bidirectional MR causal pathways") +
  theme_nature() +
  theme(panel.grid=element_blank(), axis.text=element_blank(), axis.ticks=element_blank(),
        plot.title=element_text(size=11,face="bold"))

steiger_df <- data.frame(
  pathway = c("Lon→MDD","Ins→MDD","Lon→Ins"),
  prop = c(79.4, 77.2, 99.8)
)
steiger_df$pathway <- factor(steiger_df$pathway, levels=rev(steiger_df$pathway))

p9b <- ggplot(steiger_df, aes(x=pathway, y=prop, fill=pathway)) +
  geom_col(width=0.7, colour="white", linewidth=0.6) +
  geom_text(aes(label=paste0(prop,"%%)), hjust=-0.1, size=3.5) +
  scale_fill_manual(values=c(COL["loneliness"], COL["insomnia"], COL["loneliness"])) +
  labs(x=NULL, y="% SNPs directional", title="(b) Steiger directionality") +
  theme_nature() +
  theme(legend.position="none", axis.text.x=element_text(face="bold",size=9))

p9 <- p9a / p9b + plot_layout(heights=c(1.2,0.6))
ggsave(file.path(FIG,"fig9_bidirectional.png"), p9, width=9, height=7, dpi=300, bg="white")
cat("Saved: fig9_bidirectional.png\n\n")

# ============================================================
#  三线表生成（openxlsx）
# ============================================================

# 表1: MR主结果（插入论文Table 2位置）
t1 <- data.frame(
  Pathway = c("Loneliness→MDD","Insomnia→MDD","Loneliness→Insomnia"),
  Instruments = c(544, 800, 657),
  Mean_F = c(34.4, 34.3, 33.9),
  IVW_Beta = sprintf("%.2f (%.2f–%.2f)", results$ivw_beta, results$ivw_lo, results$ivw_hi),
  OR = sprintf("%.2f (%.2f–%.2f)", results$OR, results$ivw_lo, results$ivw_hi),
  P = c("<1×10⁻¹⁶","<1×10⁻¹⁶","<1×10⁻¹⁶"),
  Egger_Beta = sprintf("%.2f (%.2f–%.2f)", results$egger_beta,
                       results$egger_beta-1.96*results$egger_se,
                       results$egger_beta+1.96*results$egger_se),
  Egger_P = c("<1×10⁻¹⁶","<1×10⁻¹⁶","<1×10⁻¹⁶"),
  WM_Beta = sprintf("%.2f (%.2f–%.2f)", results$wm_beta,
                    results$wm_beta-1.96*results$wm_se,
                    results$wm_beta+1.96*results$wm_se),
  Egger_Int_P = sprintf("%.3f", results$egger_int_p),
  stringsAsFactors = FALSE
)
write.xlsx(t1, file.path(TAB,"table1_mr_main.xlsx"), sheetName="Table2", row.names=FALSE)

# 表2: MR-PRESSO校正结果（新增）
t2 <- data.frame(
  Pathway = c("Loneliness→MDD","Insomnia→MDD","Loneliness→Insomnia"),
  Total_SNPs = c(544, 800, 657),
  Outliers_Removed = c(99, 296, 211),
  Clean_IVW_Beta = c(round(enhanced$mrpresso$lon_mdd$clean_beta,2),
                     round(enhanced$mrpresso$ins_mdd$clean_beta,2),
                     round(enhanced$mrpresso$lon_ins$clean_beta,2)),
  Clean_OR = c(round(exp(enhanced$mrpresso$lon_mdd$clean_beta),2),
               round(exp(enhanced$mrpresso$ins_mdd$clean_beta),2), NA),
  stringsAsFactors = FALSE
)
write.xlsx(t2, file.path(TAB,"table2_mrpessso.xlsx"), sheetName="TableS1", row.names=FALSE)

# 表3: Steiger方向性（新增）
t3 <- data.frame(
  Pathway = c("Loneliness→MDD","Insomnia→MDD","Loneliness→Insomnia"),
  SNPs_Directional = c(432, 618, 656),
  Total_SNPs = c(544, 800, 657),
  Percent_Directional = c("79.4%%","77.2%%","99.8%%"),
  P_Binomial = c("0.002","<0.001","<0.001"),
  stringsAsFactors = FALSE
)
write.xlsx(t3, file.path(TAB,"table3_steiger.xlsx"), sheetName="TableS2", row.names=FALSE)

# 表4: 双向MR（新增）
t4 <- data.frame(
  Direction = c("Loneliness→MDD","Insomnia→MDD","MDD→Loneliness","MDD→Insomnia"),
  Instruments = c(544, 800, 12849, 12837),
  Beta = c("1.90","0.84","0.09","0.15"),
  SE = c("0.03","0.01","—","—"),
  OR = c("6.66","2.31","1.10","1.17"),
  P_Value = c("<1×10⁻¹⁶","<1×10⁻¹⁶","<0.001","<0.001"),
  stringsAsFactors = FALSE
)
write.xlsx(t4, file.path(TAB,"table4_bidirectional.xlsx"), sheetName="TableS3", row.names=FALSE)

# 表5: 遗传相关性（新增）
t5 <- data.frame(
  Trait_1 = c("MDD","MDD","Loneliness"),
  Trait_2 = c("Loneliness","Insomnia","Insomnia"),
  rg = c(0.147, 0.098, 0.185),
  n_Shared_SNPs = c(7091212, 7038785, 8747914),
  stringsAsFactors = FALSE
)
write.xlsx(t5, file.path(TAB,"table5_genetic_corr.xlsx"), sheetName="TableS4", row.names=FALSE)

# 表6: 中介分析（插入论文Table 3位置）
t6 <- data.frame(
  Component = c("Total effect (c)","a-path: Loneliness→Insomnia",
                "b-path: Insomnia→MDD","Indirect effect (a×b)","Direct effect (c')"),
  Beta_SE = c("1.90 (0.03)","0.45 (0.01)","0.84 (0.01)","0.37 (0.01)","1.52 (0.03)"),
  P = c("<1×10⁻¹⁶","<1×10⁻¹⁶","<1×10⁻¹⁶","<1×10⁻¹⁶","<1×10⁻¹⁶"),
  Share_of_Total = c("100%%","—","—","19.7%%","80.3%%"),
  stringsAsFactors = FALSE
)
write.xlsx(t6, file.path(TAB,"table6_mediation.xlsx"), sheetName="Table3", row.names=FALSE)

cat("All tables saved to:", TAB, "\n")
cat(list.files(TAB), "\n")
cat("\n=== ALL DONE ===\n")

**数据：** `mr_full_results.csv`
**列：** Pathway | Instruments | Mean F | IVW β (95% CI) | OR (95% CI) | P | MR-Egger β (P) | WM β (P) | Egger int P
**输出：** `R_tables/table1_mr_main.xlsx`

### 表2 — MR-PRESSO校正表
**数据：** `enhanced_mr_results.json` 的 mrpresso 字段
**列：** Pathway | Total SNPs | Outliers Removed | Clean IVW β | Clean OR | Q global P
**输出：** `R_tables/table2_mrpessso.xlsx`

### 表3 — Steiger方向性检验表
**数据：** `enhanced_mr_results.json` 的 steiger 字段
**列：** Pathway | SNPs with exposure R²>outcome | Total SNPs | % Directional | P (binomial)
**输出：** `R_tables/table3_steiger.xlsx`

### 表4 — 双向MR结果表
**数据：** `enhanced_mr_results.json` 的 bidirectional 字段
**列：** Direction | Instruments | β (SE) | OR (95% CI) | P
**输出：** `R_tables/table4_bidirectional.xlsx`

### 表5 — 遗传相关性表
**数据：** `enhanced_mr_results.json` 的 genetic_correlation 字段
**列：** Trait 1 | Trait 2 | rg | n shared SNPs
**输出：** `R_tables/table5_genetic_corr.xlsx`

### 表6 — 中介分析表（Table 3 位置）
**数据：** `mediation_results.csv`
**列：** Component | β (SE) | P | Share of Total (%)
**输出：** `R_tables/table6_mediation.xlsx`

### 表7 — 工具变量特征表（Table 1 位置）
**数据：** 从GWAS原始文件提取
**列：** SNP | A1 | A2 | EAF | Beta_exp | SE_exp | P_exp | F_stat | Beta_out | SE_out | P_out
**输出：** `R_tables/table7_instruments.xlsx`

---

## 五、完整R代码模板（复制粘贴运行）

```r
# ============================================================
#  Step 0: 加载包
# ============================================================
library(ggplot2); library(dplyr); library(tidyr); library(scales); library(patchwork); library(xlsx)

DIR <- "C:/Users/闫/Desktop/depression_paper_submission"
FIG <- file.path(DIR, "R_figs")
TAB <- file.path(DIR, "R_tables")
dir.create(TAB, recursive=TRUE, showWarnings=FALSE)

# 加载数据
results <- read.csv(file.path(DIR, "mr_full_results.csv"))
mediation <- read.csv(file.path(DIR, "mediation_results.csv"))
enhanced <- jsonlite::read_json(file.path(DIR, "enhanced_mr_results.json"), simplifyVector=TRUE)

# Nature风格theme
theme_nature <- function() {
  theme_minimal(base_size=11, base_family="Arial") +
    theme(text=element_text(color="#1F2937"),
          plot.title=element_text(face="bold",size=13),
          axis.title=element_text(face="bold",size=11),
          axis.text=element_text(size=10),
          panel.grid.major=element_line(color="#F3F4F6"),
          panel.grid.minor=element_blank(),
          legend.position="bottom",
          plot.margin=margin(12,12,8,12))
}

COL <- c(loneliness="#1F6B9A", insomnia="#CA6B3A", MDD="#3A8C4E",
         direct="#8E44AD", indirect="#E08214")

# ============================================================
#  新增 Figure 5: 漏斗图
# ============================================================
# 每个SNP的Wald ratio作为x轴，inverse variance weight作为y轴
funnel_df <- results %>%
  mutate(se_inv = 1/se) %>%
  select(pathway, ivw_beta, ivw_se, n_snps) %>%
  rowwise() %>%
  summarise(
    pathway = pathway,
    slope = ivw_beta,
    se = ivw_se
  )

# ============================================================
#  新增 Figure 6: 多方法森林图
# ============================================================
methods_df <- data.frame(
  pathway = rep(c("Loneliness→MDD","Insomnia→MDD","Loneliness→Insomnia"), 3),
  method = rep(c("IVW","MR-Egger","Weighted median"), each=3),
  beta = c(results$ivw_beta[1], results$egger_beta[1], results$wm_beta[1],
           results$ivw_beta[2], results$egger_beta[2], results$wm_beta[2],
           results$ivw_beta[3], results$egger_beta[3], results$wm_beta[3]),
  se = c(results$ivw_se[1], results$egger_se[1], results$wm_se[1],
         results$ivw_se[2], results$egger_se[2], results$wm_se[2],
         results$ivw_se[3], results$egger_se[3], results$wm_se[3]),
  col = c(COL["loneliness"], COL["egger"], COL["wmedian"],
          COL["insomnia"], COL["egger"], COL["wmedian"],
          COL["loneliness"], COL["egger"], COL["wmedian"])
)
methods_df$pathway <- factor(methods_df$pathway, levels=c("Loneliness→MDD","Insomnia→MDD","Loneliness→Insomnia"))
methods_df$method <- factor(methods_df$method, levels=c("IVW","MR-Egger","Weighted median"))

p6 <- ggplot(methods_df, aes(x=pathway, y=beta, fill=method)) +
  geom_col(position=position_dodge(width=0.8), width=0.7, colour="white", linewidth=0.6) +
  geom_errorbar(aes(ymin=beta-1.96*se, ymax=beta+1.96*se),
                position=position_dodge(width=0.8), width=0.15, linewidth=0.7) +
  scale_fill_manual(values=c(COL["loneliness"], COL["egger"], COL["wmedian"])) +
  labs(x=NULL, y="β estimate (95% CI)", title="MR estimates across methods") +
  theme_nature() +
  theme(axis.text.x=element_text(face="bold",size=9), legend.position="top")

ggsave(file.path(FIG,"fig5_multi_method.png"), p6, width=8, height=5, dpi=300, bg="white")

# ============================================================
#  新增 Figure 7: 中介效应气泡图
# ============================================================
bubble_df <- data.frame(
  component = factor(c("Total (c)","a-path (Lon→Ins)","b-path (Ins→MDD)",
                       "Indirect (a×b)","Direct (c')"),
                     levels=c("Total (c)","a-path (Lon→Ins)","b-path (Ins→MDD)",
                              "Indirect (a×b)","Direct (c')")),
  beta = c(1.897, 0.447, 0.837, 0.374, 1.522),
  prop = c(100, NA, NA, 19.7, 80.3),
  color = c("#6B7280", COL["loneliness"], COL["insomnia"], COL["indirect"], COL["direct"])
)
bubble_df$size <- bubble_df$prop / max(bubble_df$prop) * 12 + 4

p7 <- ggplot(bubble_df, aes(x=component, y=beta, size=size, fill=color)) +
  geom_point(shape=21, colour="white", linewidth=0.8) +
  scale_size_identity() + scale_fill_identity() +
  geom_text(aes(label=paste0(round(beta,2)," (",prop,"%%)")), vjust=-0.5, size=3) +
  labs(x=NULL, y="β (95% CI)", title="Mediation effect decomposition") +
  theme_nature() +
  theme(axis.text.x=element_text(face="bold",size=8), legend.position="none")

ggsave(file.path(FIG,"fig6_mediation_bubble.png"), p7, width=7, height=5, dpi=300, bg="white")

# ============================================================
#  新增 Figure 8: 遗传相关性热图
# ============================================================
gc_df <- data.frame(
  Trait1 = c("MDD","MDD","Loneliness"),
  Trait2 = c("Loneliness","Insomnia","Insomnia"),
  rg = c(0.147, 0.098, 0.185)
)

p8 <- ggplot(gc_df, aes(x=Trait1, y=Trait2, fill=rg)) +
  geom_tile(colour="white", linewidth=1) +
  geom_text(aes(label=sprintf("%.3f",rg)), size=5, fontface="bold", color="white") +
  scale_fill_gradient2(low="#3498DB", mid="#FFFFFF", high="#E74C3C", midpoint=0, limits=c(-0.3,0.3)) +
  labs(x=NULL, y=NULL, title="Genetic correlations (rg)") +
  theme_nature() +
  theme(axis.text=element_text(face="bold",size=11), panel.grid=element_blank())

ggsave(file.path(FIG,"fig7_genetic_correlation.png"), p8, width=4, height=4, dpi=300, bg="white")

# ============================================================
#  新增 Figure 9: 双向MR因果路径图
# ============================================================
# 用简单节点+箭头表示，数字标注β和显著性
p9 <- ggplot() +
  geom_point(aes(x=2,y=7), shape=21, fill=COL["loneliness"], size=24, colour="white", stroke=2) +
  geom_point(aes(x=5,y=7), shape=21, fill=COL["indirect"], size=24, colour="white", stroke=2) +
  geom_point(aes(x=8,y=7), shape=21, fill=COL["MDD"], size=24, colour="white", stroke=2) +
  geom_text(aes(x=2,y=7,label="Loneliness"), colour="white", fontface="bold", size=4) +
  geom_text(aes(x=5,y=7,label="Insomnia"),   colour="white", fontface="bold", size=4) +
  geom_text(aes(x=8,y=7,label="MDD"),        colour="white", fontface="bold", size=4) +
  # Forward paths
  geom_segment(aes(x=2.5,y=7,xend=4.5,yend=7), arrow=arrow(type="closed",length=unit(0.2,"cm")), colour="#374151", linewidth=1.5) +
  geom_segment(aes(x=5.5,y=7,xend=7.5,yend=7), arrow=arrow(type="closed",length=unit(0.2,"cm")), colour="#374151", linewidth=1.5) +
  geom_text(aes(x=3.5,y=7.4,label="β=0.45 ***"), size=3) +
  geom_text(aes(x=6.5,y=7.4,label="β=0.84 ***"), size=3) +
  # Reverse paths (dashed)
  geom_curve(aes(x=2.3,y=6.3,xend=7.7,yend=6.3), curvature=0.2,
             arrow=arrow(type="closed",length=unit(0.15,"cm")),
             colour="#9CA3AF", linewidth=1, linetype="dashed") +
  geom_text(aes(x=5,y=5.8,label="MDD→Lon: β=0.09 *; MDD→Ins: β=0.15 **"), size=3, colour="#6B7280") +
  coord_cartesian(xlim=c(0.5,9.5), ylim=c(4.5,8.5), expand=FALSE) +
  scale_x_continuous(NULL,breaks=NULL) + scale_y_continuous(NULL,breaks=NULL) +
  labs(title="(a) Bidirectional MR causal pathways") +
  theme_nature() +
  theme(panel.grid=element_blank(), axis.text=element_blank(), axis.ticks=element_blank(),
        plot.title=element_text(size=11,face="bold"))

# 右侧加Steiger结果小图
steiger_df <- data.frame(
  pathway = c("Lon→MDD","Ins→MDD","Lon→Ins"),
  prop = c(79.4, 77.2, 99.8)
)
steiger_df$pathway <- factor(steiger_df$pathway, levels=rev(steiger_df$pathway))

p9b <- ggplot(steiger_df, aes(x=pathway, y=prop, fill=pathway)) +
  geom_col(width=0.7, colour="white", linewidth=0.6) +
  geom_text(aes(label=paste0(prop,"%")), hjust=-0.1, size=3.5) +
  scale_fill_manual(values=c(COL["loneliness"], COL["insomnia"], COL["loneliness"])) +
  labs(x=NULL, y="% SNPs directional", title="(b) Steiger directionality") +
  theme_nature() +
  theme(legend.position="none", axis.text.x=element_text(face="bold",size=9))

p9 <- p9 / p9b + plot_layout(heights=c(1.2,0.6))
ggsave(file.path(FIG,"fig8_bidirectional.png"), p9, width=9, height=7, dpi=300, bg="white")

# ============================================================
#  三线表生成（xlsx格式）
# ============================================================

# 表1: MR主结果
table1 <- data.frame(
  Pathway = c("Loneliness→MDD","Insomnia→MDD","Loneliness→Insomnia"),
  Instruments = c(544, 800, 657),
  Mean_F = c(34.4, 34.3, 33.9),
  IVW_Beta = sprintf("%.2f (%.2f–%.2f)", results$ivw_beta, results$ivw_lo, results$ivw_hi),
  OR = sprintf("%.2f (%.2f–%.2f)", results$OR, results$ivw_lo, results$ivw_hi),
  P_IVW = c("<1×10⁻¹⁶","<1×10⁻¹⁶","<1×10⁻¹⁶"),
  Egger_Beta = sprintf("%.2f (%.2f–%.2f)", results$egger_beta,
                       results$egger_beta-1.96*results$egger_se,
                       results$egger_beta+1.96*results$egger_se),
  Egger_P = c("<1×10⁻¹⁶","<1×10⁻¹⁶","<1×10⁻¹⁶"),
  WM_Beta = sprintf("%.2f (%.2f–%.2f)", results$wm_beta,
                    results$wm_beta-1.96*results$wm_se,
                    results$wm_beta+1.96*results$wm_se),
  Egger_Int_P = sprintf("%.3f", results$egger_int_p)
)
write.xlsx(table1, file.path(TAB,"table1_mr_main.xlsx"), sheetName="MR_Main", row.names=FALSE)

# 表2: MR-PRESSO
table2 <- data.frame(
  Pathway = c("Loneliness→MDD","Insomnia→MDD","Loneliness→Insomnia"),
  Total_SNPs = c(544, 800, 657),
  Outliers_Removed = c(99, 296, 211),
  Clean_IVW_Beta = sprintf("%.2f (%.2f–%.2f)",
                           enhanced$mrpresso$lon_mdd$clean_beta,
                           enhanced$mrpresso$lon_mdd$clean_beta-1.96*sqrt(1/sum((enhanced$mrpresso$lon_mdd$clean_beta)^2)),
                           enhanced$mrpresso$lon_mdd$clean_beta+1.96*sqrt(1/sum((enhanced$mrpresso$lon_mdd$clean_beta)^2))),
  Clean_OR = sprintf("%.2f", exp(enhanced$mrpresso$lon_mdd$clean_beta)),
  Q_Global_P = c("<1×10⁻¹⁶","<1×10⁻¹⁶","<1×10⁻¹⁶")
)
write.xlsx(table2, file.path(TAB,"table2_mrpessso.xlsx"), sheetName="MRPRESSO", row.names=FALSE)

# 表3: Steiger
table3 <- data.frame(
  Pathway = c("Loneliness→MDD","Insomnia→MDD","Loneliness→Insomnia"),
  SNPs_Directional = c(432, 618, 656),
  Total_SNPs = c(544, 800, 657),
  Percent_Directional = c("79.4%","77.2%","99.8%"),
  P_Binomial = c("0.002","<0.001","<0.001")
)
write.xlsx(table3, file.path(TAB,"table3_steiger.xlsx"), sheetName="Steiger", row.names=FALSE)

# 表4: 双向MR
table4 <- data.frame(
  Direction = c("Loneliness→MDD","Insomnia→MDD","MDD→Loneliness","MDD→Insomnia"),
  Instruments = c(544, 800, 12849, 12837),
  Beta = c("1.90","0.84","0.09","0.15"),
  SE = c("0.03","0.01","—","—"),
  OR = c("6.66","2.31","1.10","1.17"),
  P_Value = c("<1×10⁻¹⁶","<1×10⁻¹⁶","<0.001","<0.001")
)
write.xlsx(table4, file.path(TAB,"table4_bidirectional.xlsx"), sheetName="Bidirectional", row.names=FALSE)

# 表5: 遗传相关性
table5 <- data.frame(
  Trait_1 = c("MDD","MDD","Loneliness"),
  Trait_2 = c("Loneliness","Insomnia","Insomnia"),
  rg = c(0.147, 0.098, 0.185),
  n_Shared_SNPs = c(7091212, 7038785, 8747914)
)
write.xlsx(table5, file.path(TAB,"table5_genetic_corr.xlsx"), sheetName="GenCorr", row.names=FALSE)

# 表6: 中介分析
table6 <- data.frame(
  Component = c("Total effect (c)","a-path: Loneliness→Insomnia",
                "b-path: Insomnia→MDD","Indirect effect (a×b)","Direct effect (c')"),
  Beta_SE = c("1.90 (0.03)","0.45 (0.01)","0.84 (0.01)","0.37 (0.01)","1.52 (0.03)"),
  P = c("<1×10⁻¹⁶","<1×10⁻¹⁶","<1×10⁻¹⁶","<1×10⁻¹⁶","<1×10⁻¹⁶"),
  Share_of_Total = c("100%","—","—","19.7%","80.3%")
)
write.xlsx(table6, file.path(TAB,"table6_mediation.xlsx"), sheetName="Mediation", row.names=FALSE)

cat("All tables saved to:", TAB, "\n")
cat(list.files(TAB), "\n")
cat("\nAll figures saved to:", FIG, "\n")
cat(list.files(FIG), "\n")
cat("\n=== DONE ===\n")
