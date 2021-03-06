################################################################
# Nested under:
# covid.2019.ru.main.r
# 
# requires:
# source("covid.2019.ru.data_loader.r")
# source("covid.2019.ru.data_transformations.r")
#
# # For more details, read: https://cran.r-project.org/web/packages/drc/drc.pdf
# 
# # If needed, install:
# install.packages("drc")

library(drc)
library(aomisc)

# # Fitting exponential and logistic growth;
#
# covid.2019.ru.full.expoGrowth <- drm(
# covid.2019.ru.i.dyn.tt$RUS.CS ~ covid.2019.ru.i.dyn.tt$DAYS, 
# fct = DRC.expoGrowth()
# )
#
# covid.2019.ru.full.Mos.expoGrowth <- drm(
# covid.2019.ru.i.dyn.tt$Mos.CS ~ covid.2019.ru.i.dyn.tt$DAYS, 
# fct = DRC.expoGrowth()
# )
#
# covid.2019.ru.full.ll.3 <- drm(
# covid.2019.ru.i.dyn.tt$RUS.CS ~ covid.2019.ru.i.dyn.tt$DAYS, 
# fct = LL.3()
# )
#
# covid.2019.ru.full.Mos.ll.3 <- drm(
# covid.2019.ru.i.dyn.tt$Mos.CS ~ covid.2019.ru.i.dyn.tt$DAYS, 
# fct = LL.3()
# )
#
# covid.2019.ru.full.SPb.ll.3 <- drm(
# covid.2019.ru.i.dyn.tt$SPb.CS ~ covid.2019.ru.i.dyn.tt$DAYS, 
# fct = LL.3()
# )
#
# covid.2019.ru.full.RUS.Provinces.ll.3 <- drm(
# (covid.2019.ru.i.dyn.tt$RUS.CS - (covid.2019.ru.i.dyn.tt$Mos.CS + covid.2019.ru.i.dyn.tt$SPb.CS)) ~ covid.2019.ru.i.dyn.tt$DAYS, 
# fct = LL.3()
# )
#
# # Cutting off the initial disconnected cases;
#
# covid.2019.ru.i.dyn.tt.short <- covid.2019.ru.i.dyn.tt[33:nrow(covid.2019.ru.i.dyn.tt),]
#
# covid.2019.ru.i.dyn.tt.short$DAYS <- covid.2019.ru.i.dyn.tt.short$DAYS - 32
# covid.2019.ru.i.dyn.tt.short$RUS.CS <- covid.2019.ru.i.dyn.tt.short$RUS.CS - 5
#
# # Fitting exponential and logistic growth;
#
# covid.2019.ru.short.expoGrowth <- drm(
# covid.2019.ru.i.dyn.tt.short$RUS.CS ~ covid.2019.ru.i.dyn.tt.short$DAYS, 
# fct = DRC.expoGrowth()
# )
#
# covid.2019.ru.short.ll.3 <- drm(
# covid.2019.ru.i.dyn.tt.short$RUS.CS ~ covid.2019.ru.i.dyn.tt.short$DAYS, 
# fct = LL.3()
# )
#
# # # Summarising models;
# #
# # summary(covid.2019.ru.full.expoGrowth)
# # summary(covid.2019.ru.short.expoGrowth)
# # summary(covid.2019.ru.short.ll.3)
# # summary(covid.2019.ru.full.ll.3)
# # summary(covid.2019.ru.full.Mos.ll.3)
# # summary(covid.2019.ru.full.SPb.ll.3)
# # summary(covid.2019.ru.full.RUS.Provinces.ll.3)
#
# # Running model;
#
# covid.2019.ru.i.dyn.tt.ts <- NULL
# covid.2019.ru.i.dyn.tt.ts <- as.list(covid.2019.ru.i.dyn.tt.ts)
#
# for(i in 33:nrow(covid.2019.ru.i.dyn.tt)){
# covid.2019.ru.i.dyn.tt.ts[[i]] <- covid.2019.ru.i.dyn.tt[1:i,]
# }
#
# rmc.df <- NULL
#
# for(i in 33:nrow(covid.2019.ru.i.dyn.tt)){
#
# rmc.df <- rbind.data.frame(rmc.df,
# c(
# drm(
# covid.2019.ru.i.dyn.tt.ts[[i]]$RUS.CS ~ covid.2019.ru.i.dyn.tt.ts[[i]]$DAYS, 
# fct = DRC.expoGrowth()
# )$coefficients,
# drm(
# covid.2019.ru.i.dyn.tt.ts[[i]]$RUS.CS ~ covid.2019.ru.i.dyn.tt.ts[[i]]$DAYS, 
# fct = LL.3()
# )$fit$par
# )
# )
# }
#
# colnames(rmc.df) <- c("eg.1","eg.2","ll.3.b","ll.3.d","ll.3.e")
#
# # RMC for Moscow
#
# rmc.Mos.df <- NULL
#
# for(i in 33:nrow(covid.2019.ru.i.dyn.tt)){
#
# rmc.Mos.df <- rbind.data.frame(rmc.Mos.df,
# c(
# drm(
# covid.2019.ru.i.dyn.tt.ts[[i]]$Mos.CS ~ covid.2019.ru.i.dyn.tt.ts[[i]]$DAYS, 
# fct = DRC.expoGrowth()
# )$coefficients,
# drm(
# covid.2019.ru.i.dyn.tt.ts[[i]]$Mos.CS ~ covid.2019.ru.i.dyn.tt.ts[[i]]$DAYS, 
# fct = LL.3()
# )$fit$par
# )
# )
# }
#
# colnames(rmc.Mos.df) <- c("eg.1","eg.2","ll.3.b","ll.3.d","ll.3.e")
#
# # Control plot;
#
# png("../plots/COVID.2019.fitting.expGrowth_vs_LL.3.png", height=750, width=1000, res=120, pointsize=10)
# par(mar=c(6,5,4,2)+.1)
#
# plot(covid.2019.ru.i.dyn.tt.short$RUS.CS ~ covid.2019.ru.i.dyn.tt.short$DAYS, 
# type="n", 
# # xlim=c(0,120), ylim=c(0,3.5e+4),
# main="Russian Federation",
# xlab="Days since 2020-03-02",
# ylab="Total cases registered",
# axes=FALSE
# )
#
# curve(covid.2019.ru.short.ll.3$fit$par[2]/(1+exp(covid.2019.ru.short.ll.3$fit$par[1]*(log(x/covid.2019.ru.short.ll.3$fit$par[3])))), from=0, to=120, col=4, lty=3, add=TRUE)
# curve(covid.2019.ru.short.expoGrowth$coefficients[1]*exp(x*covid.2019.ru.short.expoGrowth$coefficients[2]), col=2, lty=3, add=TRUE)
# curve(covid.2019.ru.full.ll.3$fit$par[2]/(1+exp(covid.2019.ru.full.ll.3$fit$par[1]*(log((x+32)/covid.2019.ru.full.ll.3$fit$par[3])))), from=0, to=120, col=4, lty=2, add=TRUE)
# curve(covid.2019.ru.full.expoGrowth$coefficients[1]*exp((x+32)*covid.2019.ru.full.expoGrowth$coefficients[2]), col=2, lty=2, add=TRUE)
#
# points(covid.2019.ru.i.dyn.tt.short$RUS.CS ~ covid.2019.ru.i.dyn.tt.short$DAYS, 
# pch=21, col="white", bg=1)
#
# axis(1)
# axis(1, at=1:nrow(covid.2019.ru.i.dyn.tt.short), tcl=-.25, labels=FALSE)
# axis(2)
#
# legend("topleft", 
# lty=c(2,3,2,3), 
# lwd=1.5,
# col=c(2,2,4,4), 
# legend=c(
# "Exponential (since February 1, 2020)",
# "Exponential (since March 3, 2020)",
# "Log-logistic (since February 1, 2020)",
# "Log-logistic (since March 3, 2020)"
# ),
# bty="n"
# )
#
# dev.off()
#
# png("../plots/COVID.2019.fitting.expGrowth_vs_LL.3.log10.png", height=750, width=1000, res=120, pointsize=10)
# par(mar=c(6,5,4,2)+.1)
#
# plot(log10(covid.2019.ru.i.dyn.tt.short$RUS.CS) ~ covid.2019.ru.i.dyn.tt.short$DAYS, 
# type="n", 
# # xlim=c(0,120), ylim=c(0,3.5e+4),
# main="Russian Federation",
# xlab="Days since 2020-03-02",
# ylab="Total cases registered (logarithmic scale)",
# axes=FALSE
# )
#
# curve(log10(covid.2019.ru.short.ll.3$fit$par[2]/(1+exp(covid.2019.ru.short.ll.3$fit$par[1]*(log(x/covid.2019.ru.short.ll.3$fit$par[3]))))), from=0, to=120, col=4, lty=3, add=TRUE)
# curve(log10(covid.2019.ru.short.expoGrowth$coefficients[1]*exp(x*covid.2019.ru.short.expoGrowth$coefficients[2])), col=2, lty=3, add=TRUE)
# curve(log10(covid.2019.ru.full.ll.3$fit$par[2]/(1+exp(covid.2019.ru.full.ll.3$fit$par[1]*(log((x+32)/covid.2019.ru.full.ll.3$fit$par[3]))))), from=0, to=120, col=4, lty=2, add=TRUE)
# curve(log10(covid.2019.ru.full.expoGrowth$coefficients[1]*exp((x+32)*covid.2019.ru.full.expoGrowth$coefficients[2])), col=2, lty=2, add=TRUE)
#
# points(log10(covid.2019.ru.i.dyn.tt.short$RUS.CS) ~ covid.2019.ru.i.dyn.tt.short$DAYS, 
# pch=21, col="white", bg=1)
#
# axis(1)
# axis(1, at=1:nrow(covid.2019.ru.i.dyn.tt.short), tcl=-.25, labels=FALSE)
# axis(2, at=log10(c(1,10,100,1000,10000)), labels=c(1,10,100,1000,10000))
# axis(2, at=log10(c(1:9, seq(10,100,10), seq(200,1000,100), seq(2000,10000,1000))), labels=FALSE)
#
# legend("topleft", 
# lty=c(2,3,2,3), 
# lwd=1.5,
# col=c(2,2,4,4), 
# legend=c(
# "Exponential (since February 1, 2020)",
# "Exponential (since March 3, 2020)",
# "Log-logistic (since February 1, 2020)",
# "Log-logistic (since March 3, 2020)"
# ),
# bty="n"
# )
#
# dev.off()
#
# # Running model plot;
#
# png("../plots/COVID.2019.fitting.rmc.png", height=750, width=1000, res=120, pointsize=10)
# par(mar=c(6,5,4,2)+.1)
#
# plot(covid.2019.ru.i.dyn.tt$RUS.CS ~ covid.2019.ru.i.dyn.tt$DAYS, 
# type="n", 
# xlim=c(0,(median(rmc.df$ll.3.e)*3)), ylim=c(0,max(rmc.df$ll.3.d)),
# main="Russian Federation",
# xlab="Days since 2020-01-31",
# ylab="Total cases registered",
# axes=FALSE
# )
#
# for(i in 1:nrow(rmc.df)){
# curve(rmc.df$ll.3.d[i]/(1+exp(rmc.df$ll.3.b[i]*(log((x)/rmc.df$ll.3.e[i])))), col=rgb(0,0,1,.3), add=TRUE)
# curve(rmc.df$eg.1[i]*exp((x)*rmc.df$eg.2[i]), col=rgb(1,0,0,.3), add=TRUE)
# }
#
# curve((covid.2019.ru.full.ll.3$fit$par[2]/(1+exp(covid.2019.ru.full.ll.3$fit$par[1]*(log(x/covid.2019.ru.full.ll.3$fit$par[3]))))), col=4, lwd=1.5, lty=2, add=TRUE)
# curve((covid.2019.ru.full.expoGrowth$coefficients[1]*exp(x*covid.2019.ru.full.expoGrowth$coefficients[2])), col=2, lwd=1.5, lty=2, add=TRUE)
# abline(v=covid.2019.ru.full.ll.3$fit$par[3], col=4, lwd=1.5, lty=2)
#
# points(covid.2019.ru.i.dyn.tt$RUS.CS ~ covid.2019.ru.i.dyn.tt$DAYS, 
# pch=21, col="white", bg=1)
#
# axis(1)
# axis(2)
#
# dev.off()
#
# # Running model plot, log10;
#
# png("../plots/COVID.2019.fitting.rmc.log10.png", height=750, width=1000, res=120, pointsize=10)
# par(mar=c(6,5,4,2)+.1)
#
# plot(log10(covid.2019.ru.i.dyn.tt$RUS.CS) ~ covid.2019.ru.i.dyn.tt$DAYS, 
# type="n", 
# xlim=c(0,median(rmc.df$ll.3.e)*1.5), ylim=c(0,log10(max(rmc.df$ll.3.d))),
# main=paste("Russian Federation /",Sys.Date()),
# xlab="Days since 2020-01-31",
# ylab="Total cases registered",
# axes=FALSE
# )
#
# for(i in 1:nrow(rmc.df)){
# curve(log10(rmc.df$ll.3.d[i]/(1+exp(rmc.df$ll.3.b[i]*(log((x)/rmc.df$ll.3.e[i]))))), col=rgb(0,0,1,.3), add=TRUE)
# abline(v=rmc.df$ll.3.e[i], col=rgb(0,0,1,.2), lwd=1, lty=5)
# curve(log10(rmc.df$eg.1[i]*exp((x)*rmc.df$eg.2[i])), col=rgb(1,0,0,.3), add=TRUE)
# }
#
# curve(log10(covid.2019.ru.full.ll.3$fit$par[2]/(1+exp(covid.2019.ru.full.ll.3$fit$par[1]*(log(x/covid.2019.ru.full.ll.3$fit$par[3]))))), col=4, lwd=1.5, lty=2, add=TRUE)
# curve(log10(covid.2019.ru.full.expoGrowth$coefficients[1]*exp(x*covid.2019.ru.full.expoGrowth$coefficients[2])), col=2, lwd=1.5, lty=2, add=TRUE)
# abline(v=covid.2019.ru.full.ll.3$fit$par[3], col=4, lwd=1.5, lty=2)
#
# points(log10(covid.2019.ru.i.dyn.tt$RUS.CS) ~ covid.2019.ru.i.dyn.tt$DAYS, 
# pch=21, col="white", bg=1)
#
# axis(1)
# axis(2, at=log10(c(1,10,100,1000,10000,100000,1000000)), labels=c("1","10","100","1K","10K","100K","1000K"))
# axis(2, at=log10(c(1:9, seq(10,100,10), seq(200,1000,100), seq(2000,10000,1000), seq(20000,100000,10000), seq(200000,1000000,100000))), labels=FALSE)
#
# dev.off()
#
# ### Running model for Moscow;
#
# png("../plots/COVID.2019.fitting.rmc.Mos.log10.png", height=750, width=1000, res=120, pointsize=10)
# par(mar=c(6,5,4,2)+.1)
#
# plot(log10(covid.2019.ru.i.dyn.tt$Mos.CS) ~ covid.2019.ru.i.dyn.tt$DAYS, 
# type="n", 
# xlim=c(0,median(rmc.df$ll.3.e)*1.5), ylim=c(0,log10(max(rmc.df$ll.3.d))),
# main=paste("Russian Federation / Moscow /",Sys.Date()),
# xlab="Days since 2020-01-31",
# ylab="Total cases registered",
# axes=FALSE
# )
#
# for(i in 1:nrow(rmc.Mos.df)){
# curve(log10(rmc.Mos.df$ll.3.d[i]/(1+exp(rmc.Mos.df$ll.3.b[i]*(log((x)/rmc.Mos.df$ll.3.e[i]))))), col=rgb(0,0,1,.3), add=TRUE)
# abline(v=rmc.Mos.df$ll.3.e[i], col=rgb(0,0,1,.2), lwd=1, lty=5)
# curve(log10(rmc.Mos.df$eg.1[i]*exp((x)*rmc.Mos.df$eg.2[i])), col=rgb(1,0,0,.3), add=TRUE)
# }
#
# curve(log10(covid.2019.ru.full.Mos.ll.3$fit$par[2]/(1+exp(covid.2019.ru.full.Mos.ll.3$fit$par[1]*(log(x/covid.2019.ru.full.Mos.ll.3$fit$par[3]))))), col=4, lwd=1.5, lty=2, add=TRUE)
# curve(log10(covid.2019.ru.full.Mos.expoGrowth$coefficients[1]*exp(x*covid.2019.ru.full.Mos.expoGrowth$coefficients[2])), col=2, lwd=1.5, lty=2, add=TRUE)
# abline(v=covid.2019.ru.full.Mos.ll.3$fit$par[3], col=4, lwd=1.5, lty=2)
#
# points(log10(covid.2019.ru.i.dyn.tt$Mos.CS) ~ covid.2019.ru.i.dyn.tt$DAYS, 
# pch=21, col="white", bg=1)
#
# axis(1)
# axis(2, at=log10(c(1,10,100,1000,10000,100000,1000000)), labels=c("1","10","100","1K","10K","100K","1000K"))
# axis(2, at=log10(c(1:9, seq(10,100,10), seq(200,1000,100), seq(2000,10000,1000), seq(20000,100000,10000), seq(200000,1000000,100000))), labels=FALSE)
#
# dev.off()
#
# # ################################################################
# # # # Do not execute this part of the code mindlessly!
# # dir.create("../plots/fit.animated/")
# #
# # # Running model plot animated;
# #
# # for(i in 1:nrow(rmc.df)){
# # if(i <= 9){
# #  png(file=paste("../plots/fit.animated/COVID.2019.fitting.rmc.00",i,".png", sep=""), height=750, width=1000, res=120, pointsize=10)
# #  } else if(i <= 99){
# #  png(file=paste("../plots/fit.animated/COVID.2019.fitting.rmc.0",i,".png", sep=""), height=750, width=1000, res=120, pointsize=10)
# #  } else {
# #  png(file=paste("../plots/fit.animated/COVID.2019.fitting.rmc.",i,".png", sep=""), height=750, width=1000, res=120, pointsize=10)
# #  }
# #  par(mar=c(6,5,4,2)+.1)
# #  
# #  plot(covid.2019.ru.i.dyn.tt$RUS.CS ~ covid.2019.ru.i.dyn.tt$DAYS, 
# #   type="n", 
# #   xlim=c(0,(median(rmc.df$ll.3.e)*2)), ylim=c(0,max(rmc.df$ll.3.d)),
# #   main=paste("Russian Federation,",covid.2019.ru.i.dyn.tt$TIME[i+32]),
# #   xlab="Days since 2020-01-31",
# #   ylab="Total cases registered", 
# #   axes=FALSE
# #  )
# #
# # for(k in 1:i){
# #  curve(rmc.df$ll.3.d[k]/(1+exp(rmc.df$ll.3.b[k]*(log(x/rmc.df$ll.3.e[k])))), n=1001, col=rgb(0,0,1,.2), add=TRUE)
# #  abline(v=rmc.df$ll.3.e[k], col=rgb(0,0,1,.2), lwd=1, lty=5)
# #  curve(rmc.df$eg.1[k]*exp((x)*rmc.df$eg.2[k]), n=1001, col=rgb(1,0,0,.2), add=TRUE)
# # }
# #
# # curve(rmc.df$ll.3.d[i]/(1+exp(rmc.df$ll.3.b[i]*(log(x/rmc.df$ll.3.e[i])))), n=1001, col=4, lwd=1.5, add=TRUE)
# # curve(rmc.df$eg.1[i]*exp(x*rmc.df$eg.2[i]), n=1001, col=2, lwd=1.5, add=TRUE)
# # abline(v=rmc.df$ll.3.e[i], col=4, lwd=1, lty=5)
# #
# # points(covid.2019.ru.i.dyn.tt$RUS.CS[1:32] ~ covid.2019.ru.i.dyn.tt$DAYS[1:32], 
# # pch=21, col="white", bg=1)
# # points(covid.2019.ru.i.dyn.tt$RUS.CS[1:i+32] ~ covid.2019.ru.i.dyn.tt$DAYS[1:i+32], 
# # pch=21, col="white", bg=1)
# #
# # axis(1)
# # axis(2)
# #
# # dev.off()
# # }
# #
# # Running model plot animated log10;
# # dir.create("../plots/fit.animated/log10/")
# #
# # for(i in 1:nrow(rmc.df)){
# # if(i <= 9){
# #  png(file=paste("../plots/fit.animated/log10/COVID.2019.fitting.rmc.log10.00",i,".png", sep=""), height=750, width=1000, res=120, pointsize=10)
# #  } else if(i <= 99){
# #  png(file=paste("../plots/fit.animated/log10/COVID.2019.fitting.rmc.log10.0",i,".png", sep=""), height=750, width=1000, res=120, pointsize=10)
# #  } else {
# #  png(file=paste("../plots/fit.animated/log10/COVID.2019.fitting.rmc.log10.",i,".png", sep=""), height=750, width=1000, res=120, pointsize=10)
# #  }
# #  par(mar=c(6,5,4,2)+.1)
# #  
# #  plot(log10(covid.2019.ru.i.dyn.tt$RUS.CS) ~ covid.2019.ru.i.dyn.tt$DAYS, 
# #   type="n", 
# #   xlim=c(0,(median(rmc.df$ll.3.e)*2)), ylim=c(0,(log10(max(rmc.df$ll.3.d)))),
# #   main=paste("Russian Federation,",covid.2019.ru.i.dyn.tt$TIME[i+32]),
# #   xlab="Days since 2020-01-31",
# #   ylab="Total cases registered", 
# #   axes=FALSE
# #  )
# #
# # for(k in 1:i){
# #  curve(log10(rmc.df$ll.3.d[k]/(1+exp(rmc.df$ll.3.b[k]*(log(x/rmc.df$ll.3.e[k]))))), n=1001, col=rgb(0,0,1,.2), add=TRUE)
# #  abline(v=rmc.df$ll.3.e[k], col=rgb(0,0,1,.2), lwd=1, lty=5)
# #  curve(log10(rmc.df$eg.1[k]*exp((x)*rmc.df$eg.2[k])), n=1001, col=rgb(1,0,0,.2), add=TRUE)
# # }
# #
# # curve(log10(rmc.df$ll.3.d[i]/(1+exp(rmc.df$ll.3.b[i]*(log(x/rmc.df$ll.3.e[i]))))), n=1001, col=4, lwd=1.5, add=TRUE)
# # curve(log10(rmc.df$eg.1[i]*exp(x*rmc.df$eg.2[i])), n=1001, col=2, lwd=1.5, add=TRUE)
# # abline(v=rmc.df$ll.3.e[i], col=4, lwd=1, lty=5)
# #
# # points(log10(covid.2019.ru.i.dyn.tt$RUS.CS[1:32]) ~ covid.2019.ru.i.dyn.tt$DAYS[1:32], 
# # pch=21, col="white", bg=1)
# # points(log10(covid.2019.ru.i.dyn.tt$RUS.CS[1:i+32]) ~ covid.2019.ru.i.dyn.tt$DAYS[1:i+32], 
# # pch=21, col="white", bg=1)
# #
# # axis(1)
# # axis(2, 
# # at=log10(c(1:9,seq(10,90,10),seq(100,900,100),seq(1000,9000,1000),seq(10000,90000,10000),seq(100000,900000,100000),seq(1000000,9000000,1000000))),
# # labels=c("1",rep(NA,8),"10",rep(NA,8),"100",rep(NA,8),"1K",rep(NA,8),"10K",rep(NA,8),"100K",rep(NA,8),"1M",rep(NA,8))
# # )
# #
# # dev.off()
# # }
# #
# # # ffmpeg command line: 
# # #
# # # ffmpeg -r 2 -f image2 -s 1000x750 -i COVID.2019.fitting.rmc.%03d.png -vcodec libx264 -crf 25 -pix_fmt yuv420p COVID.2019.fitting.rmc.animated.mp4
# # # ffmpeg -r 2 -f image2 -s 1000x750 -i COVID.2019.fitting.rmc.log10.%03d.png -vcodec libx264 -crf 25 -pix_fmt yuv420p COVID.2019.fitting.rmc.log10.animated.mp4

################################################################
# Multipart model;

# Russia and Moscow

covid.2019.ru.i.dyn.tt.20200131_20200306 <- subset(covid.2019.ru.i.dyn.tt, covid.2019.ru.i.dyn.tt$DAYS <= 36)
covid.2019.ru.i.dyn.tt.20200307_20200403 <- subset(covid.2019.ru.i.dyn.tt, covid.2019.ru.i.dyn.tt$DAYS >= 37 & covid.2019.ru.i.dyn.tt$DAYS <= 64)
covid.2019.ru.i.dyn.tt.20200404_20200420 <- subset(covid.2019.ru.i.dyn.tt, covid.2019.ru.i.dyn.tt$DAYS >= 65 & covid.2019.ru.i.dyn.tt$DAYS <= 81)
covid.2019.ru.i.dyn.tt.20200421_202005__ <- subset(covid.2019.ru.i.dyn.tt, covid.2019.ru.i.dyn.tt$DAYS >= 82)

# St. Petersburg

covid.2019.ru.i.dyn.tt.SPb.20200131_20200313 <- subset(covid.2019.ru.i.dyn.tt, covid.2019.ru.i.dyn.tt$DAYS <= 43)
covid.2019.ru.i.dyn.tt.SPb.20200314_20200331 <- subset(covid.2019.ru.i.dyn.tt, covid.2019.ru.i.dyn.tt$DAYS >= 44 & covid.2019.ru.i.dyn.tt$DAYS <= 61)
covid.2019.ru.i.dyn.tt.SPb.20200401_20200417 <- subset(covid.2019.ru.i.dyn.tt, covid.2019.ru.i.dyn.tt$DAYS >= 62 & covid.2019.ru.i.dyn.tt$DAYS <= 78)
covid.2019.ru.i.dyn.tt.SPb.20200418_202005__ <- subset(covid.2019.ru.i.dyn.tt, covid.2019.ru.i.dyn.tt$DAYS >= 79)

################################################################
# Running model;

covid.2019.ru.i.dyn.tt.20200131_20200306.ts <- NULL
covid.2019.ru.i.dyn.tt.20200131_20200306.ts <- as.list(covid.2019.ru.i.dyn.tt.20200131_20200306.ts)

for(i in 33:nrow(covid.2019.ru.i.dyn.tt.20200131_20200306)){
covid.2019.ru.i.dyn.tt.20200131_20200306.ts[[i]] <- covid.2019.ru.i.dyn.tt.20200131_20200306[1:i,]
}

rmc.20200131_20200306.df <- NULL

for(i in 33:nrow(covid.2019.ru.i.dyn.tt.20200131_20200306)){

rmc.20200131_20200306.df <- rbind.data.frame(rmc.20200131_20200306.df,
c(
drm(
covid.2019.ru.i.dyn.tt.20200131_20200306.ts[[i]]$RUS.CS ~ covid.2019.ru.i.dyn.tt.20200131_20200306.ts[[i]]$DAYS, 
fct = DRC.expoGrowth()
)$coefficients,
drm(
covid.2019.ru.i.dyn.tt.20200131_20200306.ts[[i]]$RUS.CS ~ covid.2019.ru.i.dyn.tt.20200131_20200306.ts[[i]]$DAYS, 
fct = LL.3()
)$fit$par
)
)
}

colnames(rmc.20200131_20200306.df) <- c("eg.1","eg.2","ll.3.b","ll.3.d","ll.3.e")

# rmc.20200131_20200306 for Moscow

rmc.20200131_20200306.Mos.df <- NULL

for(i in 33:nrow(covid.2019.ru.i.dyn.tt.20200131_20200306)){

rmc.20200131_20200306.Mos.df <- rbind.data.frame(rmc.20200131_20200306.Mos.df,
c(
drm(
covid.2019.ru.i.dyn.tt.20200131_20200306.ts[[i]]$Mos.CS ~ covid.2019.ru.i.dyn.tt.20200131_20200306.ts[[i]]$DAYS, 
fct = DRC.expoGrowth()
)$coefficients,
drm(
covid.2019.ru.i.dyn.tt.20200131_20200306.ts[[i]]$Mos.CS ~ covid.2019.ru.i.dyn.tt.20200131_20200306.ts[[i]]$DAYS, 
fct = LL.3()
)$fit$par
)
)
}

colnames(rmc.20200131_20200306.Mos.df) <- c("eg.1","eg.2","ll.3.b","ll.3.d","ll.3.e")


# rmc.20200131_20200306 for RUS.Prov

rmc.20200131_20200306.RUS.Prov.df <- NULL

for(i in 33:nrow(covid.2019.ru.i.dyn.tt.20200131_20200306)){

rmc.20200131_20200306.RUS.Prov.df <- rbind.data.frame(rmc.20200131_20200306.RUS.Prov.df,
c(
drm(
covid.2019.ru.i.dyn.tt.20200131_20200306.ts[[i]]$RUS.Prov.CS ~ covid.2019.ru.i.dyn.tt.20200131_20200306.ts[[i]]$DAYS, 
fct = DRC.expoGrowth()
)$coefficients,
drm(
covid.2019.ru.i.dyn.tt.20200131_20200306.ts[[i]]$RUS.Prov.CS ~ covid.2019.ru.i.dyn.tt.20200131_20200306.ts[[i]]$DAYS, 
fct = LL.3()
)$fit$par
)
)
}

colnames(rmc.20200131_20200306.RUS.Prov.df) <- c("eg.1","eg.2","ll.3.b","ll.3.d","ll.3.e")

# covid.2019.ru.i.dyn.tt.SPb.20200131_20200313
# rmc.20200131_20200306 for Moscow

rmc.SPb.20200131_20200313.df <- NULL

for(i in 33:nrow(covid.2019.ru.i.dyn.tt.20200131_20200306)){

rmc.SPb.20200131_20200313.df <- rbind.data.frame(rmc.SPb.20200131_20200313.df,
c(
drm(
covid.2019.ru.i.dyn.tt.20200131_20200306.ts[[i]]$Mos.CS ~ covid.2019.ru.i.dyn.tt.20200131_20200306.ts[[i]]$DAYS, 
fct = DRC.expoGrowth()
)$coefficients,
drm(
covid.2019.ru.i.dyn.tt.20200131_20200306.ts[[i]]$Mos.CS ~ covid.2019.ru.i.dyn.tt.20200131_20200306.ts[[i]]$DAYS, 
fct = LL.3()
)$fit$par
)
)
}

colnames(rmc.SPb.20200131_20200313.df) <- c("eg.1","eg.2","ll.3.b","ll.3.d","ll.3.e")

################################################################

################################################################
# Running model;

covid.2019.ru.i.dyn.tt.20200307_20200403.ts <- NULL
covid.2019.ru.i.dyn.tt.20200307_20200403.ts <- as.list(covid.2019.ru.i.dyn.tt.20200307_20200403.ts)

for(i in 2:nrow(covid.2019.ru.i.dyn.tt.20200307_20200403)){
covid.2019.ru.i.dyn.tt.20200307_20200403.ts[[i]] <- covid.2019.ru.i.dyn.tt.20200307_20200403[1:i,]
}

rmc.20200307_20200403.df <- NULL

for(i in 2:nrow(covid.2019.ru.i.dyn.tt.20200307_20200403)){

rmc.20200307_20200403.df <- rbind.data.frame(rmc.20200307_20200403.df,
c(
drm(
covid.2019.ru.i.dyn.tt.20200307_20200403.ts[[i]]$RUS.CS ~ covid.2019.ru.i.dyn.tt.20200307_20200403.ts[[i]]$DAYS, 
fct = DRC.expoGrowth()
)$coefficients,
drm(
covid.2019.ru.i.dyn.tt.20200307_20200403.ts[[i]]$RUS.CS ~ covid.2019.ru.i.dyn.tt.20200307_20200403.ts[[i]]$DAYS, 
fct = LL.3()
)$fit$par
)
)
}

colnames(rmc.20200307_20200403.df) <- c("eg.1","eg.2","ll.3.b","ll.3.d","ll.3.e")

# RMC.20200307_20200403 for Moscow

rmc.20200307_20200403.Mos.df <- NULL

for(i in 2:nrow(covid.2019.ru.i.dyn.tt.20200307_20200403)){

rmc.20200307_20200403.Mos.df <- rbind.data.frame(rmc.20200307_20200403.Mos.df,
c(
drm(
covid.2019.ru.i.dyn.tt.20200307_20200403.ts[[i]]$Mos.CS ~ covid.2019.ru.i.dyn.tt.20200307_20200403.ts[[i]]$DAYS, 
fct = DRC.expoGrowth()
)$coefficients,
drm(
covid.2019.ru.i.dyn.tt.20200307_20200403.ts[[i]]$Mos.CS ~ covid.2019.ru.i.dyn.tt.20200307_20200403.ts[[i]]$DAYS, 
fct = LL.3()
)$fit$par
)
)
}

colnames(rmc.20200307_20200403.Mos.df) <- c("eg.1","eg.2","ll.3.b","ll.3.d","ll.3.e")

# RMC.20200307_20200403 for RUS.Prov

rmc.20200307_20200403.RUS.Prov.df <- NULL

for(i in 2:nrow(covid.2019.ru.i.dyn.tt.20200307_20200403)){

rmc.20200307_20200403.RUS.Prov.df <- rbind.data.frame(rmc.20200307_20200403.RUS.Prov.df,
c(
drm(
covid.2019.ru.i.dyn.tt.20200307_20200403.ts[[i]]$RUS.Prov.CS ~ covid.2019.ru.i.dyn.tt.20200307_20200403.ts[[i]]$DAYS, 
fct = DRC.expoGrowth()
)$coefficients,
drm(
covid.2019.ru.i.dyn.tt.20200307_20200403.ts[[i]]$RUS.Prov.CS ~ covid.2019.ru.i.dyn.tt.20200307_20200403.ts[[i]]$DAYS, 
fct = LL.3()
)$fit$par
)
)
}

colnames(rmc.20200307_20200403.RUS.Prov.df) <- c("eg.1","eg.2","ll.3.b","ll.3.d","ll.3.e")

################################################################

# RMC.20200307_20200403 for St. Petersburg

# covid.2019.ru.i.dyn.tt.SPb.20200314_20200331

rmc.SPb.20200314_20200331.df <- NULL

for(i in 2:nrow(covid.2019.ru.i.dyn.tt.20200307_20200403)){

rmc.SPb.20200314_20200331.df <- rbind.data.frame(rmc.SPb.20200314_20200331.df,
c(
drm(
covid.2019.ru.i.dyn.tt.20200307_20200403.ts[[i]]$SPb.CS ~ covid.2019.ru.i.dyn.tt.20200307_20200403.ts[[i]]$DAYS, 
fct = DRC.expoGrowth()
)$coefficients,
drm(
covid.2019.ru.i.dyn.tt.20200307_20200403.ts[[i]]$SPb.CS ~ covid.2019.ru.i.dyn.tt.20200307_20200403.ts[[i]]$DAYS, 
fct = LL.3()
)$fit$par
)
)
}

colnames(rmc.SPb.20200314_20200331.df) <- c("eg.1","eg.2","ll.3.b","ll.3.d","ll.3.e")

################################################################

################################################################
# Running model;

covid.2019.ru.i.dyn.tt.20200404_20200420.ts <- NULL
covid.2019.ru.i.dyn.tt.20200404_20200420.ts <- as.list(covid.2019.ru.i.dyn.tt.20200404_20200420.ts)

for(i in 2:nrow(covid.2019.ru.i.dyn.tt.20200404_20200420)){
covid.2019.ru.i.dyn.tt.20200404_20200420.ts[[i]] <- covid.2019.ru.i.dyn.tt.20200404_20200420[1:i,]
}

rmc.20200404_20200420.df <- NULL

for(i in 2:nrow(covid.2019.ru.i.dyn.tt.20200404_20200420)){

rmc.20200404_20200420.df <- rbind.data.frame(rmc.20200404_20200420.df,
c(
drm(
covid.2019.ru.i.dyn.tt.20200404_20200420.ts[[i]]$RUS.CS ~ covid.2019.ru.i.dyn.tt.20200404_20200420.ts[[i]]$DAYS, 
fct = DRC.expoGrowth()
)$coefficients,
drm(
covid.2019.ru.i.dyn.tt.20200404_20200420.ts[[i]]$RUS.CS ~ covid.2019.ru.i.dyn.tt.20200404_20200420.ts[[i]]$DAYS, 
fct = LL.3()
)$fit$par
)
)
}

colnames(rmc.20200404_20200420.df) <- c("eg.1","eg.2","ll.3.b","ll.3.d","ll.3.e")

# RMC.20200404_20200420 for Moscow

rmc.20200404_20200420.Mos.df <- NULL

for(i in 2:nrow(covid.2019.ru.i.dyn.tt.20200404_20200420)){

rmc.20200404_20200420.Mos.df <- rbind.data.frame(rmc.20200404_20200420.Mos.df,
c(
drm(
covid.2019.ru.i.dyn.tt.20200404_20200420.ts[[i]]$Mos.CS ~ covid.2019.ru.i.dyn.tt.20200404_20200420.ts[[i]]$DAYS, 
fct = DRC.expoGrowth()
)$coefficients,
drm(
covid.2019.ru.i.dyn.tt.20200404_20200420.ts[[i]]$Mos.CS ~ covid.2019.ru.i.dyn.tt.20200404_20200420.ts[[i]]$DAYS, 
fct = LL.3()
)$fit$par
)
)
}

colnames(rmc.20200404_20200420.Mos.df) <- c("eg.1","eg.2","ll.3.b","ll.3.d","ll.3.e")

# RMC.20200404_20200420 for RUS.Prov

rmc.20200404_20200420.RUS.Prov.df <- NULL

for(i in 2:nrow(covid.2019.ru.i.dyn.tt.20200404_20200420)){

rmc.20200404_20200420.RUS.Prov.df <- rbind.data.frame(rmc.20200404_20200420.RUS.Prov.df,
c(
drm(
covid.2019.ru.i.dyn.tt.20200404_20200420.ts[[i]]$RUS.Prov.CS ~ covid.2019.ru.i.dyn.tt.20200404_20200420.ts[[i]]$DAYS, 
fct = DRC.expoGrowth()
)$coefficients,
drm(
covid.2019.ru.i.dyn.tt.20200404_20200420.ts[[i]]$RUS.Prov.CS ~ covid.2019.ru.i.dyn.tt.20200404_20200420.ts[[i]]$DAYS, 
fct = LL.3()
)$fit$par
)
)
}

colnames(rmc.20200404_20200420.RUS.Prov.df) <- c("eg.1","eg.2","ll.3.b","ll.3.d","ll.3.e")

################################################################

# RMC.20200404_20200420 for St. Petersburg

# covid.2019.ru.i.dyn.tt.SPb.20200401_20200417

rmc.SPb.20200401_20200417.df <- NULL

for(i in 2:nrow(covid.2019.ru.i.dyn.tt.20200404_20200420)){

rmc.SPb.20200401_20200417.df <- rbind.data.frame(rmc.SPb.20200401_20200417.df,
c(
drm(
covid.2019.ru.i.dyn.tt.20200404_20200420.ts[[i]]$SPb.CS ~ covid.2019.ru.i.dyn.tt.20200404_20200420.ts[[i]]$DAYS, 
fct = DRC.expoGrowth()
)$coefficients,
drm(
covid.2019.ru.i.dyn.tt.20200404_20200420.ts[[i]]$SPb.CS ~ covid.2019.ru.i.dyn.tt.20200404_20200420.ts[[i]]$DAYS, 
fct = LL.3()
)$fit$par
)
)
}

colnames(rmc.SPb.20200401_20200417.df) <- c("eg.1","eg.2","ll.3.b","ll.3.d","ll.3.e")

################################################################

################################################################
# Running model;

covid.2019.ru.i.dyn.tt.20200421_202005__.ts <- NULL
covid.2019.ru.i.dyn.tt.20200421_202005__.ts <- as.list(covid.2019.ru.i.dyn.tt.20200421_202005__.ts)

for(i in 2:nrow(covid.2019.ru.i.dyn.tt.20200421_202005__)){
covid.2019.ru.i.dyn.tt.20200421_202005__.ts[[i]] <- covid.2019.ru.i.dyn.tt.20200421_202005__[1:i,]
}

rmc.20200421_202005__.df <- NULL

for(i in 2:nrow(covid.2019.ru.i.dyn.tt.20200421_202005__)){

if(i != 7){
rmc.20200421_202005__.df <- rbind.data.frame(rmc.20200421_202005__.df,
c(
drm(
covid.2019.ru.i.dyn.tt.20200421_202005__.ts[[i]]$RUS.CS ~ covid.2019.ru.i.dyn.tt.20200421_202005__.ts[[i]]$DAYS, 
fct = DRC.expoGrowth()
)$coefficients, #c(NA,NA,NA)
drm(
covid.2019.ru.i.dyn.tt.20200421_202005__.ts[[i]]$RUS.CS ~ covid.2019.ru.i.dyn.tt.20200421_202005__.ts[[i]]$DAYS, 
fct = LL.3()
)$fit$par
)
)
} else if(i == 7){
rmc.20200421_202005__.df <- rbind.data.frame(rmc.20200421_202005__.df,
c(
drm(
covid.2019.ru.i.dyn.tt.20200421_202005__.ts[[i]]$RUS.CS ~ covid.2019.ru.i.dyn.tt.20200421_202005__.ts[[i]]$DAYS, 
fct = DRC.expoGrowth()
)$coefficients, c(NA,NA,NA)
# drm(
# covid.2019.ru.i.dyn.tt.20200421_202005__.ts[[i]]$RUS.CS ~ covid.2019.ru.i.dyn.tt.20200421_202005__.ts[[i]]$DAYS, 
# fct = LL.3()
# )$fit$par
)
)
}
}

colnames(rmc.20200421_202005__.df) <- c("eg.1","eg.2","ll.3.b","ll.3.d","ll.3.e")

# colnames(rmc.20200421_202005__.df) <- c("eg.1","eg.2")

# RMC.20200421_202005__ for Moscow

rmc.20200421_202005__.Mos.df <- NULL

for(i in 2:nrow(covid.2019.ru.i.dyn.tt.20200421_202005__)){

rmc.20200421_202005__.Mos.df <- rbind.data.frame(rmc.20200421_202005__.Mos.df,
c(
drm(
covid.2019.ru.i.dyn.tt.20200421_202005__.ts[[i]]$Mos.CS ~ covid.2019.ru.i.dyn.tt.20200421_202005__.ts[[i]]$DAYS, 
fct = DRC.expoGrowth()
)$coefficients,
drm(
covid.2019.ru.i.dyn.tt.20200421_202005__.ts[[i]]$Mos.CS ~ covid.2019.ru.i.dyn.tt.20200421_202005__.ts[[i]]$DAYS, 
fct = LL.3()
)$fit$par
)
)
}

colnames(rmc.20200421_202005__.Mos.df) <- c("eg.1","eg.2","ll.3.b","ll.3.d","ll.3.e")

# RMC.20200421_202005__ for RUS.Prov

rmc.20200421_202005__.RUS.Prov.df <- NULL

for(i in 2:nrow(covid.2019.ru.i.dyn.tt.20200421_202005__)){

rmc.20200421_202005__.RUS.Prov.df <- rbind.data.frame(rmc.20200421_202005__.RUS.Prov.df,
c(
drm(
covid.2019.ru.i.dyn.tt.20200421_202005__.ts[[i]]$RUS.Prov.CS ~ covid.2019.ru.i.dyn.tt.20200421_202005__.ts[[i]]$DAYS, 
fct = DRC.expoGrowth()
)$coefficients,
drm(
covid.2019.ru.i.dyn.tt.20200421_202005__.ts[[i]]$RUS.Prov.CS ~ covid.2019.ru.i.dyn.tt.20200421_202005__.ts[[i]]$DAYS, 
fct = LL.3()
)$fit$par
)
)
}

colnames(rmc.20200421_202005__.RUS.Prov.df) <- c("eg.1","eg.2","ll.3.b","ll.3.d","ll.3.e")

################################################################

# RMC.20200421_202005__ for St. Petersburg

# covid.2019.ru.i.dyn.tt.SPb.20200418_202005__

rmc.SPb.20200418_202005__.df <- NULL

for(i in 2:nrow(covid.2019.ru.i.dyn.tt.20200421_202005__)){

rmc.SPb.20200418_202005__.df <- rbind.data.frame(rmc.SPb.20200418_202005__.df,
c(
drm(
covid.2019.ru.i.dyn.tt.20200421_202005__.ts[[i]]$SPb.CS ~ covid.2019.ru.i.dyn.tt.20200421_202005__.ts[[i]]$DAYS, 
fct = DRC.expoGrowth()
)$coefficients,
drm(
covid.2019.ru.i.dyn.tt.20200421_202005__.ts[[i]]$SPb.CS ~ covid.2019.ru.i.dyn.tt.20200421_202005__.ts[[i]]$DAYS, 
fct = LL.3()
)$fit$par
)
)
}

colnames(rmc.SPb.20200418_202005__.df) <- c("eg.1","eg.2","ll.3.b","ll.3.d","ll.3.e")

################################################################

# # ffmpeg command line: 
# #
# # ffmpeg -r 2 -f image2 -s 1000x750 -i COVID.2019.fitting.rmc.%03d.png -vcodec libx264 -crf 25 -pix_fmt yuv420p COVID.2019.fitting.rmc.animated.mp4
# # ffmpeg -r 2 -f image2 -s 1000x750 -i COVID.2019.fitting.rmc.log10.%03d.png -vcodec libx264 -crf 25 -pix_fmt yuv420p COVID.2019.fitting.rmc.log10.animated.mp4

# dim(covid.2019.ru.i.dyn.tt.20200131_20200306)
# dim(covid.2019.ru.i.dyn.tt.20200307_20200403)
# dim(covid.2019.ru.i.dyn.tt.20200404_20200420)
# dim(covid.2019.ru.i.dyn.tt.20200421_202005__)
#
# dim(rmc.20200131_20200306.df)
# dim(rmc.20200307_20200403.df)
# dim(rmc.20200404_20200420.df)
# dim(rmc.20200421_202005__.df)

# Partial running model plot, log10;

png("../plots/31.COVID.2019.fitting.rmc.partial.01.log10.png", height=750, width=1000, res=120, pointsize=10)
par(mar=c(6,5,4,2)+.1)

plot(log10(covid.2019.ru.i.dyn.tt$RUS.CS) ~ covid.2019.ru.i.dyn.tt$DAYS, 
type="n", 
xlim=c(0,nrow(covid.2019.ru.i.dyn.tt)*1.5), ylim=c(0,log10(max(covid.2019.ru.i.dyn.tt$RUS.CS)*5)),
main=paste("Russian Federation /",covid.2019.ru.i.dyn.tt$TIME[length(covid.2019.ru.i.dyn.tt$TIME)]),
xlab="Days since 2020-01-31",
ylab="Total cases registered",
axes=FALSE
)

rect(
xleft=c(2,62,123,183),
xright=c((1+29), (61+30), (122+30), (182+31)),
ybottom=rep(-10,3),
ytop=rep(8,3),
col=rgb(0,0,0,.05), border=rgb(0,0,0,.01)
)

for(i in 1:nrow(rmc.20200131_20200306.df)){
curve(log10(rmc.20200131_20200306.df$ll.3.d[i]/(1+exp(rmc.20200131_20200306.df$ll.3.b[i]*(log((x)/rmc.20200131_20200306.df$ll.3.e[i]))))), col=rgb(0,0,1,.3), add=TRUE)
abline(v=rmc.20200131_20200306.df$ll.3.e[i], col=rgb(0,0,1,.2), lwd=1, lty=5)
curve(log10(rmc.20200131_20200306.df$eg.1[i]*exp((x)*rmc.20200131_20200306.df$eg.2[i])), col=rgb(1,0,0,.3), add=TRUE)
}

# curve(log10(covid.2019.ru.full.ll.3$fit$par[2]/(1+exp(covid.2019.ru.full.ll.3$fit$par[1]*(log(x/covid.2019.ru.full.ll.3$fit$par[3]))))), col=4, lwd=1.5, lty=2, add=TRUE)
# curve(log10(covid.2019.ru.full.expoGrowth$coefficients[1]*exp(x*covid.2019.ru.full.expoGrowth$coefficients[2])), col=2, lwd=1.5, lty=2, add=TRUE)
# abline(v=covid.2019.ru.full.ll.3$fit$par[3], col=4, lwd=1.5, lty=2)

for(i in 1:nrow(rmc.20200307_20200403.df)){
curve(log10(rmc.20200307_20200403.df$ll.3.d[i]/(1+exp(rmc.20200307_20200403.df$ll.3.b[i]*(log((x)/rmc.20200307_20200403.df$ll.3.e[i]))))), col=rgb(0,0,1,.3), add=TRUE)
abline(v=rmc.20200307_20200403.df$ll.3.e[i], col=rgb(0,0,1,.2), lwd=1, lty=5)
curve(log10(rmc.20200307_20200403.df$eg.1[i]*exp((x)*rmc.20200307_20200403.df$eg.2[i])), col=rgb(1,0,0,.3), add=TRUE)
}

# curve(log10(covid.2019.ru.full.ll.3$fit$par[2]/(1+exp(covid.2019.ru.full.ll.3$fit$par[1]*(log(x/covid.2019.ru.full.ll.3$fit$par[3]))))), col=4, lwd=1.5, lty=2, add=TRUE)
# curve(log10(covid.2019.ru.full.expoGrowth$coefficients[1]*exp(x*covid.2019.ru.full.expoGrowth$coefficients[2])), col=2, lwd=1.5, lty=2, add=TRUE)
# abline(v=covid.2019.ru.full.ll.3$fit$par[3], col=4, lwd=1.5, lty=2)

for(i in 1:nrow(rmc.20200404_20200420.df)){
curve(log10(rmc.20200404_20200420.df$ll.3.d[i]/(1+exp(rmc.20200404_20200420.df$ll.3.b[i]*(log((x)/rmc.20200404_20200420.df$ll.3.e[i]))))), col=rgb(0,0,1,.3), add=TRUE)
abline(v=rmc.20200404_20200420.df$ll.3.e[i], col=rgb(0,0,1,.2), lwd=1, lty=5)
curve(log10(rmc.20200404_20200420.df$eg.1[i]*exp((x)*rmc.20200404_20200420.df$eg.2[i])), col=rgb(1,0,0,.3), add=TRUE)
}

# curve(log10(covid.2019.ru.full.ll.3$fit$par[2]/(1+exp(covid.2019.ru.full.ll.3$fit$par[1]*(log(x/covid.2019.ru.full.ll.3$fit$par[3]))))), col=4, lwd=1.5, lty=2, add=TRUE)
# curve(log10(covid.2019.ru.full.expoGrowth$coefficients[1]*exp(x*covid.2019.ru.full.expoGrowth$coefficients[2])), col=2, lwd=1.5, lty=2, add=TRUE)
# abline(v=covid.2019.ru.full.ll.3$fit$par[3], col=4, lwd=1.5, lty=2)

for(i in 1:nrow(rmc.20200421_202005__.df)){
curve(log10(rmc.20200421_202005__.df$ll.3.d[i]/(1+exp(rmc.20200421_202005__.df$ll.3.b[i]*(log((x)/rmc.20200421_202005__.df$ll.3.e[i]))))), col=rgb(0,0,1,.3), add=TRUE)
abline(v=rmc.20200421_202005__.df$ll.3.e[i], col=rgb(0,0,1,.2), lwd=1, lty=5)
curve(log10(rmc.20200421_202005__.df$eg.1[i]*exp((x)*rmc.20200421_202005__.df$eg.2[i])), col=rgb(1,0,0,.3), add=TRUE)
}

curve(log10(rmc.20200421_202005__.df$ll.3.d[i]/(1+exp(rmc.20200421_202005__.df$ll.3.b[i]*(log((x)/rmc.20200421_202005__.df$ll.3.e[i]))))), col=rgb(0,0,1,1), lwd=1.5, lty=5, add=TRUE)
abline(v=rmc.20200421_202005__.df$ll.3.e[i], col=rgb(0,0,1,1), lwd=1.5, lty=5)
curve(log10(rmc.20200421_202005__.df$eg.1[i]*exp((x)*rmc.20200421_202005__.df$eg.2[i])), col=rgb(1,0,0,1), lwd=1.5, lty=5, add=TRUE)

points(log10(covid.2019.ru.i.dyn.tt$RUS.CS) ~ covid.2019.ru.i.dyn.tt$DAYS, 
pch=21, col="white", bg=1)

axis(1)
axis(2, at=log10(c(1,10,100,1000,10000,100000,1000000)), labels=c("1","10","100","1K","10K","100K","1000K"))
axis(2, at=log10(c(1:9, seq(10,100,10), seq(200,1000,100), seq(2000,10000,1000), seq(20000,100000,10000), seq(200000,1000000,100000))), labels=FALSE)

dev.off()

### Running model for Moscow;

png("../plots/33.COVID.2019.fitting.rmc.partial.03.Mos.log10.png", height=750, width=1000, res=120, pointsize=10)
par(mar=c(6,5,4,2)+.1)

plot(log10(covid.2019.ru.i.dyn.tt$Mos.CS) ~ covid.2019.ru.i.dyn.tt$DAYS, 
type="n", 
xlim=c(0,nrow(covid.2019.ru.i.dyn.tt)*1.5), ylim=c(0,log10(max(covid.2019.ru.i.dyn.tt$RUS.CS)*5)),
main=paste("Russian Federation / Moscow /",covid.2019.ru.i.dyn.tt$TIME[length(covid.2019.ru.i.dyn.tt$TIME)]),
xlab="Days since 2020-01-31",
ylab="Total cases registered",
axes=FALSE
)

rect(
xleft=c(2,62,123,183),
xright=c((1+29), (61+30), (122+30), (182+31)),
ybottom=rep(-10,3),
ytop=rep(8,3),
col=rgb(0,0,0,.05), border=rgb(0,0,0,.01)
)

for(i in 1:nrow(rmc.20200131_20200306.Mos.df)){
curve(log10(rmc.20200131_20200306.Mos.df$ll.3.d[i]/(1+exp(rmc.20200131_20200306.Mos.df$ll.3.b[i]*(log((x)/rmc.20200131_20200306.Mos.df$ll.3.e[i]))))), col=rgb(0,0,1,.3), add=TRUE)
abline(v=rmc.20200131_20200306.Mos.df$ll.3.e[i], col=rgb(0,0,1,.2), lwd=1, lty=5)
curve(log10(rmc.20200131_20200306.Mos.df$eg.1[i]*exp((x)*rmc.20200131_20200306.Mos.df$eg.2[i])), col=rgb(1,0,0,.3), add=TRUE)
}

# curve(log10(covid.2019.ru.full.ll.3$fit$par[2]/(1+exp(covid.2019.ru.full.ll.3$fit$par[1]*(log(x/covid.2019.ru.full.ll.3$fit$par[3]))))), col=4, lwd=1.5, lty=2, add=TRUE)
# curve(log10(covid.2019.ru.full.expoGrowth$coefficients[1]*exp(x*covid.2019.ru.full.expoGrowth$coefficients[2])), col=2, lwd=1.5, lty=2, add=TRUE)
# abline(v=covid.2019.ru.full.ll.3$fit$par[3], col=4, lwd=1.5, lty=2)

for(i in 1:nrow(rmc.20200307_20200403.Mos.df)){
curve(log10(rmc.20200307_20200403.Mos.df$ll.3.d[i]/(1+exp(rmc.20200307_20200403.Mos.df$ll.3.b[i]*(log((x)/rmc.20200307_20200403.Mos.df$ll.3.e[i]))))), col=rgb(0,0,1,.3), add=TRUE)
abline(v=rmc.20200307_20200403.Mos.df$ll.3.e[i], col=rgb(0,0,1,.2), lwd=1, lty=5)
curve(log10(rmc.20200307_20200403.Mos.df$eg.1[i]*exp((x)*rmc.20200307_20200403.Mos.df$eg.2[i])), col=rgb(1,0,0,.3), add=TRUE)
}

# curve(log10(covid.2019.ru.full.ll.3$fit$par[2]/(1+exp(covid.2019.ru.full.ll.3$fit$par[1]*(log(x/covid.2019.ru.full.ll.3$fit$par[3]))))), col=4, lwd=1.5, lty=2, add=TRUE)
# curve(log10(covid.2019.ru.full.expoGrowth$coefficients[1]*exp(x*covid.2019.ru.full.expoGrowth$coefficients[2])), col=2, lwd=1.5, lty=2, add=TRUE)
# abline(v=covid.2019.ru.full.ll.3$fit$par[3], col=4, lwd=1.5, lty=2)

for(i in 1:nrow(rmc.20200404_20200420.Mos.df)){
curve(log10(rmc.20200404_20200420.Mos.df$ll.3.d[i]/(1+exp(rmc.20200404_20200420.Mos.df$ll.3.b[i]*(log((x)/rmc.20200404_20200420.Mos.df$ll.3.e[i]))))), col=rgb(0,0,1,.3), add=TRUE)
abline(v=rmc.20200404_20200420.Mos.df$ll.3.e[i], col=rgb(0,0,1,.2), lwd=1, lty=5)
curve(log10(rmc.20200404_20200420.Mos.df$eg.1[i]*exp((x)*rmc.20200404_20200420.Mos.df$eg.2[i])), col=rgb(1,0,0,.3), add=TRUE)
}

# curve(log10(covid.2019.ru.full.ll.3$fit$par[2]/(1+exp(covid.2019.ru.full.ll.3$fit$par[1]*(log(x/covid.2019.ru.full.ll.3$fit$par[3]))))), col=4, lwd=1.5, lty=2, add=TRUE)
# curve(log10(covid.2019.ru.full.expoGrowth$coefficients[1]*exp(x*covid.2019.ru.full.expoGrowth$coefficients[2])), col=2, lwd=1.5, lty=2, add=TRUE)
# abline(v=covid.2019.ru.full.ll.3$fit$par[3], col=4, lwd=1.5, lty=2)

for(i in 1:nrow(rmc.20200421_202005__.Mos.df)){
curve(log10(rmc.20200421_202005__.Mos.df$ll.3.d[i]/(1+exp(rmc.20200421_202005__.Mos.df$ll.3.b[i]*(log((x)/rmc.20200421_202005__.Mos.df$ll.3.e[i]))))), col=rgb(0,0,1,.3), add=TRUE)
abline(v=rmc.20200421_202005__.Mos.df$ll.3.e[i], col=rgb(0,0,1,.2), lwd=1, lty=5)
curve(log10(rmc.20200421_202005__.Mos.df$eg.1[i]*exp((x)*rmc.20200421_202005__.Mos.df$eg.2[i])), col=rgb(1,0,0,.3), add=TRUE)
}

curve(log10(rmc.20200421_202005__.Mos.df$ll.3.d[i]/(1+exp(rmc.20200421_202005__.Mos.df$ll.3.b[i]*(log((x)/rmc.20200421_202005__.Mos.df$ll.3.e[i]))))), col=rgb(0,0,1,1), lwd=1.5, lty=5, add=TRUE)
abline(v=rmc.20200421_202005__.Mos.df$ll.3.e[i], col=rgb(0,0,1,1), lwd=1.5, lty=5)
curve(log10(rmc.20200421_202005__.Mos.df$eg.1[i]*exp((x)*rmc.20200421_202005__.Mos.df$eg.2[i])), col=rgb(1,0,0,1), lwd=1.5, lty=5, add=TRUE)

points(log10(covid.2019.ru.i.dyn.tt$Mos.CS) ~ covid.2019.ru.i.dyn.tt$DAYS, 
pch=21, col="white", bg=1)

axis(1)
axis(2, at=log10(c(1,10,100,1000,10000,100000,1000000)), labels=c("1","10","100","1K","10K","100K","1000K"))
axis(2, at=log10(c(1:9, seq(10,100,10), seq(200,1000,100), seq(2000,10000,1000), seq(20000,100000,10000), seq(200000,1000000,100000))), labels=FALSE)

dev.off()

### Running model for St. Petersburg;

png("../plots/34.COVID.2019.fitting.rmc.partial.04.SPb.log10.png", height=750, width=1000, res=120, pointsize=10)
par(mar=c(6,5,4,2)+.1)

plot(log10(covid.2019.ru.i.dyn.tt$SPb.CS) ~ covid.2019.ru.i.dyn.tt$DAYS, 
type="n", 
xlim=c(0,nrow(covid.2019.ru.i.dyn.tt)*1.5), ylim=c(0,log10(max(covid.2019.ru.i.dyn.tt$RUS.CS)*5)),
main=paste("Russian Federation / St. Petersburg /",covid.2019.ru.i.dyn.tt$TIME[length(covid.2019.ru.i.dyn.tt$TIME)]),
xlab="Days since 2020-01-31",
ylab="Total cases registered",
axes=FALSE
)

rect(
xleft=c(2,62,123,183),
xright=c((1+29), (61+30), (122+30), (182+31)),
ybottom=rep(-10,3),
ytop=rep(8,3),
col=rgb(0,0,0,.05), border=rgb(0,0,0,.01)
)

for(i in 1:nrow(rmc.SPb.20200131_20200313.df)){
curve(log10(rmc.SPb.20200131_20200313.df$ll.3.d[i]/(1+exp(rmc.SPb.20200131_20200313.df$ll.3.b[i]*(log((x)/rmc.SPb.20200131_20200313.df$ll.3.e[i]))))), col=rgb(0,0,1,.3), add=TRUE)
abline(v=rmc.SPb.20200131_20200313.df$ll.3.e[i], col=rgb(0,0,1,.2), lwd=1, lty=5)
curve(log10(rmc.SPb.20200131_20200313.df$eg.1[i]*exp((x)*rmc.SPb.20200131_20200313.df$eg.2[i])), col=rgb(1,0,0,.3), add=TRUE)
}

for(i in 1:nrow(rmc.SPb.20200314_20200331.df)){
curve(log10(rmc.SPb.20200314_20200331.df$ll.3.d[i]/(1+exp(rmc.SPb.20200314_20200331.df$ll.3.b[i]*(log((x)/rmc.SPb.20200314_20200331.df$ll.3.e[i]))))), col=rgb(0,0,1,.3), add=TRUE)
abline(v=rmc.SPb.20200314_20200331.df$ll.3.e[i], col=rgb(0,0,1,.2), lwd=1, lty=5)
curve(log10(rmc.SPb.20200314_20200331.df$eg.1[i]*exp((x)*rmc.SPb.20200314_20200331.df$eg.2[i])), col=rgb(1,0,0,.3), add=TRUE)
}

for(i in 1:nrow(rmc.SPb.20200401_20200417.df)){
curve(log10(rmc.SPb.20200401_20200417.df$ll.3.d[i]/(1+exp(rmc.SPb.20200401_20200417.df$ll.3.b[i]*(log((x)/rmc.SPb.20200401_20200417.df$ll.3.e[i]))))), col=rgb(0,0,1,.3), add=TRUE)
abline(v=rmc.SPb.20200401_20200417.df$ll.3.e[i], col=rgb(0,0,1,.2), lwd=1, lty=5)
curve(log10(rmc.SPb.20200401_20200417.df$eg.1[i]*exp((x)*rmc.SPb.20200401_20200417.df$eg.2[i])), col=rgb(1,0,0,.3), add=TRUE)
}

for(i in 1:nrow(rmc.SPb.20200418_202005__.df)){
curve(log10(rmc.SPb.20200418_202005__.df$ll.3.d[i]/(1+exp(rmc.SPb.20200418_202005__.df$ll.3.b[i]*(log((x)/rmc.SPb.20200418_202005__.df$ll.3.e[i]))))), col=rgb(0,0,1,.3), add=TRUE)
abline(v=rmc.SPb.20200418_202005__.df$ll.3.e[i], col=rgb(0,0,1,.2), lwd=1, lty=5)
curve(log10(rmc.SPb.20200418_202005__.df$eg.1[i]*exp((x)*rmc.SPb.20200418_202005__.df$eg.2[i])), col=rgb(1,0,0,.3), add=TRUE)
}

curve(log10(rmc.SPb.20200418_202005__.df$ll.3.d[i]/(1+exp(rmc.SPb.20200418_202005__.df$ll.3.b[i]*(log((x)/rmc.SPb.20200418_202005__.df$ll.3.e[i]))))), col=rgb(0,0,1,1), lwd=1.5, lty=5, add=TRUE)
abline(v=rmc.SPb.20200418_202005__.df$ll.3.e[i], col=rgb(0,0,1,1), lwd=1.5, lty=5)
curve(log10(rmc.SPb.20200418_202005__.df$eg.1[i]*exp((x)*rmc.SPb.20200418_202005__.df$eg.2[i])), col=rgb(1,0,0,1), lwd=1.5, lty=5, add=TRUE)

points(log10(covid.2019.ru.i.dyn.tt$SPb.CS) ~ covid.2019.ru.i.dyn.tt$DAYS, 
pch=21, col="white", bg=1)

axis(1)
axis(2, at=log10(c(1,10,100,1000,10000,100000,1000000)), labels=c("1","10","100","1K","10K","100K","1000K"))
axis(2, at=log10(c(1:9, seq(10,100,10), seq(200,1000,100), seq(2000,10000,1000), seq(20000,100000,10000), seq(200000,1000000,100000))), labels=FALSE)

dev.off()

# Russia without capitals and their regions;

### Running model for RUS.Prov;

png("../plots/32.COVID.2019.fitting.rmc.partial.02.RUS.Prov.log10.png", height=750, width=1000, res=120, pointsize=10)
par(mar=c(6,5,4,2)+.1)

plot(log10(covid.2019.ru.i.dyn.tt$RUS.Prov.CS) ~ covid.2019.ru.i.dyn.tt$DAYS, 
type="n", 
xlim=c(0,nrow(covid.2019.ru.i.dyn.tt)*1.5), ylim=c(0,log10(max(covid.2019.ru.i.dyn.tt$RUS.CS)*5)),
main=paste("Russia without Moscow, St. Petersburg, Moscow and Leningrad regions /",covid.2019.ru.i.dyn.tt$TIME[length(covid.2019.ru.i.dyn.tt$TIME)]),
xlab="Days since 2020-01-31",
ylab="Total cases registered",
axes=FALSE
)

rect(
xleft=c(2,62,123,183),
xright=c((1+29), (61+30), (122+30), (182+31)),
ybottom=rep(-10,3),
ytop=rep(8,3),
col=rgb(0,0,0,.05), border=rgb(0,0,0,.01)
)

for(i in 1:nrow(rmc.20200131_20200306.RUS.Prov.df)){
curve(log10(rmc.20200131_20200306.RUS.Prov.df$ll.3.d[i]/(1+exp(rmc.20200131_20200306.RUS.Prov.df$ll.3.b[i]*(log((x)/rmc.20200131_20200306.RUS.Prov.df$ll.3.e[i]))))), col=rgb(0,0,1,.3), add=TRUE)
abline(v=rmc.20200131_20200306.RUS.Prov.df$ll.3.e[i], col=rgb(0,0,1,.2), lwd=1, lty=5)
curve(log10(rmc.20200131_20200306.RUS.Prov.df$eg.1[i]*exp((x)*rmc.20200131_20200306.RUS.Prov.df$eg.2[i])), col=rgb(1,0,0,.3), add=TRUE)
}

for(i in 1:nrow(rmc.20200307_20200403.RUS.Prov.df)){
curve(log10(rmc.20200307_20200403.RUS.Prov.df$ll.3.d[i]/(1+exp(rmc.20200307_20200403.RUS.Prov.df$ll.3.b[i]*(log((x)/rmc.20200307_20200403.RUS.Prov.df$ll.3.e[i]))))), col=rgb(0,0,1,.3), add=TRUE)
abline(v=rmc.20200307_20200403.RUS.Prov.df$ll.3.e[i], col=rgb(0,0,1,.2), lwd=1, lty=5)
curve(log10(rmc.20200307_20200403.RUS.Prov.df$eg.1[i]*exp((x)*rmc.20200307_20200403.RUS.Prov.df$eg.2[i])), col=rgb(1,0,0,.3), add=TRUE)
}

for(i in 1:nrow(rmc.20200404_20200420.RUS.Prov.df)){
curve(log10(rmc.20200404_20200420.RUS.Prov.df$ll.3.d[i]/(1+exp(rmc.20200404_20200420.RUS.Prov.df$ll.3.b[i]*(log((x)/rmc.20200404_20200420.RUS.Prov.df$ll.3.e[i]))))), col=rgb(0,0,1,.3), add=TRUE)
abline(v=rmc.20200404_20200420.RUS.Prov.df$ll.3.e[i], col=rgb(0,0,1,.2), lwd=1, lty=5)
curve(log10(rmc.20200404_20200420.RUS.Prov.df$eg.1[i]*exp((x)*rmc.20200404_20200420.RUS.Prov.df$eg.2[i])), col=rgb(1,0,0,.3), add=TRUE)
}

for(i in 1:nrow(rmc.20200421_202005__.RUS.Prov.df)){
curve(log10(rmc.20200421_202005__.RUS.Prov.df$ll.3.d[i]/(1+exp(rmc.20200421_202005__.RUS.Prov.df$ll.3.b[i]*(log((x)/rmc.20200421_202005__.RUS.Prov.df$ll.3.e[i]))))), col=rgb(0,0,1,.3), add=TRUE)
abline(v=rmc.20200421_202005__.RUS.Prov.df$ll.3.e[i], col=rgb(0,0,1,.2), lwd=1, lty=5)
curve(log10(rmc.20200421_202005__.RUS.Prov.df$eg.1[i]*exp((x)*rmc.20200421_202005__.RUS.Prov.df$eg.2[i])), col=rgb(1,0,0,.3), add=TRUE)
}

curve(log10(rmc.20200421_202005__.RUS.Prov.df$ll.3.d[i]/(1+exp(rmc.20200421_202005__.RUS.Prov.df$ll.3.b[i]*(log((x)/rmc.20200421_202005__.RUS.Prov.df$ll.3.e[i]))))), col=rgb(0,0,1,1), lwd=1.5, lty=5, add=TRUE)
abline(v=rmc.20200421_202005__.RUS.Prov.df$ll.3.e[i], col=rgb(0,0,1,1), lwd=1.5, lty=5)
curve(log10(rmc.20200421_202005__.RUS.Prov.df$eg.1[i]*exp((x)*rmc.20200421_202005__.RUS.Prov.df$eg.2[i])), col=rgb(1,0,0,1), lwd=1.5, lty=5, add=TRUE)

points(log10(covid.2019.ru.i.dyn.tt$RUS.Prov.CS) ~ covid.2019.ru.i.dyn.tt$DAYS, 
pch=21, col="white", bg=1)

axis(1)
axis(2, at=log10(c(1,10,100,1000,10000,100000,1000000)), labels=c("1","10","100","1K","10K","100K","1000K"))
axis(2, at=log10(c(1:9, seq(10,100,10), seq(200,1000,100), seq(2000,10000,1000), seq(20000,100000,10000), seq(200000,1000000,100000))), labels=FALSE)

dev.off()

# varbinom.9.125.75 <- NULL
#
# for(i in 1:10000){
# varbinom.9.125.75 <- c(varbinom.9.125.75, var(rbinom(9, 125, .75)))
# }
