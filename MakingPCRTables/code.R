
#load modules
library(ggplot2)
library(ggplot2bdc)
library(plater)
library(platetools)
library(dplyr)

#set working directory in script, more general is better
setwd("~/Documents/GitHub/RandomCode/MakingPCRTables/")

#adding our csv file as a variable
sampletable <- read.csv("makingtables.csv")

#adding a new column, or variable to our existing table
sampletable$nv <- rep(c("a","b"))

#mutate adds new variable
#as.numeric turns it into a new type of thing (number)
#substr splits wells column into positions as new variables
PQplatemap1 <- mutate(sampletable, Row=as.numeric(match(toupper(substr(Wells, 1, 1)), LETTERS)), Column=as.numeric(substr(Wells, 2, 5)))


ggplot(data=PQplatemap1, aes(x=Column, y=Row)) + geom_point(data=expand.grid(seq(1, 12), seq(1, 8)), aes(x=Var1, y=Var2), color="grey90", fill="white", shape=21, size=6) + geom_point(size=8, colour = "lightgreen") +  coord_fixed(ratio=(13/12)/(9/8), xlim = c(0.5, 12.5), ylim=c(0.5, 8.5)) + scale_y_reverse(breaks=seq(1, 8), labels=LETTERS[1:8]) + scale_x_continuous(breaks=seq(1, 12)) + theme_bdc_microtiter() + geom_text(aes(label = Sample), size = 2.1) + labs(title = "Protein Quantification Map 0 hour 1 of 3")

#copy
ggplot(data=PQplatemap1, aes(x=Column, y=Row)) + geom_point(data=expand.grid(seq(1, 12), seq(1, 8)), aes(x=Var1, y=Var2), color="grey90", fill="white", shape=21, size=10) + geom_point(size=10, colour = "lightgreen")+coord_fixed(ratio=(13/12)/(9/8), xlim = c(0.5, 12.5), ylim=c(0.5, 8.5))+ scale_y_reverse(breaks=seq(1, 8), labels=LETTERS[1:8]) + scale_x_continuous(breaks=seq(1, 12))+ theme_bdc_microtiter()+ geom_text(aes(label = id), size = 1.8)
ggsave(file="myplate.pdf")

sampletable$samplevariable <- rep(c(2,4))