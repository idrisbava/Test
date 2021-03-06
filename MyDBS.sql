USE [master]
GO
/****** Object:  Database [MyDBS]    Script Date: 12/05/2021 1:41:37 PM ******/
CREATE DATABASE [MyDBS]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'MyDBS', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER2014\MSSQL\DATA\MyDBS.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'MyDBS_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER2014\MSSQL\DATA\MyDBS_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [MyDBS] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [MyDBS].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [MyDBS] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [MyDBS] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [MyDBS] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [MyDBS] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [MyDBS] SET ARITHABORT OFF 
GO
ALTER DATABASE [MyDBS] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [MyDBS] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [MyDBS] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [MyDBS] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [MyDBS] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [MyDBS] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [MyDBS] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [MyDBS] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [MyDBS] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [MyDBS] SET  DISABLE_BROKER 
GO
ALTER DATABASE [MyDBS] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [MyDBS] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [MyDBS] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [MyDBS] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [MyDBS] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [MyDBS] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [MyDBS] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [MyDBS] SET RECOVERY FULL 
GO
ALTER DATABASE [MyDBS] SET  MULTI_USER 
GO
ALTER DATABASE [MyDBS] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [MyDBS] SET DB_CHAINING OFF 
GO
ALTER DATABASE [MyDBS] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [MyDBS] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [MyDBS] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'MyDBS', N'ON'
GO
USE [MyDBS]
GO
/****** Object:  Table [dbo].[Attachment]    Script Date: 12/05/2021 1:41:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Attachment](
	[AttachmentID] [int] NOT NULL,
	[DeptID] [int] NULL,
	[FilePath] [nvarchar](max) NULL,
	[FileName] [nvarchar](max) NULL,
	[IsDeleted] [bit] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[demo]    Script Date: 12/05/2021 1:41:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[demo](
	[Id] [int] NULL,
	[DeptName] [nchar](10) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DeptTable]    Script Date: 12/05/2021 1:41:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DeptTable](
	[DeptID] [int] IDENTITY(1,1) NOT NULL,
	[DeptName] [nvarchar](50) NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_DeptTable] PRIMARY KEY CLUSTERED 
(
	[DeptID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Employee]    Script Date: 12/05/2021 1:41:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee](
	[EmpID] [int] IDENTITY(1,1) NOT NULL,
	[EmpName] [nvarchar](100) NOT NULL,
	[DeptID] [int] NOT NULL,
 CONSTRAINT [PK_employee] PRIMARY KEY CLUSTERED 
(
	[EmpID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[EmpTable]    Script Date: 12/05/2021 1:41:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EmpTable](
	[EmpID] [int] IDENTITY(1,1) NOT NULL,
	[EmpName] [nvarchar](100) NOT NULL,
	[DeptID] [int] NOT NULL,
	[IsDeleted] [bit] NULL,
 CONSTRAINT [PK_EmpTable] PRIMARY KEY CLUSTERED 
(
	[EmpID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SalaryTable]    Script Date: 12/05/2021 1:41:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SalaryTable](
	[SalaryID] [int] IDENTITY(1,1) NOT NULL,
	[EmpID] [int] NOT NULL,
	[Amount] [decimal](18, 3) NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_SalaryTable] PRIMARY KEY CLUSTERED 
(
	[SalaryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[DeptTable] ADD  CONSTRAINT [DF_DeptTable_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[SalaryTable] ADD  CONSTRAINT [DF_SalaryTable_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
/****** Object:  StoredProcedure [dbo].[Sproc_Attachment_GetAll]    Script Date: 12/05/2021 1:41:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:
-- Create date:
-- Description: Get By DeptID Departmemt
-- =============================================
CREATE PROCEDURE [dbo].[Sproc_Attachment_GetAll]
 @DeptID int
AS
BEGIN
SET NOCOUNT ON;
SELECT AttachmentID
 ,DeptID
 ,FilePath
 ,FileName
 ,IsDeleted
 FROM Attachment
 WHERE
DeptID=@DeptID
and
IsDeleted=0

END

GO
/****** Object:  StoredProcedure [dbo].[Sproc_Attachment_GetByDeptID]    Script Date: 12/05/2021 1:41:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:
-- Create date:
-- Description: Get By DeptID Departmemt
-- =============================================
CREATE PROCEDURE [dbo].[Sproc_Attachment_GetByDeptID]
 @DeptID int
AS
BEGIN
SET NOCOUNT ON;
SELECT AttachmentID
 ,DeptID
 ,FilePath
 ,FileName
 ,IsDeleted
 FROM Attachment
 WHERE
DeptID=@DeptID
and
IsDeleted=0

END

GO
/****** Object:  StoredProcedure [dbo].[Sproc_Department_Delete]    Script Date: 12/05/2021 1:41:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:
-- Create date:
-- Description: Department Delete
-- =============================================
CREATE PROCEDURE [dbo].[Sproc_Department_Delete]
@DeptID INT ,
 @ReturnParam int output
AS
BEGIN
SET @ReturnParam = 0;
UPDATE DeptTable
SET DeptTable.IsDeleted = 1
WHERE DeptTable.DeptID = @DeptID and IsDeleted=0
SET @ReturnParam=@DeptID
END

GO
/****** Object:  StoredProcedure [dbo].[Sproc_Department_GetByDeptID]    Script Date: 12/05/2021 1:41:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:
-- Create date:
-- Description: Get By DeptID Departmemt
-- =============================================
CREATE PROCEDURE [dbo].[Sproc_Department_GetByDeptID]
 @DeptID int=0
AS
BEGIN
-- SET NOCOUNT ON added to prevent extra result sets from
-- interfering with SELECT statements.
SET NOCOUNT ON;
SELECT DeptID
,DeptName
FROM DeptTable
WHERE
DeptTable.DeptID=@DeptID
and IsDeleted = 0
 
END

GO
/****** Object:  StoredProcedure [dbo].[Sproc_Department_Save]    Script Date: 12/05/2021 1:41:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:
-- Create date:
-- Description: Insert / Update Department
-- =============================================
CREATE PROCEDURE [dbo].[Sproc_Department_Save]
 @DeptID int=0
 ,@DeptName nvarchar(50)=NULL
,@ReturnParam INT OUTPUT
AS
BEGIN
SET NOCOUNT ON;
SET @ReturnParam = 0; -- 0 - Default, -1 - Update, -2 Duplicate
BEGIN
 IF (@DeptID = 0) ---- 0 - Insert
 BEGIN
 IF NOT EXISTS (SELECT DeptName FROM DeptTable WHERE
DeptName=@DeptName and IsDeleted=0)
 BEGIN
 INSERT INTO DeptTable
(DeptName, IsDeleted)
 VALUES
(@DeptName, 0)
 set @ReturnParam = scope_identity();
 END
 ELSE
 BEGIN
 SET @ReturnParam = -2; ----Duplicate
 END
 END
 ELSE ---- > 1 --- Update
IF NOT EXISTS (SELECT DeptName FROM DeptTable WHERE
DeptName=@DeptName and DeptID != @DeptID and IsDeleted=0)
 BEGIN
 UPDATE DeptTable
 SET
DeptName=@DeptName
 WHERE DeptID=@DeptID
 set @ReturnParam = @DeptID
 END
 else BEGIN
SET @ReturnParam = -2; ----Duplicate
END
END
END

GO
/****** Object:  StoredProcedure [dbo].[Sproc_Department_Search]    Script Date: 12/05/2021 1:41:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:
-- Create date:
-- =============================================
CREATE PROCEDURE [dbo].[Sproc_Department_Search]
-- Add the parameters for the stored procedure here
 @DeptName nvarchar(50)=''
,@PAGESIZE INT = -1
,@PAGENUMBER INT = 0
AS
BEGIN
-- SET NOCOUNT ON added to prevent extra result sets from
-- interfering with SELECT statements.
SET NOCOUNT ON;
DECLARE
@STARTNUMBER INT,
@ENDNUMBER INT,
@TOTALCOUNT INT
--
IF @PAGESIZE =-1 --PAGE SIZE NOT DEFINED - RETURN ALL RECORDS
BEGIN
SET @STARTNUMBER = 0
SET @ENDNUMBER = -1
END
ELSE
BEGIN
SET @STARTNUMBER = ((@PAGESIZE * @PAGENUMBER) -
(@PAGESIZE)) + 1
SET @ENDNUMBER = (@PAGESIZE * @PAGENUMBER)
END
;WITH DepartmentSearchCTE AS
(SELECT
 COUNT(*) over() AS TotalRecordsCount
,ROW_NUMBER() OVER (ORDER BY DeptID Desc) AS RowNum
,ROW_NUMBER() OVER (ORDER BY DeptID Desc) AS RowID
,DeptID AS DeptID
 ,DeptName
,IsDeleted
 FROM [dbo].[DeptTable]
WHERE (IsDeleted = 0) and
 (DeptName LIKE ('%' + @DeptName + '%') OR
@DeptName IS NULL OR @DeptName='')
)
SELECT
 TotalRecordsCount
,RowNum
,RowID
,DeptID
,DeptName
,IsDeleted
 FROM DepartmentSearchCTE
WHERE ROWNUM >=@STARTNUMBER AND (ROWNUM <=@ENDNUMBER OR
@ENDNUMBER = -1)
ORDER BY DeptID Desc;
END

GO
/****** Object:  StoredProcedure [dbo].[Sproc_EmployeeDetails_Delete]    Script Date: 12/05/2021 1:41:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
--
-- =============================================
CREATE PROCEDURE [dbo].[Sproc_EmployeeDetails_Delete]
-- Add the parameters for the stored procedure here
 @EmpID int

AS
BEGIN
 delete from Employee


where EmpID=@EmpID

END

GO
/****** Object:  StoredProcedure [dbo].[Sproc_EmployeeDetails_GetAll]    Script Date: 12/05/2021 1:41:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:
-- Create date:
-- Description: Get By EmployeeDetails_GetAll
-- =============================================
CREATE PROCEDURE [dbo].[Sproc_EmployeeDetails_GetAll]
AS
BEGIN
SET NOCOUNT ON;
SELECT *

 FROM Employee
END

GO
/****** Object:  StoredProcedure [dbo].[Sproc_EmployeeDetails_GetById]    Script Date: 12/05/2021 1:41:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:
-- Create date:
-- Description: Get By [Sproc_EmployeeDetails_GetById]
-- =============================================
CREATE PROCEDURE [dbo].[Sproc_EmployeeDetails_GetById]
@EmpID int
AS
BEGIN
SET NOCOUNT ON;
SELECT EmpID
 ,EmpName
 ,DeptID

 FROM Employee
 where EmpID=@EmpID;
END

GO
/****** Object:  StoredProcedure [dbo].[Sproc_EmployeeDetails_GetByQuery]    Script Date: 12/05/2021 1:41:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Sproc_EmployeeDetails_GetByQuery]
@EmpID int,
@DeptID int,
@EmpName varchar(50)
AS
BEGIN
 SELECT EmpID ,EmpName ,DeptID
 FROM Employee
 Where
 (EmpName like '%'+@EmpName+'%' or @EmpName ='')
AND (EmpID =@EmpID OR @EmpID =0)
AND (DeptID =@DeptID OR @DeptID = 0)
END
--IF (@EmpID !='' AND @DeptID != '' )
--BEGIN
--SELECT EmpID
-- ,EmpName
-- ,DeptID

-- FROM Employee
-- where EmpID=@EmpID and DeptID=@DeptID

--END
--ElSE IF ((@EmpID !='' AND @DeptID = '') OR (@EmpID ='' AND @DeptID != ''))
--BEGIN
--SELECT EmpID
-- ,EmpName
-- ,DeptID

-- FROM Employee
-- where EmpID=@EmpID and DeptID=@DeptID

--END
--ELSE IF(@EmpID !='')
--BEGIN
--SELECT EmpID
-- ,EmpName
-- ,DeptID

-- FROM Employee
-- where EmpID=@EmpID

--END
--ELSE
--BEGIN
--SELECT EmpID
-- ,EmpName
-- ,DeptID

-- FROM Employee
-- where DeptID=@DeptID
--END

GO
/****** Object:  StoredProcedure [dbo].[Sproc_EmployeeDetails_Insert]    Script Date: 12/05/2021 1:41:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
--
-- =============================================
CREATE PROCEDURE [dbo].[Sproc_EmployeeDetails_Insert]
-- Add the parameters for the stored procedure here

 @EmpName nvarchar(max) =NULL,
 @DeptID int=0,
 @IsInserted int=0 output
AS
BEGIN
 INSERT INTO [dbo].Employee
 (

EmpName,
DeptID
 )
 VALUES
 (

@EmpName,
@DeptID
)
END
set @IsInserted=SCOPE_IDENTITY();

GO
/****** Object:  StoredProcedure [dbo].[Sproc_EmployeeDetails_Update]    Script Date: 12/05/2021 1:41:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
--
-- =============================================
Create PROCEDURE [dbo].[Sproc_EmployeeDetails_Update]
-- Add the parameters for the stored procedure here
 @EmpID int,
 @EmpName nvarchar(max) =NULL,
 @DeptID int=0
AS
BEGIN
 update Employee

 set
 EmpName=@EmpName,

DeptID=@DeptID
where EmpID=@EmpID

END

GO
/****** Object:  StoredProcedure [dbo].[Sproc_List_Department]    Script Date: 12/05/2021 1:41:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author: <Author,,Name>
-- Create date: <Create Date,,>
-- Description: <Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Sproc_List_Department]
AS
BEGIN
-- SET NOCOUNT ON added to prevent extra result sets from
-- interfering with SELECT statements.
SET NOCOUNT ON;
 -- Select statements for procedure here
SELECT DeptID
 ,DeptName
FROM DeptTable
WHERE
IsDeleted=0
ORDER BY
DeptID Desc
END

GO
USE [master]
GO
ALTER DATABASE [MyDBS] SET  READ_WRITE 
GO
