CREATE PROCEDURE dbo.CourseReport
AS
BEGIN
	SELECT IIF(GROUPING([SalesRepName]) = 0, [SalesRepName], 'ALL') AS [SalesRep],
		IIF(GROUPING([ClientCompanyName]) = 0, [ClientCompanyName], 'ALL') AS [Company],
		IIF(GROUPING([CourseName]) = 0, [CourseName], 'ALL') AS [Course],
		SUM([CourseSalesView].[TotalCourseSale]) AS Sale
	FROM [dbo].[CourseSalesView]
	GROUP BY CUBE([SalesRepName], [ClientCompanyName], [CourseName])
	ORDER BY 1, 2, 3
END