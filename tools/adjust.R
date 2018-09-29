adjust <- function(y, t, w) {

	#
	data <-y
	pop <- t
	std_rates <-w

	# start data.frame
	result <- data.frame(matrix(nrow = 20, ncol = 4))
	colnames(result) <- c('Year', 'Crude', 'Adjusted', 'SE')

	# prepare for loop
	range <- seq(1, 20)
	year <- 1998

	# loop for compute adjusted population
	for (i in range) {

		# formulas
		adjusted <- round(sum(((data[,i]/pop[,i])*100000)*std_rates), 2)
		crude <- round((sum(data[,i])/sum(pop[,i])*100000), 2)
		se <- round(crude/(sqrt(sum(pop[,i]))), 4)

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
