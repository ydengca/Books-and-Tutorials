setwd("D:/Book on R/Writing/R Graph Cookbook/draft")

################################
# Chapter-1
################################

# Calling grid library
library(grid)

# Creating a rectangle
grid.rect(height=0.25,width=0.25)

# A rounded rectangle
grid.roundrect(height=0.2,width=0.2) 

# A circle
grid.circle(r=0.1)

# Inserting text within the shape
grid.text("R Graphics")

# Drawing a polygon
grid.polygon()





#####################
# data generation

# Set the seed to make the example reproducible
set.seed(1234)
incubation_period <- c(rnorm(100,mean=10),rnorm(100,mean=15),rnorm(100,mean=5),rnorm(100,mean=20))
exposure_cat <- sort(rep(c(1:4),100))
dis_dat<-data.frame(incubation_period,exposure_cat)

# Producing histogram for each of the exposure category 1, 2, 3, and 4 
# using traditional visualization code

op<-par(mfrow=c(2,2))
 hist(dis_dat$incubation_period[dis_dat$exposure_cat==1])
 hist(dis_dat$incubation_period[dis_dat$exposure_cat==2])
 hist(dis_dat$incubation_period[dis_dat$exposure_cat==3])
 hist(dis_dat$incubation_period[dis_dat$exposure_cat==4])
 par(op)


library(lattice)
histogram(~incubation_period | factor(exposure_cat), data=dis_dat)
plot(incubation_period ~ factor(exposure_cat), data=dis_dat)
plot(incubation_period ~ exposure_cat, data=dis_dat)


################################
# Chapter-11
################################

################################
# Recipe: Creating bar charts

# Set a seed value to make the data reproducible
set.seed(12345)
data_barchart <-data.frame(disA=rnorm(n=100,mean=20,sd=3),
                disB=rnorm(n=100,mean=25,sd=4),
                disC=rnorm(n=100,mean=15,sd=1.5),
                age=sample((c(1,2,3,4)),size=100,replace=T))

dis_dat <- round(aggregate(data_barchart[,1:3],list(data_barchart$age),mean),digits=1)
colnames(dis_dat)<-c("age","disA","disB","disC")
barchart(disA+disB+disC~factor(age),data=dis_dat)
barchart(disA+disB+disC~factor(age),data=dis_dat,auto.key=list(column=3),
main="Mean incubation period comparison \n among different age group",
xlab="Age group",ylab="Mean incubation period (weeks)")


################################
# Recipe: Creating stacked bar charts

barchart(disA+disB+disC~factor(age),data=dis_dat,stack=T)
barchart(disA+disB+disC~factor(age),data=dis_dat,auto.key=list(column=3),
         main="Mean incubation period comparison \n among different age group",
         xlab="Age group",ylab="Mean incubation period (weeks)",stack=TRUE)

################################
# Recipe: Creating bar charts to visualize cross tabulation


# Set a seed value to make the data reproducible
set.seed(12345)
cross_tabulation_data <-data.frame(disA=rnorm(n=100,mean=20,sd=3),
                disB=rnorm(n=100,mean=25,sd=4),
                disC=rnorm(n=100,mean=15,sd=1.5),
                age=sample((c(1,2,3,4)),size=100,replace=T),
                sex=sample(c("Male","Female"),size=100,replace=T),
                econ_status=sample(c("Poor","Middle","Rich"),
                size=100,replace=T))

# producing the cross tabulation data with three categorical variables
cross_table <- as.data.frame(table(cross_tabulation_data[,4:6]) )

barchart(age~Freq|sex+econ_status,data=cross_table)
barchart(econ_status~Freq|sex+age,data=cross_table)
barchart(econ_status~Freq|sex+age,data=cross_table,
         main="Chart title",xlab="Frequency count",ylab="Age")

barchart(econ_status~Freq|sex+age,data=cross_table,
main="Chart title",xlab="Frequency count",ylab="Age",col="black")

################################
# Recipe: Creating bar charts to visualize cross tabulation

set.seed(12345)
cross_tabulation_data <-data.frame(disA=rnorm(n=100,mean=20,sd=3),
                disB=rnorm(n=100,mean=25,sd=4),
                disC=rnorm(n=100,mean=15,sd=1.5),
                age=sample((c(1,2,3,4)),size=100,replace=T),
                sex=sample(c("Male","Female"),size=100,replace=T),
                econ_status=sample(c("Poor","Middle","Rich"),size=100,replace=T))

histogram(~disA|sex,data=cross_tabulation_data,type="density")
histogram(~disA|sex+econ_status,data=cross_tabulation_data,type="density")
histogram(~disA+disB|sex,data=cross_tabulation_data,type="density")

################################
# Recipe: Visualizing distribution through kernel density plot

densityplot(~disA|sex,data=cross_tabulation_data)
densityplot(~disA+disB|sex,data=cross_tabulation_data,auto.key=T)

################################
# Recipe: Creating normal Q-Q plot

# Set a seed value to make the data reproducible
set.seed(12345)
qqdata <-data.frame(disA=rnorm(n=100,mean=20,sd=3),
                disB=rnorm(n=100,mean=25,sd=4),
                disC=rnorm(n=100,mean=15,sd=1.5),
                age=sample((c(1,2,3,4)),size=100,replace=T),
                sex=sample(c("Male","Female"),size=100,replace=T),
                econ_status=sample(c("Poor","Middle","Rich"),
                size=100,replace=T))
qqmath(~disA|sex,data=qqdata,f.value=ppoints(50),distribution=qnorm)
qqmath(~disA+disB+disC|sex,data=qqdata,f.value=ppoints(50),distribution=qnorm)

################################
# Recipe: Visualizing empirical cumulative distribution function (CDF)

library(latticeExtra)
# Set a seed value to make the data reproducible
set.seed(12345)
qqdata <-data.frame(disA=rnorm(n=100,mean=20,sd=3),
                disB=rnorm(n=100,mean=25,sd=4),
                disC=rnorm(n=100,mean=15,sd=1.5),
                age=sample((c(1,2,3,4)),size=100,replace=T),
                sex=sample(c("Male","Female"),size=100,replace=T),
                econ_status=sample(c("Poor","Middle","Rich"),
                size=100,replace=T))

ecdfplot(~disA|sex,data=qqdata)
ecdfplot(~disA|sex,data=qqdata,subset=disA>15)

################################
# Recipe: Creating box plot

# Set a seed value to make the data reproducible
set.seed(12345)
qqdata <-data.frame(disA=rnorm(n=100,mean=20,sd=3),
                disB=rnorm(n=100,mean=25,sd=4),
                disC=rnorm(n=100,mean=15,sd=1.5),
                age=sample((c(1,2,3,4)),size=100,replace=T),
                sex=sample(c("Male","Female"),size=100,replace=T),
                econ_status=sample(c("Poor","Middle","Rich"),
                size=100,replace=T))

bwplot(~disA,data=qqdata)
bwplot(disA~sex,data=qqdata)
bwplot(disA~sex|econ_status,data=qqdata)

################################
# Recipe: Creating conditional scatter plot

# Set a seed value to make the data reproducible
set.seed(12345)
qqdata <-data.frame(disA=rnorm(n=100,mean=20,sd=3),
                disB=rnorm(n=100,mean=25,sd=4),
                disC=rnorm(n=100,mean=15,sd=1.5),
                age=sample((c(1,2,3,4)),size=100,replace=T),
                sex=sample(c("Male","Female"),size=100,replace=T),
                econ_status=sample(c("Poor","Middle","Rich"),
                size=100,replace=T))
xyplot(disA~disB, data=qqdata)

# colored scatter plot
xyplot(disA~disB,group=sex,data=qqdata,auto.key=T)
# panel scatter plot
xyplot(disA~disB|sex,data=qqdata)


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

################################
# Chapter-13
################################


# calling mtcars dataset and store it in dat object
dat <- mtcars

# set seed to make the data reproducible
set.seed(12345)

# Generate 1000 random uniform number 
# The random uniform number will be
# used as probability argument in quantile function
probs <- runif(1000)

# Generate each of the variable separately
mpg <- quantile(dat$mpg,prob=probs)
cyl <- as.integer(quantile(dat$cyl,prob=probs))
disp <- as.integer(quantile(dat$disp,prob=probs))
hp <- as.integer(quantile(dat$hp,prob=probs))
drat <- quantile(dat$drat,prob=probs)
wt <- quantile(dat$wt,prob=probs)
qsec <- quantile(dat$qsec,prob=probs)
vs <- as.integer(quantile(dat$vs,prob=probs))
am <- as.integer(quantile(dat$am,prob=probs))
gear <- as.integer(quantile(dat$gear,prob=probs))
carb <- as.integer(quantile(dat$carb,prob=probs))

# Make a new dataframe containing all the variables
# Some of the variables we converted to factor 
# to represents as categorical variable
modified_mtcars <- data.frame(mpg,cyl=factor(cyl),
                     disp,hp,drat,wt,qsec,vs=factor(vs),
                     am=factor(am),gear=factor(gear),
                     carb=factor(carb))
row.names(modified_mtcars) <- NULL

################################
# Recipe: Multivariate continuous data visualization


# Taking subset with only continuous variables
con_dat <- modified_mtcars[c("mpg","disp","drat","wt","qsec")]
# Loading the library
library(tabplot)

tableplot(con_dat)
################################
# Recipe: Multivariate visualization of categorical data

cat_dat <- modified_mtcars[c("cyl","vs","am","gear","carb")]
tableplot(cat_dat,sortCol=carb)

################################
# Recipe: Visualizing mixed data

tableplot(modified_mtcars)

################################
# Recipe: Zooming and filtering

tableplot(con_dat,from=20,to=50,sortCol=mpg)

################################
# Chapter-14
################################

################################
# Recipe: Three dimensional scatter plot

# Loading the library
library(scatterplot3d)
# Attach the dataset in the current environment 
# so that we can call using the variable names
attach(airquality)
# Basic scatter plot in 3D space
scatterplot3d(Ozone,Solar.R,Wind) 

# adding horizontal drop line
scatterplot3d(Ozone,Solar.R,Wind,type="h")
scatterplot3d(Ozone,Solar.R)

################################
# Recipe: Three dimensional scatter plot with regression plane

attach(airquality)
s3dplot<- scatterplot3d(Temp,Solar.R,Ozone)
model <- lm(Ozone~Solar.R+Temp)
s3dplot$plane3d(model)

################################
# Recipe: Three dimensional bar chart

scatterplot3d(Day,Month,Temp,type="h",lwd=5,pch=" ",color="grey10")

################################
# Recipe: Three dimensional density plot

library(MASS)

# To fill the NA values in the variables and create new variable
# Create new ozone variable
Ozone_new <- Ozone

#Fill the NA with median
Ozone_new[is.na(Ozone_new)]<-median(Ozone,na.rm=T)

#Create new Temp variable
Temp_new <- Temp

#Fill the NA with median
Temp_new[is.na(Temp_new)]<- median(Temp,na.rm=T)

#Bivariate kernel density estimation with automatic bandwidth 
density3d <- kde2d(Ozone_new,Temp_new)

#Visualize the density in 3D space
persp(density3d)

