setwd("D:/MYWORKING//RLearning/GEB2405/tut3")
library(haven)
mcs <- read_dta("mcs.dta")
# View(mcs)
mcs$math <- as.factor(mcs$mths)
mcs$science <- as.factor(mcs$scien)
mcs$sex_bin <- as.factor(mcs$sex)
mcs$best_fact <- as.factor(mcs$best)
library(dplyr)
mcs$math <- recode(mcs$math, "1" = "1. Strongly Disagree", "2" = "2. Disagree", "3" = "3. Agree", "4" = "4. Strongly Agree")
table(mcs$math)
mcs$science <- recode(mcs$science, "1" = "1. Strongly Disagree", "2" = "2. Disagree", "3" = "3. Agree", "4" = "4. Strongly Agree")
table(mcs$science)
mcs$sex_bin <- recode(mcs$sex_bin, "0" = "0.female", "1" = "1.Male")
table(mcs$sex_bin)
mcs$best_fact <- recode(
    mcs$best_fact,
    "1" = "1. Never",
    "2" = "2. Sometimes", "3" = "3. Most Times", "4" = "4. Always"
)
table(mcs$best_fact)

library(labelled)
gfk_cleaned_eul <- read_dta("gfk_cleaned_eul.dta")
# View(gfk_cleaned_eul)
gfk_cleaned_eul$educ2 <- gfk_cleaned_eul$educ
gfk_cleaned_eul$educ2 <- recode(
    gfk_cleaned_eul$educ2,
    "7" = "Did not complete GCSE/CSE/O-levels",
    "6" = "Completed GCSE/CSE/O-levels",
    "5" = "A-levels/Scottish Highers", "4" = "I am still in education", "3" = "Completed post-16 vocational course", "2" = "Undergraduate degree", "1" = "Postgraduate degree"
)
table(gfk_cleaned_eul$educ2)
gfk_cleaned_eul$mmetal_3cat <- gfk_cleaned_eul$mmetal
gfk_cleaned_eul$mmetal_3cat <- as.factor(gfk_cleaned_eul$mmetal_3cat)
