# Coal Consumption Analysis in R

This project focuses on data wrangling and visualization to analyze coal consumption trends using R programming. The analysis covers the entire process from data loading and cleaning to transformation and visualization, providing insights into coal consumption trends over time and across different regions.

## Table of Contents

- [Introduction](#introduction)
- [Data Loading and Inspection](#data-loading-and-inspection)
- [Data Transformation](#data-transformation)
- [Data Cleaning and Type Conversion](#data-cleaning-and-type-conversion)
- [Handling Missing Values](#handling-missing-values)
- [Data Categorization](#data-categorization)
- [Data Visualization](#data-visualization)
- [Saving the Cleaned Dataset](#saving-the-cleaned-dataset)
- [Conclusion](#conclusion)
- [Future Work](#future-work)


## Introduction

This project aims to provide a thorough analysis of coal consumption data using R. The goal is to clean and transform the data, handle missing values, categorize the data for detailed analysis, and create insightful visualizations to understand coal consumption patterns. The dataset includes coal consumption data across various regions and years, providing a comprehensive view of global coal usage trends.

## Data Loading and Inspection

- **Loading the Dataset**: Manually loaded the coal consumption dataset from a CSV file. This step involves reading the data into R using functions such as `read.csv()`.
- **Renaming Columns**: Renamed columns for better readability and consistency. For instance, the first column was renamed to "Region" to clearly indicate the geographical areas covered.
- **Initial Exploration**: Reviewed the first few rows and summary statistics of the dataset to understand its structure and content. This involves using functions like `head()` and `summary()` to get an overview of the data.

## Data Transformation

- **Long Format Conversion**: Used `pivot_longer` from the `tidyverse` package to transform the dataset into a long format, making it suitable for time series analysis. This step involves converting wide-format data, where years are columns, into long-format data, where years become values in a single column.
- **Year Column Adjustment**: Addressed issues with the "Year" column where multiple variables were stored as a single string. This involved removing non-numeric characters and ensuring each year's data is correctly formatted.

## Data Cleaning and Type Conversion

- **Year Column Conversion**: Cleaned the "Year" column by removing non-numeric characters and converting it to a numeric type. This ensures that the year values can be used in time series analyses.
- **Consumption Column Conversion**: Converted the "Consumption" column from character to numeric to ensure accurate calculations and visualizations. This step is crucial for performing numerical operations on the data.

## Handling Missing Values

- **Removing Missing Values**: Used the `janitor` package to identify and remove rows with missing values, ensuring the dataset is clean and complete. This step helps in maintaining the integrity of the analysis by removing incomplete data entries.

## Data Categorization

- **Region and Continent Separation**: Separated the dataset into different categories, distinguishing between regions, continents, and individual countries. This categorization allows for more detailed and specific analysis of coal consumption patterns.
- **Granular Analysis**: Enabled more detailed and specific analysis by categorizing the data appropriately. For example, separating data into continents like Africa, Asia, Europe, and regions within these continents for targeted analysis.

## Data Visualization

- **Bar Plots**: Created bar plots to visualize total coal consumption by year for both countries and continents. These visualizations help in understanding the annual consumption trends.
- **Density Plots**: Generated density plots to display the distribution of coal consumption across various regions. These plots help in visualizing the spread and concentration of coal consumption values.
- **Line Plots**: Developed line plots to illustrate trends in coal consumption over the years, segmented by region. Line plots are effective in showing changes over time and comparing trends across different regions.

## Saving the Cleaned Dataset

- **Exporting Data**: Saved the final cleaned dataset to an Excel file using the `writexl` package, facilitating future analysis and reporting. This ensures that the cleaned and transformed data is preserved for subsequent use.

## Conclusion

The project encapsulates a comprehensive process of data cleaning, transformation, and visualization. The final tidy dataset, along with the generated visualizations, provides valuable insights into coal consumption patterns across different regions and time periods. This analysis can help inform energy policies and understand historical consumption trends.

## Future Work

- **Enhanced Visualizations**: Future work could involve creating more advanced visualizations, such as interactive dashboards using `Shiny` or other web-based tools.
- **Additional Data Sources**: Integrating additional data sources, such as economic indicators or environmental impact data, could provide a more holistic view of coal consumption trends.
- **Predictive Modeling**: Implementing predictive modeling techniques to forecast future coal consumption based on historical data trends.

## References

- **Packages and Libraries**: This project uses several R packages, including `tidyverse`, `janitor`, `ggplot2`, and `writexl`.
- **Data Source**: The coal consumption dataset used in this analysis.


