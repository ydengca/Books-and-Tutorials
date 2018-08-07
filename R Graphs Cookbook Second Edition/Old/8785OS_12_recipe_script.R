
################################
# Chapter-12
################################

# Set a seed value to make the data reproducible
set.seed(12345)
ggplotdata <-data.frame(disA=rnorm(n=100,mean=20,sd=3),
              disB=rnorm(n=100,mean=25,sd=4),
              disC=rnorm(n=100,mean=15,sd=1.5),
              age=factor(sample(c(1,2,3,4),size=100,replace=T),
              levels=c(1,2,3,4),labels=c("< 5yrs","5-10 yrs","10-18 yrs","18 +yrs")),
              sex=factor(sample(c(1,2),size=100,replace=T),
              levels=c(1,2),labels=c("Male","Female")),
econ_status=factor(sample(c(1,2,3),size=100,replace=T), levels=c(1,2,3),labels=c("Poor","Middle","Rich")))

ggplotdata$disD <- ggplotdata$disA+rnorm(100,sd=3)

################################
# Recipe: Creating bar charts

library(plyr)
bardata <- ddply(ggplotdata,.(econ_status),summarize,meandisA=mean(disA),
meandisB=mean(disB),meandisC=mean(disC),meadisD=mean(disD))

library(ggplot2)

ggplot(data= bardata, aes(x=econ_status, y=meandisA)) + geom_bar(stat="identity")

# to change bar width we could use width= argument within geom_bar()
ggplot(data= bardata, aes(x=econ_status, y=meandisA)) + geom_bar(stat="identity",width=0.5)
# change the layout to horizontal use coord_flip()
# with the main plot
ggplot(data= bardata, aes(x=econ_status, y=meandisA)) + geom_bar(stat="identity",width=0.5)+coord_flip()


################################
# Recipe: Creating multiple bar charts

library(plyr)
bardata <- ddply(ggplotdata,.(econ_status),summarize,meandisA=mean(disA),
meandisB=mean(disB),meandisC=mean(disC),meadisD=mean(disD))

library(reshape)
bardata_tidy <- melt(bardata,id.vars="econ_status")

ggplot(data= bardata_tidy, aes(x=econ_status, y=value, fill=variable)) + geom_bar(stat="identity",position="dodge")

# To make horizontal bar chart
ggplot(data= bardata_tidy, aes(x=econ_status, y=value, fill=variable)) + geom_bar(stat="identity",position="dodge")+coord_flip()
ggplot(data= bardata_tidy, aes(x=econ_status, y=value, fill=variable)) + geom_bar(stat="identity",position="stack")

################################
# Recipe: Creating bar chart with error bars

# Summarizing the dataset to calculate mean
# calculating margin of error for 95% confidence interval of mean
bardata <- ddply(ggplotdata,.(econ_status),summarize,n=length(disA),meandisA=mean(disA),
            sdA=sd(disA),errMargin= 1.96*sd(disA)/sqrt(length(disA)))

# transforming the dataset to calculate
# lower and upper limit of confidence interval
bardata <- transform(bardata, lower= meandisA-errMargin, upper=meandisA+errMargin)

errbar <- ggplot(data= bardata, aes(x=econ_status, y=meandisA)) + geom_bar(stat="identity")
errbar + geom_errorbar(aes(ymax=upper,ymin=lower),data=bardata)

################################
# Recipe: Visualizing density of numeric variable

ggplot(data=ggplotdata,aes(x=disA))+geom_density()


################################
# Recipe: Creating box plot

ggplot(data=ggplotdata,aes(y=disB,x=sex))+geom_boxplot()

################################
# Recipe: Creating layered plot with scatter plot and fitted line

Sctrplot <- ggplot(data=ggplotdata,aes(x=disA,y=disD))+geom_point()
Sctrplot <- Sctrplot + geom_smooth(method="lm",col="red")
Sctrplot + geom_smooth(col="green")

################################
# Recipe: Creating line chart

# connected line
ggplot(data=ggplotdata,aes(x=1:nrow(ggplotdata),y=disA))+geom_line()

# connected line with points
ggplot(data=ggplotdata,aes(x=1:nrow(ggplotdata),y=disA))+geom_line()+geom_point()

# connected line with points separated by factor variable
ggplot(data=ggplotdata,aes(x=1:nrow(ggplotdata),y=disA,col=sex))+geom_line()+geom_point()

ggplot(data=ggplotdata,aes(x=as.Date(1:nrow(ggplotdata),origin = "2013-12-31"),y=disA,col=sex))+geom_line()+geom_point()


################################
# Recipe: Graph annotation with ggplot

library(grid)
library(gridExtra)
# creating scatter plot and print it
annotation_obj <- ggplot(data=ggplotdata,aes(x=disA,y=disD))+geom_point()
annotation_obj

# Adding custom text at (18,29) position
annotation_obj1 <- annotation_obj + annotate(geom="text",x=18,y=29,label="Extreme value",size=3)
annotation_obj1

# Highlight certain regions with a box
annotation_obj2 <- annotation_obj1+
annotate("rect", xmin = 24, xmax = 27,ymin=17,ymax=22,alpha = .2)
annotation_obj2

# Drawing line segment with arrow
annotation_obj3 <- annotation_obj2+
annotate("segment",x = 16,xend=17.5,y=25,yend=27.5,colour="red", arrow = arrow(length = unit(0.5, "cm")),size=2)
annotation_obj3
