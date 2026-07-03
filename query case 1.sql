SELECT C.[ProductID],
      C.[Name] AS Productname,
      C.[ProductNumber],
      C.[ProductSubcategoryID],
      C.[ProductModelID]
  FROM [AdventureWorks2019].[Production].[Product] AS C
