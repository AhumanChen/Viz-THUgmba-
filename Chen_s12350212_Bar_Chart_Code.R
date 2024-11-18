#
#Chen
#Practice bar chart
#



library(gcookbook)
library(ggplot2)

ggplot(pg_mean, aes(x=group, y=weight, fill = group)) +
  geom_col()+
  labs(title="My Bar Chart, colorized",
       caption = "By Chen, Data Visualization Course, Tunghai University, 2024")+
  theme(plot.title = element_text(hjust =0.05, size = 20))

ggplot(BOD, aes(x= Time, y=demand))+
  geom_line()+
  labs(title="My Line Chart",
       caption = "By Chen, Datavisualization Course, Tunghai University, 2024")+
  theme(plot.title = element_text(hjust = 0.5, size = 20))
ggplot(diamonds, aes(x = carat))+
  geom_bar() +
  labs(title = "Bar Chart",
       caption = "By Chen, Data Visualiazation Course, Tunghai University, 2024")+
  theme(plot.title = element_text(hjust = 0.5, size = 20))
ggplot(diamonds, aes(x = carat))+
  geom_bar() +
  labs(title = "Bar Chart",
       caption = "By Chen, Data Visualiazation Course, Tunghai University, 2024")+
  theme(plot.title = element_text(hjust = 0.5, size = 20))

ggplot(diamonds, aes(x = carat))+
  geom_histogram() +
  labs(title = "Histogram Chart",
       caption = "By Chen, Data Visualiazation Course, Tunghai University, 2024")+
  theme(plot.title = element_text(hjust = 0.5, size = 20))

ggplot(diamonds, aes(x = group , y = weight))+
  geom_histogram()

df <- read.csv("Accidents.csv")

ggplot(df, aes(x = Year, y = Death))+
  geom_col()+
  labs(title = "Accidents:Death",
       caption = "By Chen, Data Visualization Course, Tunghai University, 2024")+
  theme(plot.title = element_text(hjust = 0.5, size = 20))


df <- read.csv("VizClimate.csv")

ggplot(df, aes(x = Month, y = Temperature))+
  geom_bar() +
  labs(title = "Temperature of Taoyuan",
       caption = "By Chen, Data Visualization Course, Tunghai University, 2024")+
  theme(plot.title= element_text(hjust= 0.5), size = 20)

df <- read.csv("VizClimate.csv")

# Convert Month to a factor to treat it as categorical
df$Month <- factor(df$Month, levels = 1:12, labels = c("January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"))

ggplot(df, aes(x = Month, y = Temperature)) +
  geom_bar(stat = "identity") +  # Use stat = "identity" for bar heights based on values
  labs(title = "Temperature of Taoyuan",
       caption = "By Chen, Data Visualization Course, Tunghai University, 2024") +
  theme(plot.title = element_text(hjust = 0.5, size = 20))


ggplot(df, aes(x = Month, y = Humidity)) +
  geom_bar(stat = "identity") +  # Use stat = "identity" for bar heights based on values
  labs(title = "Humidity of Taoyuan",
       caption = "By Chen, Data Visualization Course, Tunghai University, 2024") +
  theme(plot.title = element_text(hjust = 0.5, size = 20))



ggplot(pg_mean, aes(x=group, y=weight)) +
  geom_point()



# Create Data
data <- data.frame(
  group=LETTERS[1:5],
  value=c(13,7,9,21,2)
)

# Basic piechart
ggplot(data, aes(x="", y=value, fill=group)) +
  geom_bar(stat="identity", width=1) +
  coord_polar("y", start=0)

ggplot(faithful, aes(x = waiting)) + 
  geom_histogram()+
  labs(title = "Old Faithful Geyser",
       caption = "By Chen, Data Visualization Course, Tunghai University, 2024")

library(ggplot2)

# Basic plot
ggplot(data = faithful, aes(x = waiting)) +
  geom_histogram(binwidth = 2, fill = "gray40") +
  
  # Modify labels
  labs(
    title = "Old Faithful Geyser",    # Title
    x = "waiting",                    # X-axis label
    y = "Count",                      # Y-axis label
    caption = "By Chen, Data Visualization Course, Tunghai University, 2024"
  ) +
  
  # Center the title
  theme(
    plot.title = element_text(hjust = 0.5, size = 18),  # hjust = 0.5 centers the title
    axis.title.y = element_text(size = 12)              # Adjust y-axis label size
  )

library(ggplot2)

# Basic plot with borders between bars
ggplot(data = faithful, aes(x = waiting)) +
  geom_histogram() +  # Add black borders
  
  # Modify labels
  labs(
    title = "Old Faithful Geyser",    # Title
    x = "Waiting",                    # X-axis label
    y = "Count",                      # Y-axis label
    caption = "By Chen, Data Visualization Course, Tunghai University, 2024"
  ) +
  
  # Center the title
  theme(
    plot.title = element_text(hjust = 0.5, size = 18),  # hjust = 0.5 centers the title
    axis.title.y = element_text(size = 12)              # Adjust y-axis label size
  )


ggplot(faithful, aes(x = waiting))+
  geom_histogram(binwidth = 5, fill = 'white', colour = "black")