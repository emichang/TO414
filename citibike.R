setwd("C:/Users/apple/Desktop")
data<-read.csv("201511-citibike-tripdata.csv") #import the data
summary(data)
table(data$end.station.id) # count how many arrivals for each station
end1<-as.data.frame(table(data$end.station.id)) 
end2<-end1[order(end1$Var1),] #order by the station.id
end2
table(data$start.station.id)  # count how many departures for each station
start1<-as.data.frame(table(data$start.station.id))
start2<-start1[order(start1$Var1),]  #order by the station.id
start2
colnames(end2)<-c("station.id","counts") #change the column names
end2
colnames(start2)<-c("station.id","counts")
start2
station<-merge(x=end2,y=start2,by="station.id",all=TRUE) #joint these two data frame
station$asytraffic<-station$counts.x-station$counts.y #add a new column of asymmetric traffic "arrivals-departures"
station<-station[order(station$asytraffic),] #order by asymmertic traffic
station[1,] #pick up the smallest asymmertic traffic which means the most departures than arrivals
station[467,] #pick up the biggest asymmetric traffic which means the most arrivals than departures
