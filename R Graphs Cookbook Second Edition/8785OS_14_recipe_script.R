
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
