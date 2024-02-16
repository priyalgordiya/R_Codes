

#matrix()
my.data <- 1:20
my.data

A <- matrix(my.data, 4, 5)
#rbind()
#cbind()

Games
rownames(Games)
colnames(Games)
Games["LeBronJames", "2012"]
FieldGoals
FieldGoals / Games

FieldGoals
t(FieldGoals)



matplot(t(FieldGoals/Games), type = "b", pch=15:18, col=c(1:4,6))
legend("bottomleft", inset = 0.01, legend=Players, col=c(1:4,6), pch=15:18, horiz=F)




matplot(t(FieldGoals/FieldGoalAttempts), type = "b", pch=15:18, col=c(1:4,6))
legend("bottomleft", inset = 0.01, legend=Players, col=c(1:4,6), pch=15:18, horiz=F)

#subset
data <- MinutesPlayed[1,,drop=F]
matplot(t(data), type = "b", pch=15:18, col=c(1:4,6))
legend("bottomleft", inset = 0.01, legend=Players, col=c(1:4,6), pch=15:18, horiz=F)

data

?drop()

myplot <- function(data, rows=1:10){
  data <- Games[rows,,drop=F]
  matplot(t(data), type = "b", pch=15:18, col=c(1:4,6))
  legend("bottomleft", inset = 0.01, legend=Players[rows], col=c(1:4,6), pch=15:18, horiz=F)
}

myplot(Games)







