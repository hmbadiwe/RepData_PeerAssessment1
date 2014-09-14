library(ggplot2)
unzip('activity.zip')



generate_histogram <- function(agg_sum){
  mean_aggregate_steps <- mean( agg_sum$steps)
  median_aggregate_steps <- median( agg_sum$steps )
  ggplot( agg_sum, aes(steps)) + geom_histogram(aes(fill = ..count..), binwidth=1000) +
    scale_fill_gradient("Count", low = "yellow", high = "red") +
    labs( title = paste("mean = ", mean_aggregate_steps, " median = ", median_aggregate_steps ) )  
}

fill_in_blanks <- function(total_frame, interval_frame){
  index <- 1
  while( index <= length(total_frame$steps ) ){
    if( is.na(total_frame$steps[index])){
      step_from_int_row <- interval_frame[aggregate_steps.mean_by_interval$interval == total_frame$interval[index],]
      step_from_int <- round( step_from_int_row[, 2] )
      total_frame$steps[index] <- step_from_int
    }
    index <- index + 1
  }
  total_frame
}


