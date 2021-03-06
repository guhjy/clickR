#' Plot of the coefficients of a model
#'
#' @description Creates a plot of the coefficients of a model
#' @param coefs A vector with each coefficient
#' @param lwr.int A vector with the lower end of the CI
#' @param upper.int A vector with the upper end of the CI
#' @param offset Y-axis offset for the coefficients
#' @param coefnames Name for each variable
#' @param abline.pos Position for the vertical reference line
#' @param sorted Should the coefficients be sorted from highest to lowest?
#' @param reverse Should the order be reversed?
#' @param pch Type of point
#' @param xlim Limits of the X-axis
#' @param ylim Limits of the Y-axis
#' @param color Color for the points
#' @param ... Further arguments passed to axis()
#' @return A plot of the coefficients with their CI
#' @importFrom graphics abline lines plot.new plot.window points axis
#' @export
#' @examples
#' lm1 <- lm(Petal.Length ~ Sepal.Width + Species, data=iris)
#' a<-report(lm1)
#' par(mar=c(4, 10, 3, 2))
#' #Coefplot calling plot.reportmodel
#' plot(a)
#' #Manual coefplot
#' coefplot(coefs=c(1, 2, 3), lwr.int=c(0, 1, 2), upper.int=c(5, 6, 7), coefnames=c("A", "B", "C"))
coefplot <- function(coefs, lwr.int=coefs, upper.int=coefs, offset=0, coefnames=names(coefs), abline.pos=0, sorted=FALSE, reverse=FALSE, pch=16, xlim=c(min(lwr.int, na.rm=TRUE), max(upper.int, na.rm=TRUE)), ylim=c(1, length(coefs)), color="black", ...){
  color <- as.character(data.frame(color, coefs)[,1])
  if(is.null(coefnames)) coefnames <- 1:length(coefs)
  dat <- data.frame(coefs, lwr.int, upper.int, coefnames)
  if(sorted) dat <- dat[order(dat$coefs),]
  if(reverse) dat <- dat[(dim(dat)[1]):1,]
  plot.new()
  plot.window(xlim=xlim, ylim=ylim)
  axis(3, ...)
  axis(2, at=c(1:length(coefs)), las=1, labels=dat$coefnames, lwd=0)
  abline(v=abline.pos, lty=2)
  points(dat$coefs, (1:length(coefs))+offset, pch=pch, col=color)
  for(i in 1:length(coefs)){
    lines(x=c(dat$lwr.int[i], dat$upper.int[i]), y=c(i, i)+offset, col=color[i])
  }
}


#' Coefplot for reportmodel objects
#'
#' @description Creates a coefplot from the reportmodel object
#' @param x A reportmodel object
#' @param ... Further arguments passed to coefplot
#' @export
#' @examples
#' lm1 <- lm(Petal.Length ~ Sepal.Width + Species, data=iris)
#' a<-report(lm1)
#' par(mar=c(4, 10, 3, 2))
#' plot(a)   #Coefplot calling plot.reportmodel
plot.reportmodel<-function(x, ...){
  coefplot(x$coefficients, x$lwr.int, x$upper.int, ...)
}
