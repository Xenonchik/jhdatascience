rankhospital <- function(state, outcome, num = "best") {
  
  vars <- list(heart_attack = "Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack", 
               heart_failure = "Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure" , 
               pneumonia = "Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia"
  )
  outName = vars[[gsub(" ", "_", outcome)]]
  data <- read.csv("week4/outcome-of-care-measures.csv", colClasses = "character")
  data <- data[data$State==state, c("Hospital.Name", outName)]
  data[,outName] <- as.numeric(data[,outName])
  data <- data[complete.cases(data),]
  data <- data[ order(data[,2], data[,1]), ]
  if(num == "best") num <- 1
  else if(num == "worst") num <- nrow(data)
  return(data[num,][[1]])
}
