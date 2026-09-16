#!/usr/bin/env Rscript
# =============================================================================
#  ??MR??:MR-PRESSO + Steiger + ??MR + ?????
#  ??GPT???????(41205074)????
# =============================================================================

# ???
suppressMessages({
  library(TwoSampleMR)
  library(MRPRESSO)
  library(dplyr)
  library(tidyr)
})

# ????
DIR <- "C:/Users/?/Desktop/depression_paper_submission"
OUT <- file.path(DIR, "enhanced_results")
dir.create(OUT, recursive=TRUE, showWarnings=FALSE)

cat("================================================================\n")
cat("  Enhanced MR Analysis - GPT??????\n")
cat("================================================================\n\n")

# =============================================================================
# STEP 1: ?GWAS???????????(??????)
# =============================================================================
cat("[Step 1] ??GWAS??...\n")

usecols <- c("SNP","A1","A2","BETA","SE","P")
mdd  <- read.csv(file.path(DIR,"mdd_gwas.csv"))[,usecols]
lon  <- read.csv(file.path(DIR,"loneliness_full.csv"))[,usecols]
ins  <- read.csv(file.path(DIR,"insomnia_ukb_a13.csv"))[,usecols]

cat("  MDD:", nrow(mdd), "| Loneliness:", nrow(lon), "| Insomnia:", nrow(ins), "\n")

# ??IV(P<5e-8)
lon_ivs <- lon %>% filter(P < 5e-8) %>% select(SNP,A1,A2,BETA,SE)
ins_ivs <- ins %>% filter(P < 5e-8) %>% select(SNP,A1,A2,BETA,SE)

cat("  Lon IVs:", nrow(lon_ivs), "| Ins IVs:", nrow(ins_ivs), "\n")

# ????
harmonize <- function(exp_ivs, out_full) {
  m <- merge(exp_ivs, out_full[,c("SNP","A1","A2","BETA","SE")],
             by="SNP", suffixes=c("_exp","_out"))
  same  <- (m$A1_exp == m$A1_out) & (m$A2_exp == m$A2_out)
  flip  <- (m$A1_exp == m$A2_out) & (m$A2_exp == m$A1_out)
  m     <- m[same | flip, ]
  mask_flip <- flip[same | flip]
  m$beta_exp <- m$BETA_exp
  m$beta_exp[mask_flip] <- -m$beta_exp[mask_flip]
  pali <- m$A1_exp %in% c("A","T") & m$A2_exp %in% c("T","A") |
          m$A1_exp %in% c("G","C") & m$A2_exp %in% c("C","G")
  m <- m[!pali, ]
  m
}

h_lon_mdd <- harmonize(lon_ivs, mdd)
h_ins_mdd <- harmonize(ins_ivs, mdd)
h_lon_ins <- harmonize(lon_ivs, ins)

cat("  Lon->MDD:", nrow(h_lon_mdd), "| Ins->MDD:", nrow(h_ins_mdd), 
    "| Lon->Ins:", nrow(h_lon_ins), "\n\n")

# =============================================================================
# STEP 2: IVW / Egger / WM ????(??)
# =============================================================================
cat("[Step 2] ??MR??...\n")

mr_ivw <- function(bx, by, sy) {
  w  <- 1/sy^2
  b  <- sum(w*bx*by)/sum(w*bx^2)
  se <- sqrt(1/sum(w*bx^2))
  p  <- 2*(1-pnorm(abs(b/se)))
  list(beta=b, se=se, p=p)
}

mr_egger <- function(bx, by, sy) {
  w <- 1/sy^2
  X <- cbind(bx, rep(1,length(bx)))
  W <- diag(w)
  coef <- as.vector(solve(t(X)%*%W%*%X) %*% t(X)%*%W %*% by)
  beta <- coef[1]; int <- coef[2]
  resid <- by - X %*% coef
  dof <- max(length(by)-2, 1)
  sigma2 <- sum(resid^2)/dof
  cov <- sigma2 * solve(t(X)%*%W%*%X)
  se_b <- sqrt(max(cov[1,1],1e-12)); se_i <- sqrt(max(cov[2,2],1e-12))
  p_b <- 2*(1-pnorm(abs(beta/se_b))); p_i <- 2*(1-pnorm(abs(int/se_i)))
  list(beta=beta, se=se_b, p=p_b, intercept=int, int_se=se_i, int_p=p_i)
}

# Lon->MDD
lon_mdd_ivw   <- mr_ivw(h_lon_mdd$beta_exp, h_lon_mdd$BETA_out, h_lon_mdd$SE_out)
lon_mdd_egger <- mr_egger(h_lon_mdd$beta_exp, h_lon_mdd$BETA_out, h_lon_mdd$SE_out)
cat("  Lon->MDD: IVW=", round(lon_mdd_ivw$beta,4), 
    " Egger_int_p=", round(lon_mdd_egger$int_p,4), "\n")

# Ins->MDD
ins_mdd_ivw   <- mr_ivw(h_ins_mdd$beta_exp, h_ins_mdd$BETA_out, h_ins_mdd$SE_out)
ins_mdd_egger <- mr_egger(h_ins_mdd$beta_exp, h_ins_mdd$BETA_out, h_ins_mdd$SE_out)
cat("  Ins->MDD: IVW=", round(ins_mdd_ivw$beta,4),
    " Egger_int_p=", round(ins_mdd_egger$int_p,4), "\n")

# Lon->Ins
lon_ins_ivw   <- mr_ivw(h_lon_ins$beta_exp, h_lon_ins$BETA_out, h_lon_ins$SE_out)
lon_ins_egger <- mr_egger(h_lon_ins$beta_exp, h_lon_ins$BETA_out, h_lon_ins$SE_out)
cat("  Lon->Ins: IVW=", round(lon_ins_ivw$beta,4),
    " Egger_int_p=", round(lon_ins_egger$int_p,4), "\n\n")

# =============================================================================
# STEP 3: MR-PRESSO(????!)
# =============================================================================
cat("[Step 3] MR-PRESSO...\n")

# MR-PRESSO??data.frame??
make_mrpessso_df <- function(h, exposure_name, outcome_name) {
  data.frame(
    SNP = h$SNP,
    exposure = h$beta_exp,
    outcome = h$BETA_out,
    exposure_se = h$SE_exp,
    outcome_se = h$SE_out
  )
}

# Lon->MDD MR-PRESSO
df_lon_mdd <- make_mrpessso_df(h_lon_mdd, "Loneliness", "MDD")
tryCatch({
  mp_lon_mdd <- mr.presso(Data = df_lon_mdd, Dimension = 2, Number.Datasets = 1000,
                          alpha = 0.05, outlier.table = TRUE)
  cat("  Lon->MDD MR-PRESSO:\n")
  cat("    Global test:", round(mp_lon_mdd$'Global test'$p.value, 6), "\n")
  cat("    Outliers:", ifelse(nrow(mp_lon_mdd$'Outlier table') > 0, 
                           paste(mp_lon_mdd$'Outlier table'$SNP, collapse=", "), "0"), "\n")
  if(nrow(mp_lon_mdd$'Outlier table') > 0) {
    # ????SNP?????IVW
    outliers <- mp_lon_mdd$'Outlier table'$SNP
    h_clean <- h_lon_mdd[!h_lon_mdd$SNP %in% outliers, ]
    mp_ivw_clean <- mr_ivw(h_clean$beta_exp, h_clean$BETA_out, h_clean$SE_out)
    cat("    After removing", nrow(mp_lon_mdd$'Outlier table'), "outliers:\n")
    cat("    New IVW beta:", round(mp_ivw_clean$beta, 4), 
        "(95% CI:", round(mp_ivw_clean$beta-1.96*mp_ivw_clean$se, 2), 
        ",", round(mp_ivw_clean$beta+1.96*mp_ivw_clean$se, 2), ")\n")
    cat("    New OR:", round(exp(mp_ivw_clean$beta), 2), "\n")
  }
}, error = function(e) {
  cat("  MR-PRESSO Lon->MDD error:", e$message, "\n")
})

# Ins->MDD MR-PRESSO
df_ins_mdd <- make_mrpessso_df(h_ins_mdd, "Insomnia", "MDD")
tryCatch({
  mp_ins_mdd <- mr.presso(Data = df_ins_mdd, Dimension = 2, Number.Datasets = 1000,
                          alpha = 0.05, outlier.table = TRUE)
  cat("  Ins->MDD MR-PRESSO:\n")
  cat("    Global test:", round(mp_ins_mdd$'Global test'$p.value, 6), "\n")
  cat("    Outliers:", ifelse(nrow(mp_ins_mdd$'Outlier table') > 0, 
                           paste(mp_ins_mdd$'Outlier table'$SNP, collapse=", "), "0"), "\n")
  if(nrow(mp_ins_mdd$'Outlier table') > 0) {
    outliers <- mp_ins_mdd$'Outlier table'$SNP
    h_clean <- h_ins_mdd[!h_ins_mdd$SNP %in% outliers, ]
    mp_ivw_clean <- mr_ivw(h_clean$beta_exp, h_clean$BETA_out, h_clean$SE_out)
    cat("    After removing", nrow(mp_ins_mdd$'Outlier table'), "outliers:\n")
    cat("    New IVW beta:", round(mp_ivw_clean$beta, 4),
        "(95% CI:", round(mp_ivw_clean$beta-1.96*mp_ivw_clean$se, 2),
        ",", round(mp_ivw_clean$beta+1.96*mp_ivw_clean$se, 2), ")\n")
    cat("    New OR:", round(exp(mp_ivw_clean$beta), 2), "\n")
  }
}, error = function(e) {
  cat("  MR-PRESSO Ins->MDD error:", e$message, "\n")
})

# Lon->Ins MR-PRESSO
df_lon_ins <- make_mrpessso_df(h_lon_ins, "Loneliness", "Insomnia")
tryCatch({
  mp_lon_ins <- mr.presso(Data = df_lon_ins, Dimension = 2, Number.Datasets = 1000,
                          alpha = 0.05, outlier.table = TRUE)
  cat("  Lon->Ins MR-PRESSO:\n")
  cat("    Global test:", round(mp_lon_ins$'Global test'$p.value, 6), "\n")
  cat("    Outliers:", ifelse(nrow(mp_lon_ins$'Outlier table') > 0, 
                           paste(mp_lon_ins$'Outlier table'$SNP, collapse=", "), "0"), "\n")
}, error = function(e) {
  cat("  MR-PRESSO Lon->Ins error:", e$message, "\n")
})

cat("\n")

# =============================================================================
# STEP 4: Steiger?????
# =============================================================================
cat("[Step 4] Steiger?????...\n")

steiger_test <- function(h) {
  # R² of SNP on exposure vs outcome
  r2_exp <- h$beta_exp^2 / (h$beta_exp^2 + h$SE_exp^2)
  r2_out <- h$BETA_out^2 / (h$BETA_out^2 + h$SE_out^2)
  # Proportion with higher R2 on exposure
  n_direction <- sum(r2_exp > r2_out)
  prop_direction <- n_direction / length(r2_exp)
  # Binomial test
  p_value <- 2 * min(binom.test(n_direction, length(r2_exp), prop_direction)$p.value, 1-binom.test(n_direction, length(r2_exp), prop_direction)$p.value)
  list(prop_direction = prop_direction, n_direction = n_direction, 
       total = length(r2_exp), p_value = p_value)
}

st_lon_mdd <- steiger_test(h_lon_mdd)
st_ins_mdd <- steiger_test(h_ins_mdd)
st_lon_ins <- steiger_test(h_lon_ins)

cat("  Lon->MDD: ????SNP =", st_lon_mdd$n_direction, 
    "/", st_lon_mdd$total, " (", round(st_lon_mdd$prop_direction*100,1), "%), p =", 
    format.pval(st_lon_mdd$p_value, digits=3), "\n")
cat("  Ins->MDD: ????SNP =", st_ins_mdd$n_direction,
    "/", st_ins_mdd$total, " (", round(st_ins_mdd$prop_direction*100,1), "%), p =",
    format.pval(st_ins_mdd$p_value, digits=3), "\n")
cat("  Lon->Ins: ????SNP =", st_lon_ins$n_direction,
    "/", st_lon_ins$total, " (", round(st_lon_ins$prop_direction*100,1), "%), p =",
    format.pval(st_lon_ins$p_value, digits=3), "\n\n")

# =============================================================================
# STEP 5: ??MR(MDD?Loneliness / MDD?Insomnia)
# =============================================================================
cat("[Step 5] ??MR...\n")

# ??:?MDD?SNP????,Loneliness/Insomnia????
# ???MDD GWAS????SNP
mdd_ivs <- mdd %>% filter(P < 5e-8) %>% select(SNP,A1,A2,BETA,SE)
cat("  MDD??IVs:", nrow(mdd_ivs), "\n")

# MDD?Loneliness
h_mdd_lon <- harmonize(mdd_ivs, lon)
cat("  MDD?Loneliness matched:", nrow(h_mdd_lon), "SNPs\n")
if(nrow(h_mdd_lon) > 10) {
  mdd_lon_ivw <- mr_ivw(h_mdd_lon$beta_exp, h_mdd_lon$BETA_out, h_mdd_lon$SE_out)
  cat("  MDD?Loneliness IVW ß =", round(mdd_lon_ivw$beta, 4),
      "(", round(exp(mdd_lon_ivw$beta), 2), "), P =", format.pval(mdd_lon_ivw$p, digits=3), "\n")
} else {
  cat("  MDD?Loneliness: ??????\n")
}

# MDD?Insomnia
h_mdd_ins <- harmonize(mdd_ivs, ins)
cat("  MDD?Insomnia matched:", nrow(h_mdd_ins), "SNPs\n")
if(nrow(h_mdd_ins) > 10) {
  mdd_ins_ivw <- mr_ivw(h_mdd_ins$beta_exp, h_mdd_ins$BETA_out, h_mdd_ins$SE_out)
  cat("  MDD?Insomnia IVW ß =", round(mdd_ins_ivw$beta, 4),
      "(", round(exp(mdd_ins_ivw$beta), 2), "), P =", format.pval(mdd_ins_ivw$p, digits=3), "\n")
} else {
  cat("  MDD?Insomnia: ??????\n")
}

cat("\n")

# =============================================================================
# STEP 6: ?????(???:??SNP??)
# =============================================================================
cat("[Step 6] ???????...\n")

# ????SNP??
shared_mdd_lon <- length(intersect(unique(mdd$SNP), unique(lon$SNP)))
shared_mdd_ins <- length(intersect(unique(mdd$SNP), unique(ins$SNP)))
shared_lon_ins <- length(intersect(unique(lon$SNP), unique(ins$SNP)))
cat("  MDDnLoneliness??SNP:", shared_mdd_lon, "\n")
cat("  MDDnInsomnia??SNP:", shared_mdd_ins, "\n")
cat("  LonelinessnInsomnia??SNP:", shared_lon_ins, "\n\n")

# ??LD Score??????????(???)
# ?GWAS?Z????rg
calc_rg <- function(gwas1, gwas2, snp_col="SNP") {
  m <- merge(gwas1[,c(snp_col,"BETA","SE","P")],
             gwas2[,c(snp_col,"BETA","SE","P")],
             by=snp_col)
  z1 <- m$BETA.x / m$SE.x
  z2 <- m$BETA.y / m$SE.y
  # rg ˜ mean(z1*z2) / sqrt(mean(z1^2)*mean(z2^2))
  rg <- mean(z1*z2) / sqrt(mean(z1^2) * mean(z2^2))
  list(rg=rg, n=nrow(m))
}

rg_mdd_lon <- calc_rg(mdd, lon)
rg_mdd_ins <- calc_rg(mdd, ins)
rg_lon_ins <- calc_rg(lon, ins)

cat("  rg(MDD, Loneliness) ˜", round(rg_mdd_lon$rg, 3), 
    " (n=", rg_mdd_lon$n, ")\n")
cat("  rg(MDD, Insomnia)  ˜", round(rg_mdd_ins$rg, 3),
    " (n=", rg_mdd_ins$n, ")\n")
cat("  rg(Loneliness, Insomnia) ˜", round(rg_lon_ins$rg, 3),
    " (n=", rg_lon_ins$n, ")\n\n")

# =============================================================================
# STEP 7: ????????????(MR-PRESSO???)
# =============================================================================
cat("[Step 7] ???????...\n")

# ????IVW?(????,??????)
a_val <- lon_ins_ivw$beta
b_val <- ins_mdd_ivw$beta
c_val <- lon_mdd_ivw$beta
indirect_val <- a_val * b_val
direct_val <- c_val - indirect_val
prop_med <- indirect_val / c_val * 100

cat("  Total effect (c):", round(c_val, 4), "\n")
cat("  a-path (Lon?Ins):", round(a_val, 4), "\n")
cat("  b-path (Ins?MDD):", round(b_val, 4), "\n")
cat("  Indirect (a×b):", round(indirect_val, 4), "\n")
cat("  Direct (c'): ", round(direct_val, 4), "\n")
cat("  Mediation %:", round(prop_med, 1), "%\n\n")

# =============================================================================
# STEP 8: ?????
# =============================================================================
cat("[Step 8] ??????...\n")

results <- list(
  original_ivw = list(
    lon_mdd = c(beta=lon_mdd_ivw$beta, se=lon_mdd_ivw$se, p=lon_mdd_ivw$p, OR=exp(lon_mdd_ivw$beta)),
    ins_mdd = c(beta=ins_mdd_ivw$beta, se=ins_mdd_ivw$se, p=ins_mdd_ivw$p, OR=exp(ins_mdd_ivw$beta)),
    lon_ins = c(beta=lon_ins_ivw$beta, se=lon_ins_ivw$se, p=lon_ins_ivw$p)
  ),
  egger_intercept = list(
    lon_mdd = lon_mdd_egger$int_p,
    ins_mdd = ins_mdd_egger$int_p,
    lon_ins = lon_ins_egger$int_p
  ),
  steiger = list(
    lon_mdd = st_lon_mdd,
    ins_mdd = st_ins_mdd,
    lon_ins = st_lon_ins
  ),
  genetic_correlation = list(
    mdd_lon = rg_mdd_lon$rg,
    mdd_ins = rg_mdd_ins$rg,
    lon_ins = rg_lon_ins$rg
  ),
  mediation = list(
    a=a_val, b=b_val, c=c_val,
    indirect=indirect_val, direct=direct_val, prop_med=prop_med
  ),
  bidirectional = list(
    mdd_lon_n = if(exists("mdd_lon_ivw")) nrow(h_mdd_lon) else 0,
    mdd_ins_n = if(exists("mdd_ins_ivw")) nrow(h_mdd_ins) else 0
  )
)

# ??JSON
library(jsonlite)
write_json(results, file.path(OUT, "enhanced_mr_results.json"), auto_unbox=TRUE)

# ??CSV??
summary_df <- data.frame(
  pathway = c("Loneliness->MDD", "Insomnia->MDD", "Loneliness->Insomnia"),
  ivw_beta = c(lon_mdd_ivw$beta, ins_mdd_ivw$beta, lon_ins_ivw$beta),
  ivw_or = c(exp(lon_mdd_ivw$beta), exp(ins_mdd_ivw$beta), NA),
  egger_int_p = c(lon_mdd_egger$int_p, ins_mdd_egger$int_p, lon_ins_egger$int_p),
  steiger_prop = c(st_lon_mdd$prop_direction, st_ins_mdd$prop_direction, st_lon_ins$prop_direction),
  n_snps = c(nrow(h_lon_mdd), nrow(h_ins_mdd), nrow(h_lon_ins)),
  stringsAsFactors = FALSE
)
write.csv(summary_df, file.path(OUT, "enhanced_summary.csv"), row.names=FALSE)

cat("\n================================================================\n")
cat("  ??????!\n")
cat("  ????:", OUT, "\n")
cat("  ??: enhanced_mr_results.json, enhanced_summary.csv\n")
cat("================================================================\n")
