**introduction**
Welcome to the Green Sale Dashboard project! This Power BI project aims to help users learn and understand stock management requirements through practical exercises in Power Query. The dataset used is from Circle, with a primary focus on stock analysis and KPI development. This repository includes the Power BI template and the Circle Google Sheet data to support a smooth, step-by-step learning experience.

**Key Objectives**
This project is designed to help you:

Get hands-on with Power Query for data import, cleaning, and transformation.
Understand the essentials of stock management by working with real data.
Build visualizations and insights using Power BI.

----------------------------------------------------------------------------------------

**Project Structure**
Circle Google Sheet Data: A link to the Google Sheet containing the source data for the project.
Power BI Template - Green Sale Dashboard: Power BI file that includes the dashboard design and KPIs.
Data Sources
Circle Google Sheet Data: [[Link to Google Sheet data]](https://docs.google.com/spreadsheets/d/1OGm2wtHzz3fgXI04Xnuw-Sqnrf3Ehv2viqu0zWrrKtE/edit?usp=sharing)

**Objectives**
The main goal of this project is to load Circle’s stock data into Power BI using Power Query and perform the required transformations for analysis. By the end of this exercise, you’ll be familiar with Power Query and gain a solid understanding of stock management needs.

**Instructions**
**1. Data Import**
Import the Data: Load the data from the Circle Google Sheet using its URL.
Sheet Selection: Be sure to import the two sheets, stock and sales.

**2. Table Cleaning**
Set Headers: Use the first row as headers for both tables.

Format Columns: Ensure all columns have the appropriate format.

Product ID: Create a new column product_id by concatenating model_id, colour, and size with an underscore (_).

Hint: Identify rows where size is NULL, set the default size as "no-size," and move this step above the merging of columns to ensure product IDs are accurate.
**3. Table Enrichment**
Product Name: Add a product_name column by concatenating model_name, color_name, and size. Adjust for "no-size" cases in the function.


Model Type: Create a model_type column based on the type of items:

Accessories: "Tour de cou", "Tapis," "Gourde"
T-shirt, Crop-top, Legging, Short, Top
Hint: Normalize model names by duplicating the column and formatting them to lower case to prevent typographical errors.
Stock Columns:

in_stock: Use conditional logic to assign 1 if in stock and 0 if out of stock.
stock_value: Calculate the stock value for each product.

**4. Apply Changes**
Once you’ve completed the transformations, close and apply your changes in Power Query.

----------------------------------------------------------------------------------------


**Data Visualization**
After transforming your data:

Analyze the data with some quick filters to explore insights.
Verify that Power BI has linked the tables in the Model view.
Replicate the Green Sale Dashboard as shown in the example.
🎉 Congratulations on completing this hands-on Power BI project with Power Query! 🎉

This project is a beginner-friendly yet comprehensive introduction to Power BI and Power Query for stock data analysis, providing a valuable foundation in data management and visualization.
