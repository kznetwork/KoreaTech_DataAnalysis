#############################
# R기초
#############################
setwd("C:/DEV/r-workspaces")
.libPaths()

install.packages("AID")
library(help=AID)
help(package=AID)
update.packages("AID")
remove.package("AID")
remove.packages("AID")

help(package=AID)

SUM <- function(a,b){
  result <- a+b
  return(result)
}


setwd("C:/DEV/r-workspaces")
source('ADsP-script.R',encoding='utf-8')
SUM(3,5)

# iris.RData 사제 후 명령어 실행
# datasets 패키지 불러오기
library(datasets)

# iris 데이터셋 불러오기
data(iris)

# iris 데이터 확인하기
head(iris)  # 처음 6개의 행 출력

save(iris, file = "iris.RData")
load(file="iris.RData")

# iris 데이터 확인하기
head(iris)  # 처음 6개의 행 출력

save.image(file = "ALL.RData")
load("ALL.RData")

#저장된 객체 목록 확인
ls()

sink("output.txt")
x <- 1
y <- 2
x
y
x + y
sink()

library(ggplot2)
p <- ggplot(ToothGrowth, aes(x=dose, y=len)) + geom_boxplot()
p


pdf("myplot.pdf") #pdf로 출력하기

p <- ggplot(ToothGrowth, aes(x=dose, y=len)) + geom_boxplot() #그래프 그리기
print(p) #그림 파일로 출력하기
dev.off() #R과 그림파일 연결 끊기

#'
#batch.R 파일 생성
pdf("xh.pdf")
hist(rnorm(100))
dev.off()
#'

### R 기초 중에 기초

a <- 3
a
print(a)
b <- 4.5
c<- a+b
z=c(1,2,3)
print(z)
mean(z)
one <- 100
two <- 75
three <- 80
four <- NA
is.na(one)
is.na(four)
gender <- factor("m", c("m","f"))
gender
gender2 <- factor("성별", c("남성","여성"))
gender2
season <- factor("season", c("spring","summer","fall","winter"))
season
nlevels(season)
levels(season)
str(iris)
nlevels(iris$Species)
levels(iris$Species)



1:5
9:-2
seq(from=0, to=20, b=2)


rep(1,time=5)
rep(1:4, each=2)

A<-paste("a","b","c",sep="-") 
paste(A, c("e","f"))
paste(A,10,sep="")

Sys.Date()
Sys.time()
date()
format(Sys.Date(), "%Y")
format(Sys.Date(), "%y")
format(Sys.Date(), "%m")
format(Sys.Date(), "%b")
format(Sys.Date(), "%d")
format(Sys.Date(), "%a")


#R 프로그래밍 시 자주 하는 실수
X< -pi

sum<-1+2+3
+4+5
sum

n<-5;
1:n+1
1:(n+1)


a<-c(9,10,11);
mean(a)
mean(9,10,11)

# 데이터를 넣고 꺼내는 방법
x <- c("a", "b", "c")
print(x)
x[1:2]
x[2:3]


# 리스트는 list(키=값, 키=값, ...) 형태로 데이터를 나열해 정의한다.
x <- list(name="foo", height=70)
x
x$name
x[[1]]

d <- data.frame(x=c(1, 2, 3, 4, 5), y=c(6,7,8,9,10)) 
d
d$x
d$y
d[1,]
d[,1]
d[c(1,3),2]
d[-1,-c(2,3)]
d[-1,-c(2)]



#############################
# 데이터 조작 기초
#############################

num <- scan()
num

sum(num)

# 실습: 키보드로 문자 입력하기 
name <- scan(what = character())

name


getwd()
setwd("C:/DEV/r-workspaces/data")
student <- read.table(file = "student.txt")
student

names(student) <- c("번호", "이름", "키", "몸무게")
student

student2 <- read.csv(file = "student4.txt",sep = ",",na.strings = "-",fileEncoding = "euc-kr")
student2

install.packages("readxl")
library(readxl)
student3 <- read_excel(path = "studentexcel.xlsx",sheet="student")

student3

# txt 파일에 저장
write.table(student, "studentw.txt", row.names = FALSE)
# csv 파일에 저장
write.csv(student2, "student2w.csv", row.names = F, quote = F)
# excel 파일에 저장
install.packages("writexl")

library(writexl)
write_xlsx(x=student3, path="student3w.xlsx", col_names = TRUE)


#데이터 구조와 데이터 프레임-1
V<-c(10,20,30); names(V)<-c("Moe","Larry","Curly")
V["Larry"]


#R 원소가 하나인 벡터로 인식 처리
pi
length(pi)

a<-1:9
dim(a)<-c(3,3)
a


b<-1:12
dim(b)<-c(2,3,2)
b

###########################################

##R을 이용한 제조 데이터 분석을 수행해 보기 -일부 소스코드 제공

install.packages("party")
library(party)
install.packages("readxl")
library(readxl)
install.packages("dplyr")
library(dplyr)
setwd("C:/DEV/r-workspaces")
GE_PBA_A_검사서_2022_04_19<-read_excel(path="data/2022-04-19_GE_PBA_A_검사서.xlsx",sheet = "BFT")
GE_PBA_A_검사서_2022_04_20<-read_excel(path="data/2022-04-20_GE_PBA_A_검사서.xlsx",sheet = "BFT")
head(GE_PBA_A_검사서_2022_04_19)
head(GE_PBA_A_검사서_2022_04_20)
str(GE_PBA_A_검사서_2022_04_19)
str(GE_PBA_A_검사서_2022_04_20)
names(GE_PBA_A_검사서_2022_04_19)
names(GE_PBA_A_검사서_2022_04_20)
dim(GE_PBA_A_검사서_2022_04_19)
dim(GE_PBA_A_검사서_2022_04_20)
GE_PBA_A_검사서<-bind_rows(GE_PBA_A_검사서_2022_04_19,GE_PBA_A_검사서_2022_04_20)
dim(GE_PBA_A_검사서)
write.csv(GE_PBA_A_검사서, "data/GE_PBA_A_검사서.csv", row.names = F, quote = F)
GE_PBA_A_검사서<-read.csv(file = "data/GE_PBA_A_검사서.csv",sep = ",",na.strings = "-",fileEncoding = "euc-kr")
head(GE_PBA_A_검사서)
tail(GE_PBA_A_검사서)
dim(GE_PBA_A_검사서)
str(GE_PBA_A_검사서)
names(GE_PBA_A_검사서)

install.packages("caret")
library(caret)



################3

library(dplyr)

# One-Hot Encoding

# 데이터 생성
set.seed(0614)
data <- data.frame(Num = seq(1,100, by=1),
                   Variables = sample(c("a", "b", "c"), 100, replace=T)
)

data$Variables <- as.factor(data$Variables) # Variables 변수를 factor 처리
str(data)

data %>% head()

# [방법1]
## caret 패키지 활용 -> 머신러닝에서 자주 이용
library(caret)
dummy <- dummyVars("~.", data = data)

data2 <- data.frame(predict(dummy, newdata = data))

data2 %>% head() # 변수명이 Variables.(?) 로 바뀌고 원핫인코딩

# [방법2]
## reshape2 패키지 활용
library(reshape2) # 데이터 정제 및 변환에 유용한 패키지

data3 <- dcast(data=data, Num~Variables, length)
data3 %>% head() # levels 값들을 변수명으로 바뀌면서 원핫인코딩

######################
dmy <- dummyVars(~Result, data = GE_PBA_A_검사서)
GE_PBA_A_검사서_dmy <- data.frame(predict(dmy, newdata = GE_PBA_A_검사서))
head(GE_PBA_A_검사서_dmy)

GE_PBA_A_검사서_new <- cbind(GE_PBA_A_검사서,GE_PBA_A_검사서_dmy)
head(GE_PBA_A_검사서_new)
write.csv(GE_PBA_A_검사서_new, "data/GE_PBA_A_검사서_new.csv", row.names = F, quote = F)
GE_PBA_A_검사서_new<-read.csv(file = "data/GE_PBA_A_검사서_new.csv",sep = ",",na.strings = "-",fileEncoding = "euc-kr")
head(GE_PBA_A_검사서_new)
class(GE_PBA_A_검사서_new$ResultOK)
length(GE_PBA_A_검사서_new$ResultOK)
table(GE_PBA_A_검사서_new$ResultOK)

str(GE_PBA_A_검사서_new)

# 필요한 열을 적절한 데이터 타입으로 변환
GE_PBA_A_검사서_new$ResultOK <- as.factor(GE_PBA_A_검사서_new$ResultOK)
GE_PBA_A_검사서_new$BLE.RSSI <- as.numeric(GE_PBA_A_검사서_new$BLE.RSSI)
GE_PBA_A_검사서_new$ATIVECURR <- as.numeric(GE_PBA_A_검사서_new$ATIVECURR)
GE_PBA_A_검사서_new$STANBYCURR <- as.numeric(GE_PBA_A_검사서_new$STANBYCURR)
GE_PBA_A_검사서_new$IR.Current <- as.numeric(GE_PBA_A_검사서_new$IR.Current)
GE_PBA_A_검사서_new$IR.LED <- as.numeric(GE_PBA_A_검사서_new$IR.LED)
GE_PBA_A_검사서_new$ACC_X <- as.numeric(GE_PBA_A_검사서_new$ACC_X)
GE_PBA_A_검사서_new$ACC_Y <- as.numeric(GE_PBA_A_검사서_new$ACC_Y)
GE_PBA_A_검사서_new$ACC_Z <- as.numeric(GE_PBA_A_검사서_new$ACC_Z)

str(GE_PBA_A_검사서_new)


formula <- ResultOK ~ BLE.RSSI + ATIVECURR + STANBYCURR + IR.Current + IR.LED + ACC_X + ACC_Y + ACC_Z
GE_PBA_A_검사서_ctree <- ctree(formula, data = GE_PBA_A_검사서_new)
GE_PBA_A_검사서_ctree
plot(GE_PBA_A_검사서_ctree)


############################################
########학습데이터와 검정데이터 샘플링

idx <- sample(1:nrow(GE_PBA_A_검사서_new), nrow(GE_PBA_A_검사서_new) * 0.7)
train <- GE_PBA_A_검사서_new[idx, ]
test <- GE_PBA_A_검사서_new[-idx, ]

formula <- ResultOK ~ BLE.RSSI + ATIVECURR + STANBYCURR + IR.Current + IR.LED + ACC_X + ACC_Y + ACC_Z

GE_PBA_A_검사서_new_ctree <- ctree(formula, data = train)
GE_PBA_A_검사서_new_ctree

plot(GE_PBA_A_검사서_new_ctree, type = "simple")

plot(GE_PBA_A_검사서_new_ctree)

####################
pred <- predict(GE_PBA_A_검사서_new_ctree, test)
table(pred, test$ResultOK)
(14 + 16 + 13) / nrow(test)
##########################


###################################
######랜덤 포레스트 
urlPackage <- "https://cran.r-project.org/src/contrib/Archive/randomForest/randomForest_4.6-14.tar.gz"
install.packages(urlPackage, repos=NULL, type="source")
library(randomForest)


model <- randomForest(ResultOK ~ BLE.RSSI + ATIVECURR + STANBYCURR + IR.Current + IR.LED + ACC_X + ACC_Y + ACC_Z, data = GE_PBA_A_검사서_new)
model

varImpPlot(model)

## 끝

#############################
# 데이터 마트
# 파생변수
#############################

# 실습: 파생변수 생성하기 
# 단계 1: 데이터 파일 가져오기
setwd("C:/DEV/r-workspaces/day-20220501/data")
install.packages("reshape2")
user_data <- read.csv("user_data.csv", header = T,fileEncoding = "euc-kr")
head(user_data)
table(user_data$house_type)

# 단계 2: 파생변수 생성
house_type2 <- ifelse(user_data$house_type == 1 |
                        user_data$house_type == 2, 0 , 1)
house_type2[1:10]

# 단계 3: 파생변수 추가 
user_data$house_type2 <- house_type2
head(user_data)


# 실습: 1:N의 관계를 1:1 관계로 파생변수 생성하기 
# 단계 1: 데이터 파일 가져오기 
pay_data <- read.csv("pay_data.csv", header = T, fileEncoding = "euc-kr")
head(pay_data, 10)
table(pay_data$product_type)

# 단계 2: 고객별 상품 유형에 따른 구매금액과 합계를 나타내는 파생변수 생성
library(reshape2)
product_price <- dcast(pay_data, user_id ~ product_type,
                       sum, na.rm = T)
head(product_price, 3)
# 단계 3: 칼럼명 수정
names(product_price) <- c('user_id', '식표품(1)', '생필품(2)',
                          '의류(3)', '잡화(4)', '기타(5)')
head(product_price)


# 실습: 고객식별번호(user_id)에 대한 지불유형(pay_method)의 파생변수 생성하기 
# 단계 1: 고객별 지불유형에 따른 구매상품 개수를 나타내는 팡생변수 생성
pay_price <- dcast(pay_data, user_id ~ pay_method, length)
head(pay_price, 3)

# 단계 2: 칼럼명 변경하기 
names(pay_price) <- c('user_id', '현금(1)', '직불카드(2)', 
                      '신용카드(3)', '상품권(4)')
head(pay_price, 3)

# 실습: 고객정보(user_data) 테이블에 파생변수 추가하기 
# 단계 1: 고객정보 테이블과 고객별 상품 유형에 따른
#         구매금액 합계 병합하기 
library(plyr)
user_pay_data <- join(user_data, product_price, by = 'user_id')
head(user_pay_data, 10)

# 단계 2: [단계 1]의 병합 결과를 대상으로 고객별 지불유형에 따르 ㄴ
#         구매상품 개수 병합하기 
user_pay_data <- join(user_pay_data, pay_price, by = 'user_id')
user_pay_data[c(1:10), c(1, 7:15)]


# 실습: 사칙연산으로 총 구매금액 파생변수 생성하기 
# 단계 1: 고객별 구매금액의 합계(총 구매금액) 계산하기 
user_pay_data$총구매금액 <- user_pay_data$`식표품(1)` +
  user_pay_data$`생필품(2)` +
  user_pay_data$`의류(3)` +
  user_pay_data$`잡화(4)` +
  user_pay_data$`기타(5)`

# 단계 2: 고객별 상품 구매 총금액 칼럼 확인하기 
user_pay_data[c(1:10), c(1, 7:11, 16)]


# 실습: 정제된 데이터 저장하기 
print(user_pay_data)

setwd("C:/DEV/r-workspaces/day-20220501/data")
write.csv(user_pay_data, "cleanData.csv", quote = F, row.names = F)

data <- read.csv("cleanData.csv", header = TRUE)
data


#############################
# Reshape 활용
#############################

install.packages("reshape")
library(reshape)
head(airquality)
melt(airquality, id=c("Month","Day"), na.rm=T)

# id를 기준으로 나머지 변수들을 variable이란 이름의 데이터로 변환
# 결측치 제거
aqm = melt(airquality, id = c("Month", "Day"), na.rm=TRUE)

# 상위 6개 출력
head(aqm)

cast(aqm, Day~Month~variable)


#sqldf를 이용한 데이터 분석
install.packages("sqldf")
library(sqldf)
sqldf("select * from iris")
sqldf("select * from iris limit 10")
sqldf("select * from iris where Species like 'se%'")

#
install.packages("data.table")
library(data.table)
DF <- data.frame(x = runif(2.6e+07), y = rep(LETTERS, each = 10000))
df <- data.frame(x = runif(2.6e+07), y = rep(letters, each = 10000))
system.time(x <- DF[DF$y == "C", ])
DT <- as.data.table(DF)
setkey(DT, y)
system.time(x <- DT[J("C"), ])


# 

require(ggplot2)
data("diamonds")
dia.data <- diamonds
head(dia.data)
summary(dia.data)

#
install.packages("klaR")
library(klaR)
iris2<-iris[,c(1,3,5)]
plineplot(Species ~., data=iris2, method="lda", x=iris[,4], xlab="Petal.Width")



# 실습: dplyr 패키지와 hflight 데이터 셋 설치 
install.packages(c("dplyr", "hflights"))
library(dplyr)
library(hflights)

str(hflights)

# 실습: tbl_df() 함수 사용하기 
hflights_df <- tbl_df(hflights)
hflights_df


# 실습: hflights_df를 대상으로 특정일의 데이터 추출하기 
filter(hflights_df, Month == 1 & DayofMonth == 2)  # 1월 2일 데이터 추출


# 실습: hflights_df를 대상으로 지정된 월의 데이터 추출하기 
filter(hflights_df, Month == 1 | Month == 2) # 1월 또는 2월 데이터 추출


# 실습: hflights_df를 대상으로 데이터 정렬하기 
arrange(hflights_df, Year, Month, DepTime, ArrTime)

# 실습: hflights_df를 대상으로 지정된 칼럼 데이터 검색하기 
select(hflights_df, Year, Month, DepTime, ArrTime)

# 실습: hflights_df를 대상으로 칼럼의 범위로 검색하기 
select(hflights_df, Year:ArrTime)

# 실습: hflights_df에서 출발 지연시간과 도착 지연시간의 차이를 계산한 칼럼 추가하기 
mutate(hflights_df, gain = ArrTime - DepTime, 
       gain_per_hour = gain / (AirTime / 60))


# 실습: mutate() 함수에 의해 추가된 칼럼 보기 
select(mutate(hflights_df, gain = ArrDelay - DepDelay, 
              gain_per_hour = gain / (AirTime / 60)),
       Year, Month, ArrDelay, DepDelay, gain, gain_per_hour)


# 실습: hflights_df에서 비행시간의 평균 구하기 
summarise(hflights_df, avgAirTime = mean(AirTime, na.rm = TRUE))
# hflights_df %>% summarise(avgAirTime = mean(AirTime, na.rm = TRUE))

# 실습: hflights_df의 관측치 길이 구하기 
summarise(hflights_df, cnt = n(), 
          delay = mean(AirTime, na.rm = TRUE))


# 실습: 도착시간(ArrTime)의 표준편차와 분산 계산하기 
summarise(hflights_df, arrTimeSd = sd(ArrTime, na.rm = TRUE),
          arrTimeVar = var(ArrTime, na.rm = T))



# 실습: 공통변수를 이용하여 내부조인(inner_join)하기
# 단계 1: join 실습용 데이터프레임 생성
df1 <- data.frame(x = 1:5, y = rnorm(5))
df2 <- data.frame(x = 2:6, z = rnorm(5))

df1

df2

# 단계 2: inner_join 하기 
inner_join(df1, df2, by = 'x')

# 실습: 공통변수를 이용하여 왼쪽 조인(left_join)하기
left_join(df1, df2, by = 'x')

# 실습: 공통변수를 이용하여 오른쪽 조인(right_join)하기
right_join(df1, df2, by = 'x')


# 실습: 공통변수를 이용하여 전체 조인(full_join)하기
full_join(df1, df2, by = 'x')


# 실습: 두 개의 데이터프레임을 행 단위로 합치기 
# 단계 1: 실습을 위한 데이터프레임 생성
df1 <- data.frame(x = 1:5, y = rnorm(5))
df2 <- data.frame(x = 6:10, y = rnorm(5))

df1

df2

# 단계 2: 데이터프레임 합치기 
df_rows <- bind_rows(df1, df2)
df_rows


# 실습: 두 개의 데이터프레임을 열 단위로 합치기 
df_cols <- bind_cols(df1, df2)
df_cols

#############################
# 데이터 탐색(EDA와 시각화) 기초
#############################

# 실습: 실습용 데이터 가져오기 
getwd()
setwd("C:/DEV/r-workspaces/day-20220501/data")
dataset <- read.csv("dataset.csv", header = T)
dataset

# 실습: 전체 데이터 보기 
print(dataset)
View(dataset)

# 실습: 데이터의 앞부분과 뒷부분 보기 
head(dataset)
tail(dataset)

# 실습: 데이터 셋 구조 보기 
names(dataset)
attributes(dataset)
str(dataset)


# 다양한 방법으로 데이터 셋 조회하기 
# 단계 1: 데이터 셋에서 특정 변수 조회하기 
dataset$age
dataset$resident
length(dataset$age)

#단계 2: 특정 변수으 조회 결과를 변수에 저장하기 
x <- dataset$gender
y <- dataset$price

x
y

# 단계 3: 산점도 그래프로 변수 조회
plot(dataset$price)

# 단계 4: 칼럼명을 사용하여 특정 변수 조회
dataset["gender"]
dataset["price"]


# 단계 5: 색인을 사용하여 특정 변수 조회
dataset[2]
dataset[6]
dataset[3, ]
dataset[ , 3]

# 단계 6: 2개 이상의 칼럼 조 
dataset[c("job", "price")]
dataset[c(2, 6)]
dataset[c(1, 2, 3)]
dataset[c(2, 4:6, 3, 1)]


#단계 7: 특정행/열을 조회
dataset[ , c(2:4)]
dataset[c(2:4), ]
dataset[-c(1:100), ]



#############################
# 변수간의 관계 분석과 시각화
#############################

## Anscombe's Quartet of ‘Identical’ Simple Linear Regressions

# yet are quite different. 

# 데이터 구조
str(anscombe)

# 데이터 view
anscombe

# 변수별 평균, 표준편차
options(digits = 2) # 소수점 자리 설정

sapply(anscombe, mean) # mean

sapply(anscombe, sd) # standard deviation

# x, y 상관계수 (x, y correlation)
attach(anscombe)
cor(x1, y1)

cor(x2, y2)

cor(x3, y3)

cor(x4, y4)

detach(anscombe) 

# Simple Linear Regrassions by 4 groups
attach(anscombe)

lm(y1 ~ x1)

lm(y2 ~ x2)

lm(y3 ~ x3)

lm(y4 ~ x4)

# Scatter Plot & Simple Linear Regression Line
par(mfrow = c(2,2)) # 2 x 2 layout
attach(anscombe)

plot(x1, y1); abline(lm(y1~x1), col = "blue", lty = 3)
plot(x2, y2); abline(lm(y2~x2), col = "blue", lty = 3)
plot(x3, y3); abline(lm(y3~x3), col = "blue", lty = 3)
plot(x4, y4); abline(lm(y4~x4), col = "blue", lty = 3)> 
  detach(anscombe)

########################
# 실습: 범주형 vs 범주형 데이터 분포 시각화 
# 단계 1: 실습을 위한 데이터 가져오기 
setwd("C:/DEV/r-workspaces/day-20220501/data")
new_data <- read.csv("new_data.csv", header = TRUE)
str(new_data)

# 단계 2: 코딩 변경된 거주지역(resident) 칼럼과 성별(gender) 칼럼을
#         대상으로 빈도수 구하기 
resident_gender <- table(new_data$resident2, new_data$gender2)
resident_gender
gender_resident <- table(new_data$gender2, new_data$resident2)
gender_resident

# 단계 3: 성별(gender)에 따른 거주지역(resident)의 분포 현황 시각화 
barplot(resident_gender, beside = T, horiz = T, 
        col = rainbow(5), 
        legend = row.names(resident_gender), 
        main = '성별에 따른 거주지역 분포 현황')

# 단계 4: 거주지역(resident)에 따른 성별(gender)의 분포 현황 시각화 
barplot(gender_resident, beside = T, 
        col = rep(c(2, 4), 5), horiz = T, 
        legend = c("남자", "여자"),
        main = '거주지역별 성별 분포 현황')

# 실습: 연속형 vs 범주형 데이터의 시각화 
# 단계 1: lattice 패키지 설치와 메모리 로딩 및 데이터 준비
install.packages("lattice")
library(lattice)

# 단계 2: 직업 유형에 따른 나이 분포 현황
densityplot(~ age, data = new_data, 
            groups = job2, 
            # plot.points = T: 밀도, auto.key = T: 범례)
            plot.points = T, auot.key = T)


# 실습: 연속형 vs 범주형 vs 범주형
# 단계 1: 성별에 따른 직급별 구매비용 분석
densityplot(~ price | factor(gender), 
            data = new_data, 
            groups = position2, 
            plot.points = T, auto.key = T)


# 단계 2: 직급에 따른 성별 구매비용 분석
densityplot(~ price | factor(position2), 
            data = new_data, 
            groups = gender2, 
            plot.points = T, auto.key = T)


# 실습: 연속형(2개) vs 범주형(1개) 데이터 분포 시각화 
xyplot(price ~ age | factor(gender2), 
       data = new_data)



#############################
# 데이터 정제 - 결측치 인식
#############################


# 실습: summary() 함수를 사용하여 결측치 확인하기
summary(dataset$price)
sum(dataset$price)

# 실습: sum() 함수의 속성을 이용하여 결측치 제거하기 
sum(dataset$price, na.rm = T)

# 실습: 결측치 제거 함수를 이용하여 결측치 제거 
price2 <- na.omit(dataset$price)
sum(price2)
length(price2)


# 실습: 결측치를 0으로 대체하기 
x <- dataset$price
x[1:30]
dataset$price2 = ifelse(!is.na(x), x, 0)
dataset$price2[1:30]


# 실습: 결측치를 평균으로 대체하기 
x <- dataset$price
x[1:30]
dataset$price3 = ifelse(!is.na(x), x, round(mean(x, na.rm = TRUE), 2))
dataset$price3[1:30]
dataset[c('price', 'price2', 'price3')]

#############################
# 데이터 정제 - 이상치 극단치
#############################
################### 
# 실습: 범주형 변수의 극단치 처리하기 
table(dataset$gender)
pie(table(dataset$gender))


# 실습: subset() 함수를 사용하여 데이터 정제하기 
dataset <- subset(dataset, gender == 1 | gender == 2)
dataset
length(dataset$gender)
pie(table(dataset$gender))
pie(table(dataset$gender), col = c("red", "blue"))


# 실습: 연속형 변수의 극단치 보기 
dataset <- read.csv("dataset.csv", header = T)
dataset$price
length(dataset$price)
plot(dataset$price)
summary(dataset$price)

# 실습: price 변수의 데이터 정제와 시각화 
dataset2 <- subset(dataset, price >= 2 & price <= 8)
length(dataset2$price)
stem(dataset2$price)

# 실습: age 변수의 데이터 정제와 시각화 
# 단계 1: age 변수에서 NA 발견
summary(dataset2$age)
length(dataset2$age)

# 단계 2: age 변수 정제(20 ~ 69)
dataset2 <- subset(dataset2, age >= 20 & age <= 69)
length(dataset2)

# 단계 3: box 플로팅으로 평균연령 분석
boxplot(dataset2$age)

#############################
# 통계분석 
#############################
# 샘플링
# 단순 임의 추출(Random Sampling)-비복원추출

sample(1:10, 5)

sample(1:10, 5, replace = FALSE)

sample(1:10, 5, replace = FALSE)

sample(1:10, 5, replace = FALSE)

sample(1:10, 5)

sample(1:10, 5)

sample(1:10, 5)

# 단순 임의 추출(Random Sampling)- 복원추출


sample(1:10, 5, replace = TRUE)

sample(1:10, 5, replace = TRUE)

sample(1:10, 5, replace = T)

sample(1:10, 5, replace = T)

# 실습: 표본 샘플링


# 단계 1: 표본 추출하기 
nrow(data)
choice1 <- sample(nrow(data), 30)
choice1

# 50 ~ (data 길이) 사이에서 30개 행을 무작위 추출
choice2 <- sample(50:nrow(data), 30)
choice2

# 50~100 사이에서 30개 행을 무작위 추출 
choice3 <- sample(c(50:100), 30)
choice3

# 다양한 범위를 지정하여 무작위 샘플링
choice4 <- sample(c(10:50, 80:150, 160:190), 30)
choice4

# 단계 2: 샘플링 데이터로 표본추출
data[choice1, ]


# 실습: iris 데이터 셋을 대상으로 7:3 비율로 데이터 셋 생성하기 
# 단계 1: iris 데이터 셋의 관측치와 칼럼 수 확인
data("iris")
dim(iris)


# 단계 2: 학습 데이터*70%), 검정 데이터(30%) 비율로 데이터 셋 구성
idx <-sample(1:nrow(iris), nrow(iris) * 0.7)
training <- iris[idx, ]
testing <- iris[-idx, ]
dim(training)



# 실습: 데이터 셋을 대상으로 K겹 교차 검정 데이터 셋 생성하기 
# 단계 0: 교차 검정을 위한 패키지 설치 
install.packages("cvTools")
library(cvTools)

# 단계 1: 데이터프레임 생성
name <- c('a', 'b','c', 'd', 'e', 'f')
score <- c(90, 85, 99, 75, 65, 88)
df <- data.frame(Name = name, Score = score)

# 단계 2: K겹 교차 검정 데이터 셋 생성
cross <- cvFolds(n = 6, K = 3, R = 1, type = "random")
cross

# 단계 3: K겹 교차 검정 데이터 셋 구조 보기 
str(cross)
cross$which

# 단계 4: subsets 데이터 참조하기 
cross$subsets[cross$which == 1, 1]
cross$subsets[cross$which == 2, 1]
cross$subsets[cross$which == 3, 1]

# 단계 5: 데이터프레임의 관측치 적용하기 
r = 1
K = 1:3
for(i in K) {
  datas_idx <- cross$subsets[cross$which == i, r]
  cat('K = ', i, '검정데이터 \n')
  print(df[datas_idx, ])
  
  cat('K = ', i, '훈련데이터 \n')
  print(df[-datas_idx, ])
}

#############################
# 통계분석 
#############################
# 일표본 T검정-t.test

women$weight
mean(women$weight)
t.test(women$weight, mu=130, alternative="greater")


women$height
mean(women$height)
t.test(women$height, mu=70, alternative="less")


var.test(sleep$extra ~ sleep$group)
t.test(sleep$extra ~ sleep$group, alternative="greater", var.equal=TRUE)
t.test(sleep$extra ~ sleep$group, alternative="less", var.equal=TRUE)
t.test(sleep$extra ~ sleep$group, alternative="two.sided", var.equal=TRUE)

### 분산분석


data(anorexia,package="MASS")
anorexia 
out1=aov(Postwt~Treat,
         data=anorexia
)
out1 
summary(out1)


out2=anova(lm(Postwt~Treat,data=anorexia))
out2


out3=oneway.test(Postwt~Treat,data=anorexia)
out3

out4=oneway.test(Postwt~Treat,data=anorexia,var.equal = TRUE)
out4


#############################
# 통계분석 
#############################
# 상관분석

install.packages("corrplot")
library(corrplot)
install.packages("lattice")
library(lattice) 
mcor2=cor(mtcars$gear,
          mtcars$carb)
mcor2
xyplot(gear~carb,data=mtcars)
mcor=cor(mtcars)
mcor
round(mcor,2)
corrplot(mcor)
plot(mtcars)


data(mtcars)
a <- mtcars$mpg
b <- mtcars$hp
cor(a,b)
cov(a,b)
cor.test(a, b, method = "pearson")

#############################
# 회귀분석
#단순 선형 회귀분석 : 
x <- c(19, 23, 26, 29, 30, 38, 39, 46, 49)
y <- c(33, 51, 40, 49, 50, 69, 70, 64, 89)
lm(y ~ x)
summary(lm(y ~ x))

#
library(MASS)
attach(Cars93)
lm(Price~EngineSize+RPM+Weight, data=Cars93)
summary(lm(Price~EngineSize+RPM+Weight, data=Cars93))

#
library(boot)
data(nodal)
a <- c(2,4,6,7)
data <- nodal[,a]
glmModel <- glm(r~., data=data, family = "binomial")
summary(glmModel)

#최적화 회귀 방정식의 사례 : pp.321-326
#변수 선택법 예제(유의확률 기반)
#1)데이터 프레임 생성
x1 <- c(7, 1, 11, 11, 7, 11, 3, 1, 2, 21, 1, 11, 10)
x2 <- c(26, 29, 56, 31, 52, 55, 71, 31, 54, 47, 40, 66, 68)
x3 <- c(6, 15, 8, 8, 6, 9, 17, 22, 18, 4, 23, 9, 8)
x4 <- c(60, 52, 20, 47, 33, 22, 6, 44, 22, 26, 34, 12, 12)
y <- c(78.5, 74.3, 104.3, 87.6, 95.9, 109.2, 102.7, 72.5, 93.1, 115.9, 83.8, 113.3, 109.4)

df <- data.frame(x1, x2, x3, x4, y)
head(df)

#2)회귀모형 생성
a <- lm(y ~ x1 + x2 + x3 + x4, data = df)
summary(a)

#3)유의확률이 가장 높은 변수를 제거하고 다시 회귀모형을 생성
b <- lm(y ~ x1 + x2 + x4, data = df)
summary(b)

#4)유의확률이 가장 높은 변수를 제거하고 다시 회귀모형을 생성
c <- lm(y ~ x1 + x2, data = df)
summary(c)

#변수 선택법 예제(벌점화 전진선택법)
step(lm(y~1, data = df), scope = list(lower=~1, upper = ~x1+x2+x3+x4), direction = "forward")


#후진제거법에서 AIC를 이용한 변수선택
#install.packages("ElemStatLearn") install Error
library(ElemStatLearn)
Data = prostate
data.use = Data[, -ncol(Data)]
lm.full.Model = lm(lpsa~., data = data.use)
backward.aic = step(lm.full.Model, lpsa~1, direction = "backward")

#############################
# 통계분석 
#############################
# 시계열 분석
#1)분해 시계열
#가) 자료 읽기 및 그래프 그리기

install.packages('tseries')
install.packages("forecast")
library(tseries)
library(forecast)
library(TTR)
king <- scan("http://robjhyndman.com/tsdldata/misc/kings.dat",skip = 3)
king.ts <-  ts(king)
plot.ts(king.ts)

#나) 3년마다 평균을 내서 그래프를 부드럽게 표현
king.sma3 <- SMA(king.ts, n=3)
plot.ts(king.sma3)

#다) 8년마다 평균을 내서 그래프를 부드럽게 표현
king.sma8 <- SMA(king.ts, n=8)
plot.ts(king.sma8)

#2)ARIMA 모델
#가) 개요 : ARIMA(p,1,q)모델이며 차분을 1번 해야 정상성을 만족한다.
king.ff1 <- diff(king.ts, differences = 1)
plot.ts(king.ff1)

#나) ACF와 PACF를 통한 적합한 ARIMA 모델 결정.
#ACF
acf(king.ff1, lag.max = 20)
acf(king.ff1, lag.max = 20, plot = FALSE)

#PACF
pacf(king.ff1, lag.max = 20)
pacf(king.ff1, lag.max = 20, plot = FALSE)

#다) 적절한 ARIMA 모형 찾기.
auto.arima(king)

#라) 예측.
king.arima <- arima(king, order = c(0,1,1))
king.forecasts <- forecast(king.arima)
king.forecasts

#############################
# 통계분석 
#############################
# 다차원 척도법
#가) 계량적 MDS
library(MASS)
loc <- cmdscale(eurodist)
x <- loc[,1]
y <- -loc[,2]
plot(x,y, type="n",asp=1, main="Metric MDS")
text(x,y,rownames(loc),cex = 0.7)
abline(v=0, h=0, lty=2, lwd=0.5)

#나) 비계량적 MDS
#isoMDS
library(MASS)
data(swiss)
swiss.x <- as.matrix(swiss[,-1])
swiss.dist <- dist(swiss.x)
swiss.mds <- isoMDS(swiss.dist)
plot(swiss.mds$points, type="n")

text(swiss.mds$points, labels=as.character((1:nrow(swiss.x))))
abline(v=0, h=0, lty=2, lwd=0.5)


#sammon
swiss.x <- as.matrix(swiss[,-1])
swiss.sammon <- sammon(dist(swiss.x))
plot(swiss.sammon$points, type="n")
text(swiss.sammon$points, labels=as.character((1:nrow(swiss.x))))
abline(v=0, h=0, lty=2, lwd=0.5)

#############################
# 통계분석 
#############################
# 주성분
#가) 4개의 변수들 간의 산점도
library(datasets)
data("USArrests")
pairs(USArrests, panel = panel.smooth, main = "USArrests data")

#나) 요약
US.prin <- princomp(USArrests, cor = TRUE)
summary(US.prin)
screeplot(US.prin, npcs = 4, type = "lines")

#다) 가중치 제시
loadings(US.prin)

#라) 각 지역별 결과
US.prin$scores

#마) 제 1-2주성분에 의한 행렬도
arrests.pca <- prcomp(USArrests, center = TRUE, scale. = TRUE)
biplot(arrests.pca, scale = 0)


#############################
# 데이터 마이닝
#############################
# ROC실습 코드
library(rpart)
library(party)
library(ROCR)
x <- kyphosis[sample(1:nrow(kyphosis), nrow(kyphosis), replace=F),]
x.train <- kyphosis[1:floor(nrow(x)*0.75),]
x.evaluate <- kyphosis[floor(nrow(x)*0.75):nrow(x),]
x.model <- cforest(Kyphosis~Age+Number+Start, data = x.train)
x.evaluate$prediction <- predict(x.model, newdata=x.evaluate)
x.evaluate$correct <- x.evaluate$prediction == x.evaluate$Kyphosis
print(paste("% of predicted classification corect",mean(x.evaluate$correct)))
x.evaluate$probalilities <- 1- unlist(treeresponse(x.model, newdata=x.evaluate), use.names = F)[seq(1,nrow(x.evaluate)*2,2)]
pred <- prediction(x.evaluate$probalilities, x.evaluate$Kyphosis)
perf <- performance(pred, "tpr", "fpr")
plot(perf, main="ROC Curve", colorize=T)

perf <-performance(pred, "lift", "rpp")
plot(perf, main="Lift Curve", colorize=T)

# New York 대기 온도에 영향을 미치는 변수 알아보기
install.packages("party")
library(party)
#install.packages("datasets")
library(datasets)
str(airquality)
formula <- Temp ~ Solar.R + Wind + Ozone
air_ctree <- ctree(formula, data = airquality)
air_ctree
plot(air_ctree)

#############################
# 데이터 마이닝
#############################
# 분류분석

# install.packages("party")
#set.seed(1234)
library(party)
idx <- sample(1:nrow(iris), nrow(iris) * 0.7)
train <- iris[idx, ]
test <- iris[-idx, ]
formula <- Species ~ Sepal.Length + Sepal.Width + Petal.Length + Petal.Width
iris_ctree <- ctree(formula, data = train)
iris_ctree
plot(iris_ctree, type = "simple")
plot(iris_ctree)
pred <- predict(iris_ctree, test)
table(pred, test$Species)
(12 + 16 + 15) / nrow(test)

# caret 패키지 설치
install.packages("caret")

# caret 패키지 불러오기
library(caret)

confusionMatrix(pred, test$Species)

#############################
# 데이터 마이닝
#############################
# 회귀분석

lm_fit <- lm(hp ~ cyl, data=mtcars) 
summary(lm_fit)
plot(mtcars$cyl, mtcars$hp)   # scatter plot
abline(lm_fit)          # line

###회귀선이 0점을 지나도록 추가 작업
lm_fit_0 <- lm(hp ~ cyl+0, data=mtcars)
summary(lm_fit_0)
plot(mtcars$cyl, mtcars$hp, xlim=c(0,8), ylim=c(-60, 350))
abline(lm_fit_0)


#R을 이용한 로지스틱 회귀분석 실습 코드:
a <- iris[iris$Species=="setosa" | iris$Species=="versicolor",]
b <- glm(Species ~ Sepal.Length, data=a, family = binomial)
summary(b)

#############################
# 데이터 마이닝
#############################
# 의사결정나무 실습 코드

#iris 데이터 셋
idx <- sample(2, nrow(iris), replace = TRUE, prob = c(0.7, 0.3))
train.data <- iris[idx==1,]
test.data <- iris[idx==2,]

#train.data를 이용하여 모형생성
iris.tree <- ctree(Species~., data=train.data)
plot(iris.tree)

plot(iris.tree, type="simple")



###

library(rpart)
install.packages("rpart.plot")

library(rpart.plot)

data(iris)
rpart_model <- rpart(Species ~ ., data = iris)
rpart_model

rpart.plot(rpart_model)




#예측된 데이터와 실제 데이터의 비교
table(predict(iris.tree), train.data$Species)


#테스트 데이터를 적용하여 정확성 확인
test.pre <- predict(iris.tree, newdata=test.data)
table(test.pre, test.data$Species)

#############################
# 데이터 마이닝
#############################
# 랜덤포레스트 실습 코드

###
install.packages("randomForest")

library(randomForest)

data(iris)

model1 <- randomForest(Species ~ ., data = iris)
model1

model2 <- randomForest(Species ~ ., data = iris, ntree = 300, mtry = 4, na.action = na.omit)
model2

model3 <- randomForest(Species ~ ., data = iris, importance = T, na.action = na.omit)
importance(model3)



#※ 엔트로피(Entropy): 불확실성 척도
#동전의 앞면(x1)과 뒷면(x2)이 나올 확률이 동일한 경우,
x1 <- 0.5; x2 <- 0.5 
e1 <- -x1 * log2(x1) - x2 * log2(x2)
e1
#앞면이 나올 확률이 더 높은 경우, 
x1 <- 0.7; x2 <- 0.3               
e2 <- -x1 * log2(x1) - x2 * log2(x2)
e2

varImpPlot(model3)



#모형만들기
idx <- sample(2, nrow(iris), replace = TRUE, prob = c(0.7, 0.3))
train.data <- iris[idx==2,]
test.data <- iris[idx==1,]
r.f <- randomForest(Species~., data=train.data, ntree=100, proximity=TRUE)

#오차율 계산하기
table(predict(r.f), train.data$Species)

#그래프 그리기1
plot(r.f)

#그래프 그리기2
varImpPlot(r.f)

#테스트 데이터 예측
pre.rf <- predict(r.f, newdata = test.data)
table(pre.rf, test.data$Species)

plot(margin(r.f, test.data$Species))

#############################
# 데이터 마이닝
#############################
# 다향 분류 xgboost 모델 생성

# 단계 1: 패키지 설치
install.packages("xgboost")
library(xgboost)

# 단계 2: y 변수 생성
iris_label <- ifelse(iris$Species == 'setosa', 0,
                     ifelse(iris$Species == 'versicolor', 1, 2))
table(iris_label)
iris$label <- iris_label

# 단계 3: 데이터 셋 생성
idx <- sample(nrow(iris), 0.7 * nrow(iris))
train <- iris[idx, ] 
test <- iris[-idx, ]

# 단계 4: matrix 객체 변환
train_mat <- as.matrix(train[-c(5:6)])
dim(train_mat)

train_lab <- train$label
length(train_lab)


# 단계 5: xgb.DMatrix 객체 변환
dtrain <- xgb.DMatrix(data = train_mat, label = train_lab)

# 단계 6: model 생성 - xgboost matrix 객체 이용
xgb_model <- xgboost(data = dtrain, max_depth = 2, eta = 1,
                     nthread = 2, nrounds = 2,
                     objective = "multi:softmax", 
                     num_class = 3,
                     verbose = 0)
xgb_model

# 단계 7: testset 생성
test_mat <- as.matrix(test[-c(5:6)])
dim(test_mat)
test_lab <- test$label
length(test_lab)

# 단계 8: model prediction
pred_iris <- predict(xgb_model, test_mat)
pred_iris

# 단계 9: confusion matrix
table(pred_iris, test_lab)

# 단계 10: 모델 성능평가1 - Accuracy
(23 + 12 + 10) / length(test_lab)

# 단계 11: model의 중요 변수(feature)와 영향력 보기 
importance_matrix <- xgb.importance(colnames(train_mat), 
                                    model = xgb_model)
importance_matrix

# 단계 12: 중요 변수 시각화 
xgb.plot.importance(importance_matrix)

#############################
# 데이터 마이닝
#############################
# 군집분석 실습 코드
#Hierarchical Clustering

idx <- sample(1:dim(iris)[1], 40)
iris.s <- iris[idx,]
iris.s$Species <- NULL
hc <- hclust(dist(iris.s), method = "ave")
plot(hc, hang = -1, labels = iris$Species[idx])

#K-means Clustering
data(iris)
newiris <- iris
newiris$Species <- NULL
kc <- kmeans(newiris, 3)
table(iris$Species, kc$cluster)
plot(newiris[c("Sepal.Length", "Sepal.Width")], col=kc$cluster)

#############################
# 데이터 마이닝
#############################
# 연관분석 실습 코드
install.packages("arulesViz")
library(arulesViz) 
data(Groceries)
inspect(Groceries[1:3])
rules <- apriori(Groceries, parameter = list(support=0.01, confidence = 0.3))
inspect(sort(rules, by=c("lift"), decreasing = TRUE)[1:20])
