#Reading an input cancer data file
data_file=read.csv("C:\\Users\\Admino\\Desktop\\GSE153659_FPKM_Matrix.csv",sep=,header=T,row.names = 1)
print(data_file)


#Create a count per matrix
cpmatrix=data_file
for(i in 1:ncol(data_file)){
cpmatrix[,i]=(data_file[,i]/sum(data_file[,i]))*1000000
}
print(cpmatrix)

#Calculate a log of cpm
logcpm=log2(cpmatrix+1)
saveRDS(logcpm,file="logCPM.rds")
summary(logcpm)

install.packages("matrixStats")

#Calculate a zscore
library(matrixStats)
zscore = (logcpm - rowMeans(logcpm))/rowSds(as.matrix(logcpm))[row(logcpm)]
print(zscore)

#variance
variance = apply(logcpm, 1, var)
variance = sort(variance,decreasing = T)
top50 = variance[1:50]
pmat = z_score[names(top50),]
print(variance)

 

