USE [master]
GO
/****** Object:  Database [LAN_OR_WAN_EXAMINATION_SYSTEM]    Script Date: 02/03/2025 2:27:54 PM ******/
CREATE DATABASE [LAN_OR_WAN_EXAMINATION_SYSTEM]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ONLINE_EXAMINATION_SYSTEM', FILENAME = N'C:\Users\IT Programmer\source\repos\LAN-OR-WAN-EXAMINATION-SYSTEM\DATABASE FILE\LAN_OR_WAN_EXAMINATION_SYSTEM.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'ONLINE_EXAMINATION_SYSTEM_log', FILENAME = N'C:\Users\IT Programmer\source\repos\LAN-OR-WAN-EXAMINATION-SYSTEM\DATABASE FILE\LAN_OR_WAN_EXAMINATION_SYSTEM_log.ldf' , SIZE = 2816KB , MAXSIZE = UNLIMITED, FILEGROWTH = 10%)
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [LAN_OR_WAN_EXAMINATION_SYSTEM] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [LAN_OR_WAN_EXAMINATION_SYSTEM].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [LAN_OR_WAN_EXAMINATION_SYSTEM] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [LAN_OR_WAN_EXAMINATION_SYSTEM] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [LAN_OR_WAN_EXAMINATION_SYSTEM] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [LAN_OR_WAN_EXAMINATION_SYSTEM] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [LAN_OR_WAN_EXAMINATION_SYSTEM] SET ARITHABORT OFF 
GO
ALTER DATABASE [LAN_OR_WAN_EXAMINATION_SYSTEM] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [LAN_OR_WAN_EXAMINATION_SYSTEM] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [LAN_OR_WAN_EXAMINATION_SYSTEM] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [LAN_OR_WAN_EXAMINATION_SYSTEM] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [LAN_OR_WAN_EXAMINATION_SYSTEM] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [LAN_OR_WAN_EXAMINATION_SYSTEM] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [LAN_OR_WAN_EXAMINATION_SYSTEM] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [LAN_OR_WAN_EXAMINATION_SYSTEM] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [LAN_OR_WAN_EXAMINATION_SYSTEM] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [LAN_OR_WAN_EXAMINATION_SYSTEM] SET  DISABLE_BROKER 
GO
ALTER DATABASE [LAN_OR_WAN_EXAMINATION_SYSTEM] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [LAN_OR_WAN_EXAMINATION_SYSTEM] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [LAN_OR_WAN_EXAMINATION_SYSTEM] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [LAN_OR_WAN_EXAMINATION_SYSTEM] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [LAN_OR_WAN_EXAMINATION_SYSTEM] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [LAN_OR_WAN_EXAMINATION_SYSTEM] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [LAN_OR_WAN_EXAMINATION_SYSTEM] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [LAN_OR_WAN_EXAMINATION_SYSTEM] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [LAN_OR_WAN_EXAMINATION_SYSTEM] SET  MULTI_USER 
GO
ALTER DATABASE [LAN_OR_WAN_EXAMINATION_SYSTEM] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [LAN_OR_WAN_EXAMINATION_SYSTEM] SET DB_CHAINING OFF 
GO
ALTER DATABASE [LAN_OR_WAN_EXAMINATION_SYSTEM] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [LAN_OR_WAN_EXAMINATION_SYSTEM] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [LAN_OR_WAN_EXAMINATION_SYSTEM] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [LAN_OR_WAN_EXAMINATION_SYSTEM] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [LAN_OR_WAN_EXAMINATION_SYSTEM] SET QUERY_STORE = OFF
GO
USE [LAN_OR_WAN_EXAMINATION_SYSTEM]
GO
/****** Object:  Table [dbo].[tbl_account_or_exam_status]    Script Date: 02/03/2025 2:27:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_account_or_exam_status](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](8) NOT NULL,
 CONSTRAINT [PK_tbl_account_or_exam_status] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_admins]    Script Date: 02/03/2025 2:27:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_admins](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[email] [varchar](50) NOT NULL,
	[password] [char](60) NOT NULL,
	[full_name] [varchar](50) NOT NULL,
	[secret_question] [varchar](50) NOT NULL,
	[secret_answer] [char](60) NOT NULL,
	[account_or_exam_status_id] [int] NOT NULL,
 CONSTRAINT [PK_tbl_admins] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_students]    Script Date: 02/03/2025 2:27:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_students](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[student_id_no] [varchar](50) NOT NULL,
	[email] [varchar](50) NOT NULL,
	[password] [char](60) NOT NULL,
	[full_name] [varchar](50) NOT NULL,
	[secret_question] [varchar](50) NOT NULL,
	[secret_answer] [char](60) NOT NULL,
	[registered_date_time] [datetime] NOT NULL,
	[admin_id] [int] NOT NULL,
	[account_or_exam_status_id] [int] NOT NULL,
 CONSTRAINT [PK_tbl_students] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vw_GetAllStudents]    Script Date: 02/03/2025 2:27:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vw_GetAllStudents]
AS
SELECT        TOP (100) PERCENT dbo.tbl_students.id, dbo.tbl_students.student_id_no AS [STUDENT ID NO], dbo.tbl_students.email, dbo.tbl_students.password, dbo.tbl_students.full_name AS [FULL NAME], 
                         dbo.tbl_students.secret_question AS [SECRET QUESTION], dbo.tbl_students.secret_answer AS [SECRET ANSWER], dbo.tbl_students.registered_date_time AS [REGISTERED DATE TIME], 
                         dbo.tbl_admins.full_name AS [REGISTERED BY], dbo.tbl_account_or_exam_status.name AS [ACCOUNT STATUS]
FROM            dbo.tbl_students INNER JOIN
                         dbo.tbl_admins ON dbo.tbl_students.admin_id = dbo.tbl_admins.id INNER JOIN
                         dbo.tbl_account_or_exam_status ON dbo.tbl_students.account_or_exam_status_id = dbo.tbl_account_or_exam_status.id
ORDER BY dbo.tbl_students.id
GO
/****** Object:  Table [dbo].[tbl_questions]    Script Date: 02/03/2025 2:27:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_questions](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[question] [varchar](150) NOT NULL,
	[option_one] [varchar](150) NOT NULL,
	[option_two] [varchar](150) NOT NULL,
	[option_three] [varchar](150) NOT NULL,
	[option_four] [varchar](150) NOT NULL,
	[correct_answer] [int] NOT NULL,
	[exam_id] [int] NOT NULL,
	[admin_id] [int] NOT NULL,
 CONSTRAINT [PK_tbl_questions] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_exams]    Script Date: 02/03/2025 2:27:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_exams](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](100) NOT NULL,
	[description] [varchar](100) NOT NULL,
	[duration_time] [time](7) NOT NULL,
	[total_question] [int] NOT NULL,
	[pass_mark] [int] NOT NULL,
	[category_id] [int] NOT NULL,
	[subject_id] [int] NOT NULL,
	[date_and_time] [datetime] NOT NULL,
	[admin_id] [int] NOT NULL,
	[account_or_exam_status_id] [int] NOT NULL,
 CONSTRAINT [PK_tbl_exams] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vw_GetAllQuestions]    Script Date: 02/03/2025 2:27:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vw_GetAllQuestions]
AS
SELECT        TOP (100) PERCENT dbo.tbl_questions.id AS ID, dbo.tbl_questions.question AS QUESTION, dbo.tbl_questions.option_one AS 'OPTION ONE', dbo.tbl_questions.option_two AS 'OPTION TWO', 
                         dbo.tbl_questions.option_three AS 'OPTION THREE', dbo.tbl_questions.option_four AS 'OPTION FOUR', dbo.tbl_questions.correct_answer AS 'CORRECT ANSWER', dbo.tbl_exams.name AS 'EXAM NAME', 
                         dbo.tbl_admins.full_name AS 'CREATED BY'
FROM            dbo.tbl_questions INNER JOIN
                         dbo.tbl_exams ON dbo.tbl_questions.exam_id = dbo.tbl_exams.id INNER JOIN
                         dbo.tbl_admins ON dbo.tbl_questions.admin_id = dbo.tbl_admins.id
ORDER BY ID
GO
/****** Object:  Table [dbo].[tbl_categories]    Script Date: 02/03/2025 2:27:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_categories](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NOT NULL,
 CONSTRAINT [PK_tbl_categories] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_subject_names]    Script Date: 02/03/2025 2:27:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_subject_names](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NOT NULL,
 CONSTRAINT [PK_tbl_subject_names] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vw_GetAllExams]    Script Date: 02/03/2025 2:27:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vw_GetAllExams]
AS
SELECT        TOP (100) PERCENT dbo.tbl_exams.id, dbo.tbl_exams.name, dbo.tbl_exams.description, dbo.tbl_exams.duration_time AS [DURATION TIME], dbo.tbl_exams.total_question AS [TOTAL QUESTION], 
                         dbo.tbl_exams.pass_mark AS [PASS MARK], dbo.tbl_categories.name AS [CATEGORY NAME], dbo.tbl_subject_names.name AS [SUBJECT NAME], dbo.tbl_exams.date_and_time AS [CREATED DATE AND TIME], 
                         dbo.tbl_admins.full_name AS [CREATED BY], dbo.tbl_account_or_exam_status.name AS STATUS
FROM            dbo.tbl_exams INNER JOIN
                         dbo.tbl_categories ON dbo.tbl_exams.category_id = dbo.tbl_categories.id INNER JOIN
                         dbo.tbl_subject_names ON dbo.tbl_exams.subject_id = dbo.tbl_subject_names.id INNER JOIN
                         dbo.tbl_admins ON dbo.tbl_exams.admin_id = dbo.tbl_admins.id INNER JOIN
                         dbo.tbl_account_or_exam_status ON dbo.tbl_exams.account_or_exam_status_id = dbo.tbl_account_or_exam_status.id
ORDER BY dbo.tbl_exams.id
GO
/****** Object:  Table [dbo].[tbl_results]    Script Date: 02/03/2025 2:27:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_results](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[exam_id] [int] NOT NULL,
	[student_id] [int] NOT NULL,
	[total_question] [int] NOT NULL,
	[score] [int] NOT NULL,
	[result_status_id] [int] NOT NULL,
	[date_and_time] [datetime] NOT NULL,
 CONSTRAINT [PK_tbl_results] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_result_status]    Script Date: 02/03/2025 2:27:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_result_status](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](4) NOT NULL,
 CONSTRAINT [PK_tbl_status] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vw_GetAllResults]    Script Date: 02/03/2025 2:27:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vw_GetAllResults]
AS
SELECT        TOP (100) PERCENT dbo.tbl_results.id, dbo.tbl_exams.name AS [EXAM NAME], dbo.tbl_students.student_id_no AS [STUDENT ID NO], dbo.tbl_results.total_question AS [TOTAL QUESTION], dbo.tbl_results.score, 
                         dbo.tbl_result_status.name AS STATUS, dbo.tbl_results.date_and_time AS [DATE AND TIME]
FROM            dbo.tbl_results INNER JOIN
                         dbo.tbl_exams ON dbo.tbl_results.exam_id = dbo.tbl_exams.id INNER JOIN
                         dbo.tbl_students ON dbo.tbl_results.student_id = dbo.tbl_students.id INNER JOIN
                         dbo.tbl_result_status ON dbo.tbl_results.result_status_id = dbo.tbl_result_status.id
ORDER BY dbo.tbl_results.id DESC
GO
/****** Object:  View [dbo].[vw_GetAllAdmins]    Script Date: 02/03/2025 2:27:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vw_GetAllAdmins]
AS
SELECT        TOP (100) PERCENT dbo.tbl_admins.id, dbo.tbl_admins.email, dbo.tbl_admins.password, dbo.tbl_admins.full_name AS [FULL NAME], dbo.tbl_admins.secret_question AS [SECRET QUESTION], 
                         dbo.tbl_admins.secret_answer AS [SECRET ANSWER], dbo.tbl_account_or_exam_status.name AS [ACCOUNT STATUS]
FROM            dbo.tbl_admins INNER JOIN
                         dbo.tbl_account_or_exam_status ON dbo.tbl_admins.account_or_exam_status_id = dbo.tbl_account_or_exam_status.id
ORDER BY dbo.tbl_admins.id
GO
/****** Object:  Table [dbo].[tbl_subjects]    Script Date: 02/03/2025 2:27:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_subjects](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[subject_name_id] [int] NOT NULL,
	[category_id] [int] NOT NULL,
 CONSTRAINT [PK_tbl_subjects] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vw_GetAllSubjects]    Script Date: 02/03/2025 2:27:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vw_GetAllSubjects]
AS
SELECT        TOP (100) PERCENT dbo.tbl_subjects.id, dbo.tbl_subject_names.name AS [SUBJECT NAME], dbo.tbl_categories.name AS [CATEGORY NAME]
FROM            dbo.tbl_subjects INNER JOIN
                         dbo.tbl_subject_names ON dbo.tbl_subjects.subject_name_id = dbo.tbl_subject_names.id INNER JOIN
                         dbo.tbl_categories ON dbo.tbl_subjects.category_id = dbo.tbl_categories.id
ORDER BY dbo.tbl_subjects.id
GO
SET IDENTITY_INSERT [dbo].[tbl_account_or_exam_status] ON 

INSERT [dbo].[tbl_account_or_exam_status] ([id], [name]) VALUES (1, N'Active')
INSERT [dbo].[tbl_account_or_exam_status] ([id], [name]) VALUES (2, N'Inactive')
SET IDENTITY_INSERT [dbo].[tbl_account_or_exam_status] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_admins] ON 

INSERT [dbo].[tbl_admins] ([id], [email], [password], [full_name], [secret_question], [secret_answer], [account_or_exam_status_id]) VALUES (2, N'joshuamagoliman22@gmail.com', N'$2a$11$uCaCUH/VMhC7WDrDotu1QOb8Afhamkr9g1AIuvM4p4GlXX50sGpQa', N'Joshua C. Magoliman', N'What is your favorite color?', N'$2a$11$uCaCUH/VMhC7WDrDotu1QOb8Afhamkr9g1AIuvM4p4GlXX50sGpQa', 1)
INSERT [dbo].[tbl_admins] ([id], [email], [password], [full_name], [secret_question], [secret_answer], [account_or_exam_status_id]) VALUES (9, N'billgates28@gmail.com', N'$2a$11$uCaCUH/VMhC7WDrDotu1QOb8Afhamkr9g1AIuvM4p4GlXX50sGpQa', N'Bill Gates', N'What is your favorite color?', N'$2a$11$uCaCUH/VMhC7WDrDotu1QOb8Afhamkr9g1AIuvM4p4GlXX50sGpQa', 1)
SET IDENTITY_INSERT [dbo].[tbl_admins] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_categories] ON 

INSERT [dbo].[tbl_categories] ([id], [name]) VALUES (1, N'A')
INSERT [dbo].[tbl_categories] ([id], [name]) VALUES (2, N'B')
INSERT [dbo].[tbl_categories] ([id], [name]) VALUES (3, N'C')
INSERT [dbo].[tbl_categories] ([id], [name]) VALUES (4, N'D')
SET IDENTITY_INSERT [dbo].[tbl_categories] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_exams] ON 

INSERT [dbo].[tbl_exams] ([id], [name], [description], [duration_time], [total_question], [pass_mark], [category_id], [subject_id], [date_and_time], [admin_id], [account_or_exam_status_id]) VALUES (1, N'Math (Prelim Exam)', N'This is a math prelim examination', CAST(N'00:00:30' AS Time), 5, 3, 1, 1, CAST(N'2020-06-01T14:19:22.533' AS DateTime), 2, 1)
INSERT [dbo].[tbl_exams] ([id], [name], [description], [duration_time], [total_question], [pass_mark], [category_id], [subject_id], [date_and_time], [admin_id], [account_or_exam_status_id]) VALUES (4, N'Math (Midterm Exam)', N'This is a math midterm examination', CAST(N'00:00:20' AS Time), 10, 5, 1, 1, CAST(N'2020-05-23T11:23:49.000' AS DateTime), 2, 1)
INSERT [dbo].[tbl_exams] ([id], [name], [description], [duration_time], [total_question], [pass_mark], [category_id], [subject_id], [date_and_time], [admin_id], [account_or_exam_status_id]) VALUES (17, N'Math (Final Exam)', N'', CAST(N'01:00:00' AS Time), 4, 2, 1, 1, CAST(N'2025-02-03T14:18:48.697' AS DateTime), 2, 1)
SET IDENTITY_INSERT [dbo].[tbl_exams] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_questions] ON 

INSERT [dbo].[tbl_questions] ([id], [question], [option_one], [option_two], [option_three], [option_four], [correct_answer], [exam_id], [admin_id]) VALUES (1, N'a+b-b+a = ?', N'2a', N'a', N'a+b', N'2b', 1, 1, 2)
INSERT [dbo].[tbl_questions] ([id], [question], [option_one], [option_two], [option_three], [option_four], [correct_answer], [exam_id], [admin_id]) VALUES (2, N'2a+3a = ?', N'10a', N'6a', N'5a', N'a', 3, 1, 2)
INSERT [dbo].[tbl_questions] ([id], [question], [option_one], [option_two], [option_three], [option_four], [correct_answer], [exam_id], [admin_id]) VALUES (4, N'5 + 2 = ?', N'7', N'3', N'5', N'1', 1, 1, 2)
INSERT [dbo].[tbl_questions] ([id], [question], [option_one], [option_two], [option_three], [option_four], [correct_answer], [exam_id], [admin_id]) VALUES (5, N'b+b = ?', N'2b', N'3b', N'4b', N'5b', 1, 1, 2)
INSERT [dbo].[tbl_questions] ([id], [question], [option_one], [option_two], [option_three], [option_four], [correct_answer], [exam_id], [admin_id]) VALUES (6, N'10*10 = ?', N'10', N'1000', N'100', N'20', 3, 1, 2)
INSERT [dbo].[tbl_questions] ([id], [question], [option_one], [option_two], [option_three], [option_four], [correct_answer], [exam_id], [admin_id]) VALUES (22, N'1 + 1', N'LAPU LAPU', N'PULA PULA', N'MEGALAN', N'2', 4, 17, 2)
INSERT [dbo].[tbl_questions] ([id], [question], [option_one], [option_two], [option_three], [option_four], [correct_answer], [exam_id], [admin_id]) VALUES (23, N'6 + 9', N'69', N'3', N'12', N'42', 2, 17, 2)
INSERT [dbo].[tbl_questions] ([id], [question], [option_one], [option_two], [option_three], [option_four], [correct_answer], [exam_id], [admin_id]) VALUES (24, N'10 x 10', N'100', N'10', N'20', N'30', 1, 17, 2)
SET IDENTITY_INSERT [dbo].[tbl_questions] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_result_status] ON 

INSERT [dbo].[tbl_result_status] ([id], [name]) VALUES (2, N'Fail')
INSERT [dbo].[tbl_result_status] ([id], [name]) VALUES (1, N'Pass')
SET IDENTITY_INSERT [dbo].[tbl_result_status] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_results] ON 

INSERT [dbo].[tbl_results] ([id], [exam_id], [student_id], [total_question], [score], [result_status_id], [date_and_time]) VALUES (1, 1, 1, 5, 1, 2, CAST(N'2020-05-26T23:58:40.007' AS DateTime))
INSERT [dbo].[tbl_results] ([id], [exam_id], [student_id], [total_question], [score], [result_status_id], [date_and_time]) VALUES (3, 1, 1, 5, 4, 1, CAST(N'2020-05-28T01:32:40.600' AS DateTime))
INSERT [dbo].[tbl_results] ([id], [exam_id], [student_id], [total_question], [score], [result_status_id], [date_and_time]) VALUES (4, 1, 1, 5, 2, 2, CAST(N'2020-06-04T07:58:55.610' AS DateTime))
INSERT [dbo].[tbl_results] ([id], [exam_id], [student_id], [total_question], [score], [result_status_id], [date_and_time]) VALUES (5, 17, 1, 3, 1, 2, CAST(N'2025-02-03T14:22:15.143' AS DateTime))
SET IDENTITY_INSERT [dbo].[tbl_results] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_students] ON 

INSERT [dbo].[tbl_students] ([id], [student_id_no], [email], [password], [full_name], [secret_question], [secret_answer], [registered_date_time], [admin_id], [account_or_exam_status_id]) VALUES (1, N'0003297366', N'st01@gmail.com', N'$2a$12$og1mZWkpKmNjHUUrgpXgqO9Rqz4cSGHiab3d0ZZYgyYAGEXW5J5TK', N'Joanna Mae C. Magoliman', N'What is your favorite color?', N'$2a$11$uCaCUH/VMhC7WDrDotu1QOb8Afhamkr9g1AIuvM4p4GlXX50sGpQa', CAST(N'2020-06-03T07:22:13.163' AS DateTime), 2, 1)
INSERT [dbo].[tbl_students] ([id], [student_id_no], [email], [password], [full_name], [secret_question], [secret_answer], [registered_date_time], [admin_id], [account_or_exam_status_id]) VALUES (8, N'0003297367', N'st02@gmail.com', N'$2a$11$uCaCUH/VMhC7WDrDotu1QOb8Afhamkr9g1AIuvM4p4GlXX50sGpQa', N'Bill Gates', N'What is your favorite color?', N'$2a$11$uCaCUH/VMhC7WDrDotu1QOb8Afhamkr9g1AIuvM4p4GlXX50sGpQa', CAST(N'2020-05-16T03:23:49.000' AS DateTime), 2, 2)
SET IDENTITY_INSERT [dbo].[tbl_students] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_subject_names] ON 

INSERT [dbo].[tbl_subject_names] ([id], [name]) VALUES (2, N'English')
INSERT [dbo].[tbl_subject_names] ([id], [name]) VALUES (1, N'Mathematics')
INSERT [dbo].[tbl_subject_names] ([id], [name]) VALUES (3, N'Physical Education ')
SET IDENTITY_INSERT [dbo].[tbl_subject_names] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_subjects] ON 

INSERT [dbo].[tbl_subjects] ([id], [subject_name_id], [category_id]) VALUES (1, 1, 1)
INSERT [dbo].[tbl_subjects] ([id], [subject_name_id], [category_id]) VALUES (2, 2, 1)
INSERT [dbo].[tbl_subjects] ([id], [subject_name_id], [category_id]) VALUES (3, 3, 1)
SET IDENTITY_INSERT [dbo].[tbl_subjects] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ_tbl_account_or_exam_status_name]    Script Date: 02/03/2025 2:27:54 PM ******/
ALTER TABLE [dbo].[tbl_account_or_exam_status] ADD  CONSTRAINT [UQ_tbl_account_or_exam_status_name] UNIQUE NONCLUSTERED 
(
	[name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ_tbl_admins_email]    Script Date: 02/03/2025 2:27:54 PM ******/
ALTER TABLE [dbo].[tbl_admins] ADD  CONSTRAINT [UQ_tbl_admins_email] UNIQUE NONCLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ_tbl_categories_name]    Script Date: 02/03/2025 2:27:54 PM ******/
ALTER TABLE [dbo].[tbl_categories] ADD  CONSTRAINT [UQ_tbl_categories_name] UNIQUE NONCLUSTERED 
(
	[name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ_tbl_exams_name]    Script Date: 02/03/2025 2:27:54 PM ******/
ALTER TABLE [dbo].[tbl_exams] ADD  CONSTRAINT [UQ_tbl_exams_name] UNIQUE NONCLUSTERED 
(
	[name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ_tbl_questions_question]    Script Date: 02/03/2025 2:27:54 PM ******/
ALTER TABLE [dbo].[tbl_questions] ADD  CONSTRAINT [UQ_tbl_questions_question] UNIQUE NONCLUSTERED 
(
	[question] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ_tbl_status_name]    Script Date: 02/03/2025 2:27:54 PM ******/
ALTER TABLE [dbo].[tbl_result_status] ADD  CONSTRAINT [UQ_tbl_status_name] UNIQUE NONCLUSTERED 
(
	[name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ_tbl_students_email]    Script Date: 02/03/2025 2:27:54 PM ******/
ALTER TABLE [dbo].[tbl_students] ADD  CONSTRAINT [UQ_tbl_students_email] UNIQUE NONCLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ_tbl_students_student_id_no]    Script Date: 02/03/2025 2:27:54 PM ******/
ALTER TABLE [dbo].[tbl_students] ADD  CONSTRAINT [UQ_tbl_students_student_id_no] UNIQUE NONCLUSTERED 
(
	[student_id_no] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ_tbl_subject_names_name]    Script Date: 02/03/2025 2:27:54 PM ******/
ALTER TABLE [dbo].[tbl_subject_names] ADD  CONSTRAINT [UQ_tbl_subject_names_name] UNIQUE NONCLUSTERED 
(
	[name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tbl_admins]  WITH CHECK ADD  CONSTRAINT [FK_tbl_admins_account_or_exam_status_id] FOREIGN KEY([account_or_exam_status_id])
REFERENCES [dbo].[tbl_account_or_exam_status] ([id])
GO
ALTER TABLE [dbo].[tbl_admins] CHECK CONSTRAINT [FK_tbl_admins_account_or_exam_status_id]
GO
ALTER TABLE [dbo].[tbl_exams]  WITH CHECK ADD  CONSTRAINT [FK_tbl_exams_account_or_exam_status_id] FOREIGN KEY([account_or_exam_status_id])
REFERENCES [dbo].[tbl_account_or_exam_status] ([id])
GO
ALTER TABLE [dbo].[tbl_exams] CHECK CONSTRAINT [FK_tbl_exams_account_or_exam_status_id]
GO
ALTER TABLE [dbo].[tbl_exams]  WITH CHECK ADD  CONSTRAINT [FK_tbl_exams_admin_id] FOREIGN KEY([admin_id])
REFERENCES [dbo].[tbl_admins] ([id])
GO
ALTER TABLE [dbo].[tbl_exams] CHECK CONSTRAINT [FK_tbl_exams_admin_id]
GO
ALTER TABLE [dbo].[tbl_exams]  WITH CHECK ADD  CONSTRAINT [FK_tbl_exams_category_id] FOREIGN KEY([category_id])
REFERENCES [dbo].[tbl_categories] ([id])
GO
ALTER TABLE [dbo].[tbl_exams] CHECK CONSTRAINT [FK_tbl_exams_category_id]
GO
ALTER TABLE [dbo].[tbl_exams]  WITH CHECK ADD  CONSTRAINT [FK_tbl_exams_subject_id] FOREIGN KEY([subject_id])
REFERENCES [dbo].[tbl_subjects] ([id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tbl_exams] CHECK CONSTRAINT [FK_tbl_exams_subject_id]
GO
ALTER TABLE [dbo].[tbl_questions]  WITH CHECK ADD  CONSTRAINT [FK_tbl_questions_admin_id] FOREIGN KEY([admin_id])
REFERENCES [dbo].[tbl_admins] ([id])
GO
ALTER TABLE [dbo].[tbl_questions] CHECK CONSTRAINT [FK_tbl_questions_admin_id]
GO
ALTER TABLE [dbo].[tbl_questions]  WITH CHECK ADD  CONSTRAINT [FK_tbl_questions_exam_id] FOREIGN KEY([exam_id])
REFERENCES [dbo].[tbl_exams] ([id])
GO
ALTER TABLE [dbo].[tbl_questions] CHECK CONSTRAINT [FK_tbl_questions_exam_id]
GO
ALTER TABLE [dbo].[tbl_results]  WITH CHECK ADD  CONSTRAINT [FK_tbl_result_status_result_status_id] FOREIGN KEY([result_status_id])
REFERENCES [dbo].[tbl_result_status] ([id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tbl_results] CHECK CONSTRAINT [FK_tbl_result_status_result_status_id]
GO
ALTER TABLE [dbo].[tbl_results]  WITH CHECK ADD  CONSTRAINT [FK_tbl_results_exam_id] FOREIGN KEY([exam_id])
REFERENCES [dbo].[tbl_exams] ([id])
GO
ALTER TABLE [dbo].[tbl_results] CHECK CONSTRAINT [FK_tbl_results_exam_id]
GO
ALTER TABLE [dbo].[tbl_students]  WITH CHECK ADD  CONSTRAINT [FK_tbl_students_account_or_exam_status_id] FOREIGN KEY([account_or_exam_status_id])
REFERENCES [dbo].[tbl_account_or_exam_status] ([id])
GO
ALTER TABLE [dbo].[tbl_students] CHECK CONSTRAINT [FK_tbl_students_account_or_exam_status_id]
GO
ALTER TABLE [dbo].[tbl_students]  WITH CHECK ADD  CONSTRAINT [FK_tbl_students_admin_id] FOREIGN KEY([admin_id])
REFERENCES [dbo].[tbl_admins] ([id])
GO
ALTER TABLE [dbo].[tbl_students] CHECK CONSTRAINT [FK_tbl_students_admin_id]
GO
ALTER TABLE [dbo].[tbl_subjects]  WITH CHECK ADD  CONSTRAINT [FK_tbl_subjects_category_id] FOREIGN KEY([category_id])
REFERENCES [dbo].[tbl_categories] ([id])
GO
ALTER TABLE [dbo].[tbl_subjects] CHECK CONSTRAINT [FK_tbl_subjects_category_id]
GO
ALTER TABLE [dbo].[tbl_subjects]  WITH CHECK ADD  CONSTRAINT [FK_tbl_subjects_subject_name_id] FOREIGN KEY([subject_name_id])
REFERENCES [dbo].[tbl_subject_names] ([id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tbl_subjects] CHECK CONSTRAINT [FK_tbl_subjects_subject_name_id]
GO
/****** Object:  StoredProcedure [dbo].[sp_DeleteExistingCategory]    Script Date: 02/03/2025 2:27:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_DeleteExistingCategory]
@id int
AS
BEGIN
	DELETE FROM tbl_categories WHERE id=@id
END
GO
/****** Object:  StoredProcedure [dbo].[sp_DeleteExistingExam]    Script Date: 02/03/2025 2:27:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_DeleteExistingExam]
@id int
AS
BEGIN
	DELETE FROM tbl_exams WHERE id=@id
END
GO
/****** Object:  StoredProcedure [dbo].[sp_DeleteExistingQuestion]    Script Date: 02/03/2025 2:27:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_DeleteExistingQuestion]
@id int
AS
BEGIN	
DELETE FROM tbl_questions WHERE id=@id
END
GO
/****** Object:  StoredProcedure [dbo].[sp_DeleteExistingSubject]    Script Date: 02/03/2025 2:27:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_DeleteExistingSubject]
@id int
AS
BEGIN
	DELETE FROM tbl_subject_names WHERE id=@id
END
GO
/****** Object:  StoredProcedure [dbo].[sp_GetAllCategories]    Script Date: 02/03/2025 2:27:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_GetAllCategories]
AS
BEGIN	
	SELECT * FROM tbl_categories
END
GO
/****** Object:  StoredProcedure [dbo].[sp_GetAllExamsToday]    Script Date: 02/03/2025 2:27:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

 CREATE PROC [dbo].[sp_GetAllExamsToday]
 @StudentIdNo varchar(50),
 @Year int,
 @Month int,
 @Day int
 AS 
 BEGIN
 SELECT * FROM vw_GetAllResults WHERE [STUDENT ID NO]=@StudentIdNo AND (DATEPART(yy, [DATE AND TIME]) = @Year AND DATEPART(mm, [DATE AND TIME]) = @Month AND DATEPART(dd, [DATE AND TIME]) = @Day) ORDER BY ID DESC;
 END
GO
/****** Object:  StoredProcedure [dbo].[sp_GetTotalCategories]    Script Date: 02/03/2025 2:27:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_GetTotalCategories]
AS
BEGIN	
	SELECT COUNT(id) FROM tbl_categories
END
GO
/****** Object:  StoredProcedure [dbo].[sp_GetTotalExams]    Script Date: 02/03/2025 2:27:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_GetTotalExams]
AS
BEGIN	
	SELECT COUNT(id) FROM tbl_exams
END
GO
/****** Object:  StoredProcedure [dbo].[sp_GetTotalExamsActive]    Script Date: 02/03/2025 2:27:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_GetTotalExamsActive]
AS
BEGIN
 SELECT COUNT(id) FROM tbl_exams WHERE account_or_exam_status_id=1
END
GO
/****** Object:  StoredProcedure [dbo].[sp_GetTotalExamsInactive]    Script Date: 02/03/2025 2:27:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_GetTotalExamsInactive]
AS
BEGIN
 SELECT COUNT(id) FROM tbl_exams WHERE account_or_exam_status_id=2
END
GO
/****** Object:  StoredProcedure [dbo].[sp_GetTotalQuestions]    Script Date: 02/03/2025 2:27:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_GetTotalQuestions]
AS
BEGIN	
	SELECT COUNT(id) FROM tbl_questions
END
GO
/****** Object:  StoredProcedure [dbo].[sp_GetTotalResults]    Script Date: 02/03/2025 2:27:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_GetTotalResults]
AS
BEGIN	
	SELECT COUNT(id) FROM tbl_results
END
GO
/****** Object:  StoredProcedure [dbo].[sp_GetTotalResultsPrevious]    Script Date: 02/03/2025 2:27:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_GetTotalResultsPrevious]
@Year int,
@Month int,
@Day int
AS
BEGIN	
	SELECT COUNT(id) FROM tbl_results WHERE NOT (DATEPART(yy, date_and_time) = @Year AND DATEPART(mm, date_and_time) = @Month AND DATEPART(dd, date_and_time) = @Day)
END
GO
/****** Object:  StoredProcedure [dbo].[sp_GetTotalResultsToday]    Script Date: 02/03/2025 2:27:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_GetTotalResultsToday]
@Year int,
@Month int,
@Day int
AS
BEGIN	
	SELECT COUNT(id) FROM tbl_results WHERE (DATEPART(yy, date_and_time) = @Year AND DATEPART(mm, date_and_time) = @Month AND DATEPART(dd, date_and_time) = @Day)
END
GO
/****** Object:  StoredProcedure [dbo].[sp_GetTotalStudents]    Script Date: 02/03/2025 2:27:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_GetTotalStudents]
AS
BEGIN	
	SELECT COUNT(id) FROM tbl_students
END
GO
/****** Object:  StoredProcedure [dbo].[sp_GetTotalSubjects]    Script Date: 02/03/2025 2:27:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_GetTotalSubjects]
AS
BEGIN	
	SELECT COUNT(id) FROM tbl_subjects
END
GO
/****** Object:  StoredProcedure [dbo].[sp_InsertNewAdmin]    Script Date: 02/03/2025 2:27:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_InsertNewAdmin]
@email varchar(50),
@password char(60),
@full_name varchar(50),
@secret_question varchar(50),
@secret_answer char(60),
@account_or_exam_status_id int
AS
BEGIN
INSERT INTO tbl_admins (email, password, full_name, secret_question, secret_answer, account_or_exam_status_id) 
	VALUES (@email, @password, @full_name, @secret_question, @secret_answer, @account_or_exam_status_id) 
END
GO
/****** Object:  StoredProcedure [dbo].[sp_InsertNewCategory]    Script Date: 02/03/2025 2:27:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_InsertNewCategory]
@name varchar(50)
AS
BEGIN	
	INSERT INTO tbl_categories (name) VALUES (@name)
END
GO
/****** Object:  StoredProcedure [dbo].[sp_InsertNewExam]    Script Date: 02/03/2025 2:27:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_InsertNewExam]
@name varchar(100),
@description varchar(100),
@duration_time time(7),
@total_question int,
@pass_mark int,
@category_id int,
@subject_id int,
@date_and_time datetime,
@admin_id int,
@account_or_exam_status_id int
AS
BEGIN	
	INSERT INTO tbl_exams (name, description, duration_time, total_question, pass_mark, category_id, subject_id, date_and_time, admin_id, account_or_exam_status_id) 
	VALUES (@name, @description, @duration_time, @total_question, @pass_mark, @category_id, @subject_id, @date_and_time, @admin_id, @account_or_exam_status_id)
END
GO
/****** Object:  StoredProcedure [dbo].[sp_InsertNewQuestion]    Script Date: 02/03/2025 2:27:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_InsertNewQuestion]
@question varchar(150),
@option_one varchar(150),
@option_two varchar(150),
@option_three varchar(150),
@option_four varchar(150),
@correct_answer int,
@exam_id int,
@admin_id int
AS
BEGIN 
INSERT INTO tbl_questions (question, option_one, option_two, option_three, option_four, correct_answer, exam_id, admin_id) VALUES (@question, @option_one, @option_two, @option_three, @option_four, @correct_answer, @exam_id, @admin_id) 
END
GO
/****** Object:  StoredProcedure [dbo].[sp_InsertNewResult]    Script Date: 02/03/2025 2:27:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_InsertNewResult]
@exam_id int,
@student_id int,
@total_question int,
@score int,
@result_status_id int,
@date_and_time datetime
AS 
BEGIN
INSERT INTO tbl_results (exam_id, student_id, total_question, score, result_status_id, date_and_time) 
VALUES (@exam_id, @student_id, @total_question, @score, @result_status_id, @date_and_time)
END
GO
/****** Object:  StoredProcedure [dbo].[sp_InsertNewStudent]    Script Date: 02/03/2025 2:27:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_InsertNewStudent]
@student_id_no varchar(50),
@email varchar(50),
@password char(60),
@full_name varchar(50),
@secret_question varchar(50),
@secret_answer char(60),
@registered_date_time datetime,
@admin_id int,
@account_or_exam_status_id int
AS
BEGIN
INSERT INTO tbl_students (student_id_no, email, password, full_name, secret_question, secret_answer, registered_date_time, admin_id, account_or_exam_status_id) 
	VALUES (@student_id_no, @email, @password, @full_name, @secret_question, @secret_answer, @registered_date_time, @admin_id, @account_or_exam_status_id) 
END
GO
/****** Object:  StoredProcedure [dbo].[sp_InsertNewSubject]    Script Date: 02/03/2025 2:27:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_InsertNewSubject]
@name varchar(50)
AS
BEGIN	
	INSERT INTO tbl_subject_names (name) VALUES (@name)
END
GO
/****** Object:  StoredProcedure [dbo].[sp_LoginForAdmin]    Script Date: 02/03/2025 2:27:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_LoginForAdmin]
@email varchar(50)
AS
BEGIN
	SELECT * FROM tbl_admins 
	WHERE email = @email
END
GO
/****** Object:  StoredProcedure [dbo].[sp_LoginForStudents]    Script Date: 02/03/2025 2:27:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_LoginForStudents]
@email varchar(50)
AS
BEGIN
	SELECT * FROM tbl_students 
	WHERE email = @email
END
GO
/****** Object:  StoredProcedure [dbo].[sp_UpdateExistingAdmin]    Script Date: 02/03/2025 2:27:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_UpdateExistingAdmin]
@account_or_exam_status_id int,
@id int
AS
BEGIN
UPDATE tbl_admins SET account_or_exam_status_id=@account_or_exam_status_id WHERE id=@id
END
GO
/****** Object:  StoredProcedure [dbo].[sp_UpdateExistingCategory]    Script Date: 02/03/2025 2:27:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_UpdateExistingCategory]
@id int,
@name varchar(50)
AS
BEGIN	
	UPDATE tbl_categories SET name=@name WHERE id=@id
END
GO
/****** Object:  StoredProcedure [dbo].[sp_UpdateExistingExam]    Script Date: 02/03/2025 2:27:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_UpdateExistingExam]
@name varchar(100),
@description varchar(100),
@duration_time time(7),
@total_question int,
@pass_mark int,
@category_id int,
@subject_id int,
@date_and_time datetime,
@admin_id int,
@account_or_exam_status_id int,
@id int
AS
BEGIN	
UPDATE tbl_exams SET name=@name, description=@description, duration_time=@duration_time, total_question=@total_question, pass_mark=@pass_mark, category_id=@category_id, subject_id=@subject_id, date_and_time=@date_and_time, admin_id=@admin_id, account_or_exam_status_id=@account_or_exam_status_id WHERE id=@id
END
GO
/****** Object:  StoredProcedure [dbo].[sp_UpdateExistingQuestion]    Script Date: 02/03/2025 2:27:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_UpdateExistingQuestion]
@question varchar(150),
@option_one varchar(150),
@option_two varchar(150),
@option_three varchar(150),
@option_four varchar(150),
@correct_answer int,
@exam_id int,
@admin_id int,
@id int
AS
BEGIN 
UPDATE tbl_questions SET question=@question, option_one=@option_one, option_two=@option_two, option_three=@option_three, option_four=@option_four, correct_answer=@correct_answer, exam_id=@exam_id, admin_id=@admin_id WHERE id=@id
END
GO
/****** Object:  StoredProcedure [dbo].[sp_UpdateExistingStudent]    Script Date: 02/03/2025 2:27:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_UpdateExistingStudent]
@password char(60),
@full_name varchar(50),
@secret_question varchar(50),
@secret_answer char(60),
@registered_date_time datetime,
@admin_id int,
@account_or_exam_status_id int,
@id int
AS

IF LEN(@password) = 0 AND LEN(@secret_answer) > 0
BEGIN 
UPDATE tbl_students SET full_name=@full_name, secret_question=@secret_question, secret_answer=@secret_answer, registered_date_time=@registered_date_time, admin_id=@admin_id, account_or_exam_status_id=@account_or_exam_status_id WHERE id=@id
END
IF LEN(@password) > 0 AND LEN(@secret_answer) = 0
BEGIN 
UPDATE tbl_students SET password=@password, full_name=@full_name, secret_question=@secret_question, registered_date_time=@registered_date_time, admin_id=@admin_id, account_or_exam_status_id=@account_or_exam_status_id WHERE id=@id
END
IF LEN(@password) > 0 AND LEN(@secret_answer) > 0
BEGIN 
UPDATE tbl_students SET password=@password, full_name=@full_name, secret_question=@secret_question, secret_answer=@secret_answer, registered_date_time=@registered_date_time, admin_id=@admin_id, account_or_exam_status_id=@account_or_exam_status_id WHERE id=@id
END
ELSE
BEGIN 
UPDATE tbl_students SET full_name=@full_name, secret_question=@secret_question, registered_date_time=@registered_date_time, admin_id=@admin_id, account_or_exam_status_id=@account_or_exam_status_id WHERE id=@id
END
GO
/****** Object:  StoredProcedure [dbo].[sp_UpdateExistingSubject]    Script Date: 02/03/2025 2:27:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_UpdateExistingSubject]
@name varchar(50),
@id int
AS
BEGIN
 UPDATE tbl_subject_names SET name = @name where id = @id
END
GO
/****** Object:  StoredProcedure [dbo].[sp_UpdateMyAccount]    Script Date: 02/03/2025 2:27:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[sp_UpdateMyAccount]
@password char(60),
@full_name varchar(50),
@secret_question varchar(50),
@secret_answer char(60),
@account_or_exam_status_id int,
@id int
AS

IF LEN(@password) = 0 AND LEN(@secret_answer) > 0
  BEGIN 
UPDATE tbl_admins SET full_name=@full_name, secret_question=@secret_question, secret_answer=@secret_answer, account_or_exam_status_id=@account_or_exam_status_id WHERE id=@id
END
IF LEN(@password) > 0 AND LEN(@secret_answer) = 0
  BEGIN 
UPDATE tbl_admins SET password=@password, full_name=@full_name, secret_question=@secret_question, account_or_exam_status_id=@account_or_exam_status_id WHERE id=@id
END
IF LEN(@password) > 0 AND LEN(@secret_answer) > 0
BEGIN 
UPDATE tbl_admins SET password=@password, full_name=@full_name, secret_question=@secret_question, secret_answer=@secret_answer, account_or_exam_status_id=@account_or_exam_status_id WHERE id=@id
END
ELSE
BEGIN 
UPDATE tbl_admins SET full_name=@full_name, secret_question=@secret_question, account_or_exam_status_id=@account_or_exam_status_id WHERE id=@id
END
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "tbl_account_or_exam_status"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 102
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "tbl_admins"
            Begin Extent = 
               Top = 6
               Left = 246
               Bottom = 136
               Right = 479
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vw_GetAllAdmins'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vw_GetAllAdmins'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[54] 4[8] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "tbl_exams"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 256
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "tbl_categories"
            Begin Extent = 
               Top = 6
               Left = 246
               Bottom = 102
               Right = 416
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "tbl_subject_names"
            Begin Extent = 
               Top = 6
               Left = 454
               Bottom = 102
               Right = 624
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "tbl_admins"
            Begin Extent = 
               Top = 145
               Left = 383
               Bottom = 275
               Right = 554
            End
            DisplayFlags = 280
            TopColumn = 2
         End
         Begin Table = "tbl_account_or_exam_status"
            Begin Extent = 
               Top = 6
               Left = 662
               Bottom = 102
               Right = 832
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vw_GetAllExams'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vw_GetAllExams'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vw_GetAllExams'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[24] 4[5] 2[54] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "tbl_questions"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "tbl_exams"
            Begin Extent = 
               Top = 6
               Left = 246
               Bottom = 136
               Right = 416
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "tbl_admins"
            Begin Extent = 
               Top = 6
               Left = 454
               Bottom = 136
               Right = 625
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vw_GetAllQuestions'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vw_GetAllQuestions'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[25] 4[14] 2[43] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "tbl_results"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "tbl_exams"
            Begin Extent = 
               Top = 6
               Left = 246
               Bottom = 136
               Right = 416
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "tbl_students"
            Begin Extent = 
               Top = 6
               Left = 454
               Bottom = 136
               Right = 652
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "tbl_result_status"
            Begin Extent = 
               Top = 6
               Left = 690
               Bottom = 102
               Right = 860
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vw_GetAllResults'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vw_GetAllResults'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[35] 4[5] 2[55] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "tbl_students"
            Begin Extent = 
               Top = 6
               Left = 274
               Bottom = 205
               Right = 554
            End
            DisplayFlags = 280
            TopColumn = 1
         End
         Begin Table = "tbl_admins"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 199
               Right = 217
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "tbl_account_or_exam_status"
            Begin Extent = 
               Top = 6
               Left = 592
               Bottom = 102
               Right = 762
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vw_GetAllStudents'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vw_GetAllStudents'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[22] 4[5] 2[55] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "tbl_subjects"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 119
               Right = 215
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "tbl_subject_names"
            Begin Extent = 
               Top = 6
               Left = 253
               Bottom = 102
               Right = 423
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "tbl_categories"
            Begin Extent = 
               Top = 6
               Left = 461
               Bottom = 102
               Right = 631
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vw_GetAllSubjects'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vw_GetAllSubjects'
GO
USE [master]
GO
ALTER DATABASE [LAN_OR_WAN_EXAMINATION_SYSTEM] SET  READ_WRITE 
GO
