raw.chicago.data <- read.csv("~/Code/GetMeThere/data_import/chicago-data.csv", stringsAsFactors=FALSE);
time.windows <- read.csv("~/Code/GetMeThere/data_import/time_windows.csv",header=FALSE);
time.windows=as.factor(time.windows$V1)

raw.chicago.data = subset(raw.chicago.data, subset = (raw.chicago.data$SPEED!=0 & raw.chicago.data$SPEED<=70))

region = as.factor(raw.chicago.data$REGION_ID)

times = raw.chicago.data$TIME;

day = vector(mode = "character", length = length(times));
dotw = c("Sunday","Monday","Tuesday","Wednesday","Thursday","Friday","Saturday")

time = vector(mode = "character", length = length(times));

for (i in 1:length(times)){
  temp = strptime(times[i],"%m/%d/%Y %I:%M:%S %p");
  day[i] = format(temp, "%A");
  time[i] = format(temp, "%H:%M");
  time[i]=paste(substr(time[i],start=1,stop=4),"0",sep="");
}

day = factor(day, levels = dotw)
time = as.factor(time)




vnames = c("region","day","time","n","speed")
chicago.data = data.frame(region,day,time,raw.chicago.data$NUMBER.OF.READS,raw.chicago.data$SPEED)
names(chicago.data)=vnames

chicago.data$wspeed = chicago.data$n*chicago.data$speed


positions = order(chicago.data$region,chicago.data$day,chicago.data$time,na.last = TRUE, decreasing = FALSE)
chicago.data = chicago.data[positions,]

row.names(chicago.data) = 1:length(chicago.data)

write.csv(chicago.data, file= "~/Code/GetMeThere/data_import/cleaned-chicago-data.csv")
