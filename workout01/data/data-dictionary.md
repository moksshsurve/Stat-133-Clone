---
output:
  html_document: default
  pdf_document: default
---

#2) DATA DICTIONARY
===================

### Variables and Brief Descriptions
----------------------------------

`team_name`

* Data Type: character
* Indicates the name of the NBA team the player is on (in this case, Golden State Warriors).

`game_date`

* Data Type: character
* Indicates the date the game took place in mm/dd/yy format.

`season`

* Data Type: integer
* Indicates the year of the NBA season the game took place in (specific year).

`period`

* Data Type: integer
* Indicates the time period of the game in which the shot was taken. NBA games are divided into 4 periods, so this takes on values 1 to 4.

`minutes_remaining`

* Data Type: integer
* Indicates how many minutes are left in the current period (described by period variable).

`seconds_remaining`

* Data Type: integer
* Indicates how many more seconds in the current period (described by period variable) remain to be played.

`shot_made_flag`

* Data Type: character
* Binary indicator that indicates whether the shot was made (y) or not (n).

`action_type`

* Data Type: character
* Indicates what move/s the player used to set up the shot observed.

`shot_type`

* Data Type: character
* Indicates whether the shot was a two or three point field goal.

`shot_distance`

* Data Type: integer
* Indicates how far away from the basket the shot was taken.
* Units: feet

`opponent`

* Data Type: character
* Indicates what team the player was playing against when the shot was attempted.

`x`

* Data Type: integer
* Indicates where the shot was taken with respect to the court X-coordinate.
* Units: inches

`y`

* Data Type: integer
* Indicates where the shot was taken with respect to the court Y-coordinate.
* Units: inches
