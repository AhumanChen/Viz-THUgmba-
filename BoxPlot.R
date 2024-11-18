# Install ggplot2 if it's not installed
if (!require(ggplot2)) install.packages("ggplot2")

# Load the ggplot2 library
library(ggplot2)

# Load your CSV data (replace 'your_file.csv' with the actual filename)
data <- read.csv("your_file.csv")

# Replace 'Price' with the column name in your CSV file that holds stock prices
ggplot(data, aes(x = Price)) +
  geom_density(fill = "lightblue", alpha = 0.5, color = "black", size = 1) +
  labs(title = "Stock Price with Key Price Range", 
       x = "Price", y = "Density") +
  
  # Add vertical dashed lines at specific prices
  geom_vline(xintercept = c(80, 100, 120), 
             linetype = "dashed", color = "red", size = 1) +
  
  # Customize the theme to use a grey background
  theme(
    #panel.background = element_rect(fill = "grey90", color = NA),  # Panel background
    #plot.background = element_rect(fill = "grey85", color = NA),   # Plot background
    panel.grid.major = element_line(color = "white"),              # Major grid lines
    panel.grid.minor = element_line(color = "white", linetype = "dotted"),  # Minor grid lines
    plot.title = element_text(hjust = 0.5)  # Center align title
  ) +
  
  # Add annotation text at the bottom-right corner
  labs(title = "Stock Price: Histogram and Density Chart", 
       x = "Price", 
       y = "Density",
       captions = "By Chen, Data Visualization course, Tunghai University, 2024")
