# Dell analytics
setwd("C:/Users/nunes/AI/ml/Health-analytics/med_std/explore")




mov_avg <- function(vec_ind, vec_time, n){
  
  ### INPUTS
  ### arguments definition
  # vec_ind: vector related to dependent variable
  # vec_time: vector related to timestamp
  # n: number of moving average
  
  lim_max = max(vec_ind)
  plot(vec_ind ~ vec_time, type = 'l', ylim = c(0, lim_max), lwd = 2)
  grid() # Draw gridlines
  
  f <- rep(1/n, n)# average of current sample and 1 previous samples (red)
  y_lag <- filter(vec_ind, f, sides=1)
  lines(vec_time, y_lag, col="red", lwd = 2) # calculating a moving average
  
}



apc <- function(dataset, est){
  
  ### INPUTS
  ### arguments definition
  # dataset: define nrow(dataset)
  # est: define estimate and standard error using est <- summary(prais_winsten())
  
  estimate <- est$coefficients[2,1] # getting estimate from prais coefficients summary
  t_value <- qt(1 - .025, nrow(dataset)) # getting t-value for confidence interval
  std_error <- est$coefficients[2,2] # getting standard error from prais coefficients summary
  
  apc <- -1 + 10 ** estimate # anual percent change (Taxa de incremento anual)
  apc_minCI <- -1 + 10 ** (estimate - (t_value*std_error)) # anual percent change; min IC 
  apc_maxCI <- -1 + 10 ** (estimate + (t_value*std_error)) # anual percent change; max IC

  print(paste("APC: ", round(apc, 4), " or ", round(apc*100, 2),"%"),quote=FALSE)
  print(paste("APC-IC95%_minimo: ", round(apc_minCI, 4), " or ", round(apc_minCI*100, 2),"%"),quote=FALSE)
  print(paste("APC-IC95%_maximo: ", round(apc_maxCI, 4), " or ", round(apc_maxCI*100, 2),"%"),quote=FALSE)
}





