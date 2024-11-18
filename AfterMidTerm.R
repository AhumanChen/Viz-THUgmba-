library(dplyr)
score <- read.csv('student_scores.csv')

score %>% #from
  filter(English > 60 & Math > 70 & class_year == 2)

#select Englush, Math columns
score %>%
  filter(English > 60 & Math > 70 & class_year == 2) %>%
  select(English, Math)
#calculate average and add column
#score_avg <- score %>%
 # mutate(avg = English or something I don't know

#calculate group average

score_avg %>%
  group_by(class_year) %>%
  summarize(avg_English = mean(English),
            avg_Math = mean(Math))

cars <- mtcars

cars %>%
  select(mpg, hp,wt,cyl)

wt_kg <- cars %>%
  mutate(kg = wt * 0.45359237)

wt_kg %>%
  group_by(cyl) %>%
  summarise(mpg, hp, wt_kg)
####
library(dplyr)

# Select relevant columns
cars <- mtcars %>%
  select(mpg, hp, wt, cyl)

# Convert weight to kilograms and add a new column
wt_kg <- cars %>%
  mutate(wt_kg = wt * 453.59237)

# Summarize data by cylinder (cyl), calculating the mean for mpg, hp, and wt_kg
wt_kg_summary <- wt_kg %>%
  group_by(cyl) %>%
  summarise(mean_mpg = mean(mpg), mean_hp = mean(hp), mean_wt_kg = mean(wt_kg))

wt_kg_summary
#####
library(tidyverse)

ggplot(ToothGrowth, aes(x = dose, y = len, fill = dose))+
  geom_boxplot()+
  #geom_jitter()+ the scattered dots
  labs(title = "Tooth Growth",
       x = "Supp and Dose",
       y = "Length",
       caption = "By Chen, Data Visualization course, Tunghai University, 2024")
theme(plot.title = element_text(hjust = 0.5, size = 20))


ggplot(ToothGrowth, aes(x = supp, y = len, fill = supp))+
  geom_boxplot()+
  #geom_jitter()+ the scattered dots
  labs(title = "Tooth Growth",
       x = "Supp and Dose",
       y = "Length",
       caption = "By Chen, Data Visualization course, Tunghai University, 2024")+
  scale_fill_discrete(name = "Dose")+ # change legend title
theme(plot.title = element_text(hjust = 0.5, size = 20),
      legend.position = "bottom")

ToothGrowth$dose <- as.factor(ToothGrowth$dose)
####
ggplot(iris, aes(x = Species, y = Sepal.Length, fill = Species))+
  geom_boxplot()+
  #geom_jitter()+ the scattered dots
  labs(title = "Iris",
       x = "Species",
       y = "Sepal Length",
       caption = "By Chen, Data Visualization course, Tunghai University, 2024")+
theme(plot.title = element_text(hjust = 0.5, size = 20))
#644, 480
library(viridis)
ggplot(iris, aes(x = Species, y = Sepal.Length, fill = Species))+
  scale_fill_viridis(discrete = TRUE, alpha = 0.5)+
  geom_boxplot(notch = TRUE)+
  stat_summary(fun.y = "mean", geom = "point", shape = 15, size = 5, fill = "white")+
  #geom_jitter()+ the scattered dots
  labs(title = "Iris",
       x = "Species",
       y = "Sepal Length",
       caption = "By Chen, Data Visualization course, Tunghai University, 2024")+
  scale_fill_discrete(name = "Dose")+ # change legend title
  theme(plot.title = element_text(hjust = 0.5, size = 20),
        legend.position = "bottom")
#640, 480
ggplot(cars, aes(x = cyl, y = mpg, fill = cyl))+
  scale_fill_viridis(discrete = TRUE, alpha = 0.5)+
  geom_boxplot()+
  #stat_summary(fun.y = "mean", geom = "point", shape = 15, size = 5, fill = "white")+
  #geom_jitter()+ the scattered dots
  labs(title = "Engine and Mileage",
       x = "Cylinder",        ##################################
       y = "MPG",
       caption = "By Chen, Data Visualization course, Tunghai University, 2024")+
  scale_fill_discrete(name = "# of cynlinder")+ # change legend title
  theme(plot.title = element_text(hjust = 0.5, size = 20),
        legend.position = "bottom")
###
library(ggplot2)
library(viridis)

ggplot(mtcars, aes(x = as.factor(cyl), y = mpg, fill = as.factor(cyl))) +
  scale_fill_viridis(discrete = TRUE, alpha = 0.5) +
  geom_boxplot() +
  #stat_summary(fun = "mean", geom = "point", shape = 15, size = 5, color = "white") +
  #geom_jitter(width = 0.2, alpha = 0.6) +  # Optional for adding scattered dots
  labs(
    title = "Engine and Mileage",
    x = "# of cylinder",
    y = "MPG",
    caption = "By Chen, Data Visualization course, Tunghai University, 2024"
  ) +
  scale_fill_discrete(name = "# of cylinders") +  # Update legend title
  theme(
    plot.title = element_text(hjust = 0.5, size = 20),
    legend.position = "bottom"
  )
###640,480
library(gcookbook)
countries%>%
  filter(Year == 2009 &  healthexp > 2000 ) %>%
  ggplot(aes(x = infmortality)) +
  #scale_fill_viridis(discrete = TRUE, alpha = 0.5) +
  geom_dotplot(binwidth = 0.2,) +
  #stat_summary(fun = "mean", geom = "point", shape = 15, size = 5, color = "white") +
  #geom_jitter(width = 0.2, alpha = 0.6) +  # Optional for adding scattered dots
  labs(
    title = "Infant Mortality (Year == 2009 & healthexp > 2000)",
    x = "Infant Mortality",
    y = "Count",
    caption = "By Chen, Data Visualization course, Tunghai University, 2024"
  ) +
  #scale_fill_discrete(name = "# of cylinders") +  # Update legend title
    theme(
    plot.title = element_text(hjust = 0.5, size = 15),
    legend.position = "bottom")+
  annotate('text', x = 5, y = 10, label = "Hello World")
### 640,480
library(ggplot2)
faithful %>%
  mutate(group == cut(eruptions, breaks = c(-Inf, 3, Inf),labels = c("Group1", "Group2")))
p <- ggplot(faithful, aes( x = eruptions, y = waiting))+
  scale_fill_manual(values = c("Group1"= "Blue", "Group2" = "Red"))
  geom_point()
p+
  annotate("Text", x = 2, y = 70, label = "Group1")+
  annotate("Text", x = 3.5, y = 90, label = "Group2")
####
library(ggplot2)
library(dplyr)

# Create a new column 'group' using mutate
faithful <- faithful %>%
  mutate(group = cut(eruptions, breaks = c(-Inf, 3, Inf), labels = c("Group1", "Group2")))
                #ifelse(eruptions > 3,2,1))  library(dplyr)
# Create the ggplot object
p <- ggplot(faithful, aes(x = eruptions, y = waiting, color = group)) +
  geom_point() +  # Added geom_point to the plot
  labs(color = "group")+
  scale_color_discrete(name = "Group")+
  scale_color_manual(values = c("Group1" = "Blue", "Group2" = "Red")) +  # Use color instead of fill
  annotate("text", x = 2, y = 70, label = "Group1",
           family = "serif", fontface = "italic", color = "darkred", size = 3) +  # Corrected "Text" to "text"
  annotate("text", x = 3.5, y = 90, label = "Group2",
           family = "serif", fontface = "italic", color = "darkred", size = 3 )+  # Corrected "Text" to "text"
  labs(
    title = "Infant Mortality (Year == 2009 & healthexp > 2000)",
    x = "Infant Mortality",
    y = "Count",
    caption = "By Chen, Data Visualization course, Tunghai University, 2024"
  )+
# Display the plot
#print(p)
  
  ####################################
##640.480
faithful <- faithful %>%
  mutate(group = ifelse(waiting < 75 & faithful$eruption < 4, 1,2)) # eruption < 4, then group 1, otherwise group2

faithful$group = as.factor(faithful$group)  ####### FACTORING

p <- ggplot(faithful, aes(x = eruptions, y = waiting, color = group))+
  geom_point() +
  labs(color = "Group")+
  annotate("text", x = 3, y = 48, label = "Group1")+
  annotate("text", x = 4.5 , y = 66, label = "Group2")
#changing legend title text
p <- ggplot(faithful, aes(x = eruptions, y = waiting, color = group))+
  geom_point()+
  scale_color_discrete(name = "Group")+
  annotate("text", x = 3, y=48, label = "Group1")+
  annotate("text", x = 4.5, y=66, label = "Group2")+

  labs(
    title = "Faithful: Eruption and Waiting",
    x = "Eruption",
    y = "Waiting",
    caption = "By Chen, Data Visualization course, Tunghai University, 2024"
  )+theme(plot.title = element_text(hjust = 0.5, size = 20))
print(p)
###640, 480
library(ggrepel)
p <- ggplot(mtcars, aes(wt, mpg))+
  geom_point()+
  geom_label_repel(aes(label = rownames(mtcars)), size = 3.5)+
  labs(
    title = "Weight and Mileage",
    x = "Weight",
    y = "Mileage",
    caption = "By Chen, Data Visualization course, Tunghai University, 2024"
  )+theme(plot.title = element_text(hjust = 0.5, size = 20))
  print(p)
###640.480
p <- ggplot(data.frame( x = c(-3,3)), aes(x = x))+
  stat_function(fun = dnorm, color = "blue", fill = 'red', geom = "polygon", alpha = 0.5)+
  annotate("text", x = 2, y = 0.3 , parse = TRUE, 
           label = "frac(1,sqrt(2 * pi)) *e ^ {-x^2 / 2}")+
  labs(
    title = "Normal Distribution",
    caption = "By Chen, Data Visualization course, Tunghai University, 2024"
  )+theme(plot.title = element_text(hjust = 0.5, size = 20))+
print(p)

###
library(ggplot2)

p <- ggplot(data.frame(x = c(-3, 3)), aes(x = x)) +
  stat_function(fun = sin, color = "blue", geom = "line") +  # Plot normal curve as a line
  stat_function(fun = cos, color = "red", geom = "line") +  # Fill the area under the curve
  #annotate("text", x = 2, y = 0.3, parse = TRUE, 
   #        label ) +  # Corrected LaTeX for the normal distribution formula
  labs(
    title = "Normal Distribution",
    caption = "By Chen, DV,THU, 2024"
  ) +
  theme(
    plot.title = element_text(hjust = 0.5, size = 20),
    plot.caption = element_text(hjust = 1, size = 10)
  )

print(p)
#640.480
library(gcookbook)
p <- ggplot(heightweight, aes(x = ageYear, y = heightIn, color = sex))+
  geom_point()+
  geom_hline(yintercept = 60)+
  geom_vline(xintercept = 14)+
  geom_abline(intercept = 37.4, slope = 1.75)+
  labs(
    title = "Age and Height",
    x = "Age(Year)",
    y = "Height(Inch)",
    caption = "By Chen, DV, THU, 2024"
  )+theme(plot.title = element_text(hjust = 0.5, size = 20))
print(p)
#640, 480
p <- ggplot(filter(climate, Source == "Berkeley"), aes(x = Year, y = Anomaly10y))+
  geom_line()+
  annotate("rect", xmin = 1950, xmax = 1980, ymin = -1, ymax = 1, 
           alpha= .1, fill = "blue")+
  #annotate("segment", x = 1950, xend = 1980, y = -.25, yend = -.25)+
  #annotate("segment", x = 1850, xend = 1820, y = -.8, yend = -.95,
  #         colour = "blue", linewidth = 2, arrow= arrow())+
  #annotate("segment", x = 1950, xend = 1980, y = -.25, yend = -.25, 
  #         arrow = arrow(ends = "both", angle = 90, length = unit(.2, "cm")))+
  labs(
    title = "Year and Anomaly",
    caption = "By Chen, DV, THU, 2024"
  )+theme(plot.title = element_text(hjust = 0.5, size = 20))
print(p)
#### 640 480
pg_mod <- PlantGrowth %>%
  mutate(hl = recode(group, "ctrl" = "yes", "trt1" = "no", "trt2" = "no"))
p <- ggplot(pg_mod, aes(x = group, y = weight, fill = hl))+
  geom_boxplot()+
  scale_fill_manual(values = c(no = "grey85", yes ="#FFDDCC"), guide = FALSE)+
  labs(
    title = "Group and Weight",
    x = "Group",
    y = "Weight",
    caption = "By Chen, DV, THU, 2024"
  )+theme(plot.title = element_text(hjust = 0.5, size = 20))
print(p)
####640 480
library(gcookbook)
library(dplyr)
ce_mod <- cabbage_exp %>%
  filter(Cultivar == "c39")

p <- ggplot(ce_mod, aes(x = Date ,y = Weight))+
  geom_col(fill = "white", color = "black")+
  geom_errorbar(aes(ymin = Weight - se, ymax = Weight + se), width = .2)+
  labs(
    title = "Date and Weight",
    caption = "By Chen, DV, THU, 2024"
  )+theme(plot.title = element_text(hjust = 0.5, size = 20))
print(p)
### 640 480
mpg_plot <- ggplot(iris, aes(x = Sepal.Length, y = Sepal.Width))+
  geom_point()+
  facet_grid(.~ drv)

f_labels <- data.frame(drv = c("Setosa", "Versicolor", "Virginica"), label = c("Setosa", "Versicolor", "Virginica"))

mpg_plot +
  geom_text(x = 6, y = 40, aes(label = label), data = f_labels)+
  labs(
    title = "Iris",
    x = "Sepal Length",
    y = "Sepal Width",
    caption = "By Chen, DV, THU, 2024"
  )+theme(plot.title = element_text(hjust = 0.5, size = 20))
####640 480
# Load necessary library
library(ggplot2)

# Create the plot
mpg_plot <- ggplot(iris, aes(x = Sepal.Length, y = Sepal.Width)) +
  geom_point() +
  facet_grid(. ~ Species)  # Facet by Species column

# Create labels data frame
f_labels <- data.frame(Species = c("setosa", "versicolor", "virginica"), 
                       label = c("Setosa", "Versicolor", "Virginica"))

# Add text labels and customize the plot
mpg_plot +
  geom_text(x = 7, y = 4, aes(label = label), data = f_labels) +  # Adjusted y-position for labels
  labs(
    title = "Iris Dataset",
    x = "Sepal Length",
    y = "Sepal Width",
    caption = "By Chen, DV, THU, 2024"
  ) +
  theme(
    plot.title = element_text(hjust = 0.5, size = 20)
  )

