library(crisprScore)
library(readr)
library(dplyr)

guides <- read.table("data/results/tp53_gc_filtered.txt", header=FALSE)
colnames(guides) <- c("sgRNA","GC")

efficiency <- getDoench2016Scores(guides$sgRNA)

guides$Efficiency <- efficiency

guides <- guides %>%
  arrange(desc(Efficiency))

write.csv(guides,
          "data/results/final_ranked_tp53_guides.csv",
          row.names=FALSE)
