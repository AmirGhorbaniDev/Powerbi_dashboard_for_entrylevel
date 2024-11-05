#Step 1: Data Import
#Importing Data from Google Sheets

// Replace with your Google Sheet URL
let
    Source = Excel.Workbook(Web.Contents("https://docs.google.com/spreadsheets/d/YOUR_SHEET_ID/export?format=xlsx"), null, true),
    StockTable = Source{[Name="stock"]}[Data],
    SalesTable = Source{[Name="sales"]}[Data]
in
    [StockTable, SalesTable]

#Step 2: Table Cleaning
#Use First Row as Headers

let
    FirstRowAsHeaders = Table.PromoteHeaders(StockTable, [PromoteAllScalars=true])
in
    FirstRowAsHeaders

#Set Column Data Types
#Ensure each column has the correct data type. You can do this in the Power Query UI by selecting Transform > Detect Data Type or manually set them.


Table.TransformColumnTypes(FirstRowAsHeaders, {{"model_id", type text}, {"colour", type text}, {"size", type text}})
Create product_id by Concatenation

let
    AddProductID = Table.AddColumn(FirstRowAsHeaders, "product_id", each [model_id] & "_" & [colour] & "_" & (if [size] = null then "no-size" else [size]), type text)
in
    AddProductID

#Hint: If some rows have NULL in size, this code handles it by setting "no-size" as the default.
#Step 3: Table Enrichment
#Add product_name Column

let
    AddProductName = Table.AddColumn(AddProductID, "product_name", each [model_name] & " " & [colour] & (if [size] = "no-size" then "" else " " & [size]), type text)
in
    AddProductName

#Create model_type Column


    AddModelType = Table.AddColumn(AddProductName, "model_type", each 
        if Text.Contains(Text.Lower([model_name]), "tour de cou") or Text.Contains(Text.Lower([model_name]), "tapis") or Text.Contains(Text.Lower([model_name]), "gourde") then "Accessories"
        else if Text.Contains(Text.Lower([model_name]), "t-shirt") then "T-shirt"
        else if Text.Contains(Text.Lower([model_name]), "brassière") or Text.Contains(Text.Lower([model_name]), "crop-top") then "Crop-top"
        else if Text.Contains(Text.Lower([model_name]), "legging") then "Legging"
        else if Text.Contains(Text.Lower([model_name]), "short") then "Short"
        else if Text.Contains(Text.Lower([model_name]), "débardeur") or Text.Contains(Text.Lower([model_name]), "haut") then "Top"
        else "Other", type text)
in
    AddModelType

#Add in_stock Column


let
    AddInStock = Table.AddColumn(AddModelType, "in_stock", each if [stock] > 0 then 1 else 0, Int64.Type)
in
    AddInStock
Add stock_value Column

#Assuming you have a price column, you can calculate the stock value as follows:

let
    AddStockValue = Table.AddColumn(AddInStock, "stock_value", each [stock] * [price], type number)
in
    AddStockValue

#Step 4: Finalize Changes
#Once all transformations are applied, select Close & Apply in Power Query to load the data into Power BI.

#Dashboard
#With the tables cleaned and enriched, use Power BI’s Model view to ensure the correct relationships between stock and sales tables. You can then create visuals such as bar charts or tables to show metrics like:

Total stock by model_type
Average stock_value per model_type
In-stock vs. out-of-stock ratios
