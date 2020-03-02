CREATE PROCEDURE dbo.OpenCoursesSummary
AS
BEGIN
	SELECT temp.*
		,temp.Achieved - temp.Planned AS [Difference]
	FROM (
		SELECT [CourseName]
			,SUM([PlannedReturns]) AS Planned
			,SUM([TotalCourseSale]) AS Achieved
		FROM [dbo].[CourseSalesView]
		WHERE [IsRecrutationStillOpen] = 1
		GROUP BY GROUPING SETS ([CourseName], ())
	) temp
	ORDER BY IIF(CourseName IS NULL, 1, 0) ASC, CourseName ASC
END