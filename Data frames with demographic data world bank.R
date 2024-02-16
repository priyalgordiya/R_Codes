

stats <- read.csv(file.choose())


stats
nrow(stats)
ncol(stats)
head(stats)
tail(stats)
str(stats)
summary(stats)


stats
head(stats)
stats[3,3]
stats$Internet.users
levels(stats$Income.Group)
str(stats)

stats[1:10,] #subsetting
stats[3:9,]
stats[c(4,100),]
stats[1,]
stats[,1]

#mathematical operations
head(stats)
stats$Birth.rate * stats$Internet.users
stats$Birth.rate + stats$Internet.users

#addcolumn
stats$mycal <- stats$Birth.rate * stats$Internet.users
head(stats)
#remove a column
stats$mycal <- NULL
head(stats)

#filtering data frames
stats$Internet.users < 2
filter <- stats$Internet.users < 2
stats[filter, ]


stats[stats$Birth.rate > 40,]
stats[stats$Birth.rate > 40 & stats$Internet.users < 2,]
stats[stats$Income.Group=="High income",]
levels(stats$Income.Group)
stats[stats$Country.Name== "Malta",]

#------------------------------QPLOT
library(ggplot2)
qplot(data=stats, x=Internet.users)
qplot(data=stats, x=Income.Group, y = Birth.rate, size =3, color=I("blue"))

qplot(data=stats, x=Income.Group, y = Birth.rate, geom = "boxplot")

#-----------------Visualizing what we need
qplot(data = stats, x=Internet.users, y = Birth.rate)
qplot(data = stats, x=Internet.users, y = Birth.rate, 
      size= I(4), color= I("red"))
qplot(data = stats, x=Internet.users, y = Birth.rate, 
      size= I(2), color= Income.Group)

#--------------------------Creating data frames

mydf <- data.frame(Codes_2012_Dataset, Countries_2012_Dataset, Regions_2012_Dataset)
head(mydf)
colnames(mydf) <- c("Country", "Code", "Region")
head(mydf)

rm(mydf)
mydf <- data.frame(Codes=Codes_2012_Dataset, Country=Countries_2012_Dataset, 
                   Region=Regions_2012_Dataset)
head(mydf)
summary(mydf)
tail(mydf)

#-------------------merging data  frames
head(stats)
head(mydf)

merge <- merge(stats, mydf, by.x= "Country.Code", by.y="Codes")
head(merge)
stats$Country.Name <- NULL
head(merge)
merge$Country.Name <- NULL
head(merge)

#-----------Qplot visualiZing with new split,
qplot(data = merge, x=Internet.users, y = Birth.rate, color=Region)
#1. Shapes
qplot(data = merge, x=Internet.users, y = Birth.rate, color=Region,
      shape= I(15))
#2. Transparency
qplot(data = merge, x=Internet.users, y = Birth.rate, color=Region,
      alpha=I(0.6))
#3. Title
qplot(data = merge, x=Internet.users, y = Birth.rate, color=Region,
      main= "Birth rate vs Internet Users")

