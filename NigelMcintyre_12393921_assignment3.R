#Nigel McIntyre 12393921
library(deSolve)  
library(ggplot2) 


START<-0; FINISH<-20; STEP<-0.25; 
# setting the time the simulation will run for and in what increments
simtime <- seq(START, FINISH, by=STEP)
#initial stock value
stocks<-(100)
#creating flow vectors inflow
inflowdown <- seq(100, 0, by=-5)
inflowup <- seq(5, 100, by=5)
inflowdown2 <- seq(95, 0, by=-5)
netinflow <- c(inflowdown,inflowup,inflowdown2,inflowup)
outflow <-rep(50,81)

#data frame of time inflow and outflow
x <-data.frame(simtime, netinflow, outflow)
#getting the net flow by subracting inflow and outflow in data frame
netflow <- (x$netinflow- x$outflow)
#for loop to repeat the equation at each time interval
for (i in 2:length(simtime)){
  #current stock = previous stock + previous flow * dt
  stocks[i]=stocks[i-1]+netflow[i-1]*STEP;
  
}

#data frame for time stocks and flow to b used to plot
o<-data.frame(simtime, stocks, netflow)

#plotting data frame o
qplot(data=o, x=o$simtime, y=o$stocks,
      geom=c("line","point"),xlab="Time",ylab="Stock")

