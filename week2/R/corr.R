corr <- function(directory, threshold = 0) {
  trueDir = paste(c(getwd(), "/", directory), collapse='')
#   result <- data.frame(sulfates <- numeric(0), nitrates <- numeric(0))
  x <- numeric()
  ids <- 1:332
  for(id in ids) {
    if(id < 10){
      name = paste(c("00", id), collapse='')
    } else if (id < 100) {
      name = paste(c("0", id), collapse='')  
    } else {
      name = id
    }
    filename = paste(c(trueDir, name, ".csv"), collapse='')
    table = read.csv(filename)
    good <- complete.cases(table)
    table <- table[good,]
    if(nrow(table) <= threshold ) {
      next  
    }
     x <- c(x, cor(table[, c("sulfate")], table[, c("nitrate")]))
  }
  return(x)
}