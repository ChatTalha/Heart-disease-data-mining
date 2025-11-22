library(class) 
library(tidytable)
library(dplyr)
library(caret) 
heart= read.table(file.choose(),header = T,sep = ";")
 
heart$sex <- as.factor(heart$sex)
heart$cp <- as.factor(heart$cp)
heart$fbs <- as.factor(heart$fbs)
heart$restecg <- as.factor(heart$restecg)
heart$exang <- as.factor(heart$exang)
heart$slope <- as.factor(heart$slope)
heart$ca <- as.factor(heart$ca)
heart$thal <- as.factor(heart$thal)
## Dummy değişkenleri oluşturma

heart_dummies <- (heart %>%get_dummies.(cols = c(sex, cp, fbs, restecg, exang, slope, ca, thal)))
names(heart_dummies) 

#Kalan orijinal faktör sütunlarını kaldırma
heart_dummies <-select(heart_dummies, -c(sex, cp, fbs, restecg, exang, slope, ca, thal))


heart0 <- heart_dummies

heart0x <- select(heart0, -target)
heart0y <- select(heart0, target)


max1 = apply(heart0x, 2, max) 
min1 = apply(heart0x, 2, min)

gdat = scale(heart0x, center = min1, scale = max1 - min1) 
gdat = as.data.frame(cbind(heart0x, heart0y))

heart0 = gdat 

X <- select(heart0, -target)

y <- heart0[ ,31]

set.seed(123)
V = 2
n =  NROW(heart0)

id = sample(1:V, n, prob = c(0.7,0.3), replace = T) 
ii = which(id==1)
X.train = X[ii,]; X.test  = X[-ii,]
y.train = y[ii];  y.test  = y[-ii]

# Modelleme
X.train <- apply(X.train, 2, function(x) ifelse(is.na(x), mean(x, na.rm = TRUE), x))
X.test <- apply(X.test, 2, function(x) ifelse(is.na(x), mean(x, na.rm = TRUE), x))

knn.5 <- knn(train=X.train, test=X.test, cl=y.train, k=5)
knn.10 <- knn(train=X.train, test=X.test, cl=y.train, k=10)

ctable.5 = table(knn.5, y.test)
ctable.10 = table(knn.10, y.test)

confusionMatrix(ctable.5)
confusionMatrix(ctable.10)

## Optimizasyon
i=1
k.optm=1
for (i in 1:15){
  knn.mod <- knn(train=X.train, test=X.test, cl=y.train, k=i)
  k.optm[i] <- 100 * sum(y.test == knn.mod)/NROW(y.test)
  k=i
  cat(k,'=',k.optm[i],'
')
}

###############################################

## Değişkenlerle Modelleme
# cp_0, sex_0
# cp_0, sex_0, thal_2, slope_1, ca_2

set.seed(123)
V = 2
n =  NROW(heart0)

id = sample(1:V, n, prob = c(0.7,0.3), replace = T) 
ii = which(id==1)
X.train = X[ii,]; X.test  = X[-ii,]
y.train = y[ii];  y.test  = y[-ii]


vars = c("cp_0", "sex_0", "thal_2", "slope_1", "ca_2")
X.train = X.train[, vars]; X.test  = X.test[, vars]
y.train = y[ii];  y.test  = y[-ii]

 
i=1
k.optm=1
for (i in 1:15){
  knn.mod <- knn(train=X.train, test=X.test, cl=y.train, k=i)
  k.optm[i] <- 100 * sum(y.test == knn.mod)/NROW(y.test)
  k=i
  cat(k,'=',k.optm[i],'
')
}
#Doğruluk grafiği
plot(k.optm, type="b", xlab="K- Value",ylab="Accuracy level")

