# Load required packages
library(ggplot2)
library(dplyr)
library(readr)
library(gridExtra)

# Read ranked guide data
guides <- read.csv("data/results/final_ranked_tp53_guides.csv")

# Ensure columns exist: sgRNA, GC_Content, Efficiency_Score, OffTarget_Hits, Rank
str(guides)

# -----------------------------
# 1️⃣ GC Content Distribution
# -----------------------------
p1 <- ggplot(guides, aes(x = GC_Content)) +
  geom_histogram(binwidth = 2, fill = "steelblue", color = "black") +
  theme_minimal() +
  labs(
    title = "Distribution of GC Content of TP53 sgRNAs",
    x = "GC Content (%)",
    y = "Number of Guides"
  )

# -----------------------------
# 2️⃣ Efficiency Score Distribution
# -----------------------------
p2 <- ggplot(guides, aes(x = Efficiency_Score)) +
  geom_histogram(binwidth = 0.05, fill = "forestgreen", color = "black") +
  theme_minimal() +
  labs(
    title = "Distribution of Predicted sgRNA Efficiency (Doench 2016)",
    x = "Efficiency Score",
    y = "Number of Guides"
  )

# -----------------------------
# 3️⃣ Off-target Hits Distribution
# -----------------------------
p3 <- ggplot(guides, aes(x = OffTarget_Hits)) +
  geom_bar(fill = "tomato", color = "black") +
  theme_minimal() +
  labs(
    title = "Off-target Hits per sgRNA",
    x = "Number of Off-target Hits",
    y = "Number of Guides"
  )

# -----------------------------
# 4️⃣ Scatter: Efficiency vs Off-targets
# -----------------------------
p4 <- ggplot(guides, aes(x = OffTarget_Hits, y = Efficiency_Score)) +
  geom_point(color = "purple", alpha = 0.6) +
  geom_smooth(method = "loess", color = "black") +
  theme_minimal() +
  labs(
    title = "Efficiency vs Off-targets",
    x = "Off-target Hits",
    y = "Efficiency Score"
  )

# -----------------------------
# Save Plots
# -----------------------------
ggsave("data/results/GC_Content_Distribution.png", p1, width = 6, height = 4)
ggsave("data/results/Efficiency_Distribution.png", p2, width = 6, height = 4)
ggsave("data/results/OffTarget_Distribution.png", p3, width = 6, height = 4)
ggsave("data/results/Efficiency_vs_OffTarget.png", p4, width = 6, height = 4)

# -----------------------------
# Combine plots into one figure
# -----------------------------
combined <- grid.arrange(p1, p2, p3, p4, ncol = 2)
ggsave("data/results/TP53_CRISPR_summary.png", combined, width = 12, height = 8)

# -----------------------------
# Optional: Top 10 guides table
# -----------------------------
top10 <- guides %>% arrange(Rank) %>% head(10)
write.csv(top10, "data/results/top10_tp53_guides.csv", row.names = FALSE)

print("Visualization complete! Plots saved in data/results/")
