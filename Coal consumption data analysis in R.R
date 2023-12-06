## -------- Assignment of analyzing coal consumption---by Kiran Kumar -chakk1k

# Read the CSV file manually
coal <- read.csv(file.choose())  # Manually reading the CSV file
coal
nrow(coal)
# Rename the first column to "Region"
colnames(coal)[1] <- "Region"
colnames(coal)

# Display summary statistics of the dataset
summary(coal)


# Load necessary libraries
library(tidyverse)  # Load the library for pivot_longer and pivot_wider functions.
library(dplyr)

# Pivot the dataset to long format using pivot_longer
long_coal_dataset <- pivot_longer(coal, !Region, names_to = "Year", values_to = "Consumption")
long_coal_dataset
view(long_coal_dataset)

## When we check the long_coal_dataset in the year, we see that multiple variables are stored in one column, so let's separate
####--------####
## We observe that in the year column multiple variables are stored in one column

# Using transform function and gsub to replace "X" with an empty string
long_coal_dataset <- transform(long_coal_dataset, Year = gsub("X", "", Year))

long_coal_dataset
head(long_coal_dataset)

## Let's change the year into numeric
long_coal_dataset$Year <- as.numeric(as.character(long_coal_dataset$Year))
long_coal_dataset
is.numeric(long_coal_dataset$Year)  # Check if it changed to numeric or not

## Let's change the other column, Consumption, from character to numeric

## Let's check whether it is numeric or not
is.numeric(long_coal_dataset$Consumption)
## Let's check whether it's character
is.character(long_coal_dataset$Consumption)

### It is character, so let's change it into numeric
long_coal_dataset$Consumption <- as.numeric(long_coal_dataset$Consumption)
is.numeric(long_coal_dataset$Consumption)
summary(long_coal_dataset)
view(long_coal_dataset)

#### Using sapply
## Let's check the class for all the columns together
sapply(long_coal_dataset, class)

summary(long_coal_dataset)

### Let's remove the NA's from here
install.packages("janitor")
library(janitor)
View(long_coal_dataset)


library(tidyr)

tidy_coaldata <- long_coal_dataset
tidy_coaldata <- tidy_coaldata %>%
  drop_na()

tidy_coaldata
sum(is.na(tidy_coaldata))
summary(tidy_coaldata)

final_coal <- tidy_coaldata
view(final_coal)
### Separate continents, regions, and countries for grammar of graphic visualization

# Define a vector of continent names
continent_names <- c("Africa", "Asia", "Europe", "North America", "Central & South America", 
                     "Former U.S.S.R.", "Middle East", "Central African Republic", 
                     "Asia & Oceania", "Antarctica")

# Filter rows in 'final_coal' where the 'Region' column matches any continent name
continent <- filter(final_coal, Region %in% continent_names)
continent

# Filter rows in 'final_coal' where the 'Region' column does not match any continent name
non_continents <- final_coal %>%
  filter(!(Region %in% continent_names))
non_continents

# Filter out the 'World' region from 'non_continents'
countries <- non_continents[!(non_continents$Region %in% "World"),]

# View the resulting data frames
View(countries)  # Display data for individual countries
View(continent)  # Display data for continents


##### Visualization using Grammer of graphix (ggplot2)
library(ggplot2)


### ggplot for countries

# Calculate total consumption by year of countries
total_consumption_countries <- aggregate(Consumption ~ Year, data = countries, FUN = sum)

# Bar plot for total consumption by year of countries
barplot_countries<-ggplot(total_consumption_countries, aes(x = Year, y = Consumption)) +
  geom_bar(stat = "identity", fill = "skyblue") +
  labs(
    title = "Total Coal Consumption of countries by year",
    x = "Year",
    y = "Total Consumption of Coal"
  ) +
  theme_minimal()
barplot_countries

#Similarly lets calculate total consumption of coal by year of Continent

total_consumption_continent <- aggregate(Consumption ~ Year, data = continent, FUN = sum)

# Bar plot for total consumption by year of countries
barplot_continents<-ggplot(total_consumption_continent, aes(x = Year, y = Consumption)) +
  geom_bar(stat = "identity", fill = "skyblue") +
  labs(
    title = "Total Coal Consumption of continent by year",
    x = "Year",
    y = "Total Consumption of Coal"
  ) +
  theme_minimal()
barplot_continents


# Density plots of consumption by region
density_region<-ggplot(continent, aes(x = Consumption, fill = Region)) +
  geom_density(alpha = 0.6) +
  facet_wrap(~Region, scales = "free") +
  labs(
    title = "Density Plots of Coal Consumption by Region",
    x = "Consumption",
    y = "Density"
  ) +
  theme_minimal()

density_region

# Aggregate data for consumption over regions and years

regionYearConsumption <- aggregate(Consumption ~ Region + Year, data =continent, FUN = sum)

time_overyears<-ggplot(regionYearConsumption, aes(x = as.numeric(Year), y = Consumption, color = Region)) +
  geom_line() +
  labs(
    title = "Coal Consumption Over Years by Region",
    x = "Year",
    y = "Consumption"
  ) +
  theme_minimal()
time_overyears



# Create bar chart
bar_continent_region<-ggplot(continent, aes(x = Region, y = Consumption)) +
  geom_bar(stat = "identity", fill = "skyblue") +
  labs(
    title = "Total Consumption by Region",
    x = "Region",
    y = "Total Consumption"
  ) +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

bar_continent_region

# Install and load the writexl package
# install.packages("writexl")
library(writexl)

# Assuming your cleaned dataset is named 'cleaned_data'
write_xlsx(final_coal, "tidycoaldatset.xlsv")






