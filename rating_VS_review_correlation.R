library(dplyr)
library(ggplot2)

rating.df = read.csv("products_table.csv")

plot_data <- rating.df %>%
  group_by(product_id) %>%
  summarise(
    avg_rating = mean(rating, na.rm = TRUE),
    total_reviews = sum(reviewCount, na.rm = TRUE) 
  )


summary(plot_data)

cor_test <- cor.test(plot_data$avg_rating, plot_data$total_reviews, method = "pearson")

print(cor_test)