CREATE PROCEDURE dbo.NumberOfClients
AS
BEGIN
	SELECT COUNT([ClientId]) AS SalesToCompanyClients,
		COUNT(
			IIF(([ClientId] IS NULL), 1, NULL)
		) AS SalesToIndividualClients,
		COUNT(ISNULL([ClientId], 1)) AS TotalSales
	FROM [Facts].[CourseSales]
END