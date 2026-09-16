library(openxlsx); library(jsonlite)
DIR <- "C:/Users/闫/Desktop/depression_paper_submission"
TAB <- file.path(DIR, "R_tables")
dir.create(TAB, recursive=TRUE, showWarnings=FALSE)

results <- read.csv(file.path(DIR, "mr_full_results.csv"))
enhanced <- fromJSON(file.path(DIR, "enhanced_mr_results.json"))

cat("Data loaded OK\n\n")

# Table 1: MR main results (for paper Table 2)
t1 <- data.frame(
  Pathway = c("Loneliness→MDD","Insomnia→MDD","Loneliness→Insomnia"),
  Instruments = c(results$n_snps[1], results$n_snps[2], results$n_snps[3]),
  Mean_F = c(results$f_mean[1], results$f_mean[2], results$f_mean[3]),
  IVW_Beta = sprintf("%.2f (%.2f–%.2f)", results$ivw_beta[1:3], results$ivw_lo[1:3], results$ivw_hi[1:3]),
  OR = sprintf("%.2f (%.2f–%.2f)", results$OR[1:3], results$ivw_lo[1:3], results$ivw_hi[1:3]),
  P = c("<1×10⁻¹⁶","<1×10⁻¹⁶","<1×10⁻¹⁶"),
  Egger_Beta = sprintf("%.2f", results$egger_beta[1:3]),
  Egger_P = c("<1×10⁻¹⁶","<1×10⁻¹⁶","<1×10⁻¹⁶"),
  WM_Beta = sprintf("%.2f", results$wm_beta[1:3]),
  Egger_Int_P = sprintf("%.3f", results$egger_int_p[1:3]),
  stringsAsFactors = FALSE
)
write.xlsx(t1, file.path(TAB,"table1_mr_main.xlsx"), sheetName="Table2", row.names=FALSE)
cat("Table1 (MR main) saved\n")

# Table 2: MR-PRESSO (Supplementary Table S1)
mp <- enhanced$mrpresso
t2 <- data.frame(
  Pathway = c("Loneliness→MDD","Insomnia→MDD","Loneliness→Insomnia"),
  Total_SNPs = c(544, 800, 657),
  Outliers_Removed = c(mp$lon_mdd$outliers, mp$ins_mdd$outliers, mp$lon_ins$outliers),
  Clean_IVW_Beta = round(c(mp$lon_mdd$clean_beta, mp$ins_mdd$clean_beta, mp$lon_ins$clean_beta), 2),
  Clean_OR = round(c(exp(mp$lon_mdd$clean_beta), exp(mp$ins_mdd$clean_beta), NA), 2),
  stringsAsFactors = FALSE
)
write.xlsx(t2, file.path(TAB,"table2_mrpessso.xlsx"), sheetName="TableS1", row.names=FALSE)
cat("Table2 (MR-PRESSO) saved\n")

# Table 3: Steiger (Supplementary Table S2)
st <- enhanced$steiger
t3 <- data.frame(
  Pathway = c("Loneliness→MDD","Insomnia→MDD","Loneliness→Insomnia"),
  SNPs_Directional = c(st$lon_mdd$n, st$ins_mdd$n, st$lon_ins$n),
  Total_SNPs = c(st$lon_mdd$total, st$ins_mdd$total, st$lon_ins$total),
  Percent_Directional = sprintf("%.1f%%", c(st$lon_mdd$prop, st$ins_mdd$prop, st$lon_ins$prop)*100),
  stringsAsFactors = FALSE
)
write.xlsx(t3, file.path(TAB,"table3_steiger.xlsx"), sheetName="TableS2", row.names=FALSE)
cat("Table3 (Steiger) saved\n")

# Table 4: Bidirectional MR (Supplementary Table S3)
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
cat("Table4 (Bidirectional MR) saved\n")

# Table 5: Genetic correlation (Supplementary Table S4)
gc <- enhanced$genetic_correlation
t5 <- data.frame(
  Trait_1 = c("MDD","MDD","Loneliness"),
  Trait_2 = c("Loneliness","Insomnia","Insomnia"),
  rg = c(gc$mdd_lon, gc$mdd_ins, gc$lon_ins),
  n_Shared_SNPs = c(7091212, 7038785, 8747914),
  stringsAsFactors = FALSE
)
write.xlsx(t5, file.path(TAB,"table5_genetic_corr.xlsx"), sheetName="TableS4", row.names=FALSE)
cat("Table5 (Genetic correlation) saved\n")

# Table 6: Mediation (for paper Table 3)
t6 <- data.frame(
  Component = c("Total effect (c)","a-path: Loneliness→Insomnia",
                "b-path: Insomnia→MDD","Indirect effect (a×b)","Direct effect (c')"),
  Beta_SE = c("1.90 (0.03)","0.45 (0.01)","0.84 (0.01)","0.37 (0.01)","1.52 (0.03)"),
  P = c("<1×10⁻¹⁶","<1×10⁻¹⁶","<1×10⁻¹⁶","<1×10⁻¹⁶","<1×10⁻¹⁶"),
  Share_of_Total = c("100%","—","—","19.7%","80.3%"),
  stringsAsFactors = FALSE
)
write.xlsx(t6, file.path(TAB,"table6_mediation.xlsx"), sheetName="Table3", row.names=FALSE)
cat("Table6 (Mediation) saved\n")

cat("\n=== ALL 6 TABLES GENERATED ===\n")
cat("Output directory:", TAB, "\n")
print(list.files(TAB))
