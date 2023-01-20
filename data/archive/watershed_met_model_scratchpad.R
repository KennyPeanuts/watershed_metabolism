# Exploratory Calculations of Watershed Paper

GPP.stream <- rnorm(5, 5, 1)
GPP.one.pond <- c(rnorm(4, 5, 1), rnorm(1, 100, 1))
GPP.two.pond <- c(rnorm(3, 5, 1), rnorm(2, 100, 1))
GPP.three.pond <- c(rnorm(2, 5, 1), rnorm(3, 100, 1))

mean(GPP.stream)
mean(GPP.one.pond)
mean(GPP.two.pond)
mean(GPP.three.pond)

means <- c(mean(GPP.stream), mean(GPP.one.pond), mean(GPP.two.pond), mean(GPP.three.pond))
ponds <- 0:3

plot(ponds, means, type = "b")
summary(lm(means ~ ponds))

CIs <- c((1.96 * (sd(GPP.stream)/sqrt(5))), (1.96 * (sd(GPP.one.pond)/sqrt(5))), (1.96 * (sd(GPP.two.pond)/sqrt(5))), (1.96 * (sd(GPP.three.pond)/sqrt(5))))

plot(ponds, CIs, type = "b")
summary(lm(CIs ~ ponds))
