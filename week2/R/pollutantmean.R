pollutantmean <- function(directory, pollutant, ids = 1:332) {
  trueDir = paste(c(getwd(), "/", directory), collapse='')
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
    print(table)
  }
}