CREATE PROCEDURE [dbo].[CourseSalesReport]
	@CompanyIds NVARCHAR(1000),
	@CourseIds NVARCHAR(1000),
	@SalesRepIds NVARCHAR(1000)
AS
BEGIN
	DECLARE @Query NVARCHAR(MAX) = N''
	DECLARE @Parameters NVARCHAR(MAX) = N''

	SET @Parameters += N'
	 @CompanyIds NVARCHAR(1000)
	,@CourseIds NVARCHAR(1000)
	,@SalesRepIds NVARCHAR(1000) '

	SET @Query += N'
	SELECT IIF(GROUPING([SalesRepName]) = 0, [SalesRepName], ''ALL'') AS [SalesRep],
		IIF(GROUPING([ClientCompanyName]) = 0, [ClientCompanyName], ''ALL'') AS [Company],
		IIF(GROUPING([CourseName]) = 0, [CourseName], ''ALL'') AS [Course],
		SUM([CourseSalesView].[TotalCourseSale]) AS Sale
	FROM [dbo].[CourseSalesView]
	WHERE 1 = 1 '

	IF(@CompanyIds IS NOT NULL)
	BEGIN
		SET @Query += N'
		AND CourseSalesView.CompanyId IN (SELECT Id FROM SplitIds(@CompanyIds, '','')) '
	END

	IF(@CourseIds IS NOT NULL)
	BEGIN
		SET @Query += N'
		AND CourseSalesView.CourseId IN (SELECT Id FROM SplitIds(@CourseIds, '','')) '
	END

	IF(@SalesRepIds IS NOT NULL)
	BEGIN
		SET @Query += N'
		AND CourseSalesView.SalesRepId IN (SELECT Id FROM SplitIds(@SalesRepIds, '','')) '
	END

	SET @Query += N'
	GROUP BY ROLLUP([SalesRepName], [ClientCompanyName], [CourseName])
	ORDER BY [SalesRep], [Company], [Course] '

	EXEC sp_executesql @Query, @Parameters,
		@CompanyIds,
		@CourseIds,
		@SalesRepIds
END