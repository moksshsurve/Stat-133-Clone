### ---------------------------
#Title: Data Preparation
#Description: Data importing and preparation for visualisation & grouping for analysis
#Inputs: csv files with scoring data for Iguodala, Green, Durant, Thompson & Curry
#Outputs: Modified Data frames and combined tables ready for visualisation purposes
### ---------------------------

#reading files into data frames
setwd("/Users/moksshsurve/Desktop/Documents/Berkeley/Semesters/Sophomore/SPRING\ 19/Stat\ 133/hw-stat133/workout01/data")
iguodala = read.csv("andre-iguodala.csv", stringsAsFactors = FALSE)
green = read.csv("draymond-green.csv", stringsAsFactors = FALSE)
durant = read.csv("kevin-durant.csv", stringsAsFactors = FALSE)
thompson = read.csv("klay-thompson.csv", stringsAsFactors = FALSE)
curry <- read.csv("stephen-curry.csv", stringsAsFactors = FALSE)
combined_data <- read.csv("shots-data.csv", stringsAsFactors = FALSE)


#adding column 'name'
iguodala$name <- 'Andre Iguodala'
green$name <- 'Draymond Green'
durant$name <- 'Kevin Durant'
thompson$name <- 'Klay Thompson'
curry$name <- 'Stephen Curry'


#adding more descriptive shot_made_flag values
iguodala$shot_made_flag[iguodala$shot_made_flag == 'n'] <- 'shot_no'
iguodala$shot_made_flag[iguodala$shot_made_flag == 'y'] <- 'shot_yes'

green$shot_made_flag[green$shot_made_flag == 'n'] <- 'shot_no'
green$shot_made_flag[green$shot_made_flag == 'y'] <- 'shot_yes'

durant$shot_made_flag[durant$shot_made_flag == 'n'] <- 'shot_no'
durant$shot_made_flag[durant$shot_made_flag == 'y'] <- 'shot_yes'

thompson$shot_made_flag[thompson$shot_made_flag == 'n'] <- 'shot_no'
thompson$shot_made_flag[thompson$shot_made_flag == 'y'] <- 'shot_yes'

curry$shot_made_flag[curry$shot_made_flag == 'n'] <- 'shot_no'
curry$shot_made_flag[curry$shot_made_flag == 'y'] <- 'shot_yes'


#adding column 'minute'
iguodala$minute <- (iguodala$period*12) - iguodala$minutes_remaining
green$minute <- (green$period*12) - green$minutes_remaining
durant$minute <- (durant$period*12) - durant$minutes_remaining
thompson$minute <- (thompson$period*12) - thompson$minutes_remaining
curry$minute <- (curry$period*12) - curry$minutes_remaining


#sinking summary for each player
setwd("../output")

sink("andre-iguodala-summary.txt")
summary(iguodala)
sink()

sink("graymond-green-summary.txt")
summary(green)
sink()

sink("kevin-durant-summary.txt")
summary(durant)
sink()

sink("klay-thompson-summary.txt")
summary(thompson)
sink()

sink("stephen-curry-summary.txt")
summary(curry)
sink()


#stacking up the tables into 1
setwd("../data")
stacked <- rbind(iguodala, green, durant, thompson, curry)
write.csv(stacked, file = 'shots-data.csv')


#sinking summary of stacked table
setwd("../output")

sink("shots-data-summary.txt")
summary(stacked)
sink()

