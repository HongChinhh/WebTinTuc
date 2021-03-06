USE [WebsiteAdmission]
GO
/****** Object:  Table [dbo].[Departments]    Script Date: 1/21/2019 3:19:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Departments](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](500) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[EnrollMarks]    Script Date: 1/21/2019 3:19:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EnrollMarks](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Year] [int] NULL,
	[Target] [float] NULL,
	[DepartmentId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[EnrollTargets]    Script Date: 1/21/2019 3:19:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EnrollTargets](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Year] [int] NULL,
	[Target] [float] NULL,
	[DepartmentId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Departments] ON 

INSERT [dbo].[Departments] ([Id], [Name]) VALUES (1, N'Kinh tế')
INSERT [dbo].[Departments] ([Id], [Name]) VALUES (2, N'Kinh tế nông nghiệp')
INSERT [dbo].[Departments] ([Id], [Name]) VALUES (3, N'Công nghệ thông tin')
SET IDENTITY_INSERT [dbo].[Departments] OFF
SET IDENTITY_INSERT [dbo].[EnrollMarks] ON 

INSERT [dbo].[EnrollMarks] ([Id], [Year], [Target], [DepartmentId]) VALUES (1, 2014, 17, 1)
INSERT [dbo].[EnrollMarks] ([Id], [Year], [Target], [DepartmentId]) VALUES (2, 2015, 18, 1)
INSERT [dbo].[EnrollMarks] ([Id], [Year], [Target], [DepartmentId]) VALUES (3, 2016, 16, 1)
INSERT [dbo].[EnrollMarks] ([Id], [Year], [Target], [DepartmentId]) VALUES (4, 2017, 17.5, 1)
INSERT [dbo].[EnrollMarks] ([Id], [Year], [Target], [DepartmentId]) VALUES (5, 2018, 18, 1)
INSERT [dbo].[EnrollMarks] ([Id], [Year], [Target], [DepartmentId]) VALUES (6, 2014, 16, 2)
INSERT [dbo].[EnrollMarks] ([Id], [Year], [Target], [DepartmentId]) VALUES (7, 2015, 17, 2)
INSERT [dbo].[EnrollMarks] ([Id], [Year], [Target], [DepartmentId]) VALUES (8, 2016, 18, 2)
INSERT [dbo].[EnrollMarks] ([Id], [Year], [Target], [DepartmentId]) VALUES (9, 2017, 18.5, 2)
INSERT [dbo].[EnrollMarks] ([Id], [Year], [Target], [DepartmentId]) VALUES (10, 2018, 17.5, 2)
INSERT [dbo].[EnrollMarks] ([Id], [Year], [Target], [DepartmentId]) VALUES (11, 2014, 19, 3)
INSERT [dbo].[EnrollMarks] ([Id], [Year], [Target], [DepartmentId]) VALUES (12, 2015, 20, 3)
INSERT [dbo].[EnrollMarks] ([Id], [Year], [Target], [DepartmentId]) VALUES (13, 2016, 20.5, 3)
INSERT [dbo].[EnrollMarks] ([Id], [Year], [Target], [DepartmentId]) VALUES (14, 2017, 21, 3)
INSERT [dbo].[EnrollMarks] ([Id], [Year], [Target], [DepartmentId]) VALUES (15, 2018, 21.5, 3)
SET IDENTITY_INSERT [dbo].[EnrollMarks] OFF
SET IDENTITY_INSERT [dbo].[EnrollTargets] ON 

INSERT [dbo].[EnrollTargets] ([Id], [Year], [Target], [DepartmentId]) VALUES (1, 2014, 130, 1)
INSERT [dbo].[EnrollTargets] ([Id], [Year], [Target], [DepartmentId]) VALUES (2, 2015, 136, 1)
INSERT [dbo].[EnrollTargets] ([Id], [Year], [Target], [DepartmentId]) VALUES (3, 2016, 134, 1)
INSERT [dbo].[EnrollTargets] ([Id], [Year], [Target], [DepartmentId]) VALUES (4, 2017, 140, 1)
INSERT [dbo].[EnrollTargets] ([Id], [Year], [Target], [DepartmentId]) VALUES (5, 2018, 146, 1)
INSERT [dbo].[EnrollTargets] ([Id], [Year], [Target], [DepartmentId]) VALUES (6, 2014, 150, 2)
INSERT [dbo].[EnrollTargets] ([Id], [Year], [Target], [DepartmentId]) VALUES (7, 2015, 260, 2)
INSERT [dbo].[EnrollTargets] ([Id], [Year], [Target], [DepartmentId]) VALUES (8, 2016, 250, 2)
INSERT [dbo].[EnrollTargets] ([Id], [Year], [Target], [DepartmentId]) VALUES (9, 2017, 280, 2)
INSERT [dbo].[EnrollTargets] ([Id], [Year], [Target], [DepartmentId]) VALUES (10, 2018, 250, 2)
INSERT [dbo].[EnrollTargets] ([Id], [Year], [Target], [DepartmentId]) VALUES (11, 2014, 280, 3)
INSERT [dbo].[EnrollTargets] ([Id], [Year], [Target], [DepartmentId]) VALUES (12, 2015, 290, 3)
INSERT [dbo].[EnrollTargets] ([Id], [Year], [Target], [DepartmentId]) VALUES (13, 2016, 290, 3)
INSERT [dbo].[EnrollTargets] ([Id], [Year], [Target], [DepartmentId]) VALUES (14, 2017, 250, 3)
INSERT [dbo].[EnrollTargets] ([Id], [Year], [Target], [DepartmentId]) VALUES (15, 2018, 255, 3)
SET IDENTITY_INSERT [dbo].[EnrollTargets] OFF
ALTER TABLE [dbo].[EnrollMarks]  WITH CHECK ADD  CONSTRAINT [fk_Departments_EnrollMarks] FOREIGN KEY([DepartmentId])
REFERENCES [dbo].[Departments] ([Id])
GO
ALTER TABLE [dbo].[EnrollMarks] CHECK CONSTRAINT [fk_Departments_EnrollMarks]
GO
ALTER TABLE [dbo].[EnrollTargets]  WITH CHECK ADD  CONSTRAINT [fk_Departments_EnrollTargets] FOREIGN KEY([DepartmentId])
REFERENCES [dbo].[Departments] ([Id])
GO
ALTER TABLE [dbo].[EnrollTargets] CHECK CONSTRAINT [fk_Departments_EnrollTargets]
GO
