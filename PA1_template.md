# Reproducible Research: Peer Assessment 1


## Loading and preprocessing the data
Presentation layer is split from logic which is stored in 'activity.R'



## What is the mean total number of steps taken per day?
![plot of chunk unnamed-chunk-2](./PA1_template_files/figure-html/unnamed-chunk-2.png) 


## What is the average daily activity pattern?

```r
highest_number_steps <- activity_frame[activity_frame$steps == max( activity_frame$steps ), ]
activity_plot.title <- paste( "The max number of steps is ", highest_number_steps$steps,"occured at", highest_number_steps$date, ", interval ", highest_number_steps$interval, sep = " ")

plot( activity_frame$interval, activity_frame$steps, type = "l", xlab = "Time Series", ylab="Number of Steps", col="blue", main  = activity_plot.title)
```

![plot of chunk unnamed-chunk-3](./PA1_template_files/figure-html/unnamed-chunk-3.png) 


## Imputing missing values

```r
total_missing_values <- sum( is.na( activity_frame_complete$steps) )
paste( "The total number of missing values are", total_missing_values)
```

```
## [1] "The total number of missing values are 2304"
```

```r
activity_frame_mod <- fill_in_blanks( activity_frame_complete, aggregate_steps.mean_by_interval )
aggregate_steps.sum.mod <- aggregate( steps ~ date, activity_frame_mod, sum )
generate_histogram( aggregate_steps.sum.mod)
```

![plot of chunk unnamed-chunk-4](./PA1_template_files/figure-html/unnamed-chunk-4.png) 


## Are there differences in activity patterns between weekdays and weekends?
