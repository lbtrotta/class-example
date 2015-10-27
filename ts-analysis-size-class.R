get_data <- function(){
  read.csv("shrub_dimensions_labeled.csv")
  return(data)
}

get_size_class <- function(weight, threshold){
  if(weight > threshold){
    size_class <- "large"
  }
  else{
    size_class <-"small"
  }
  return(size_class)
}