library(ggplot2)
unzip('activity.zip')

activity_frame_complete <- read.csv('activity.csv')
valid_rows <- !is.na( activity_frame_complete$steps )
activity_frame <- activity_frame_complete[valid_rows,]

aggregate_steps.sum <- aggregate( steps ~ date, activity_frame, sum )
aggregate_steps.mean <- aggregate( steps ~ date, activity_frame, mean)
mean_aggregate_steps <- mean( aggregate_steps.sum$steps)
median_aggregate_steps <- median( aggregate_steps.sum$steps )

hist_agg <- ggplot( aggregate_steps.sum, aes(steps)) + geom_histogram(aes(fill = ..count..), binwidth=1000) +
  scale_fill_gradient("Count", low = "yellow", high = "red") +
  labs( title = paste("mean = ", mean_aggregate_steps, " median = ", median_aggregate_steps ) )

activity_ts <- ts( activity_frame$interval, start = c(2012,10) )
highest_number_steps <- activity_frame[activity_frame$steps == max( activity_frame$steps ), ]
activity_plot.title <- paste( "The max number of steps is ", highest_number_steps$steps," occured at ", highest_number_steps$date, ", interval ", highest_number_steps$interval, sep = "")

