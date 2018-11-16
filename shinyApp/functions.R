ControlChartPlot <- function(ChartStat, LowerLimit, UpperLimit) {

    m <- length(ChartStat)
    
    if (length(LowerLimit) == 1) {
    
        LowerLimit.vec <- rep(LowerLimit, m)
    
    } else {
    
        LowerLimit.vec <- LowerLimit
    
    }
    
    if (length(UpperLimit) == 1) {
    
        UpperLimit.vec <- rep(UpperLimit, m)
    
    } else {
    
        UpperLimit.vec <- UpperLimit
    
    }
    
    plot.max <- max(c(ChartStat, LowerLimit.vec, UpperLimit.vec))
    plot.min <- min(c(ChartStat, LowerLimit.vec, UpperLimit.vec))
    
    ####This part will be replaced by ggplot2
    
    plot(c(1, m), c(plot.min, plot.max), type = 'n', xlab = 'Batches', ylab = 'Charting Statistics')
    points(seq(1, m, 1), ChartStat, type = 'o', lty = 1)
    points(seq(1, m, 1), LowerLimit.vec, type = 'l', lty = 2)
    points(seq(1, m, 1), UpperLimit.vec, type = 'l', lty = 2)

}

#########################################################################

Ph1ChartStatAndLimits <- function(Ph1data, ChartConst = 3) {

    Ph1ChartStat <- rowMeans(Ph1data)
    Ph1sigma <- sqrt(mean(diag(var(t(Ph1Data)))))
    Ph1LowerLimit <- Ph1mu - ChartConst * Ph1sigma
    Ph1UpperLimit <- Ph1mu + ChartConst * Ph1sigma
    
    out <- list(Ph1ChartStat = Ph1ChartStat, Ph1LowerLimit = Ph1LowerLimit, Ph1UpperLimit = Ph1UpperLimit)
    
    return(out)
    
}