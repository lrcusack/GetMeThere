


nr = length(levels(frame.data$region))
nd = length(levels(frame.data$day))
nt = length(levels(frame.data$time))

initiate_array = "var tfactor = [];
    \n\nfor (var i=0; i<29;i++){\n
    tfactor[i]=[];\n
    for(var j=0; j<7;j++){\n
        tfactor[i][j]=[];\n
        for (var k=0; k<144; k++){\n
            tfactor[i][j][k] = 0
        }\n
    }\n
}\n\n"

for(i in 1:nr){
  for(j in 1:nd){
    x = i-1;
    y= j-1;
    assignment = paste(assignment,"\ntfactor[", x,"][",y,"] = [",paste(as.character(matrix.data[i,j,]),sep="",collapse=", "),"];\n",sep="")
  }
}

js = paste(initiate_array,assignment)

write(js, "~/Code/temp/GetMeThere/data_import/matrixdata.js");
