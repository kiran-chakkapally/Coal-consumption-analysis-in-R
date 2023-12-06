# Coal-consumption-analysis-in-R
Data wrangling in R programming 
#Data Loading and Inspection:
Manually loaded the coal consumption dataset, renaming columns, and reviewing summary statistics for initial exploration.
#Data Transformation:
Used pivot_longer to transform the dataset into a long format, addressing issues where multiple variables were stored in the "Year" column.
#Data Cleaning and Type Conversion:
Cleaned the "Year" column, changing it to a numeric type, and converted the "Consumption" column from character to numeric to ensure data accuracy.
#Handling Missing Values:
Removed rows with missing values using the janitor package to ensure a clean dataset.
#Data Categorization:
Separated the dataset into categories, distinguishing between regions, continents, and individual countries for more granular analysis.
#Data Visualization:
Utilized the ggplot2 package to create various visualizations, including bar plots, density plots, and line plots, providing insights into coal consumption trends over time and across regions.
#Saving the Cleaned Dataset:
Saved the final cleaned dataset to an Excel file using the writexl package for future analysis.
#Thorough Process Overview:
The script encapsulates a comprehensive process of data cleaning, transformation, and visualization, resulting in a tidy dataset ready for detailed exploration and interpretation.
