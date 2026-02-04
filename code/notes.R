# Goal: to learn how to plot in R with ggplot2 
# load packages
library(tidyverse)

# load data 
sample_data <- read_csv("sample_data.csv")

#no input needed
getwd()
Sys.Date()

#input needed 
sum(10,12)
round(3.1415)
round(3.1415,3)

# Plot 
ggplot(data = sample_data) + 
  # temp cs cells in lake ontario 
  aes( x = temperature, y = cells_per_ml, color = env_group, 
       size = chlorophyll) + 
  # update with understandable labels 
  labs(x = "Temperature (C)", 
       y = "Cels per mL", 
       title = "Does temperature affect microbial abundance?",
       color = "Environmental Group",
       size = "Chlorophyll (ug/L)") +
  # add point 
  geom_point() 
  

# Load in new data 
buoy_data <- read_csv("buoy_data.csv")
dim(buoy_data)
head(buoy_data)
ggplot(data = buoy_data) +
  aes(x = day_of_year, y = temperature, color = depth) +
  geom_line() + 
  facet_wrap(~buoy)

#what is the structure of the data?
str(buoy_data)

# Go back sample_data 
ggplot(data = sample_data) + 
  aes(x = env_group, y = cells_per_ml,
      fill = env_group) + 
  geom_jitter(shape = 23, alpha = 0.5, aes(size = chlorophyll)) +
  geom_boxplot(alpha = 0.5, outliers = FALSE) +
 # scale_color_manual(values = c("blue", "red", "yellow"))
  scale_color_brewer(palette = "Set1")

# Univariate plots 
ggplot(sample_data) +
  aes(x = cells_per_ml) + 
  geom_histogram(bins = 20) + 
  theme_linedraw()

#Saving plots 

ggsave("histogram_cellsPerML.png",
       width = 6, height = 4, 
       units = "in")


# what is the relationship between chlorphyll and temperature? 
ggplot(data = sample_data) +
  aes( x = temperature, y = chlorophyll) +
  geom_smooth() +
  geom_point(aes(color = env_group, size = total_nitrogen))
  labs(x = "Temperature (C)",
       y = "Chlorophyll (ug/L)") +
  theme_bw()+
    theme(legend.position = "right")

