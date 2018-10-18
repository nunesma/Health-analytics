adjust <- function(data, pop, std_rates, dec = 2) {

	# arguments definition
#	data = observed fequence
#	pop = reference population
#	std_rates: = weight based on world population

	# starting data.frame
	result <- data.frame(matrix(nrow = 20, ncol = 4))
	colnames(result) <- c('Year', 'Crude', 'Adjusted', 'SE')

	# prepare for loop
	range <- seq(1, 20)
	year <- 1998

	# loop for compute adjusted population
	for (i in range) {

		# formulas
		adjusted <- round(sum(((data[,i]/pop[,i])*100000)*std_rates), dec)
		crude <- round((sum(data[,i])/sum(pop[,i])*100000), dec)
		se <- round(crude/(sqrt(sum(pop[,i]))), dec)

		# returns the result on console
#		print(paste(' ', year, crude, adjusted, se, ' '))

		# returns a data frame
		result[i, 1] <- year
		result[i, 2] <- crude
		result[i, 3] <- adjusted
		result[i, 4] <- se

		year = year + 1
	}

	return(result)
}


crude <- function(data, pop, std_rates, dec = 2) {

	# arguments definition
#	data = observed fequence
#	pop = reference population
#	std_rates: = weight based on world population

	# starting data.frame
	result <- data.frame(matrix(nrow = 20, ncol = 19))
	colnames(result) <- c("Year", "f0_9y", "f10_19y", "f20_29y", "f30_39y", "f40_49y", "f50_59y", "f60_69y", "f70_79y", "f80my", "SE0", "SE10", "SE20", "SE30", "SE40", "SE50", "SE60", "SE70", "SE80")


	# prepare for loop
	range <- seq(1, 20)
	year <- 1998

	# loop for compute adjusted population
	for (i in range) {

		# formulas
		crude <- round(((data[,i] / pop[,i])*100000), dec)
		se <- round(crude/(sqrt(pop[,i])), dec)

		# returns the result on console
#		print(paste(' ', year, crude, se, ' '))

		# returns a data frame
		result[i, 1] <- year
		result[i, 2:10] <- crude
		result[i, 11:19] <- se

		year = year + 1
	}

	return(result)
}


oneHot <- function (vector){
  variable <- as.character(unique(vector))

  result <- data.frame()
  for (i in (1 : length(variable))){
    model <- as.numeric((as.character(vector)) == variable[i])
    result[1:(length(vector)), i] <- model
  }
  colnames(result) <- c(paste("cid", (1:length(variable))))
  return(result)
}
