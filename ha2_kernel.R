install.packages("scatterplot3d") # Install
library("scatterplot3d") # load
library("car")
library("rgl")

n= 500

generateCrescentMoon<-function(n=100,d=2,sigma=1) {
  
  if (d!=2) { stop("Crescent Moon dataset is currently only available in 2D")}
  x<-runif(n,0,pi)
  c1<-cbind(5*cos(x)-2.5+rnorm(n)*sigma,10*sin(x)-2.5+rnorm(n)*sigma)
  x<-runif(n,pi,2*pi)
  c2<-cbind(5*cos(x)+2.5+rnorm(n)*sigma,10*sin(x)+2.5+rnorm(n)*sigma)
  y<-factor(c(rep("+",n),rep("-",n)))
  
  data.frame(Class=y, rbind(X1=c1,X2=c2))
}

data=generateCrescentMoon(250,2,1)
a= data$X1
b=data$X2
plot(data$X1,data$X2,col=data$Class,asp=1)
my_string= "general"
c= rep(my_string, n)  
df=(cbind(a,b,c))

#plot(a, b, pch = 19, col = "blue")

count_in = 0 # count of points in inner circle
count_out = 0 # count of points in outer area

for (i in 1:length(a)) {
  distance= as.numeric()
  distance=abs(sqrt(a^2+b^2))
  if (distance[i]<=6) {
    count_in=count_in+1
    df[i,'c']='in'
  }
  else if (distance[i]>=8) {
  #else {
    count_out=count_out+1
    df[i,'c']='out'
  }
}
distance
count_in
count_out
table(df[,'c'])
#Initial plot 2D
plot(df[,1:2], col= as.factor(df[,'c']))


#dff=(as.data.frame(df))
dff= dff[!(dff$c=="general"),]
table(dff[,'c'])
#Initial plot 2D, separation
#plot(dff[,1:2], col= as.factor(dff[,'c']))



mapping= function(a,b){
  x1= as.numeric(dff[,'a'])^2
  y1= as.numeric(dff[,'b'])^2
  z1=as.numeric(dff[,'a'])*as.numeric(dff[,'b'])
  f_data= cbind(x1,y1,z1, as.factor(dff[,'c']))
  return(f_data)
}
#PLOT, 3D

f_data=mapping(a,b)
cols=sample(1:2, nrow(f_data), replace=TRUE) 

scatterplot3d(f_data,  pch = 16, color=as.factor(dff[,'c']), axis = TRUE )

scatter3d(x=f_data[,1], y=f_data [,2], z= f_data[,3], groups =  as.factor(dff[,'c']),
          surface =FALSE, grid =TRUE,
          axis.scales = FALSE, ellipsoid = TRUE)

