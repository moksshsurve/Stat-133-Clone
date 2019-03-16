### ---------------------------
#Title: Shots Charts Script
#Description: Generate Visuals for the 5 GSW Players' Shots
#Inputs: GSW Shot Data (combined and for individual players), court image
#Outputs: PDFs containing shot chart visuals for GSW players
### ---------------------------


#4) Shot Charts 
library(jpeg)
library(grid)
library(ggplot2)

setwd("/Users/moksshsurve/Desktop/Documents/Berkeley/Semesters/Sophomore/SPRING\ 19/Stat\ 133/hw-stat133/workout01/data")
iguodala = read.csv("andre-iguodala.csv", stringsAsFactors = FALSE)
green = read.csv("draymond-green.csv", stringsAsFactors = FALSE)
durant = read.csv("kevin-durant.csv", stringsAsFactors = FALSE)
thompson = read.csv("klay-thompson.csv", stringsAsFactors = FALSE)
curry <- read.csv("stephen-curry.csv", stringsAsFactors = FALSE)

setwd("/Users/moksshsurve/Desktop/Documents/Berkeley/Semesters/Sophomore/SPRING\ 19/Stat\ 133/hw-stat133/workout01/images")
court_file <- "nba-court.jpg"
court_image <- rasterGrob( readJPEG(court_file), width = unit(1, "npc"), height = unit(1, "npc"))

#4.1) Shot charts for each player
iguodala_shot_chart <- ggplot(data = iguodala) + annotation_custom(court_image, -250, 250, -50, 420) + geom_point(aes(x=x, y=y, color=shot_made_flag)) + ylim(-50, 420) + ggtitle("Shot Chart: Andre Iguodala (2016 Season)") + theme_minimal()
green_shot_chart <- ggplot(data = green) + annotation_custom(court_image, -250, 250, -50, 420) + geom_point(aes(x=x, y=y, color=shot_made_flag)) + ylim(-50, 420) + ggtitle("Shot Chart: Draymond Green (2016 Season)") + theme_minimal()
durant_shot_chart <- ggplot(data = durant) + annotation_custom(court_image, -250, 250, -50, 420) + geom_point(aes(x=x, y=y, color=shot_made_flag)) + ylim(-50, 420) + ggtitle("Shot Chart: Kevin Durant (2016 Season)") + theme_minimal()
thompson_shot_chart <- ggplot(data = thompson) + annotation_custom(court_image, -250, 250, -50, 420) + geom_point(aes(x=x, y=y, color =shot_made_flag)) + ylim(-50, 420) + ggtitle("Shot Chart: Klay Thompson (2016 Season)") + theme_minimal()
curry_shot_chart <- ggplot(data = curry) + annotation_custom(court_image, -250, 250, -50, 420) + geom_point(aes(x=x, y=y, color=shot_made_flag)) + ylim(-50, 420) + ggtitle("Shot Chart: Steph Curry (2016 Season)") + theme_minimal()

ggsave("andre-iguodala-shot-chart.pdf", plot = iguodala_shot_chart, width = 6.5, height = 5)
ggsave("draymond-green-shot-chart.pdf", plot = green_shot_chart, width = 6.5, height = 5)
ggsave("kevin-durant-shot-chart.pdf", plot = durant_shot_chart, width = 6.5, height = 5)
ggsave("klay-thompson-shot-chart.pdf", plot = thompson_shot_chart, width = 6.5, height = 5)
ggsave("stephen-curry-shot-chart.pdf", plot = curry_shot_chart, width = 6.5, height = 5)

#4.2) Facetted Shot chart
gsw_shots_chart = ggplot(data = combined_data) + annotation_custom(court_image, -250, 250, -50, 420) + geom_point(aes(x=x, y=y, color=shot_made_flag)) + ylim(-50, 420) + ggtitle('Shot Charts: GSW (2016 season)') + theme_minimal() + facet_wrap(~ name, ncol = 3)
ggsave("gsw_shots_chart.pdf", width = 8 , height = 7)
ggsave("gsw_shots_chart.png", width = 8, height = 7)

