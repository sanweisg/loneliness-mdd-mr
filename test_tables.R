library(openxlsx); library(ggplot2); library(dplyr); library(jsonlite); library(patchwork); library(scales)
DIR <- "C:/Users/闫/Desktop/depression_paper_submission"
TAB <- file.path(DIR, "R_tables")
dir.create(TAB, recursive=TRUE, showWarnings=FALSE)

results <- read.csv(file.path(DIR, "mr_full_results.csv"))
enhanced <- fromJSON(file.path(DIR, "enhanced_mr_results.json"))

cat("Results loaded. Testing table generation...\n")

# Table 1: MR main results
t1 <- data.frame(
  Pathway = c("Loneliness->MDD","Insomnia->MDD","Loneliness->Insomnia"),
  Instruments = c(544, 800, 657),
  Mean_F = c(34.4, 34.3, 33.9),
  IVW_Beta = sprintf("%.2f (%.2f-%.2f)", results$ivw_beta, results$ivw_lo, results$ivw_hi),
  OR = sprintf("%.2f (%.2f-%.2f)", results$OR, results$ivw_lo, results$ivw_hi),
  P = c("<1x10^-16","<1x10^-16","<1x10^-16"),
  Egger_Beta = sprintf("%.2f (%.2f-%.2f)", results$egger_beta,
                       results$egger_beta-1.96*results$egger_se,
                       results$egger_beta+1.96*results$egger_se),
  Egger_P = c("<1x10^-16","<1x10^-16","<1x10^-16"),
  WM_Beta = sprintf("%.2f (%.2f-%.2f)", results$wm_beta,
                    results$wm_beta-1.96*results$wm_se,
                    results$wm_beta+1.96*results$wm_se),
  Egger_Int_P = sprintf("%.3f", results$egger_int_p),
  stringsAsFactors = FALSE
)
write.xlsx(t1, file.path(TAB,"table1_mr_main.xlsx"), sheetName="Table2", row.names=FALSE)
cat("Table1 saved\n")

# Table 2: MR-PRESSO
t2 <- data.frame(
  Pathway = c("Loneliness->MDD","Insomnia->MDD","Loneliness->Insomnia"),
  Total_SNPs = c(544, 800, 657),
  Outliers_Removed = c(enhanced$mrpresso$lon_mdd$outliers,
                       enhanced$mrpresso$ins_mdd$outliers,
                       enhanced$mrpresso$lon_ins$outliers),
  Clean_IVW_Beta = round(c(enhanced$mrpresso$lon_mdd$clean_beta,
                            enhanced$mrpresso$ins_mdd$clean_beta,
                            enhanced$mrpresso$lon_ins$clean_beta), 2),
  Clean_OR = round(c(exp(enhanced$mrpresso$lon_mdd$clean_beta),
                     exp(enhanced$mrpresso$ins_mdd$clean_beta), NA), 2),
  stringsAsFactors = FALSE
)
write.xlsx(t2, file.path(TAB,"table2_mrpessso.xlsx"), sheetName="TableS1", row.names=FALSE)
cat("Table2 saved\n")

# Table 3: Steiger
t3 <- data.frame(
  Pathway = c("Loneliness->MDD","Insomnia->MDD","Loneliness->Insomnia"),
  SNPs_Directional = c(enhanced$steiger$lon_mdd$n,
                       enhanced$steiger$ins_mdd$n,
                       enhanced$steiger$lon_ins$n),
  Total_SNPs = c(enhanced$steiger$lon_mdd$total,
                 enhanced$steiger$ins_mdd$total,
                 enhanced$steiger$lon_ins$total),
  Percent_Directional = sprintf("%.1f%%", 
     c(enhanced$steiger$lon_mdd$prop*100,
       enhanced$steiger$ins_mdd$prop*100,
       enhanced$steiger$lon_ins$prop*100)),
  stringsAsFactors = FALSE
)
write.xlsx(t3, file.path(TAB,"table3_steiger.xlsx"), sheetName="TableS2", row.names=FALSE)
cat("Table3 saved\n")

# Table 4: Bidirectional
t4 <- data.frame(
  Direction = c("Loneliness->MDD","Insomnia->MDD","MDD->Loneliness","MDD->Insomnia"),
  Instruments = c(544, 800, 12849, 12837),
  Beta = c("1.90","0.84","0.09","0.15"),
  SE = c("0.03","0.01","---","---"),
  OR = c("6.66","2.31","1.10","1.17"),
  P_Value = c("<1x10^-16","<1x10^-16","<0.001","<0.001"),
  stringsAsFactors = FALSE
)
write.xlsx(t4, file.path(TAB,"table4_bidirectional.xlsx"), sheetName="TableS3", row.names=FALSE)
cat("Table4 saved\n")

# Table 5: Genetic correlation
t5 <- data.frame(
  Trait_1 = c("MDD","MDD","Loneliness"),
  Trait_2 = c("Loneliness","Insomnia","Insomnia"),
  rg = c(enhanced$genetic_correlation$mdd_lon,
         enhanced$genetic_correlation$mdd_ins,
         enhanced$genetic_correlation$lon_ins),
  n_Shared_SNPs = c(7091212, 7038785, 8747914),
  stringsAsFactors = FALSE
)
write.xlsx(t5, file.path(TAB,"table5_genetic_corr.xlsx"), sheetName="TableS4", row.names=FALSE)
cat("Table5 saved\n")

# Table 6: Mediation
t6 <- data.frame(
  Component = c("Total effect (c)","a-path: Loneliness->Insomnia",
                "b-path: Insomnia->MDD","Indirect effect (a x b)","Direct effect (c')"),
  Beta_SE = c("1.90 (0.03)","0.45 (0.01)","0.84 (0.01)","0.37 (0.01)","1.52 (0.03)"),
  P = c("<1x10^-16","<1x10^-16","<1x10^-16","<1x10^-16","<1x10^-16"),
  Share_of_Total = c("100%","---","---","19.7%","80.3%"),
  stringsAsFactors = FALSE
)
write.xlsx(t6, file.path(TAB,"table6_mediation.xlsx"), sheetName="Table3", row.names=FALSE)
cat("Table6 saved\n")

cat("\n=== ALL TABLES GENERATED ===\n")
cat("Output directory:", TAB, "\n")
print(list.files(TAB))
