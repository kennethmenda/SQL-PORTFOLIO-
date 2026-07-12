SQL Challenge 1 – Purchase Order Analysis with CASE, JOINs, ISNULL, and Date Filtering
Objective

In this challenge, I created a SQL query that retrieves purchase order information from the AdventureWorks database. My goal was to combine data from multiple related tables, classify orders by size, handle missing values, and filter the results to show only orders placed in December.

1. SELECTING THE REQUIRED COLUMNS

I began by selecting the key purchase order details from the PurchaseOrderDetail and PurchaseOrderHeader tables.

These columns included:

PurchaseOrderID
PurchaseOrderDetailID
OrderQty
UnitPrice
LineTotal
OrderDate

These fields provide the core information needed to analyze each purchase order.

2. CLASSIFYING ORDER SIZES USING CASE

I used a CASE statement to categorize orders based on the quantity ordered.

CASE
    WHEN OrderQty > 500 THEN 'Large'
    WHEN OrderQty > 50 AND OrderQty <= 500 THEN 'Medium'
    ELSE 'Small'
END AS OrderSizeCategory

Instead of displaying only numeric quantities, I grouped the orders into business-friendly categories:

Large – More than 500 items
Medium – Between 51 and 500 items
Small – 50 items or fewer

This makes the data easier to understand and analyze in reports or dashboards.

3. JOINING MULTIPLE TABLES

I used several joins to enrich the purchase order data with additional product information.

INNER JOIN

I used INNER JOIN to connect:

PurchaseOrderDetail
PurchaseOrderHeader
Product

These joins allowed me to retrieve purchase details, order dates, and product names.

LEFT JOIN

I then used LEFT JOIN to connect:

ProductSubcategory
ProductCategory

I chose LEFT JOIN because some products may not belong to a subcategory or category, but I still wanted those purchase records to appear in the final results.

4. HANDLING MISSING VALUES

Some products did not have a category or subcategory.

To prevent NULL values from appearing in my results, I used the ISNULL() function.

ISNULL(D.Name, 'None') AS Subcategory,
ISNULL(E.Name, 'None') AS Category

Whenever a category or subcategory was missing, my query displayed "None" instead of NULL, making the output cleaner and easier to read.

5. FILTERING THE DATA

At the end of the query, I filtered the results using the MONTH() function.

WHERE MONTH(B.OrderDate) = 12

This returned only purchase orders that were placed during December.

Applying this filter reduced the dataset to a specific time period, making it useful for monthly reporting and seasonal analysis.

Skills demonstrated

Through this challenge, I demonstrated my ability to use:

SELECT
CASE
INNER JOIN
LEFT JOIN
ISNULL()
WHERE
MONTH()
Table aliases
Multi-table data retrieval
Summary

In this challenge, I queried purchase order data from the AdventureWorks database by joining multiple related tables, classifying orders into Large, Medium, and Small categories using a CASE statement, replacing NULL values with ISNULL(), enriching the dataset with product, subcategory, and category information, and filtering the results to display only purchase orders placed in December. This exercise demonstrated my ability to combine data from multiple tables, clean missing values, apply business logic, and prepare data for reporting and analysis.
