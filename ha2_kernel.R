install.packages("scatterplot3d") # Install
library("scatterplot3d") # load
library("car")
library("rgl")

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
x1= data$X1
x2=data$X2
plot(data$X1,data$X2,col=data$Class,asp=1)

kernel <- function(x1,x2) {
  
  #if (N<=0) {stop('invalid argument')}
  x1=((x1 - min(x1)) / ( max(x1) - min(x1) ))
  x2=((x2 - min(x2)) / ( max(x2) - min(x2) ))
  #x1 <- runif(N,min=-1,max=1)
  #x2 <- runif(N,min=-1,max=1)
  x <- sqrt(2+2*x1)*cos(2*pi*sqrt(2+2*x1))
  y <- sqrt(2+2*x1)*sin(2*pi*sqrt(2+2*x1))
  z <- 2*x2
  
  dataset <- data.frame(x,y,z)
  
  return(dataset)
}


xf=kernel(x1,x2)
cluster=2
y=as.vector(unlist(kmeans(xf, cluster)[1]))
plot(xf[,1], xf[,3], col= as.factor(y))


scatterplot3d(xf,  pch = 16, color=as.factor(y), axis = TRUE )

scatter3d(x=xf[,1], y=xf[,2], z= xf[,3], groups =  as.factor(y),
          surface =FALSE, grid =FALSE,
          axis.scales = FALSE, ellipsoid = TRUE)
