第2章
sales<-c(15,20,25,10,30)
sales=c(15,20,25,10,30)
assign("sales ",c(15,20,25,10,30))
c(15,20,25,10,30)->sales
length(sales)
fruits<-c("梨","林檎","葡萄","桃","その他")
names(sales)<-fruits
sales

#2.1.2 行列
sales2<-matrix(0,2,5) # 要素が0の2行5列の行列を定義する
sales2[1,]<-c(15,20,25,10,30) # 第1行にデータを入力
sales2[2,]<-c(10,25,20,25,20) # 第2行にデータを入力
sales2 # 行列sales2を表示
dim(sales2) # sales2のサイズを求める
nrow(sales2) # sales2の行数を求める
ncol(sales2)
sales2[2,3]
(sales2[2,3]<-30) # 数値を代入して， その結果を表示する
sales2[2,3]<-20 # 後ほど使用するので元の状態に戻す．
colnames(sales2)<-fruits # 列のラベルをfruitsのとおりにする
rownames(sales2)<-c("A","B") # 行のラベルをA，Bにする
sales2

#2.1.3 データフレーム
DF1<-data.frame(cbind(LETTERS[1:4],3:0))
colnames(DF1)<-c("あ","い") # 列の名前を付ける
DF1
as.matrix(DF1) #データフレームDF1をマトリックスに変換

#2.1.4 配列
(AR1<-array(1:30,c(2,5,3)))

#2.1.5 リスト
L1<-list(c(1:8),c("A","B"),matrix(1:12,2,6))
L1


#2.1.6 データ形式の確認
class(sales) # salesのクラスの属性を返す
class(sales2)
class(DF1)
class(L1)
is.vector(sales) # salesがベクトルであるかを確認

#2.2 エディタによる入力と編集
edit(sales2)
sales3<-edit(sales2)
sum(DF1[,2]) # DF1の第2列の合計を求める
fix(DF1)#質的を量的に変換する
sum(DF1[,2])

#2.3 データファイルを読み込む
#2.3.1 関数read.table による読み込み
data1<-read.table("C:/RW/data1.txt",header=T,row.names=1)

#2.3.2 関数read.csv による読み込み
data1<-read.csv("C:/RW/data1.csv",header=T,row.names=1)

#2.3.3 関数scan による読み込み
scan("C:/RW/data2.txt")
matrix(scan("C:/RW/data2.txt"),3,4)
(data2<-matrix(scan("C:/RW/data2.txt"),3,4,byrow=T))
data3<- scan("C:/RW/data3.txt",list(x=" ", y=0,z=0))
data.frame(data3)

#2.4 データの出力
#2.4.1 関数write による出力
write(data2, "C:/RW/data2_Out1.txt")
write(t(data2), "C:/RW/data2_Out2.txt")
write(t(data2), "C:/RW/data2_Out3.txt",ncolumns=4)
write(t(data2), "C:/RW/data2_Out3.txt",ncolumns=4,append=TRUE)

#2.4.3 関数sink による出力
sink("C:/RW/temp.txt") # ファイルtemp.txtにデータを出力
sales21; data2 # データsales21とdata2を出力
sink() # 出力の終了

#2.5 データの結合と並び替え
rbind(sales2,c(20,30,15,20,15))
A<-matrix(c(1,2,1,4),2,2)
B<-matrix(c(4,2,3,4),2,2)
cbind(A,B)
rbind(A,B)

#2.5.2 データの並べ替え
sort(c(3,2,4,1))
rev(c(3,2,4,1))
sales2[,sort.list(sales2[1,])]

#第3章　データの演算と固有値，基本統計量
#3.1.1算術演算
x<-c(1,2,3,4); y<-c(4,2,3,1)
x+y
x*y
x/y
x^2

#3.1.2 比較演算
x>y

#3.1.3 論理演算
Lx<-c(T,T,F,F); Ly<-c(T,F,F,T)
Lx & Ly
Lx && Ly
#3.1.4 行列演算
A<-matrix(c(1,2,1,4),2,2)
D<-matrix(c(4,2,3,4,2,1),2,3)
A%*%D

#3.1.5 対角行列と逆行列
diag(c(6,7,3))
solve(A)
A%*%solve(A)

#3.2固有値と特異値の分解
eigen(A)
A.eig<-eigen(A)
A.eig$values # あるいはeigen(A)$values
A.eig$vectors
A%*%A.eig$vectors # 左辺の計算
A.eig$vectors%*%diag(A.eig$values) # 右辺の計算

#3.2.2 特異値分解
(D.s<-svd(D))
D.s$u%*%diag(D.s$d)%*%t(D.s$v)

#3.3 基本統計量
(temp<-1:10) # 1～100の数値をtempに代入し，表示する
sum(temp) # 合計を求める
summary(temp) # データの最小・大値， 四分位数， 平均を表示
apply(iris[,1:4],2,mean) # 列の平均
apply(iris[,1:4],2,var) # 列の分散
cov(iris[,-5])
var(iris[,-5])
cor(iris[,-5])


#第4章データの視覚化
#4.1 棒グラフ
VADeaths
barplot(VADeaths)
barplot(VADeaths,beside=TRUE)
barplot(VADeaths, beside = TRUE, col = c("lightblue","mistyrose",
"lightcyan","lavender","cornsilk" ))
library(MASS);install.packages("DAAG");library(DAAG); # 両パッケージを読み込む
show.colors()

#4.2 円グラフ
pie(sales)
sales.col<-c("yellow","green3","purple","violetred1","cyan")
pie(sales,col=sales.col, radius=1)
pie(sales, density=15, angle=15+10*1:5)

#4.3 ヒストグラム
hist(iris[1:50,2])
hist(iris[1:50,2],col="lightblue")
hist(iris[1:50,2],breaks=c(1:5),col="blue")

#4.4 折れ線グラフ
#図4.4(a)の折れ線作成
matplot(VADeaths,type="b")
#図4.4(b)の折れ線作成
RL<-nrow(VADeaths)
matplot(VADeaths,type="b",pch=1:RL,xlab="",ylab="",axes=FALSE)
axis(1,1:RL,rownames(VADeaths)) 	# 横軸の作成
axis(2); CL<-ncol(VADeaths)		 # 縦軸の作成
legend(1, max(VADeaths), colnames(VADeaths),col=1:CL,lty=1:CL)

#図4.6箱ひげ図
par(mfrow=c(1,2),mar=c(2.5,2,1,1))
boxplot(iris[,1])				#第1列を1つの箱ひげ図に
boxplot(iris[,1]~iris[,5],col="lightblue")	#第1列を3つの箱ひげ図に

#4.6 散布図
4.6.1 2 次元散布図
#図4.7(a)を作成するコマンド
plot(iris[,1],iris[,3])
plot(iris[,1],iris[,3],type="n")
text(iris[,1],iris[,3])

#図4.7(b)を作成するコマンド
iris.label<-rep(c("S","C","V"),rep(50,3))
plot(iris[,1],iris[,3],type="n")
text(iris[,1],iris[,3],iris.label)

#図4.8(a)を作成するコマンド
plot(iris[,1],iris[,3],type="p",xlab="Length of Sepal",ylab="Length of Petal",cex=2,col="red")
#点を同定するコマンド
identify(iris[,1],iris[,3])
#図4.8(b)を作成するコマンド
plot(iris[,1],iris[,3],pch=21,cex=2,bg=c(2,3,4)[unclass(iris$Species)])

＃図4.10(a)を作成するコマンド
install.packages("car")
library(car)
data(Prestige) 		# データを読み込む
attach(Prestige) 	# リンク付け
names(Prestige) 	# 変数のラベルを表示
scatterplot(education,income)

＃図4.10(b)を作成するコマンド
scatterplot(education,income,labels=rownames(Prestige))
detach(Prestige)

#対散布図
pairs(iris[1:4])
#図4.11
pairs(iris[1:4],pch=21,bg=c("red","green3","blue")[unclass(iris$Species)])

install.packages("scatterplot3d"); library(scatterplot3d)
scatterplot3d(iris[,2:4]) # 図は省略
scatterplot3d(iris[,2:4],pch=c(1:3)[unclass(iris[,5])],
color=unclass(iris[,5])) # 図4.12(a)
iris.lab<-c(rep("S",50),rep("C",50),rep("V",50)) # ラベルの作成
scatterplot3d(iris[,2:4],pch=iris.lab,color=unclass(iris[,5]))
# 図4.12(b)

plot(iris[,1:2])
temppar<-par(mar=c(8,6,4,2)) # 余白を設定する．
plot(iris[,1:2])
par(temppar)

図4.14(a)の作成
par(mfrow=c(2,2))
plot(iris[,2],iris[,3]); plot(iris[,2],iris[,4]);
boxplot(iris[,2]~iris[,5]); boxplot(iris[,3]~iris[,5]) # 図4.14 (a)

図4.14(b)の作成
temppar<-par(mfrow=c(2,2),mar=c(1,1,1,1))
plot(iris[,2],iris[,3]); plot(iris[,2],iris[,4]);
boxplot(iris[,2]~iris[,5]); boxplot(iris[,3]~iris[,5]) # 図4.14 (b)
par(temppar)

#******************第2部*********************************
#第1章　主成分分析

temp<-c(50,57,74,94,112,128,140,147,150,147,140,128,112,94,74,57,
57,50,57,74,94,112,128,140,147,150,147,140,128,112,94,74,
74,57,50,57,74,94,112,128,140,147,150,147,140,128,112,94,
94,74,57,50,57,74,94,112,128,140,147,150,147,140,128,112,
112,94,74,57,50,57,74,94,112,128,140,147,150,147,140,128)
okamoto<-matrix(temp,16,5)
colnames(okamoto)<-c("A","B","C","D","E")

oka.pc<-princomp(okamoto)
summary(oka.pc)
oka.pc$loadings
#図1.3
plot(oka.pc$loading[,1:2],type="n")
text(oka.pc$loadings,colnames(okamoto))

round(oka.pc$scores,2)
#図1.4
plot(oka.pc$scores[,1],oka.pc$scores[,2],type="n")
text(oka.pc$scores[,1],oka.pc$scores[,2],1:16)

#1.3.6予測
oka.pc1<-princomp(okamoto[1:10,])
plot(oka.pc1$scores[,1],oka.pc1$scores[,2],type="n") # 図1.5(A)
text(oka.pc1$scores[,1],oka.pc1$scores[,2],1:10)
oka.pre<-predict(oka.pc1,okamoto[11:16,])
plot(oka.pre[,1],oka.pre[,2],type="n") # 図1.5(b)
text(oka.pre[,1],oka.pre[,2],11:16)

#1.3.7 バイプロット
biplot(oka.pc)
#図1.7 irisのデータ
iris.pca<-princomp(iris[,-5])
plot(iris.pca$scores,type="n")
lab<-as.numeric(iris[,5])		# 5列の3種類の文字列を数値(1,2,3)に変換
text(iris.pca$scores,label=lab,col=lab)
biplot(iris.pca)

#補遺
install.packages("ade4");library(ade4)
iris.dudi<-dudi.pca(iris[,1:4])

s.arrow(iris.dudi$c1,lab=colnames(iris)[1:4])
s.class(iris.dudi$li,iris[,5],cpoint=1)

#第2章　因子分析
seiseki<-matrix(c(89,90,67,46,50, 57,70,80,85,90,
80,90,35,40,50, 40,60,50,45,55,
78,85,45,55,60, 55,65,80,75,85,
90,85,88,92,95),7,5,byrow = TRUE)
colnames(seiseki)<-c("算数","理科","国語","英語","社会")
rownames(seiseki)<-c("田中","佐藤","鈴木","本田","川端","吉野","斉藤")

(seiseki.fac<-factanal(seiseki,factors=2))
barplot(seiseki.fac$loading[,1],col="lightblue")
barplot(seiseki.fac$loading[,2],col="lightblue")

#因子負荷量と回転
seiseki.fac2<-factanal(seiseki,factors=2,rotation="none",scores="regression")
seiseki.fac3<-factanal(seiseki,factors=2,scores="regression")
＃上記の結果のbiplot
biplot(seiseki.fac2$scores,seiseki.fac2$loading)　# 図2.4(a)
biplot(seiseki.fac3$scores,seiseki.fac3$loading) # 図2.4(b)
round(seiseki.fac$uniquenesses,3)

#第3章　対応分析
library(MASS)
caith
caith.ca<-corresp(caith,nf=4)
summary(caith.ca)

caith.eig<- caith.ca$cor^2
round(caith.eig,3)
(寄与率<-round(100* caith.eig /sum(caith.eig),2)) # 単位は％
biplot(caith.ca)

#3.4.2
項目A<-c("A1","A1","A1","A1","A1","A2","A2","A2","A2","A2")
項目B<-c("B1","B2","B3","B1","B1","B2","B2","B1","B3","B2")
項目C<-c("C2","C3","C1","C3","C2","C1","C3","C1","C1","C2")
hyou2<-data.frame(cbind(項目A,項目B,項目C))
(hyou2.mca<-mca(hyou2))
biplot(hyou2.mca$rs,hyou2.mca$cs, var.axes = FALSE)

hyou3<-matrix(c(1,1,1,1,1,0,0,0,0,0, 0,0,0,0,0,1,1,1,1,1,
1,0,0,1,1,0,0,1,0,0, 0,1,0,0,0,1,1,0,0,1,
0,0,1,0,0,0,0,0,1,0, 0,0,1,0,0,1,0,1,1,0,
1,0,0,0,1,0,0,0,0,1, 0,1,0,1,0,0,1,0,0,0),10,8)
colnames(hyou3)<-c("項目1.A1","項目1.A2","項目.B1","項目2.B2",
"項目2.B3","項目3.C1","項目3.C2","項目3.C3")
hyou3.ca<-corresp(hyou3,nf=2)
biplot(hyou3.ca)

#3.5 補遺図3.4
install.packages("ade4");library(ade4)
hyou3<-as.data.frame(hyou3)
hyou3.coa<-dudi.coa(hyou3,scannf=FALSE,nf=3)
scatter(hyou3.coa,posieig = "none")
scatter(hyou3.coa,xax = 1, yax = 3,posieig = "none")

#図3.5
install.packages("vegan");library(vegan)
caith.dca<-decorana(caith)
s.label(caith.dca$cproj, clab = 1.3)
s.arrow(caith.dca$rproj, add.pl = TRUE)

#第4章　4.3.2
(eur.cmd<-cmdscale(eurodist))
plot(eur.cmd,type="n")
text(eur.cmd,rownames(eur.cmd ))

dhat<-dist(eur.cmd)
cor(eurodist,dhat)^2

#図4.4
iris.dist<-dist(iris[,-5]) # ラベルの部分を除く！
iris.cmd<-cmdscale(iris.dist)
plot(iris.cmd,type="n")
iris.lab<-factor(c(rep("S",50),rep("C",50),rep("V",50)))
text(iris.cmd,labels=iris.lab,col=unclass(iris.lab))

#図4.5
install.packages("mlbench");library(mlbench)
install.packages("e1071");set.seed(100)
p<-mlbench.corners(n=160)
lab=as.numeric(p$classes) # 質的なラベルを量的に変換する
x.dist<-dist(p$x)
library(MASS) # sammonとisoMDSを用いるため
par(mar=c(4.5,4.5,1,1), mfrow=c(2,2))
plot(cmdscale(x.dist),pch=lab,col=lab)
plot(sammon(x.dist)$points,pch=lab,col=lab)
plot(isoMDS(x.dist)$points,pch=lab,col=lab)
install.packages("vegan");library(vegan) # metaMDSを用いるため
x.dist2<-as.matrix(x.dist)
plot(metaMDS(x.dist2)$point,pch=lab,col=lab)


#第5章
seiseki<-matrix(c(89,90,67,46,50, 57,70,80,85,90,
	80,90,35,40,50, 40,60,50,45,55,
	78,85,45,55,60, 55,65,80,75,85,
	90,85,88,92,95),7,5,byrow = TRUE)
colnames(seiseki)<-c("算数","理科","国語","英語","社会")
rownames(seiseki)<-c("田中","佐藤","鈴木","本田","川端","吉野","斉藤")

seiseki.d<-dist(seiseki)
round(seiseki.d)
(sei.hc<-hclust(seiseki.d))
summary(sei.hc)
sei.hc$merge
sei.hc$order
plot(sei.hc)

#図5.5
plot(hclust(seiseki.d,"centroid"))
plot(hclust(dist(seiseki,"canberra"),"ward"))

cutree(sei.hc,k=2)
cophenetic(sei.hc)
cor(seiseki.d, cophenetic(sei.hc))

#図5.6
d<-dist(iris[c(51:60,141:150),1:4],"can")
ha<-hclust(d,"average")
hw<-hclust(d,"ward")
cor(cophenetic(ha),d)
cor(cophenetic(hw),d)
plot(ha,main="キャンベラ距離,群平均法, cop-cor=0.8057",cex=1.2,hang=-1)
plot(hw,main="キャンベラ距離,ウォード法,cop-cor=0.608",cex=1.2,hang=-1)

#5.3K-means
(seiseki.km<-kmeans(seiseki,2))
summary(seiseki.km)
seiseki.km$cluster
seiseki.km$size

#5.4　mclust
install.packages("mclust")
library(mclust)
plot(EMclust(iris[,1:4]))
iris.hc<-hc(modelName = "VVV", data = iris[,1:4])
iris.hcl<-hclass(iris.hc,3)
table(iris[,5],iris.hcl)
#図5.9
clPairs(iris[,1:4],cl=iris.hcl)

library(cluster)
plot(pam(iris[,1:4],3),ask = TRUE)

#第6章
install.packages("kohonen")
library(kohonen)
set.seed(10) # 関数somでは乱数を用いるので， 乱数の種を指定する．
gr<-somgrid(topo="hexagonal",xdim=10,ydim=7)
iris.som<-som(as.matrix(iris[,1:4]),gr,rlen=200)
#注：本の中のコマンドではエラーメッセージが返されます。関数somで用いられるデータ形式はmatrixです。データirisはdata.frame形式ですので、上記のようにmatrix形式に変換して用いてください。。

plot(iris.som, type="codes") # コードマップ
lab.cod<- as.numeric(iris[,5]) # ラベルを数値表記に書き直す
plot(iris.som, type="mapping",labels=lab.cod, col=lab.cod, bgcol="lavender")


#kmeans法によるコードブックの色付け
set.seed(10)
gr<-somgrid(topo="hexagonal",xdim=10,ydim=7)
iris.som<-som(as.matrix(iris[,1:4]),gr,rlen=1000)
temp<-kmeans(iris.som$code,3)$clust
#temp<-cutree(hclust(dist(iris.som$code,"can"),"ward"),3)
tm<-matrix(0,1,length(temp))
for(i in 1:length(temp)){
if(temp[i]==1)(tm[i]<-"lavender")else{
if(temp[i]==2)(tm[i]<-"cornsilk")else{
if(temp[i]==3)tm[i]<-"mistyrose";}}
}
lab<-c(rep(1,50),rep(4,50),rep(2,50))
plot(iris.som, type="mapping", labels=lab.cod, col=lab, bgcol=tm)

detach("package:kohonen")
#6.3.2
install.packages("som")
require(som)
set.seed(80)
iris1<-normalize(iris[,1:4])
iris.som2<-som(iris1, xdim=6,ydim=5)
plot(iris.som2) 
ransu<-cbind(rnorm(nrow(iris),0, 0.13),rnorm(nrow(iris), 0, 0.13))
out.new<-iris.som2$visual[,1:2]+0.5+ransu
points(out.new[,1:2],col=c(2:4)[unclass(iris[,5])],pch=c(1:3)[unclass(iris[,5])])
#図6.4
plot (out.new[,1:2],col=c(2:4)[unclass(iris[,5])],pch=c(1:3)[unclass(iris[,5])])#図6.4(b)
iris.som3<-som(iris1, xdim=15,ydim=10)
out.new<-iris.som3$visual[,1:2]+0.5+ransu
plot (out.new[,1:2],col=c(2:4)[unclass(iris[,5])],pch=c(1:3)[unclass(iris[,5])])
#第7章　回帰分析
cars.lm<-lm(dist~speed,data=cars)
summary(cars.lm)

予測値<-predict(cars.lm)
残差<-residuals(cars.lm)
data.frame(cars,予測値,残差)
plot(cars)
abline(cars.lm,lwd=2)

par(mfrow=c(2,2)) # par(mfrow=c(2,2),oma=c(2,2,2,1),mar=c(4,4,3,2))
plot(cars.lm)

#7.3
pairs(airquality[,1:4])
air.lm<-lm(Ozone~Solar.R+Wind+Temp,data= airquality)
summary(air.lm)
round(coefficients(air.lm),2)
air.lm2<-lm(Ozone~(Solar.R+Wind+Temp)^2,data= airquality)
summary(air.lm2)

#分散分析
summary(aov(Ozone~.,airquality[,1:4]))
anova(lm(Ozone~.,airquality[,1:4]))

#第8章
年度<-c(1966:1984)
普及率<-c(0.003,0.016,0.054,0.139,0.263,0.423,0.611,0.758,0.859,
0.903,0.937,0.954,0.978,0.978,0.982,0.985,0.989,0.988,0.992)

fm<-nls(普及率~ a/(1+b*exp(c*1:19)), start=c(a=1,b=1,c=-1),trace=TRUE)
summary(fm)
plot(年度,普及率,cex=2)
lines(年度,普及率)
lines(年度,fitted(fm),col=2,lty=2,lwd=2)
legend(locator(1),c("実測値","予測値"), col=1:2,lty=1:2,lwd=2)

fm1<-nls(普及率~SSlogis(年度,Asym,xmid,scal))
data.frame(fitted(fm),fitted(fm1))

#8.3
set.seed(30);x<-seq(-5, 5,0.1)
y<-10*x^3+100*rnorm(x,0,1)
plot(x,y)
fm3<-nls(y~a+b*x+c*x^2+d*x^3,start=c(a=1,b=1,c=1,d=1),trace=T)
summary(fm3)
fm4<-nls(y~d*x^3,start=c(d=1),trace=T)
summary(fm4)
fm4<-nls(y~d*x^3,start=c(d=1),trace=T)
lines(x,fitted(fm3),lty=1,col=2)
lines(x,fitted(fm4),lty=2,col=4,lwd=2)
legend(locator(1),c("一般式","簡潔式"), lty=1:2,col=c(2,4),lwd=2,cex=1.5)
lm(y~poly(x,3))
#8.4 一般化線形モデル

air.lm<-lm(Ozone~ Solar.R+Wind+Temp,data= airquality)
qqnorm(resid(air.lm))
qqline(resid(air.lm),lwd=2,col="red")
air.glm1<- glm(Ozone~Solar.R+Wind+Temp,data= airquality,family=gaussian)
air.glm2<- glm(Ozone~Solar.R+Wind+Temp,data= airquality,family= Gamma)

TV<-data.frame(年度,普及率)
fm5<-glm(普及率~年度,data=TV,family=binomial)
plot(年度,普及率,type="l")
lines(年度,fitted(fm5),lty=2,col="red",lwd=2)
legend(locator(1),c("実測値","予測値"), col=1:2,lty=1:2)

predict(fm5,type="response")
names(fm5)
x1=seq(-10,10,0.1);set.seed(10)
y1=50*sin(x1)+x1^2+10*rnorm(length(x1),0,1)
plot(x1,y1)

lmp2<-fitted(lm(y1~poly(x1,2)))	# 2次多項式モデルの予測値
lines(x1,lmp2,lty=4,col=4,lwd=2) 
lmp5<-fitted(lm(y1~poly(x1,5)))	# 5次多項式モデルの予測値
lines(x1,lmp5,lty=2,col=2,lwd=2) 
lmp8<-fitted(lm(y1~poly(x1,8)))	# 8次多項式モデルの予測値
lines(x1,lmp8) 
legend(locator(1),c("poly(x1,2)","poly(x1,5)","poly(x1,8)"),
col=c(4,2,1),lty=c(4,2,1),lwd=2)


par(mfrow=c(2,2),oma=c(2,2,2,2),mar=c(2,2,2,2))
plot(x1,y1,main="関数smooth.splineによる平滑結果")
lines(smooth.spline(x1,y1),col=2,lwd=2) # smooth.splineによる平滑化
plot(x1,y1,main="関数ksmoothによる平滑結果")
lines(ksmooth(x1,y1),col=4,lwd=2) # ksmoothによる平滑化
plot(x1,y1,main="関数supsmuによる平滑結果")
lines(supsmu(x1,y1),col=3,lwd=2) # supsmuによる平滑化
plot(x1,y1,main="関数lowessによ平滑結果")
lines(lowess(x1,y1,f=0.1),col=5,lwd=2) #

#8.5.2 加法モデル
install.packages("mgcv"); library(mgcv)
airq2<-na.exclude(airquality[,1:4])
airq.gam<-gam(Ozone~s(Solar.R)+s(Wind)+s(Temp),data=airq2)
summary(airq.gam)

AIC(airq.gam)
airq.glm<-glm(Ozone~Solar.R+Wind+Temp,data=airq2)
AIC(airq.glm)

#第9章
iris.lab<- c(rep("S",50),rep("C",50),rep("V",50))
iris1<-data.frame(iris[,1:4],Species=iris.lab)
even.n<-2*(1:75)-1
iris.train<-iris1[even.n,]
iris.test<-iris1[-even.n,]
library(MASS)
(Z.lda<-lda(Species~.,data=iris.train))
apply(Z.lda$means%*%Z.lda$scaling,2,mean)
table(iris.train[,5],predict(Z.lda)$class)

#図9.2
#plot(Z.lda,dimen=2)#図9.2(a)
#temp<-predict(Z.lda)$x
#m1<-mean(temp[1:25,1])
#m2<-mean(temp[26:50,1])
#m3<-mean(temp[51:75,1])
#x1<-(m2-(-m1))/2#2グループ間の中心点
#x2<-m2+(m3-m2)/2#2グループ間の中心点
#plot(Z.lda,dimen=2)
#lines(c(x1,x1),c(-9,9),col="red",lwd=1.5)
#lines(c(x2,x2),c(-9,9),col="red",lwd=1.5)

Y<-predict(Z.lda,iris.test[,-5])
table(iris.test[,5],Y$class)
plot(Y$x,type="n")
text(Y$x,labels=iris.test$Species)

iris.CV<-lda(Species~.,data=iris,CV=TRUE)
(lda.tab<- table(iris[,5],iris.CV$class))
sum(lda.tab[row(lda.tab)==col(lda.tab)])/sum(lda.tab)
sum(lda.tab[row(lda.tab)!=col(lda.tab)])/sum(lda.tab)


#第10章
library(MASS)
Z.qda<-qda(Species~.,iris.train)
table(iris.train[,5],predict(Z.qda)$class)
Y.qda<-predict(Z.qda,iris.test[,-5])
table(iris.test[,5],Y.qda$class)

#10.3距離による判別分析
seto.mean<-apply(iris.train[1:25,-5],2,mean)
seto.var<-var(iris.train[1:25,-5])
vers.mean<-apply(iris.train[26:50,-5],2,mean)
vers.var<-var(iris.train[26:50,-5])
virg.mean<-apply(iris.train[51:75,-5],2,mean)
virg.var<-var(iris.train[51:75,-5])

D1<-mahalanobis(iris.train[,-5],seto.mean,seto.var)
D2<-mahalanobis(iris.train[,-5],vers.mean,vers.var)
D3<-mahalanobis(iris.train[,-5],virg.mean,virg.var)
round(cbind(D1,D2,D3),0)

D1.t<-mahalanobis(iris.test[,-5],seto.mean,seto.var)
D2.t<-mahalanobis(iris.test[,-5],vers.mean,vers.var)
D3.t<-mahalanobis(iris.test[,-5],virg.mean,virg.var)
round(cbind(D1.t,D2.t,D3.t),0)

#10.4
library(class)
iris.knn<-knn(iris.train[,-5],iris.test[,-5], iris.train[,5], k = 5)
(table(iris.knn,iris.test[,5]))
pairs(iris.test[,1:4], pch=as.character(iris.test[,5]),
col = c(3,2)[(iris.test$Species != iris.knn)+1])
iris.cv<-knn.cv(iris[,-5], iris[,5], k = 5)
table(iris[,5],iris.cv)


#10.5
install.packages("klaR"); library(klaR)
install.packages("mlbench"); library(mlbench)
data(Glass); G<-Glass[,c(1:5,10)]
m1<-NaiveBayes(Type~.,data=G)
m1.p<-predict(m1)
tem1<-table(G$Type, m1.p$class)
1-sum(diag(tem1))/sum(tem1) # 誤判別率


m2<-NaiveBayes(Type~.,data=G,usekernel=TRUE)
m2.p<-predict(m2)
tem2<-table(G$Type, m2.p$class)
1-sum(diag(tem2))/sum(tem2) # 誤判別率

m3<-lda(Type~.,data=G)
m3.p<-predict(m3)
tem3<-table(G$Type, m3.p$class)
1-sum(diag(tem3))/sum(tem3)

m4<-knn(G[,-6],G[,-6], G[,6], k = 5)
tem4<-table(G$Type, m4)
1-sum(diag(tem4))/sum(tem4)



###第11章
library(survival);library(MASS)
data(gehan);dim(gehan);
gehan[1:6,]
Surv(gehan$time,gehan$cens)
ge.sf<-survfit(Surv(time,cens)~treat, data=gehan)
ge.sf
summary(ge.sf)

plot(ge.sf,lty=1:2)
legend(locator(1),c("6-MP投与群","対照群"), lty=c(1,2))
ge2<-subset(gehan,treat=="6-MP")
ge2.s <-survfit(Surv(time,cens)~treat, conf.int=.9,data= ge2)
plot(ge2.s,mark.t=F)
legend(locator(1),lty=c(1,2),legend=c("生存曲線","90%信頼区間"))

#図11.4
plot(ge2.s,conf.int=TRUE,mark.t=F)
lines(survfit(Surv(time,cens)~treat,
data=ge2,conf.type="plain"),mark.t=F, conf.int=TRUE,lty=3,col=3)
lines(survfit(Surv(time,cens)~treat,
data=ge2,conf.type="log-log"),mark.t=F, conf.int=TRUE,lty=4,col=4)
legend(locator(1),c("log","plain","log-log"), lty=c(1,3,4),col=c(1,3,4))

#図11.5
ge2.s <-survfit(Surv(time,cens)~treat,data= ge2)
ge2.fh<-survfit(Surv(time,cens)~treat,data= ge2,type="fleming-harrington")
ge2.fh2<- survfit(Surv(time,cens)~treat,data= ge2,type="fh2")
plot(ge2.s,conf.int=F,mark.t=F)
lines(ge2.fh,lty=2)
lines(ge2.fh2,lty=3,col=2)
legend(locator(1),lty=1:3,legend=c("Kaplan-meier","fleming-harrington", "fh2"))

survdiff(Surv(time)~treat,data=gehan)

#11.3 セミノンパラメトリックモデル
data(kidney) # パッケージsurvival中にある
kidney.cox<-coxph( Surv(time, status)~sex+disease, data=kidney)
summary(kidney.cox)
kidney.fit<-survfit(kidney.cox)
summary(kidney.fit)
plot(kidney.fit)

#図11.7
scatter.smooth(residuals(kidney.cox))
abline(h=0,lty=3,col=2)

#図11.8
scatter.smooth(residuals(kidney.cox, type="deviance"))
abline(h=0,lty=3,col=2)

kidney.zph<- cox.zph(kidney.cox)
kidney.zph

図11.9
op<- par(mfrow=c(2,2), mar=c(4.5,4,1,1))
plot(kidney.zph,df=2);par(op)

#11.3.5
kidney.cox2<-coxph( Surv(time, status)~(sex+age+ disease)^2, data=kidney)
kidney.cox2

library(MASS)
stepAIC(kidney.cox2)

#11.4 パラメトリックモデル
survreg(Surv(time, status) ~ sex+disease, kidney, dist="lognormal")


#12章

class(lh)
lh
start(UKgas)
end(UKgas)
frequency(UKgas)
UKgas
window(UKgas,c(1975,2),c(1979,3))

op<- par(mfrow=c(2,1), mar=c(4.5,4,1,1))
ts.plot(lh)
ts.plot(UKgas)
par(op)


ts.plot(ldeaths,mdeaths,fdeaths,gpars=list(xlab="年",ylab="死亡数",lty=c(1:3),col=c(1:3)))
legend(locator(1),c("全体","男性","女性"),lty=c(1:3),col=c(1:3))

temp<-ts(1:120,start=c(1995,6),frequency=12)
class(temp)

#12.1.5 ラグ処理
ldeaths
lag(ldeaths,k=5)

#12.1.6 差分
plot(diff(UKgas))


#12.2 自己共分散と自己相関
acf(UKgas)
op<- par(mai=rep(0.25,4),mfrow=c(4,1))
for(i in 1:4)plot(diff(log(UKgas),lag=i))
par(op)

ccf(mdeaths, fdeaths)

#12.3 スペクトル分析
op<- par(mfrow=c(2,2),mar=c(5,4,4,2))
spec.pgram(UKgas)
spec.pgram(UKgas,spans=c(3,3))
spec.pgram(ldeaths)
spec.pgram(ldeaths,spans=c(3,3))
par(op)

#p.207
op<- par(mfrow=c(1,2))
spectrum(UKgas,method="ar")
spectrum(ldeaths,method="ar")
par(op)


PP.test(lh)
install.packages("tseries")
library(tseries)
adf.test(UKgas)
adf.test(diff(UKgas))$p.value
#12.5.2
(lh.ar <-ar(lh))
summary(lh.ar)
lh.ar$order
round(lh.ar$ar,3)
Box.test(lh.ar$res, type="Ljung")
temp<- window(lh.ar$res,start=4)
jarque.bera.test(temp)
(lh.pr<-predict(lh.ar,n.ahead=10))

#図12.9
SE1<-lh.pr$pred+2*lh.pr$se
SE2<-lh.pr$pred-2*lh.pr$se
ts.plot(lh,lh.pr$pred,SE1,SE2,gpars=list(lt=c(1,2,3,3),col=c(1,2,4,4)))
legend(locator(1),c("実測値","予測値","2*SE"), lty=c(1,2,3),col=c(1,2,4))
(lh.ari<-arima(lh,order = c(2,0,1)))
summary(lh.ari)

data<-lh; T<-0
for(p in 1:4)
for(d in 0:1)
for(q in 0:4){
fit<-arima(data,order=c(p,d,q))
T<-T+1
if(T==1){
minaic<-fit$aic
orderP<-p; orderD<-d;orderQ<-q;
}else{
if (fit$aic<minaic){
minaic<- fit$aic;
orderP<-p; orderD<-d;orderQ<-q;
}
}
}
cat("結果： p=",orderP,"d=",orderD,"q=",orderQ,"AIC=",minaic,"\n")

(fit<-arima(lh,order = c(3,0,0)))
tsdiag(fit,gof.lag=12)

#12.7
#12.7.1 ARFIMA モデル
install.packages("fracdiff")
library(fracdiff)
(AP.d<-fdGPH(AirPassengers)$d) # 差分パラメータdを求める
AP.fra<-fracdiff(AirPassengers,nar=3, dtol= AP.d,nma=1)
summary(AP.fra)

#12.7.2
install.packages("fSeries",dependencies =TRUE)
library(fSeries)
UKg.d<-diff(UKgas)
#UKg.m<-garchFit(formula=~arma(1,1)+garch(1,1),data=UKg.d)
UKg.m<-garchFit(formula=~arma(1,1)+garch(1,1),data=UKg.d,trace = F)#trace = Fは計算過程を画面に返さない

summary(UKg.m)
plot(UKg.m)

UKg.fit <-ts(fitted(UKg.m), start=c(1960,2),frequency=4)
ts.plot(UKg.d, UKg.fit,lty=c(1,2), col=c(1,2))
legend(1962,400,c("差分値","予測値"), lty=c(1,2),col=c(1,2))

#12.8
plot(stl(UKgas, s.window ="per"))

#12.9
library(tseries);data(USeconomic)
USe.d<-diff(USeconomic[,1:2])
ts.plot(USe.d,lty=c(1,2),col=c(1,2))
legend(1960,-0.02,c(colnames(USe.d)[1],colnames(USe.d)[2]),lty=c(1,2),col=c(1,2))

acf(USe.d, na.action=na.pass)
ccf(USe.d[,1],USe.d[,2],main="d.log(M1) & d.log(GNP)")
(USe.ar<-ar(USe.d,order.max=2,aic=F))
plot(USe.ar$res)
USe.f<-predict(USe.ar,n.ahead=12,se.fit=F)

#12.10
install.packages("tseriesChaos")
install.packages("scatterplot3d")
library(tseriesChaos);library(scatterplot3d)
ro.em<-embedd(rossler.ts,m=3,d=8)
scatterplot3d(ro.em,type="l",color= "lightblue")
recurr(lorenz.ts, m=3, d=0,start.time=10,end.time=15)

#第13章　樹木モデル
install.packages("mvpart")
library("mvpart")
set.seed(20)
iris.rp<-rpart(Species~.,data=iris)
plot(iris.rp,uniform=T,branch=0.6,margin=0.05)
text(iris.rp,use.n=T,all=T)

iris.rp1<-prune(iris.rp,cp=0.02)
plot(iris.rp1,uniform=T,branch=0.6)
text(iris.rp1,use.n=T)

#13.6
plotcp(iris.rp)


even.n<-2*(1:75)-1
iris.train<-iris[even.n,]
iris.test<-iris[-even.n,]

set.seed(20)
iris.rp2<-rpart(Species~.,iris.train)
plotcp(iris.rp2)

#p.237
iris.rp3<-predict(iris.rp2,iris.test[,-5],type="class")
table(iris.test[,5],iris.rp3)


cars.rp1<-prune(cars.rp,cp=0.044)
plot(cars.rp1,uniform=T,margin=0.05)
text(cars.rp1, use.n=T)


data(spider)
spider[1,13:18]
spider.mv<-mvpart(as.matrix(spider[,1:12])~water+sand+moss+reft
+twigs+herbs,data=spider)

mvpart(as.matrix(spider[,1:12])~water+twigs+reft+herbs+moss+sand,
spider,pca=T)

install.packages("tree");
library(tree)
cars.tr<-tree(dist~speed,data=cars)
plot(cars$speed,cars$dist)　　　　　　　# 図13.12
partition.tree(cars.tr,add=T,col=2)
iris.tr<-tree(Species~.,data=iris)
iris.tr1<-snip.tree(iris.tr,nodes=c(12,7))
iris.label<-c("S", "C", "V")[iris[, 5]]
plot(iris[,3],iris[,4],type="n") # 図13.13
text(iris[,3],iris[,4],labels=iris.label)
partition.tree(iris.tr1,add=T,col=2,cex=1.5)


install.packages("RWeka")
library(RWeka)
iris.j48<-J48(Species~ ., data =iris)
iris.j48
install.packages("party") #作図に必要
library(party)
plot(iris.j48) # 図13.14(a)
plot(iris.j48,type = c("extended"))

cars.ctr<- ctree(dist ~ ., data =cars)
plot(cars.ctr) # 図13.15(a)
t.style<- node_hist(cars.ctr,ymax = 0.06,xscale = c(0,150),col="red",
fill= hsv(0.6,0.5,1))
plot(cars.ctr,terminal_panel = t.style)
○括弧
外的基準
#第14章　ニューラルネットワーク
even.n<-2*(1:75)
iris.train<-iris[even.n,]
iris.test<-iris[-even.n,]
library(nnet)
iris.nnet<- nnet(Species~ .,size=3,decay=0.1,data=iris.train)
iris.nnetp<-predict(iris.nnet,iris.test[,-5],type="class")
table(iris.test[,5], iris.nnetp)

library(class)
cl<-iris.train[,5]
cd<-lvqinit(iris.train[,1:4],cl)
cd1<-lvq1(iris.train[,1:4],cl,cd)
test.re<-lvqtest(cd1,iris.test[,1:4])
table(iris.test[,5],test.re)

#パッケージAMOREは若干使い勝手がよくない。
#説明変数(独立変数を)１つのマトリクスに、目的(応答)変数を1つのマトリックスに

install.packages("AMORE");library(AMORE)
#まずネットワークの構造の設定を行う。各層のユニットは引数n.neurons=c(4,2,3)で指定する。

net <- newff(n.neurons=c(4,2,3), learning.rate.global=1e-2, momentum.global=0.5,
        error.criterium="LMS", hidden.layer="tansig", 
        output.layer="purelin", method="ADAPTgdwm")

#説明変数のデータセットを作成
P<-iris[,1:4]

#目的変数のマトリックスの作成、質的データ使えないようである
target<-matrix(0,150,3)
target[1:50,1]<-rep(1,50)
target[51:100,2]<-rep(2,50)
target[101:150,3]<-rep(3,50)

#学習を行う
result <- train(net, P, target, report=TRUE, show.step=500, n.shows=7)

#当てはめを行う
y <- sim(result$net, P)
#結果のクロス表
table(apply(target,1,max),round(apply(y,1,max)))

#AMOREは変数が多くなると分類の振る舞いが不安定?????
#kernlabのなかのデータspamの57変数を用いるとなかなかうまくいかない。

#目的変数のマトリックスの作成は次のような自作関数を利用すると便利
tar<-function(x){
x<-as.numeric(x)
g<-length(table(x))
n<-length(x)
y<-matrix(0,n,g)
for(i in 1:n){
k<-x[i]
y[i,k]<-k
}
list(tar=y)
}


#第15章
install.packages("kernlab")
library(kernlab)
par(mfrow=c(2,2),mai=c(rep(0.3,4)))
x<-as.matrix(iris[,1:4])
iris.kpc1<-kpca(x,kernel="rbfdot",kpar=list(sigma=0.1),features=2)
plot(rotated(iris.kpc1),col=as.integer(iris[,5]))
# 上記の引数kparをlist(sigma=0.5))にし， 同じ操作を行う．
iris.kpc3<-kpca(x,kernel="polydot",kpar= list(degree= 1),features=2)
plot(rotated(iris.kpc3), col=as.integer(iris[,5]))
iris.kpc5<-kpca(x,kernel="polydot",kpar= list(degree= 5),features=2)
plot(rotated(iris.kpc5), col=as.integer(iris[,5]))
iris.kpc6<-kpca(x,kernel="polydot",kpar= list(degree= 6),features=2)
plot(rotated(iris.kpc6), col=as.integer(iris[,5]))

#15.3
data(spam);dim(spam)
table(spam[,58])
set.seed(50)
tr.num<-sample(4601,2500)
spam.train<-spam[tr.num,]
spam.test<-spam[-tr.num,]
set.seed(50)
(spam.svm <- ksvm(type~.,data=spam.train,cross=3))
spam.pre <- predict(spam.svm,spam.test[,-58])
(spam.tab<-table(spam.test[,58],spam.pre))
1-sum(diag(spam.tab))/sum(spam.tab)


spam.rf<-randomForest(type~.,data=spam.train,na.action="na.omit")
print(spam.rf)
spam.rfp<-predict(spam.rf,spam.test[,-58])
table(spam.test[,58],spam.rfp)

y<-as.matrix(iris[51:150,5])
iris1<-data.frame(iris[51:150,3:4],y)
ir.ksvm<- ksvm(y~.,data=iris1)
plot(ir.ksvm,data=iris1[,1:2])
table(iris1$y,predict(ir.ksvm,iris1[,1:2]))

#15.3.4
x1<-seq(-10,10,0.1);set.seed(10)
y1<-50*sin(x1)+x1^2+10*rnorm(length(x1),0,1)
xy.svm<-ksvm(x1,y1,epsilon=0.01,kpar=list(sigma=16))
sy.pre<-predict(xy.svm,x1)
plot(x1,y1,type="l")
lines(x1,sy.pre,col="red",lty=2)
legend(locator(1),c("実測値","予測値"), lty=c(1,2),col=c(1,2))

#第16章

install.packages("mlbench");library(mlbench)
data(BreastCancer)
even.n<-2*(1:349)
BC.train<-BreastCancer[even.n,-1] # 学習用のデータの作成
BC.test<-BreastCancer[-even.n,-1]

install.packages("adabag"); library("adabag")
set.seed(20)
#順序尺度のデータにうまく作動しない場合、次のように量的データに変換して用いる。
#結果には大きい誤差がないはず。
#for(i in 1:9){
#BC.train[,i]<-as.numeric(BC.train[,i])
#BC.test[,i]<-as.numeric(BC.test[,i])
#}

BC.ba<-bagging(Class~ .,data=BC.train)
BC.bap<-predict(BC.ba,BC.test)
(tb.ba<-table(BC.test[,10],BC.bap$class))
1-sum(diag(tb.ba))/sum(tb.ba)


set.seed(20)
BC.rp<-rpart(Class~.,data=BC.train, maxdepth=3)
BC.rpp<-predict(BC.rp,newdata=BC.test[,-10],type="class")
(tb.rp <-table(BC.rpp,BC.test[,10]))
(1-sum(diag(tb.rp))/sum(tb.rp))

set.seed(20)
BC.ad<- adaboost.M1(Class~.,data=BC.train)
BC.adp<-predict(BC.ad,newdata=BC.test)
BC.adp[-1]

#16.4
install.packages("randomForest")
library("randomForest")
#データBreastCancerは質的データ(character)として記録されている。
#randomForestは質的データに対して相性が良くない場合があるようです。
#その場合は、質的データ(character)を量的(numeric)なデータに変換して用いた方が1つの案である。

set.seed(20)
BC.rf<-randomForest(Class~.,data=BC.train,na.action="na.omit")
print(BC.rf)
summary(BC.rf)
BC.rf$type
plot(BC.rf)
varImpPlot(BC.rf)
BC.rf$importance
BC.rfp<-predict(BC.rf,BC.test[,-10])
(BC.rft<-table(BC.test[,10],BC.rfp))
(1-sum(diag(BC.rft))/sum(BC.rft))

#第17章
install.packages("arules",dependencies=TRUE)
library(arules)
 data<-list(c("パン","牛乳","ハム","果物"),
c("パン","オムツ","ビール","ハム"),
c("ソーセージ","ビール","オムツ"),
c("弁当","ビール","オムツ","タバコ"),
c("弁当","ビール","ジュース","果物"))
data.tran<- as(data, "transactions")
class(data.tran)

as(data.tran,"matrix")
as(data.tran,"data.frame")

itemFrequencyPlot(data.tran,type = "absolute")

data.ap<-apriori(data.tran)

inspect(head(SORT(data.ap, by = "support"),n=6))

data.ap1<-apriori(data.tran,parameter = list(supp =0.2,maxlen=3))
inspect(head(SORT(data.ap1, by = "support"), n = 20))

data(Income)
Income
par(mar=c(4.5,2,1,2), cex=0.65,cex.axis=0.7)
itemFrequencyPlot(Income,cex=0.8,col="lightblue")
#横向きの棒グラフ
itemFrequencyPlot(Income, col="lightblue")
#itemFrequencyPlot(Income, col="lightblue",horiz=T)
Income.ap<-apriori(Income)
summary(Income.ap)


Income.ap2 <- subset(Income.ap, subset = rhs %in% "income=$40,000+" & lift>2 )
inspect(SORT(Income.ap2)[1:3])

Income.ap3<-subset(Income.ap, subset = lhs %pin% "education" & rhs %pin% "income" )
inspect(SORT(Income.ap3,by="lift")[1:2])

#p.283例3
data(Groceries)
par(mfrow=c(1,3),mar=c(4.5,2,1,2), cex=0.65,cex.axis=0.7)
itemFrequencyPlot(Groceries[,1:55],cex=0.65,col="lightblue",horiz=T)
itemFrequencyPlot(Groceries[,56:110],cex=0.65,col="lightblue",horiz=T)
itemFrequencyPlot(Groceries[,111:169],cex=0.65,col="lightblue",horiz=T)

Gr.ap <-apriori(Groceries, parameter=list(support=0.005,confidence = 0.01))

beefRules <-subset(Gr.ap,subset=rhs %in% "beef")
inspect(head(SORT(beefRules, by = "confidence"), n = 3))


data.ec<-eclat(data.tran)
inspect(SORT(data.ec,by="support")[1:5])

data.ec2 <- data.ec[size(items(data.ec)) ==2]
inspect(SORT(data.ec2,by="support")[1:5])


Income.ec<-eclat(Income)
Income.ec2 <- subset(Income.ec,subset = items %in% "income=$40,000+" & support>0.2 & size(items)>2)
Income.ec2
inspect(SORT(Income.ec2,by="support")[1:2])

#7.4
rules.sub <- subset(Income.ap, subset = rhs %in% "income=$40,000+" & lift>2 )
d<-dissimilarity(rules.sub)
plot(hclust(d,"ward"),hang=-1)

class1<-hclust(d,"ward")$order[1:7]
inspect(rules.sub[class1])

class2<-hclust(d,"ward")$order[8:13]
inspect(rules.sub[class2])

class3<-hclust(d,"ward")$order[14:23]
inspect(rules.sub[class3])

class4<-hclust(d,"ward")$order[24:29]
inspect(rules.sub[class4])
