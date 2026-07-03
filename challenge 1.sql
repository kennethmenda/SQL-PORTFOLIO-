SELECT D.[ProductSubcategoryID],
      D.[ProductCategoryID],
      ISNULL (D.[Name], 'None')AS Subcategory,
      D.[rowguid],
      D.[ModifiedDate]
  FROM [AdventureWorks2019].[Production].[ProductSubcategory] AS D
