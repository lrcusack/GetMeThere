#chicago.data <- read.csv("~/Code/GetMeThere/data_import/cleaned-chicago-data.csv", stringsAsFactors=TRUE);
# 
# data.struct = list()
# regions = split(chicago.data,chicago.data$region,drop=TRUE)
# rweekdays=list()
# for (i in 1:length(regions)){
#   
#   rweekdays[[i]]= split(regions[i],regions$day,drop=TRUE)
#   
#   for (j in 1:length(rweekdays)){
#     
#     datastruct[[i]][[j]] = split(rweekdays[[j]],rweekdays[[j]]$time,drop=TRUE)
#   }
# }

# chicago.data = subset(chicago.data, subset=(chicago.data$speed<=70))

n = length(levels(chicago.data$region))*
  length(levels(chicago.data$day))*
  length(levels(chicago.data$time));

region = vector(mode = "character", length = length(n));
day = vector(mode = "character", length = length(n));
time = vector(mode = "character", length = length(n));
mean = vector(mode = "numeric", length = length(n));

i = 1;
matrix.data = array(0,dim = c(
  length(levels(chicago.data$region)), 
  length(levels(chicago.data$day)), 
  length(levels(chicago.data$time))))
rmax = vector(mode = "numeric", length = length(levels(frame.data$region)));


pb = pb <- winProgressBar(title = "progress bar", min = 1,
                         max = n, width = 300)
for (r in 1:length(levels(chicago.data$region))){
  rd = subset(chicago.data, subset = (as.numeric(chicago.data$region)==r),select = "speed");
  rmax[r] = max(rd$speed);
  for (d in 1:length(levels(chicago.data$day))){
    for (t in 1:length(levels(chicago.data$time))){
      
      rdt = subset(chicago.data,
                        subset = (
                          as.numeric(chicago.data$region)==r 
                          & as.numeric(chicago.data$day)==d
                          & as.numeric(chicago.data$time)==t
                          ),
                        select = c("n","speed","wspeed")
                   )
      mean = sum(rdt$wspeed)/sum(rdt$n);
      tfactor = rmax[r]/mean
      if(is.nan(tfactor) | is.na(tfactor)) tfactor=1;
      matrix.data[r,d,t] = tfactor
      i=i+1;
      setWinProgressBar(pb, i, title=paste( round(i/n*100, 0),
                                            "% done"))    
    }
  }
}
# 
# frame.data = data.frame(region,day,time,mean)
# 
# matrix.data = array(0,dim = c(
#   length(levels(frame.data$region)), 
#   length(levels(frame.data$day)), 
#   length(levels(frame.data$time))))
# 
# i=1
# 
# 
# rmax = vector(mode = "numeric", length = length(levels(frame.data$region)));
# 
# 
# for (r in 1:length(levels(frame.data$region))){
#   rd = subset(frame.data, subset = (as.numeric(frame.data$region)==r));
#   rmax[r] = max(rd$mean);
# }
# 
# 
# 
# i=1
# for(r in 1:length(levels(frame.data$region))){
#   for (d in 1:length(levels(frame.data$day))){
#     for (t in 1:length(levels(frame.data$time))){
#       tfactor = rmax[r]/frame.data$mean[i]
#       if(as.numeric(frame.data$region[i])!=r) print("oh shit")
#       if(is.nan(tfactor) | is.na(tfactor)) tfactor=1;
#       matrix.data[r,d,t] = tfactor
#       i=i+1;
#       setWinProgressBar(pb, i, title=paste( round(i/n*100, 0),
#                                             "% done"))    
#     }
#   }
# }
# 
# 
