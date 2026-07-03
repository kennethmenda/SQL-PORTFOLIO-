SELECT A.[PurchaseOrderID],
      A.[PurchaseOrderDetailID],
      A.[OrderQty],
      A.[UnitPrice],
      A.[LineTotal],
      B.[Orderdate],
     
 CASE
 When A.[OrderQty] > 500 THEN 'Large'
 When A.[OrderQty] > 50 and A.[OrderQty] <= 500 THEN 'Medium'
 ELSE 'Small'
 END AS Ordersizecategory,

C.[Name] AS Productname,
 ISNULL (D.[Name], 'None')AS Subcategory,
 ISNULL (E.[Name], 'None') AS Category

FROM [AdventureWorks2019].[Purchasing].[PurchaseOrderDetail] AS A
 INNER JOIN [Purchasing].[PurchaseOrderHeader] AS B
   ON A.PurchaseOrderID =B.PurchaseOrderID

INNER JOIN 
 [AdventureWorks2019].[Production].[Product] AS C ON A.ProductID=C.ProductID
 
 LEFT JOIN 
[AdventureWorks2019].[Production].[ProductSubcategory] AS D ON C.ProductSubcategoryID=D.ProductSubcategoryID

LEFT JOIN 
[AdventureWorks2019].[Production].[ProductCategory] E ON D. ProductCategoryID=E.ProductCategoryID
  
  WHERE MONTH(B.OrderDate)=12
