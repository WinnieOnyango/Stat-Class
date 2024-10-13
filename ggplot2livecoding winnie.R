choice <- read.csv("https://raw.githubusercontent.com/smucciolo/Aphis-nerii-host-selection-and-impact-2022/refs/heads/main/combined_nerii.csv")
library(tidyverse)

#### graphing
#basic ggplot
ggplot(data=choice, aes(x=SPECIES,y=ADULT))+
  geom_boxplot()

####fill+morph shows the two separate morphologies and add color
ggplot(data=choice, aes(x=SPECIES,y=ADULT,fill=MORPH))+
  geom_boxplot()
#use facet_grid to put MORPHS in differnt columns
ggplot(data=choice, aes(x=SPECIES,y=ADULT,fill=MORPH))+
  geom_boxplot()+
  facet_grid(.~MORPH)
#Adding lables we used labs function()
ggplot(data=choice,aes(x=SPECIES,y=ADULT,fill=MORPH))+
  geom_boxplot()+
  facet_grid(.~MORPH)+
  labs(x="Milkweed Spcies",
         y="Number of adult species",
         title="Aphid host Species Choice") 

#exploring theme, text font, color
####my pc do is limited in fornt provided.
ggplot(data=choice,aes(x=SPECIES,y=ADULT,fill=MORPH))+
  geom_boxplot()+
  facet_grid(.~MORPH)+
  labs(x="Milkweed Spcies",
       y="Number of adult species",
       title="Aphid host species Choice ")+
  theme(text=element_text(family="serif"),
               axis.title=element_text(size=20),
               plot.title=element_text(size=25,hjust=0.5))
###checking the fonts available in my R
 (grDevices::windowsFonts())
###geting rid of legend...determines what colour rep which group
    ggplot(data=choice,aes(x=SPECIES,y=ADULT,fill=MORPH))+
  geom_boxplot()+
  facet_grid(.~MORPH)+
  labs(x="Milkweed Species",
       y="Number of Adult Aphids",
       title="Aphid Host Species Choice")+
  theme(text=element_text(family="serif"),
        axis.title=element_text(size=20),
        plot.title=element_text(size=25,
                                hjust=0.5),
        legend.position="none")

###change boxplot colors using scale_fill_manual  
    ggplot(data=choice,aes(x=SPECIES,y=ADULT,fill=MORPH))+
      geom_boxplot()+
      facet_grid(.~MORPH)+
      labs(x="Milkweed Species",
           y="Number of Adult Aphids",
           title="Aphid Host Species Choice")+
      theme(text=element_text(family="serif"),
            axis.title=element_text(size=20),
            plot.title=element_text(size=25,
                                    hjust=0.5),
            legend.position="none")+
      scale_fill_manual(values = c("ALATE"="hotpink", "APTEROUS"="yellow"))
  
###changing milkweed species labels using scla_x_discrete
    ggplot(data=choice,aes(x=SPECIES,y=ADULT,fill=MORPH))+
      geom_boxplot()+
      facet_grid(.~MORPH)+
      labs(x="Milkweed Species",
           y="Number of Adult Aphids",
           title="Aphid Host Species Choice")+
      theme(text=element_text(family="serif"),
            axis.title=element_text(size=20),
            plot.title=element_text(size=25,
                                    hjust=0.5),
            legend.position="none")+
      scale_fill_manual(values = c("ALATE"="hotpink", "APTEROUS"="yellow"))+
      scale_x_discrete(labels=c("A. incarnata", "A. syriaca", "A. tuberosa"))
    
#italicize the scientific names
    ggplot(data=choice,aes(x=SPECIES,y=ADULT,fill=MORPH))+
      geom_boxplot()+
      facet_grid(.~MORPH)+
      labs(x="Milkweed Species",
           y="Number of Adult Aphids",
           title="Aphid Host Species Choice")+
      theme(text=element_text(family="serif"),
            axis.title=element_text(size=20),
            plot.title=element_text(size=25,
                                    hjust=0.5),
            legend.position="none",
      axis.text.x=element_text(face="italic"))+
      scale_fill_manual(values = c("ALATE"="hotpink", "APTEROUS"="yellow"))+
      scale_x_discrete(labels=c("A. incarnata", "A. syriaca", "A. tuberosa"))     
#use annotation to add significance letter in the plot maybe showing significant values  
    ggplot(data=choice,aes(x=SPECIES,y=ADULT,fill=MORPH))+
      geom_boxplot()+
      facet_grid(.~MORPH)+
      labs(x="Milkweed Species",
           y="Number of Adult Aphids",
           title="Aphid Host Species Choice")+
      theme(text=element_text(family="serif"),
            axis.title=element_text(size=20),
            plot.title=element_text(size=25),
            legend.position="none",
            axis.text.x=element_text(face="italic",
                                     angle=45,
                                     hjust=1),
            axis.text=element_text(size=12))+
      scale_fill_manual(values=c("ALATE"="hotpink2","APTEROUS"="darkgoldenrod2"))+
      scale_x_discrete(labels=c("A. incarnata","A. syriaca","A. tuberosa"))+
      annotate(geom="text",x=1.5,y=6,label="*",color="skyblue4",size=15) 
            
    #changing axis limits with ylim()
    ggplot(data=choice,aes(x=SPECIES,y=ADULT,fill=MORPH))+
      geom_boxplot()+
      facet_grid(.~MORPH)+
      labs(x="Milkweed Species",
           y="Number of Adult Aphids",
           title="Aphid Host Species Choice")+
      theme(text=element_text(family="serif"),
            axis.title=element_text(size=20),
            plot.title=element_text(size=25),
            legend.position="none",
            axis.text.x=element_text(face="italic",
                                     angle=45,
                                     hjust=1),
            axis.text=element_text(size=12))+
      scale_fill_manual(values=c("ALATE"="hotpink2","APTEROUS"="darkgoldenrod2"))+
      scale_x_discrete(labels=c("A. incarnata","A. syriaca","A. tuberosa"))+
      annotate(geom="text",x=1.5,y=6,label="*",color="skyblue4",size=15)+
      ylim(0,10)
    #changing angle of font on x axis with theme
    #angle changes angle
    #hjust allows you to move the font so it doesn't overlap with the graph
    
##change data opacity — change alpha in geom_boxplot()
    ggplot(data=choice,aes(x=SPECIES,y=ADULT,fill=MORPH))+
      geom_boxplot(alpha=0.5)+
      facet_grid(.~MORPH)+
      labs(x="Milkweed Species",
           y="Number of Adult Aphids",
           title="Aphid Host Species Choice")+
      theme(text=element_text(family="serif"),
            axis.title=element_text(size=20),
            plot.title=element_text(size=25),
            legend.position="none",
            axis.text.x=element_text(face="italic",
                                     angle=45,
                                     hjust=1),
            axis.text=element_text(size=12))+
      scale_fill_manual(values=c("ALATE"="hotpink","APTEROUS"="yellow"))+
      scale_x_discrete(labels=c("A. incarnata","A. syriaca","A. tuberosa"))+
      annotate(geom="text",x=1.5,y=6,label="*",color="skyblue4",size=15)+
      ylim(0,10) 
    #saving as an object
    fullplot<-ggplot(data=choice,aes(x=SPECIES,y=ADULT,fill=MORPH))+
      geom_boxplot(alpha=0.5)+
      facet_grid(.~MORPH)+
      labs(x="Milkweed Species",
           y="Number of Adult Aphids",
           title="Aphid Host Species Choice")+
      theme(text=element_text(family="serif"),
            axis.title=element_text(size=20),
            plot.title=element_text(size=25),
            legend.position="none",
            axis.text.x=element_text(face="italic",
                                     angle=45,
                                     hjust=1),
            axis.text=element_text(size=12))+
      scale_fill_manual(values=c("ALATE"="hotpink","APTEROUS"="yellow"))+
      scale_x_discrete(labels=c("A. incarnata","A. syriaca","A. tuberosa"))+
      annotate(geom="text",x=1.5,y=6,label="*",color="skyblue4",size=15)+
      ylim(0,10)
    