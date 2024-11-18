#
# Chen
# 2024/10/14
# Histogram
#

library(ggplot2)

ggplot(faithful, aes(x = waiting))+
  geom_histogram(binwidth = 5, fill = "white", color = "black")

ggplot(faithful, aes(x = waiting))+
  geom_histogram(binwidth = 10, fill = "white", color = "black")

ggplot(faithful, aes(x = waiting))+
  geom_histogram(binwidth = 3, fill = "white", color = "black")

binsize <- diff(range(faithful$waiting)) / 6


library(MASS)
ggplot(birthwt  , aes(x = bwt)) +
  geom_histogram( fill = "white", color = "black")+
  facet_grid(smoke ~ .)


birthwt$smoke <- recode_factor(birthwt$smoke, '0' = 'No Smoke', '1' = 'Smoke' )

ggplot(birthwt  , aes(x = bwt)) +
  geom_histogram( fill = "white", color = "black")+
  facet_grid(. ~ smoke)+
  labs(title = "Birth Weight",
       x="Birth weight",
       y="Count",
       captions = "By Chen, Data Visualization course, Tunghai University, 2024"
       )+
  theme(
    plot.title = element_text(hjust = 0.5, size = 18),
    axis.title.y = element_text(size=12)
  )
df$factor_variable <- as.factor(df$smoke)
birthwt$smoke <- recode_factor(birthwt$smoke, '0' = 'No Smoke', '1' = 'Smoke' )

ggplot(birthwt, aes(x = bwt, fill = smoke))+
  geom_histogram(position = "identity", alpha = 0.4)



ggplot(faithful, aes(x = waiting, y = ..density..))+
  geom_histogram(fill = "cornsilk", color = "grey60", size = .2)+
  geom_density()+
  labs(title = "Density Chart",
       x="Waiting",
       y="Count",
       captions = "By Chen, Data Visualization course, Tunghai University, 2024"
  )
  xlim(35,105)
  
  
  data <- read.csv("Stocks.csv")

# Replace 'Price' with the actual column name containing the stock prices
ggplot(data, aes(x = Price)) +
  geom_histogram(fill = "cornsilk", color = "grey60", size = .2) +
  geom_density(color = "black", size = 1) +
  labs(title = "Stock Price: Histogram and Density Chart", 
       x = "Price", 
       y = "Density",
       captions = "By Chen, Data Visualization course, Tunghai University, 2024") +
  theme_minimal() +
  theme(plot.title = element_text(hjust = 0.5)) 
  

df <- read.csv("Stocks.csv")

ggplot(df, aes(x= Price, y = ..density..))+
  geom_histogram(fill = "cornsilk", color = "grey60", size = 0.2)+
  geom_density()+
  labs(title = "Stock Price: Histogram and Density Chart", 
       x = "Price", 
       y = "Density",
       captions = "By Chen, Data Visualization course, Tunghai University, 2024")+
  xlim(35,105)


# Load the ggplot2 library
library(ggplot2)

# Load your CSV data (replace 'your_file.csv' with the actual filename)
data <- read.csv("Stocks.csv")

# Replace 'Price' with the column name in your CSV file that holds stock prices
ggplot(data, aes(x = Price)) +
  geom_density(fill = "lightblue", alpha = 0.5, color = "black", size = 1) +
  labs(title = "Stock Price with Key Price Range", 
       x = "Price", y = "Density")+
  theme(plot.title = element_text(hjust = 0.5)) +

  labs(title = "Stock Price: Histogram and Density Chart", 
       x = "Price", 
       y = "Density",
       captions = "By Chen, Data Visualization course, Tunghai University, 2024")
