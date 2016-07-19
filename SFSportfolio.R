# clear variables and close windows
rm(list = ls(all = TRUE))
graphics.off()

x = read.csv("C:/Users/Public/Portf2000_2016Ret.csv")

n = nrow(x)
xf = apply(x, 2, sort)                          # Sort data in ascending order

t = (1:n)/(n + 1)
dat1 = cbind(pnorm((xf - mean(xf))/sd(xf)), t)  # Determine probabilities
dat2 = cbind(t, t)

# PP Plot
plot(dat1, col = "blue", ylab = (""), xlab = c(""))
lines(dat2, col = "red", lwd = 2.5)
title("PP Plot of Daily Return of Portfolio")

# QQ Plot
dev.new()
qqnorm(xf, col = "blue", xlab = c(""), ylab = c(""), main = ("QQ Plot of Daily Return of Portfolio"))
qqline(xf, col = "red", lwd = 2.5) 