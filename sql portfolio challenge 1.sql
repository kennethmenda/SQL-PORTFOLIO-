SELECT E. [ProductCategoryID],
      ISNULL (E.[Name], 'NONE') AS Category,
      E.[rowguid],
      E.[ModifiedDate]
  FROM [AdventureWorks2019].[Production].[ProductCategory] E
