#Tutorial 3
library(dplyr)


#Exercise 1
#each variable can be transformed as factor one by one
mcs$math<-as.factor(mcs$mths)
mcs$science<-as.factor(mcs$scien)
mcs$sex_bin<-as.factor(mcs$sex)
mcs$best_fact<-as.factor(mcs$best)
#Change the names of the levels using recode
mcs$math<-recode(mcs$math,"1"="1. Strongly Disagree","2"="2. Disagree","3"="3. Agree","4"="4. Strongly Agree")
table(mcs$math)
mcs$science<-recode(mcs$science,"1"="1. Strongly Disagree","2"="2. Disagree","3"="3. Agree","4"="4. Strongly Agree")
table(mcs$science)
mcs$sex_bin<-recode(mcs$sex_bin,"0"="0.female","1"="1.Male")
table(mcs$sex_bin)
mcs$best_fact<-recode(mcs$best_fact,"1"="1. Never", "2"="2. Sometimes","3"="3. Most Times","4"="4. Always")
table(mcs$best_fact)
#Exercise 3 question 2, recode the variables according to the codebook
gfk_cleaned_eul$educ2<-gfk_cleaned_eul$educ
gfk_cleaned_eul$educ2<-recode(gfk_cleaned_eul$educ2,"7"="Did not complete GCSE/CSE/O-levels","6"="Completed GCSE/CSE/O-levels","5"="A-levels/Scottish Highers","4"="I am still in education","3"="Completed post-16 vocational course","2"="Undergraduate degree","1"="Postgraduate degree")
table(gfk_cleaned_eul$educ2)


#Exercise 3 question 3, 
##First solution
#Creat the new variable
gfk_cleaned_eul$mmetal_3cat<-gfk_cleaned_eul$mmetal
#convert it as factor in order to drop the pre-existing level (only because we have a stata file)
gfk_cleaned_eul$mmetal_3cat<-as.factor(gfk_cleaned_eul$mmetal_3cat)
#verify that the factor haven't been modified
summary(gfk_cleaned_eul$mmetal_3cat)
#recode the variable
gfk_cleaned_eul$mmetal_3cat<-recode(gfk_cleaned_eul$mmetal_3cat,'1'="Like or like a lot",'2'="Like or like a lot",'3'="neither",'4'="dislike or dislike a lot",'5'="dislike or dislike a lot")
#make sure that you did not do any mistake by comparing the original variable with the new one
table(gfk_cleaned_eul$mmetal_3cat,gfk_cleaned_eul$mmetal)

##SEcond solution
#download and install the package labelled
install.packages("labelled")
library("labelled")
#create the new variable
gfk_cleaned_eul$mmetal_3cat<-gfk_cleaned_eul$mmetal
#recode the variable as follow using dplyr::recode instead of recode
gfk_cleaned_eul$mmetal_3cat<-dplyr::recode(gfk_cleaned_eul$mmetal_3cat,'1'="Like or like a lot",'2'="Like or like a lot",'3'="neither",'4'="dislike or dislike a lot",'5'="dislike or dislike a lot")

#Exercise 3 Question 4
#many step are necessary for this question
#Step 1 creat the variabale year of birth (date of the survey - age of respondent at the time of the survey)
gfk_cleaned_eul$year_birth<-2014-gfk_cleaned_eul$age
#step 2 create a new categorical variable
gfk_cleaned_eul$year_birth_cat<-gfk_cleaned_eul$year_birth
#recode the categories using the cut function
#run describe to know the min and max value
describe(gfk_cleaned_eul$year_birth_cat)
# for the cut function cut(object, breaks=c(min, val1, val2,valn, max))
gfk_cleaned_eul$year_birth_cat<-cut(gfk_cleaned_eul$year_birth_cat,breaks = c(1929,1945,1964,1984,1996,1997))
table(gfk_cleaned_eul$year_birth_cat)
gfk_cleaned_eul$year_birth_cat<-recode(gfk_cleaned_eul$year_birth_cat,"(1929,1945]"="Born before 1945","(1945,1964]"="Boomers","(1964,1984]"="GenerationX","(1984,1996]"="Millenium","(1996,1997]"="GenerationZ")
table(gfk_cleaned_eul$year_birth_cat)

#Exercise 4
#Import from the menu
table(gfk_excel_version$hhincome)
gfk_excel_version$hhincome<-na_if(gfk_excel_version$hhincome,"Refused")
gfk_excel_version$hhincome<-factor(gfk_excel_version$hhincome, levels=c("Over 200,000","150,000 - 199,999","100,000 - 149,999","95,000 - 99,999","90,000 - 94,999","85,000 - 89,999","80,000 - 84,999","75,000 - 79,999","70,000 - 74,999","65,000 - 69,999","60,000 - 64,999","55,000 - 59,999","50,000 - 54,999","45,000 - 49,999","40,000 - 44,999","35,000 - 39,999","30,000 - 34,999","25 000 - 29 999","20,000 - 24,999","15,000 - 19,999","10,000 - 14,999","5,000 - 10,000","Under 5,000"))
nlevels(gfk_excel_version$hhincome)