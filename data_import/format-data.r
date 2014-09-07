json = toJSON(matrix.data);

write(json, "~/Code/GetMeThere/data_import/matrixdata.json");

nr = length(levels(frame.data$region))
nd = length(levels(frame.data$day))
nt = length(levels(frame.data$time))

matrix.json.str = paste("matrix = [" , nr , "][" , nd , "][" , nt, "];")
