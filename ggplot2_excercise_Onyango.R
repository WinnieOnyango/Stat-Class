
###ggplotexcercise
#load libraries and data
library(ggplot2)
data("mtcars")
view(data="mtcars")
str(mtcars)
###setting mtcars dataset into data.frame and naming it df_mtcars
df_mtcars <-as.data.frame(mtcars)
head(df_mtcars)
###Graph 1
###Ploting as scatter plot using geom_point() of miles per gallon Vs weight from mtcars dataframe
 ggplot(data=df_mtcars, aes(x=wt, y=mpg))+
  geom_point()
###Adding line of best fit/linear regression line using geom_smooth
 ggplot(data=df_mtcars, aes(x=wt, y=mpg))+
   geom_point()+
   geom_smooth(method = "lm")
###adding lables to my plot
 ggplot(data=df_mtcars, aes(x=wt, y=mpg))+
   geom_point()+
   geom_smooth(method = "lm")+
   labs(x="Weight(1000lbs)",
        y="Miles/(US)gallon",
        title = "Graph 1")
###change color and shape of my scatter plot points
 ggplot(data=df_mtcars, aes(x=wt, y=mpg))+
   geom_point(shape=22, color="blue", size=2, fill="blue")+
   geom_smooth(method = "lm")+
   labs(x="Weight(1000lbs)",
        y="Miles/(US)gallon",
        title = "Graph 1")
 ###Graph 2
 #plotting transmission against Displacement box plot group by gears
 ggplot(data = df_mtcars, aes(x = disp, y = as.factor(am), fill = as.factor(gear))) +
   geom_boxplot(color = "black", size = 1) +
   labs(x = "dis (cu.in.)", 
        y = "am",   
        fill = "gears") +
   theme_minimal()
#mapping y axis
 ggplot(data = df_mtcars, aes(x = disp, y = as.factor(am), fill = as.factor(gear))) +
   geom_boxplot(color = "black", size = 1) +
   scale_y_discrete(labels = c("0" = "Automatic", "1" = "Manual"))+
   labs(x = "dis (cu.in.)", 
        y = "am",   
        fill = "gears") +
   theme_minimal()
###changing box plot color
 ggplot(data = df_mtcars, aes(x = disp, y = as.factor(am), fill = as.factor(gear))) +
   geom_boxplot(color = "black", size = 1) +
   scale_fill_manual(values = c("3"="red" ,"4"="lightgreen", "5"="blue"))+
   scale_y_discrete(labels = c("0" = "Automatic", "1" = "Manual"))+
   labs(x = "dis (cu.in.)", 
        y = "am",   
        fill = "gears") +
   theme_minimal()
###Naming the lables correctly
   ggplot(data = df_mtcars, aes(x = disp, y = as.factor(am), fill = as.factor(gear))) +
     geom_boxplot(color = "black", size = 1) +
     scale_fill_manual(values = c("3" = "red", "4" = "lightgreen", "5" = "blue")) +
     scale_y_discrete(labels = c("0" = "Automatic", "1" = "Manual")) +  # Correctly mapping y-axis labels
     labs(x = "Displacement (cu.in.)", 
          y = "Transmission",  
          title = "Graph 2",
          fill = "Number of forward gears") +
     theme_minimal()
 ###adding x_axis_limit
   ggplot(data = df_mtcars, aes(x = disp, y = as.factor(am), fill = as.factor(gear))) +
     geom_boxplot(color = "black", size = 1) +
     scale_fill_manual(values = c("3" = "red", "4" = "lightgreen", "5" = "blue")) +
     scale_y_discrete(labels = c("0" = "Automatic", "1" = "Manual")) +  # Correctly mapping y-axis labels
     labs(x = "Displacement (cu.in.)", 
          y = "Transmission",   
          title = "Graph 2",
          fill = "Number of forward gears") +
     theme_minimal()+
     xlim(100,400)
     
###3 Histogram of Gross Horsepower for v_shaped(red) and straight(blue)Enginesgg
 ggplot(data = df_mtcars, aes(x = hp, fill = as.factor(vs))) +
   geom_histogram(color = "black", bins = 10, size = 1) +
   scale_fill_manual(values = c("0" = "red", "1" = "blue"),
                     labels = c("0" = "V-shaped", "1" = "Straight")) +
   labs(x = "Horsepower (hp)", 
        y = "Count", 
        fill = "Engine Type",
        title = "Histogram of Horsepower for V-shaped vs Straight Engines") +
   theme_minimal() +
   ylim(0, 6) 
 
 
 
   