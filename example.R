# load packages
library(tidyverse); library(magrittr)

# create data
d <- data.frame(x = c(rep(1, 100),
                      rep(2, 100),
                      rep(3, 100),
                      rep(4, 100),
                      rep(5, 100),
                      rep(6, 100),
                      rep(7, 100),
                      rep(8, 100),
                      rep(9, 100))
)

# calculate standard deviation for subsets of data (less categories)
sd_5 <- sd(d$x[d$x < 6])
sd_6 <- sd(d$x[d$x < 7])
sd_7 <- sd(d$x[d$x < 8])
sd_8 <- sd(d$x[d$x < 9])
sd_9 <- sd(d$x[d$x < 10])

# calculate how much one point difference is in standard units
es_5 <- 1 / sd_5
es_6 <- 1 / sd_6
es_7 <- 1 / sd_7
es_8 <- 1 / sd_8
es_9 <- 1 / sd_9

# transfer to correlation coefficient r
r_5 <- es_5 / sqrt(es_5^2 + 4)
r_6 <- es_6 / sqrt(es_6^2 + 4)
r_7 <- es_7 / sqrt(es_7^2 + 4)
r_8 <- es_8 / sqrt(es_8^2 + 4)
r_9 <- es_9 / sqrt(es_9^2 + 4)

# create table for blog-post
tab <- data.frame("Levels" = c(5:9),
                  "Cohen's d" = c(es_5, es_6, es_7, es_8, es_9),
                  "Pearson's r" = c(r_5, r_6, r_7, r_8, r_9),
                  "Squared r" = c(r_5^2, r_6^2, r_7^2, r_8^2, r_9^2)) %>% 
  mutate_at(vars(-"Levels"), funs(round(., 2)))
        
# save as csv to copy-paste    
write.csv(tab, "tab.csv")
