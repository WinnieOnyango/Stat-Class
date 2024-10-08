# Title: R bootcamp 2 Assignment
#Onyango 10/07/2024

#loading data into r from github account
setwd("D:/ent_535_r/Stat_Class_main")
library(readr)
FieldData <- read.csv("D:/ent_535_r/Stat_Class_main/FieldData.csv")
View("FieldData")
print("FieldData")
# Name "FieldData" type "character" Value "FiledData"
class(FieldData$color)
#character
class(FieldData)
#data.frame

#Types of data
str(FieldData$species)
#character vector [1:4] "butterfly" "beetle1" "beetle2" "moth"
str(FieldData$weight)
# integer [1:4] 3 5 10 1
str(FieldData$color)
#character [1:4] "purple" "gold" "aquamarine" "pink"
#FieldData has 4 observations(moth,butterfly,beetle1, beetle2) of 3 variables (species, color, weight) and this is shown under environment section.

is.character(FieldData$weight)
#FALSE
as.character(FieldData$weight)
#[1] "3"  "5"  "10" "1" 

#Part 2
#load the file data_1.xlsx
setwd("D:/ent_535_r/Stat-Class")
My_data <- read.csv("D:/ent_535_r/Stat-Class/data_1.csv")
print(My_data)
# Species length..in.mm. smells.bad...yes.no.
#1 butterfly           11.5                   no
#2  stinkbug            7.0                  yes
#3   ladybug            3.0                  yes

#load milkweed_defence into r
setwd("D:/ent_535_r/Stat-Class-main")
milkweed.data <- read.csv("milkweed_defense.csv")
print(milkweed.data)
#Milkweed_species Trichomes Latex Toxin_amt Caterpillar_mass
#1  Ascelpias amplexicaulis       1.7   1.5       1.4              5.4
#2    Asclepias boliviensis       1.5   0.4       2.1              7.7
#3    Asclepias californica      44.3   3.5       4.9              3.4
#4        Asclepias candida       0.1   0.6       4.0              9.1
#5     Asclepias cordifolia       2.5   1.6       3.5              7.0
#6      Asclepias eriocarpa      31.3   1.3       4.4              6.1
#7          Asclepias erosa      12.2   3.0       2.3              7.5
#8         Asclepias hallii       1.5   0.6       1.6             10.1
#9       Asclepias hirtella       0.2   0.5       3.3              7.5
#10    Asclepias humistrata       0.2   0.6       5.2              9.0
#11     Asclepias incarnata       2.9   0.3       0.4              9.2
#12    Asclepias lanceolata       0.2   0.2       0.4              8.6
#13      Asclepias lemmonii       4.7   4.3       3.2              1.2
#14         Asclepias nivea       3.1   0.0       4.4             12.9
#15       Asclepias obovata      32.8   0.8       0.6              7.7
#16        Asclepias pumila       0.4   0.4       0.5              7.4
#17  Asclepias purpurascens       7.2   0.3       0.3             10.6
#18     Asclepias solanoana      20.7   1.4       2.7             11.2
#19      Asclepias speciosa       6.9   1.6       1.1              8.6
#20   Asclepias sullivantii       1.7   1.7       2.4              8.2
#21       Asclepias syriaca       9.5   0.4       1.5              9.8
#22      Asclepias tuberosa       6.4   0.2       0.1              7.6
#23  Asclepias verticillata       0.4   0.1       0.1              7.2
#24       Asclepias viridis 
View((milkweed.data))

# Create a line plot
# Defining data
Trichomes <- c(1.7, 0.2) #examples of data from trichomes
Caterpillar_mass <- c(12.9, 3.4)  # Example data for caterpillar mass

#C. Now plot using the defined variables
plot(milkweed.data$Trichomes, milkweed.data$Caterpillar_mass, type = "l", main = "Line Plot", xlab = "trichomes", ylab = "caterpillar_mass", col = "black")
#does not look presentable at all let me try ggplot
#ggplot
# Create the line plot using ggplot
#Catapillar_mass Vs. Trichomase
library(ggplot2)
ggplot(milkweed.data, aes(x = Trichomes, y = Caterpillar_mass)) +
  geom_line(color = "black") +  
  geom_point(color = "red") +
  labs(title = "Line Plot of Trichomes vs. Caterpillar Mass",
       x = "Trichomes",
       y = "Caterpillar Mass") +
  theme_minimal()  
#Catapillar_mass Vs Latex
ggplot(milkweed.data, aes(x = Latex, y = Caterpillar_mass)) +
  geom_line(color = "black") +  
  geom_point(color = "red") +  
  labs(title = "Line Plot of Trichomes vs. Caterpillar Mass",
       x = "Latex",
       y = "Caterpillar Mass") +
  theme_minimal()  
#Catapillar_mass Vs Toxin_amt
ggplot(milkweed.data, aes(x = Toxin_amt, y = Caterpillar_mass)) +
  geom_line(color = "black") +  
  geom_point(color = "red") +  
  labs(title = "Line Plot of Trichomes vs. Caterpillar Mass",
       x = "Toxin amt",
       y = "Caterpillar Mass") +
  theme_minimal() 
#D. catapillar_mass Vs. Trichomes less than 20
ggplot(subset(milkweed.data, Trichomes < 20), aes(x = Trichomes, y = Caterpillar_mass)) +
  geom_line(color = "black") +
  geom_point(color = "red") +    
  labs(title = "Line Plot of Caterpillar Mass vs. Trichomes <20",
       x = "Trichomes per Leaf",
       y = "Caterpillar Mass") +
  theme_minimal()
#the plots are shown in the plot section, i am yet to learn how to show the plot in r script.
