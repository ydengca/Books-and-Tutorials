
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
