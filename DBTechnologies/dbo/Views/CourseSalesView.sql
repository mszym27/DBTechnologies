

CREATE VIEW [dbo].[CourseSalesView]
AS 
SELECT
	[Courses].Id AS CourseId,
	[Companies].Id AS CompanyId,
	[SalesReps].Id AS SalesRepId,
	[Courses].Name AS CourseName,
	[Locations].Name AS LocationName,
	[Clients].Name + ' ' + [Clients].Surname AS ClientName,
	[SalesReps].Name + ' ' + [SalesReps].Surname AS SalesRepName,
	[Companies].Name AS ClientCompanyName,
	[CourseSales].[Date],
	[Courses].NumberOfSeats AS PlannedAmount,
    [CourseSales].[Amount],
	[Courses].IndividualPrice AS CourseIndividualPrice,
    [CourseSales].[TotalNetto],
    [CourseSales].[TotalBrutto],
	[Courses].IndividualPrice * [Courses].NumberOfSeats AS PlannedReturns,
	[CourseSales].[Amount] * [CourseSales].[TotalBrutto] AS TotalCourseSale,
	[Courses].IsRecrutationStillOpen,
	[Courses].StartDate
FROM [Facts].[CourseSales]
JOIN [Dimensions].[Courses]
	ON [CourseSales].[CourseId] = [Courses].[Id]
JOIN [Dimensions].[Clients]
	ON [CourseSales].[ClientId] = [Clients].[Id]
JOIN [Dimensions].[Companies]
	ON [Clients].[CompanyId] = [Companies].[Id]
JOIN [Dimensions].[SalesReps]
	ON [CourseSales].[SalesRepId] = [SalesReps].[Id]
JOIN [Dimensions].[Locations]
	ON [CourseSales].[LocationId] = [Locations].[Id];