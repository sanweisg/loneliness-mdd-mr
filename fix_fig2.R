# =============================================================================
#  修复版 Figure 2 代码（中介模型 + 效应分解）
#  问题原因：direct/indirect 可能来自列表或因子，需要显式 as.numeric()
# =============================================================================

library(ggplot2)
library(dplyr)
library(scales)
library(patchwork)

OUT <- "C:/Users/闫/Desktop/depression_paper_submission/R_figs"

# 确保这些是纯数值（从 JSON/CSV 读入时可能变成字符）
direct_val  <- as.numeric("1.5225")   # 直接效应，从 mr_full_results.csv 算出 c - a*b
indirect_val <- as.numeric("0.3741")  # 间接效应 a*b
c_val       <- as.numeric("1.8966")   # 总效应
prop_med    <- round(indirect_val / c_val * 100, 1)  # 19.7%

cat("direct:", direct_val, "| indirect:", indirect_val, "| total:", c_val, "\n")

# Nature 风格 theme
theme_nature <- function() {
  theme_minimal(base_size = 11, base_family = "Arial") +
    theme(
      text           = element_text(family="Arial", color="#1F2937"),
      plot.title     = element_text(face="bold", size=13, hjust=0, color="#111827"),
      axis.title     = element_text(face="bold", size=11, color="#374151"),
      axis.title.y   = element_text(margin=margin(0,10,0,0)),
      axis.text      = element_text(size=10, color="#374151"),
      axis.ticks     = element_line(color="#D1D5DB", linewidth=0.6),
      panel.grid.major = element_line(color="#F3F4F6", linewidth=0.4),
      panel.grid.minor = element_blank(),
      panel.background = element_rect(fill="white", color=NA),
      plot.background = element_rect(fill="white", color=NA),
      legend.position = "none",
      plot.margin     = margin(12,12,8,12)
    )
}

COL <- c(loneliness="#1F6B9A", insomnia="#CA6B3A", MDD="#3A8C4E",
         direct="#8E44AD", indirect="#E08214", egger="#C0392B",
         wmedian="#2E86AB")

# ============================================================
# (a) 概念图
# ============================================================
p2a <- ggplot() +
  # 三个节点
  geom_point(aes(x=1.5, y=7), shape=21, fill=COL["loneliness"], size=22,
             colour="white", stroke=2) +
  geom_point(aes(x=5.0, y=7), shape=21, fill=COL["indirect"], size=22,
             colour="white", stroke=2) +
  geom_point(aes(x=8.5, y=7), shape=21, fill=COL["MDD"], size=22,
             colour="white", stroke=2) +
  # 节点标签
  geom_text(aes(x=1.5, y=7, label="Loneliness"), colour="white",
            fontface="bold", size=4) +
  geom_text(aes(x=5.0, y=7, label="Insomnia"),   colour="white",
            fontface="bold", size=4) +
  geom_text(aes(x=8.5, y=7, label="MDD"),        colour="white",
            fontface="bold", size=4) +
  # 箭头 a 通路
  geom_segment(aes(x=2.0, y=7, xend=4.4, yend=7),
               arrow=arrow(type="closed", length=unit(0.25,"cm")),
               colour="#374151", linewidth=1.5) +
  # 箭头 b 通路
  geom_segment(aes(x=5.6, y=7, xend=7.9, yend=7),
               arrow=arrow(type="closed", length=unit(0.25,"cm")),
               colour="#374151", linewidth=1.5) +
  # 直接效应弧线（上方弯曲）
  geom_curve(aes(x=1.8, y=7.7, xend=8.2, yend=7.7),
             arrow=arrow(type="closed", length=unit(0.18,"cm")),
             colour=COL["direct"], linewidth=1.5, curvature=0.25) +
  # 直接效应标签
  geom_text(aes(x=5, y=8.2, label=paste0("direct c' = ", round(direct_val,2))),
            colour=COL["direct"], fontface="bold", size=3.5) +
  # a、b 路径标签
  geom_text(aes(x=3.2, y=7.45, label=paste0("a = ", round(0.447,2))),
            size=3) +
  geom_text(aes(x=6.8, y=7.45, label=paste0("b = ", round(0.837,2))),
            size=3) +
  # 间接效应说明框
  geom_text(aes(x=5, y=4.8,
                label=paste0("indirect (a×b) = ", round(indirect_val,3), "\n",
                             prop_med, "% of total effect")),
            size=3.8, fontface="bold", colour=COL["indirect"], hjust=0.5) +
  coord_cartesian(xlim=c(0.3,9.7), ylim=c(3.8,9.2), expand=FALSE) +
  scale_x_continuous(NULL, breaks=NULL) +
  scale_y_continuous(NULL, breaks=NULL) +
  labs(title="(a) Two-step MR mediation model") +
  theme_nature() +
  theme(panel.grid=element_blank(),
        axis.text=element_blank(),
        axis.ticks=element_blank(),
        plot.title=element_text(size=11, face="bold"))

# ============================================================
# (b) 效应分解柱状图
# ============================================================
decomp_df <- data.frame(
  component = factor(c("Direct effect (c')", "Indirect (a×b)"),
                     levels=c("Direct effect (c')","Indirect (a×b)")),
  beta      = c(direct_val, indirect_val),
  prop      = c(round(direct_val / c_val * 100, 1), prop_med),
  color     = c(COL["direct"], COL["indirect"])
)

# 确保都是数值
decomp_df$beta <- as.numeric(decomp_df$beta)
decomp_df$prop <- as.numeric(decomp_df$prop)

cat("Decomposition data:\n")
print(decomp_df)

p2b <- ggplot(decomp_df, aes(x=component, y=beta, fill=color)) +
  geom_col(width=0.6, colour="white", linewidth=0.8) +
  geom_text(aes(label=paste0(round(beta,2), " (", prop, "%)")),
            y=decomp_df$beta/2, colour="white", fontface="bold", size=4) +
  geom_hline(yintercept=c_val, linetype="dashed", colour="#6B7280", linewidth=0.8) +
  geom_text(aes(x="Direct effect (c')", y=c_val*1.08,
                label=paste0("total c = ", round(c_val,2))),
            size=3, colour="#6B7280", fontface="bold") +
  scale_fill_identity(guide="none") +
  labs(x=NULL, y=expression(beta), title="(b) Effect decomposition") +
  theme_nature() +
  theme(axis.text.x=element_text(face="bold", size=9),
        plot.title=element_text(size=11, face="bold"))

# 合并两子图
p2 <- p2a / p2b + plot_layout(heights=c(1.05, 1))

# 保存
ggsave(file.path(OUT, "fig2_mediation.png"), p2, width=9, height=8, dpi=300, bg="white")
cat("Saved: fig2_mediation.png\n")
