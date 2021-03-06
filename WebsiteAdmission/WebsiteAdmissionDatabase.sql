USE [master]
GO
/****** Object:  Database [WebsiteAdmission]    Script Date: 15/01/2019 22:51:13  ******/
CREATE DATABASE [WebsiteAdmission]
GO
ALTER DATABASE [WebsiteAdmission] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [WebsiteAdmission].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [WebsiteAdmission] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [WebsiteAdmission] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [WebsiteAdmission] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [WebsiteAdmission] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [WebsiteAdmission] SET ARITHABORT OFF 
GO
ALTER DATABASE [WebsiteAdmission] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [WebsiteAdmission] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [WebsiteAdmission] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [WebsiteAdmission] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [WebsiteAdmission] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [WebsiteAdmission] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [WebsiteAdmission] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [WebsiteAdmission] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [WebsiteAdmission] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [WebsiteAdmission] SET  ENABLE_BROKER 
GO
ALTER DATABASE [WebsiteAdmission] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [WebsiteAdmission] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [WebsiteAdmission] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [WebsiteAdmission] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [WebsiteAdmission] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [WebsiteAdmission] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [WebsiteAdmission] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [WebsiteAdmission] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [WebsiteAdmission] SET  MULTI_USER 
GO
ALTER DATABASE [WebsiteAdmission] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [WebsiteAdmission] SET DB_CHAINING OFF 
GO
ALTER DATABASE [WebsiteAdmission] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [WebsiteAdmission] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [WebsiteAdmission] SET DELAYED_DURABILITY = DISABLED 
GO
USE [WebsiteAdmission]
GO
/****** Object:  Table [dbo].[Feedback]    Script Date: 15/01/2019 22:51:13  ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Feedback](
	[FeedbackID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](250) NOT NULL,
	[Content] [nvarchar](250) NOT NULL,
	[User_UserID] [int] NOT NULL,
	[Post_PostID] [int] NOT NULL,
 CONSTRAINT [PK__FeedBack__E2CB3867E74439FA] PRIMARY KEY CLUSTERED 
(
	[FeedbackID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Footers]    Script Date: 15/01/2019 22:51:13  ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Footers](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](250) NULL,
	[ParentId] [int] NULL,
	[PostId] [int] NULL,
	[Content] [nvarchar](750) NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_Footers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ParentCategory]    Script Date: 15/01/2019 22:51:13  ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ParentCategory](
	[ParentCatPath] [varchar](50) NOT NULL,
	[NameParentCat] [nvarchar](250) NOT NULL,
	[Position] [int] NOT NULL,
	[Status] [bit] NULL CONSTRAINT [DF_ParentCategory_Status]  DEFAULT ((0)),
 CONSTRAINT [PK__ParentCa__1544DF413F2565D4] PRIMARY KEY CLUSTERED 
(
	[ParentCatPath] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Post]    Script Date: 15/01/2019 22:51:13  ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Post](
	[PostID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](250) NOT NULL,
	[Body] [ntext] NOT NULL,
	[CoverImage] [varchar](250) NULL,
	[Author] [nvarchar](250) NULL,
	[CreatedTime] [datetime] NULL CONSTRAINT [DF_Post_CreationTime]  DEFAULT (getdate()),
	[PublishedTime] [datetime] NULL,
	[Status] [bit] NULL CONSTRAINT [DF_Post_Status]  DEFAULT ((0)),
	[User_UserID] [int] NOT NULL,
	[SubCategory_SubCategoryID] [int] NOT NULL,
 CONSTRAINT [PK__Post__AA1260385F5BE46D] PRIMARY KEY CLUSTERED 
(
	[PostID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Privilege]    Script Date: 15/01/2019 22:51:13  ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Privilege](
	[PrivilegeID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](250) NOT NULL,
	[Description] [nvarchar](250) NULL,
 CONSTRAINT [PK__Privileg__B3E77E3C9FD3198A] PRIMARY KEY CLUSTERED 
(
	[PrivilegeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SlideImage]    Script Date: 15/01/2019 22:51:13  ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SlideImage](
	[SlideImageID] [int] IDENTITY(1,1) NOT NULL,
	[Url] [varchar](250) NOT NULL,
	[Descri] [nvarchar](250) NULL,
 CONSTRAINT [PK__SlideIma__A93DC186AD16FF6A] PRIMARY KEY CLUSTERED 
(
	[SlideImageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SubCategory]    Script Date: 15/01/2019 22:51:13  ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SubCategory](
	[SubCategoryID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](250) NULL,
	[ViewName] [varchar](250) NOT NULL,
	[Position] [int] NOT NULL,
	[ParentCategory_ParentCatPath] [varchar](50) NOT NULL,
 CONSTRAINT [PK__SubCateg__26BE5BF9B4322FF4] PRIMARY KEY CLUSTERED 
(
	[SubCategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[User]    Script Date: 15/01/2019 22:51:13  ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[User](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [varchar](50) NOT NULL,
	[PassWord] [varchar](50) NOT NULL,
	[FullName] [nvarchar](250) NOT NULL,
	[Email] [varchar](250) NOT NULL,
	[Address] [nvarchar](4000) NOT NULL,
	[Status] [bit] NULL CONSTRAINT [DF_User_Status]  DEFAULT ((0)),
	[Privilege_PrivilegeID] [int] NOT NULL,
 CONSTRAINT [PK__User__1788CCAC928FA22C] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Feedback] ON 

INSERT [dbo].[Feedback] ([FeedbackID], [Title], [Content], [User_UserID], [Post_PostID]) VALUES (1, N't1', N'đăng kí nhập học ở đâu, học phí như thế nào', 3, 17)
INSERT [dbo].[Feedback] ([FeedbackID], [Title], [Content], [User_UserID], [Post_PostID]) VALUES (2, N't2', N'tại sao nên chonj đại học kinh tế huế', 4, 62)
INSERT [dbo].[Feedback] ([FeedbackID], [Title], [Content], [User_UserID], [Post_PostID]) VALUES (3, N't3', N'quy tắc học vụ của trường là gì', 3, 62)
INSERT [dbo].[Feedback] ([FeedbackID], [Title], [Content], [User_UserID], [Post_PostID]) VALUES (4, N't4', N'thông tin về học bổng của trường', 4, 62)
INSERT [dbo].[Feedback] ([FeedbackID], [Title], [Content], [User_UserID], [Post_PostID]) VALUES (5, N't5', N'các cuộc thi năng khiếu của trường', 4, 62)
INSERT [dbo].[Feedback] ([FeedbackID], [Title], [Content], [User_UserID], [Post_PostID]) VALUES (6, N'332', N'1', 1, 63)
INSERT [dbo].[Feedback] ([FeedbackID], [Title], [Content], [User_UserID], [Post_PostID]) VALUES (7, N'sadas3333', N'3333', 1, 62)
SET IDENTITY_INSERT [dbo].[Feedback] OFF
SET IDENTITY_INSERT [dbo].[Footers] ON 

INSERT [dbo].[Footers] ([Id], [Name], [ParentId], [PostId], [Content], [Status]) VALUES (5, NULL, 23, NULL, N'<p>99 Hồ Đắc Di- TP Huế</p> 					<p>Kết nối với HCE:</p>  					<img src="/Content/images/Facebook.png">  					<img src="/Content/images/Youtube.png"> 					<img src="/Content/images/Google-plus.png"> 					<p>HOTLINE: 0912636024</p> 					<P> Email: tuyensinh@hce.edu.vn</P>', 0)
INSERT [dbo].[Footers] ([Id], [Name], [ParentId], [PostId], [Content], [Status]) VALUES (9, NULL, 22, 56, NULL, 1)
INSERT [dbo].[Footers] ([Id], [Name], [ParentId], [PostId], [Content], [Status]) VALUES (12, NULL, 22, 55, NULL, 1)
INSERT [dbo].[Footers] ([Id], [Name], [ParentId], [PostId], [Content], [Status]) VALUES (14, NULL, 22, 57, NULL, 1)
INSERT [dbo].[Footers] ([Id], [Name], [ParentId], [PostId], [Content], [Status]) VALUES (15, N'THÔNG TIN CẦN BIẾT', NULL, NULL, N'thông tin cần biết', 1)
INSERT [dbo].[Footers] ([Id], [Name], [ParentId], [PostId], [Content], [Status]) VALUES (18, NULL, 15, 20, NULL, 0)
INSERT [dbo].[Footers] ([Id], [Name], [ParentId], [PostId], [Content], [Status]) VALUES (19, NULL, 15, 21, NULL, 0)
INSERT [dbo].[Footers] ([Id], [Name], [ParentId], [PostId], [Content], [Status]) VALUES (20, NULL, 15, 24, NULL, 0)
INSERT [dbo].[Footers] ([Id], [Name], [ParentId], [PostId], [Content], [Status]) VALUES (21, NULL, 15, 25, NULL, 0)
INSERT [dbo].[Footers] ([Id], [Name], [ParentId], [PostId], [Content], [Status]) VALUES (22, N'LIÊN KẾT ĐÀO TẠO', NULL, NULL, N'liên kết đào tạo', 0)
INSERT [dbo].[Footers] ([Id], [Name], [ParentId], [PostId], [Content], [Status]) VALUES (23, N'ĐẠI HỌC KINH TẾ HUẾ', NULL, NULL, NULL, 0)
SET IDENTITY_INSERT [dbo].[Footers] OFF
INSERT [dbo].[ParentCategory] ([ParentCatPath], [NameParentCat], [Position], [Status]) VALUES (N'gioi-thieu', N'GIỚI THIỆU', 2, 1)
INSERT [dbo].[ParentCategory] ([ParentCatPath], [NameParentCat], [Position], [Status]) VALUES (N'hoc-tai-hce', N'HỌC TẠI HCE', 6, 1)
INSERT [dbo].[ParentCategory] ([ParentCatPath], [NameParentCat], [Position], [Status]) VALUES (N'khoa', N'KHOA - NGÀNH ĐÀO TẠO', 4, 1)
INSERT [dbo].[ParentCategory] ([ParentCatPath], [NameParentCat], [Position], [Status]) VALUES (N'tin-tuc', N'TIN TỨC - THÔNG BÁO', 3, 1)
INSERT [dbo].[ParentCategory] ([ParentCatPath], [NameParentCat], [Position], [Status]) VALUES (N'trang-chu', N'TRANG CHỦ', 1, 1)
INSERT [dbo].[ParentCategory] ([ParentCatPath], [NameParentCat], [Position], [Status]) VALUES (N'tu-van', N'TƯ VẤN', 5, 1)
SET IDENTITY_INSERT [dbo].[Post] ON 

INSERT [dbo].[Post] ([PostID], [Title], [Body], [CoverImage], [Author], [CreatedTime], [PublishedTime], [Status], [User_UserID], [SubCategory_SubCategoryID]) VALUES (1, N'Thông báo tuyển sinh đợt 2-2018 hệ văn bằng 2, liên thông từ cao đẳng lên Đại học', N'<p>Thông báo tuyển sinh đợt 2-2018 hệ văn bằng 2, liên thông từ cao đẳng lên Đại học</p><figure class="image ck-widget" contenteditable="false"><img src="/Content/images/posts/1/1_1.jpg"><figcaption class="ck-editor__editable ck-editor__nested-editable" contenteditable="true" data-placeholder="Enter image caption">anh dep</figcaption></figure>', N'1.png', NULL, CAST(N'2019-01-06 20:20:07.800' AS DateTime), CAST(N'2019-01-06 20:20:07.800' AS DateTime), NULL, 1, 1)
INSERT [dbo].[Post] ([PostID], [Title], [Body], [CoverImage], [Author], [CreatedTime], [PublishedTime], [Status], [User_UserID], [SubCategory_SubCategoryID]) VALUES (3, N'Danh sách thí sinh trúng tuyển hệ đại học chính quy năm 2018 vào Trường Đại học kinh tế Huế', N'<p><strong>Danh sách thí sinh trúng tuyển hệ đại học chính quy năm 2018 vào Trường Đại học kinh tế Huế</strong></p>', N'3.jpg', NULL, CAST(N'2019-01-15 04:43:39.660' AS DateTime), CAST(N'2019-01-15 04:43:39.660' AS DateTime), NULL, 1, 1)
INSERT [dbo].[Post] ([PostID], [Title], [Body], [CoverImage], [Author], [CreatedTime], [PublishedTime], [Status], [User_UserID], [SubCategory_SubCategoryID]) VALUES (4, N'Danh sách thí sinh trúng tuyển hệ đại học chính quy năm 2018 vào Trường Đại học kinh tế Huế', N'<p>temp</p>', N'4.png', NULL, CAST(N'2019-01-06 20:20:18.533' AS DateTime), CAST(N'2019-01-06 20:20:18.533' AS DateTime), NULL, 1, 1)
INSERT [dbo].[Post] ([PostID], [Title], [Body], [CoverImage], [Author], [CreatedTime], [PublishedTime], [Status], [User_UserID], [SubCategory_SubCategoryID]) VALUES (5, N'Thông báo về việc xét tuyển bổ sung đợt 1 vào đại học hệ chính quy năm 2018', N'<p><strong>Thông báo về việc xét tuyển bổ sung đợt 1 vào đại học hệ chính quy năm 2018</strong></p>', N'5.jpg', NULL, CAST(N'2019-01-06 20:20:13.560' AS DateTime), CAST(N'2019-01-06 20:20:13.560' AS DateTime), NULL, 1, 1)
INSERT [dbo].[Post] ([PostID], [Title], [Body], [CoverImage], [Author], [CreatedTime], [PublishedTime], [Status], [User_UserID], [SubCategory_SubCategoryID]) VALUES (6, N'Công bố thông tin mới nhất về thi, tuyển sinh', N'<p>Sau đó, chương trình sẽ tiếp tục diễn ra tại Trường ĐH Thủ Dầu Một (số 6 Trần Văn Ơn, Phú Hòa, TP Thủ Dầu Một, Bình Dương) lúc 14h cùng ngày.</p><p>Chương trình do báo Tuổi Trẻ, Vụ Giáo dục ĐH (Bộ GD-ĐT), Tổng cục Giáo dục nghề nghiệp (Bộ LĐ-TB&amp;XH) phối hợp tổ chức với sự đồng hành của Tập đoàn Vingroup.&nbsp;</p><p>Tại mỗi chương trình tư vấn còn có sự phối hợp tổ chức của sở GD-ĐT và tỉnh đoàn địa phương. Dự kiến hơn 3.000 học sinh, phụ huynh đến tham dự tại mỗi chương trình.</p><p>Trong hai buổi tư vấn đầu tiên này, đại diện Bộ GD-ĐT, các chuyên gia tư vấn cũng như đại diện các trường ĐH, CĐ sẽ công bố những thông tin mới nhất về kỳ thi THPT quốc gia năm 2019, đặc biệt là những điểm mới về đề thi, cách thức tính điểm xét tốt nghiệp, cách thức đăng ký xét tuyển, cách thức chọn ngành học phù hợp với năng lực và sở thích bản thân...</p><figure class="image ck-widget ck-widget_selected" contenteditable="false"><img src="/Content/images/posts/6/6_1.jpg"><figcaption class="ck-editor__editable ck-editor__nested-editable ck-placeholder" contenteditable="true" data-placeholder="Enter image caption"><br data-cke-filler="true"></figcaption></figure><div style="position: fixed; top: 0px; left: -9999px; width: 42px;">image widget</div>', N'6.jpg', NULL, CAST(N'2019-01-06 20:08:19.083' AS DateTime), CAST(N'2019-01-06 20:08:19.083' AS DateTime), 1, 1, 1)
INSERT [dbo].[Post] ([PostID], [Title], [Body], [CoverImage], [Author], [CreatedTime], [PublishedTime], [Status], [User_UserID], [SubCategory_SubCategoryID]) VALUES (7, N'Học sinh có học lực giỏi mới được xét tuyển ngành y?', N'<p style="text-align:justify;"><strong>Dự kiến có học lực lớp 12 xếp loại giỏi mới được xét tuyển ngành y</strong></p><p style="text-align:justify;">Đây là một trong những thông tin đáng chú ý được đại diện Bộ GD-ĐT công bố tại chương trình tư vấn tuyển sinh - hướng nghiệp 2019 diễn ra sáng nay 6-1.</p><p style="text-align:justify;">Hơn 3.000 học sinh tỉnh Tây Ninh đang có mặt tại Trường CĐ Sư phạm Tây Ninh tham dự buổi tư vấn đầu tiên của chương trình tư vấn tuyển sinh - hướng nghiệp năm 2019.</p><p style="text-align:justify;">Chương trình do báo&nbsp;<i>Tuổi Trẻ</i>, Vụ Giáo dục đại học (Bộ GD-ĐT), Tổng cục Giáo dục nghề nghiệp (Bộ Lao động - thương binh và xã hội), Sở GD-ĐT Tây Ninh và Tỉnh đoàn Tây Ninh phối hợp tổ chức với sự đồng hành của Tập đoàn Vingroup.</p><p style="text-align:justify;"><strong>Đề thi chủ yếu nằm trong chương trình lớp 12</strong></p><p style="text-align:justify;">ThS Nguyễn Đức Trung - chuyên viên chính Vụ Giáo dục đại học, Bộ GD-ĐT - đã cung cấp những thông tin chung nhất về kỳ thi THPT quốc gia và tuyển sinh ĐH năm 2019.</p><p style="text-align:justify;">Ông Trung khẳng định: "Bộ GD-ĐT sẽ tiếp tục tổ chức kỳ thi THPT quốc gia năm 2019 theo hướng giữ ổn định về phương thức tổ chức như hai năm trước; đồng thời thực hiện một số điều chỉnh kỹ thuật trong quy trình tổ chức thi nhằm khắc phục các hạn chế, bất cập để đảm bảo tổ chức kỳ thi nghiêm túc, khách quan, an toàn".</p>', N'7.jpg', NULL, CAST(N'2019-01-06 20:10:32.947' AS DateTime), CAST(N'2019-01-06 20:10:32.947' AS DateTime), NULL, 1, 1)
INSERT [dbo].[Post] ([PostID], [Title], [Body], [CoverImage], [Author], [CreatedTime], [PublishedTime], [Status], [User_UserID], [SubCategory_SubCategoryID]) VALUES (8, N'Thông báo tuyển sinh HCE thông báo tuyển sinh đai học chính quy năm 2018 các thí sinh cập nhật', N'<figure class="image ck-widget ck-widget_selected" contenteditable="false"><img src="/Content/images/posts/8/8_1.jpg"><figcaption class="ck-editor__editable ck-editor__nested-editable" contenteditable="true" data-placeholder="Enter image caption"><br><br data-cke-filler="true"></figcaption></figure><p>HCE thông báo tuyển sinh đai học chính quy năm 2018 các thí sinh cập nhật</p>', N'8.jpg', NULL, CAST(N'2019-01-06 21:11:59.883' AS DateTime), CAST(N'2019-01-06 21:11:59.883' AS DateTime), NULL, 1, 19)
INSERT [dbo].[Post] ([PostID], [Title], [Body], [CoverImage], [Author], [CreatedTime], [PublishedTime], [Status], [User_UserID], [SubCategory_SubCategoryID]) VALUES (9, N'Chương trình tuyển sinh đại học chính quy 2018', N'<p><strong>Chương trình tuyển sinh đại học chính quy 2018</strong><br><br><br data-cke-filler="true"></p><figure class="image ck-widget" contenteditable="false"><img src="/Content/images/posts/9/9_1.jpg"><figcaption class="ck-editor__editable ck-editor__nested-editable" contenteditable="true" data-placeholder="Enter image caption"><br><br data-cke-filler="true"></figcaption></figure><p>image widget</p>', N'9.jpg', NULL, CAST(N'2019-01-06 21:16:51.133' AS DateTime), CAST(N'2019-01-06 21:16:51.133' AS DateTime), NULL, 1, 19)
INSERT [dbo].[Post] ([PostID], [Title], [Body], [CoverImage], [Author], [CreatedTime], [PublishedTime], [Status], [User_UserID], [SubCategory_SubCategoryID]) VALUES (13, N'Chọn Trường Đại học kinh tế Huế, tại sao?', N'<figure class="media ck-widget" contenteditable="false"><div class="ck-media__wrapper" data-oembed-url="https://youtu.be/FfYYTegj-Fo"><div style="position: relative; padding-bottom: 100%; height: 0; padding-bottom: 56.2493%;"><iframe src="https://www.youtube.com/embed/FfYYTegj-Fo" style="position: absolute; width: 100%; height: 100%; top: 0; left: 0;" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen=""></iframe></div></div></figure><p><br data-cke-filler="true"></p>', N'', NULL, CAST(N'2019-01-13 19:07:22.807' AS DateTime), CAST(N'2019-01-13 19:07:22.807' AS DateTime), 1, 1, 25)
INSERT [dbo].[Post] ([PostID], [Title], [Body], [CoverImage], [Author], [CreatedTime], [PublishedTime], [Status], [User_UserID], [SubCategory_SubCategoryID]) VALUES (14, N'Học phải ngành, hành đúng nghề!', N'<figure class="image ck-widget" contenteditable="false"><img src="/Content/images/posts/14/14_1.jpg"><figcaption class="ck-editor__editable ck-editor__nested-editable" contenteditable="true" data-placeholder="Enter image caption"><br><br><br><br><br><br data-cke-filler="true"></figcaption></figure><p><br data-cke-filler="true"></p>', N'14.jpg', NULL, CAST(N'2019-01-13 19:07:56.987' AS DateTime), CAST(N'2019-01-13 19:07:56.987' AS DateTime), 1, 1, 25)
INSERT [dbo].[Post] ([PostID], [Title], [Body], [CoverImage], [Author], [CreatedTime], [PublishedTime], [Status], [User_UserID], [SubCategory_SubCategoryID]) VALUES (16, N'KHOA KINH TẾ CHÍNH TRỊ', N'<p>KHOA KINH TẾ CHÍNH TRỊ</p>', N'16.jpg', N'thâm', CAST(N'2019-01-12 18:37:05.343' AS DateTime), CAST(N'2019-01-12 18:37:05.343' AS DateTime), 1, 1, 15)
INSERT [dbo].[Post] ([PostID], [Title], [Body], [CoverImage], [Author], [CreatedTime], [PublishedTime], [Status], [User_UserID], [SubCategory_SubCategoryID]) VALUES (17, N'Về đại học kinh tế Huế', N'<p>Về đại học kinh tế Huế</p>', NULL, N'thâm', CAST(N'2019-01-12 18:48:22.703' AS DateTime), CAST(N'2019-01-12 18:48:22.703' AS DateTime), 1, 1, 26)
INSERT [dbo].[Post] ([PostID], [Title], [Body], [CoverImage], [Author], [CreatedTime], [PublishedTime], [Status], [User_UserID], [SubCategory_SubCategoryID]) VALUES (20, N'Tuyển sinh đại học', N'<p>Tuyển sinh đại học</p>', NULL, N'thâm', CAST(N'2019-01-12 19:42:37.413' AS DateTime), CAST(N'2019-01-12 19:42:37.413' AS DateTime), NULL, 1, 26)
INSERT [dbo].[Post] ([PostID], [Title], [Body], [CoverImage], [Author], [CreatedTime], [PublishedTime], [Status], [User_UserID], [SubCategory_SubCategoryID]) VALUES (21, N'Những điều khác biệt', N'<p>Những điều khác biệt</p>', N'21.jpg', N'fsdfs', CAST(N'2019-01-12 19:48:06.637' AS DateTime), CAST(N'2019-01-12 19:48:06.637' AS DateTime), NULL, 1, 28)
INSERT [dbo].[Post] ([PostID], [Title], [Body], [CoverImage], [Author], [CreatedTime], [PublishedTime], [Status], [User_UserID], [SubCategory_SubCategoryID]) VALUES (22, N'Hue Economic University', N'<p>​​​​​​​<br><br data-cke-filler="true"></p>', N'22.jpg', N'sdfsdf', CAST(N'2019-01-15 04:55:02.587' AS DateTime), CAST(N'2019-01-15 04:55:02.587' AS DateTime), NULL, 1, 28)
INSERT [dbo].[Post] ([PostID], [Title], [Body], [CoverImage], [Author], [CreatedTime], [PublishedTime], [Status], [User_UserID], [SubCategory_SubCategoryID]) VALUES (23, N'xoa', N'<p><br data-cke-filler="true"></p>', NULL, N'sdfsdf', CAST(N'2019-01-12 20:53:07.447' AS DateTime), CAST(N'2019-01-12 20:53:07.447' AS DateTime), NULL, 1, 24)
INSERT [dbo].[Post] ([PostID], [Title], [Body], [CoverImage], [Author], [CreatedTime], [PublishedTime], [Status], [User_UserID], [SubCategory_SubCategoryID]) VALUES (24, N'Dự báo tuyển sinh', N'<p><br data-cke-filler="true"></p>', N'24.JPG', N'Hoàng Huỳnh Nhi', CAST(N'2019-01-13 19:00:52.503' AS DateTime), CAST(N'2019-01-13 19:00:52.503' AS DateTime), NULL, 1, 29)
INSERT [dbo].[Post] ([PostID], [Title], [Body], [CoverImage], [Author], [CreatedTime], [PublishedTime], [Status], [User_UserID], [SubCategory_SubCategoryID]) VALUES (25, N'Dự báo điểm chuẩn', N'<p><br data-cke-filler="true"></p>', N'25.jpg', N'Nguyễn Như Nam', CAST(N'2019-01-13 19:03:02.077' AS DateTime), CAST(N'2019-01-13 19:03:02.077' AS DateTime), 1, 1, 29)
INSERT [dbo].[Post] ([PostID], [Title], [Body], [CoverImage], [Author], [CreatedTime], [PublishedTime], [Status], [User_UserID], [SubCategory_SubCategoryID]) VALUES (27, N'PHƯƠNG THỨC TUYỂN SINH', N'<p>​​​​​​​<br><br><br><br data-cke-filler="true"></p>', N'27.jpg', N' Bùi Văn Hoài', CAST(N'2019-01-15 02:21:00.947' AS DateTime), CAST(N'2019-01-15 02:21:00.947' AS DateTime), NULL, 1, 5)
INSERT [dbo].[Post] ([PostID], [Title], [Body], [CoverImage], [Author], [CreatedTime], [PublishedTime], [Status], [User_UserID], [SubCategory_SubCategoryID]) VALUES (28, N'Các hình thức tuyển sinh của Trường kinh tế Huế 2019', N'<p><br data-cke-filler="true"></p>', N'28.jpg', N'Nguyễn Như Nam', CAST(N'2019-01-14 00:49:02.330' AS DateTime), CAST(N'2019-01-14 00:49:02.330' AS DateTime), 1, 1, 5)
INSERT [dbo].[Post] ([PostID], [Title], [Body], [CoverImage], [Author], [CreatedTime], [PublishedTime], [Status], [User_UserID], [SubCategory_SubCategoryID]) VALUES (29, N'Giới thiệu chung về trường', N'<p>​​​​​​​<br><br data-cke-filler="true"></p>', N'29.jpg', N'Nguyễn Như Nam', CAST(N'2019-01-15 02:07:37.030' AS DateTime), CAST(N'2019-01-15 02:07:37.030' AS DateTime), 1, 1, 31)
INSERT [dbo].[Post] ([PostID], [Title], [Body], [CoverImage], [Author], [CreatedTime], [PublishedTime], [Status], [User_UserID], [SubCategory_SubCategoryID]) VALUES (30, N'Thư ngõ của hiệu trưởng', N'<p>​​​​​​​<br><br><br data-cke-filler="true"></p>', N'30.jpg', N'Nguyễn Như Nam', CAST(N'2019-01-15 02:08:29.813' AS DateTime), CAST(N'2019-01-15 02:08:29.813' AS DateTime), 1, 1, 31)
INSERT [dbo].[Post] ([PostID], [Title], [Body], [CoverImage], [Author], [CreatedTime], [PublishedTime], [Status], [User_UserID], [SubCategory_SubCategoryID]) VALUES (31, N'Đại học kinh tế Huế nơi chắp cánh ước mơ', N'<p><br data-cke-filler="true"></p>', N'31.JPG', N'Hoàng Huỳnh Nhi', CAST(N'2019-01-15 02:06:48.903' AS DateTime), CAST(N'2019-01-15 02:06:48.903' AS DateTime), 1, 1, 31)
INSERT [dbo].[Post] ([PostID], [Title], [Body], [CoverImage], [Author], [CreatedTime], [PublishedTime], [Status], [User_UserID], [SubCategory_SubCategoryID]) VALUES (32, N'NỘP HỒ SƠ', N'<p>​​​​​​​<br><br><br data-cke-filler="true"></p>', N'32.jpg', N'Hoàng Huỳnh Nhi', CAST(N'2019-01-15 02:24:36.703' AS DateTime), CAST(N'2019-01-15 02:24:36.703' AS DateTime), NULL, 1, 5)
INSERT [dbo].[Post] ([PostID], [Title], [Body], [CoverImage], [Author], [CreatedTime], [PublishedTime], [Status], [User_UserID], [SubCategory_SubCategoryID]) VALUES (33, N'KẾT QUẢ TUYỂN SINH', N'<p><br><br data-cke-filler="true"></p>', N'33.jpg', N'Hoàng Huỳnh Nhi', CAST(N'2019-01-15 02:23:50.067' AS DateTime), CAST(N'2019-01-15 02:23:50.067' AS DateTime), 1, 1, 5)
INSERT [dbo].[Post] ([PostID], [Title], [Body], [CoverImage], [Author], [CreatedTime], [PublishedTime], [Status], [User_UserID], [SubCategory_SubCategoryID]) VALUES (34, N'NGÀNH TUYỂN SINH', N'<p>​​​​​​​<br><br data-cke-filler="true"></p>', N'34.JPG', N'Nguyễn Như Nam', CAST(N'2019-01-15 02:23:07.827' AS DateTime), CAST(N'2019-01-15 02:23:07.827' AS DateTime), 1, 1, 5)
INSERT [dbo].[Post] ([PostID], [Title], [Body], [CoverImage], [Author], [CreatedTime], [PublishedTime], [Status], [User_UserID], [SubCategory_SubCategoryID]) VALUES (35, N'Danh sách hồ sơ xét tuyển (đã cập nhật)', N'<p>​​​​​​​<br><br data-cke-filler="true"></p>', N'35.jpg', N'Nguyễn Như Nam', CAST(N'2019-01-15 03:04:03.307' AS DateTime), CAST(N'2019-01-15 03:04:03.307' AS DateTime), 1, 1, 19)
INSERT [dbo].[Post] ([PostID], [Title], [Body], [CoverImage], [Author], [CreatedTime], [PublishedTime], [Status], [User_UserID], [SubCategory_SubCategoryID]) VALUES (36, N'THI NĂNG KHIẾU', N'<p><br data-cke-filler="true"></p>', N'36.jpg', N'Hoàng Huỳnh Nhi', CAST(N'2019-01-15 02:19:30.897' AS DateTime), CAST(N'2019-01-15 02:19:30.897' AS DateTime), 1, 1, 5)
INSERT [dbo].[Post] ([PostID], [Title], [Body], [CoverImage], [Author], [CreatedTime], [PublishedTime], [Status], [User_UserID], [SubCategory_SubCategoryID]) VALUES (37, N'DỰ BÁO ĐIỂM', N'<p><br data-cke-filler="true"></p>', N'37.jpg', N'Nguyễn Như Nam', CAST(N'2019-01-15 02:25:40.790' AS DateTime), CAST(N'2019-01-15 02:25:40.790' AS DateTime), NULL, 1, 5)
INSERT [dbo].[Post] ([PostID], [Title], [Body], [CoverImage], [Author], [CreatedTime], [PublishedTime], [Status], [User_UserID], [SubCategory_SubCategoryID]) VALUES (39, N' Bộ GD - DT thay đổi cơ chế tuyển sinh', N'<p>​​​​​​​<br><br data-cke-filler="true"></p>', N'39.png', N' Nguyễn Xuân Phúc', CAST(N'2019-01-15 03:13:50.767' AS DateTime), CAST(N'2019-01-15 03:13:50.767' AS DateTime), NULL, 1, 1)
INSERT [dbo].[Post] ([PostID], [Title], [Body], [CoverImage], [Author], [CreatedTime], [PublishedTime], [Status], [User_UserID], [SubCategory_SubCategoryID]) VALUES (40, N'Quy chế - đề án tuyển sinh', N'<p><br data-cke-filler="true"></p>', N'40.svg', N'Nguyễn Như Nam', CAST(N'2019-01-15 03:14:46.340' AS DateTime), CAST(N'2019-01-15 03:14:46.340' AS DateTime), NULL, 1, 32)
INSERT [dbo].[Post] ([PostID], [Title], [Body], [CoverImage], [Author], [CreatedTime], [PublishedTime], [Status], [User_UserID], [SubCategory_SubCategoryID]) VALUES (41, N'Giới thiệu ngành đào tạo', N'<p><br data-cke-filler="true"></p>', N'41.svg', N'Nguyễn Như Nam', CAST(N'2019-01-15 03:15:29.993' AS DateTime), CAST(N'2019-01-15 03:15:29.993' AS DateTime), NULL, 1, 32)
INSERT [dbo].[Post] ([PostID], [Title], [Body], [CoverImage], [Author], [CreatedTime], [PublishedTime], [Status], [User_UserID], [SubCategory_SubCategoryID]) VALUES (42, N'Hướng nghiệp và hỗ trợ', N'<p><br data-cke-filler="true"></p>', N'42.svg', N'Nguyễn Như Nam', CAST(N'2019-01-15 03:16:08.807' AS DateTime), CAST(N'2019-01-15 03:16:08.807' AS DateTime), NULL, 1, 32)
INSERT [dbo].[Post] ([PostID], [Title], [Body], [CoverImage], [Author], [CreatedTime], [PublishedTime], [Status], [User_UserID], [SubCategory_SubCategoryID]) VALUES (43, N'HCE - Trường THPT', N'<p><br data-cke-filler="true"></p>', N'43.svg', N'Nguyễn Như Nam', CAST(N'2019-01-15 03:17:06.263' AS DateTime), CAST(N'2019-01-15 03:17:06.263' AS DateTime), NULL, 1, 32)
INSERT [dbo].[Post] ([PostID], [Title], [Body], [CoverImage], [Author], [CreatedTime], [PublishedTime], [Status], [User_UserID], [SubCategory_SubCategoryID]) VALUES (44, N'Bồi dưỡng kiến thức', N'<p><br data-cke-filler="true"></p>', N'44.svg', N'Hoàng Huỳnh Nhi', CAST(N'2019-01-15 03:17:56.037' AS DateTime), CAST(N'2019-01-15 03:17:56.037' AS DateTime), NULL, 1, 32)
INSERT [dbo].[Post] ([PostID], [Title], [Body], [CoverImage], [Author], [CreatedTime], [PublishedTime], [Status], [User_UserID], [SubCategory_SubCategoryID]) VALUES (45, N'Học phí - học bổng', N'<p><br data-cke-filler="true"></p>', N'45.svg', NULL, CAST(N'2019-01-15 03:18:35.083' AS DateTime), CAST(N'2019-01-15 03:18:35.083' AS DateTime), NULL, 1, 32)
INSERT [dbo].[Post] ([PostID], [Title], [Body], [CoverImage], [Author], [CreatedTime], [PublishedTime], [Status], [User_UserID], [SubCategory_SubCategoryID]) VALUES (46, N' Thủ tục nhập học', N'<p><br data-cke-filler="true"></p>', N'46.svg', N'Nguyễn Như Nam', CAST(N'2019-01-15 04:22:47.030' AS DateTime), CAST(N'2019-01-15 04:22:47.030' AS DateTime), 1, 1, 9)
INSERT [dbo].[Post] ([PostID], [Title], [Body], [CoverImage], [Author], [CreatedTime], [PublishedTime], [Status], [User_UserID], [SubCategory_SubCategoryID]) VALUES (47, N' Chuẩn đầu ra', N'<p><br data-cke-filler="true"></p>', N'47.svg', N'Nguyễn Như Nam', CAST(N'2019-01-15 04:23:35.527' AS DateTime), CAST(N'2019-01-15 04:23:35.527' AS DateTime), 1, 1, 9)
INSERT [dbo].[Post] ([PostID], [Title], [Body], [CoverImage], [Author], [CreatedTime], [PublishedTime], [Status], [User_UserID], [SubCategory_SubCategoryID]) VALUES (48, N' Chương trình Tiếng Anh', N'<p><br data-cke-filler="true"></p>', N'48.svg', NULL, CAST(N'2019-01-15 04:25:40.923' AS DateTime), CAST(N'2019-01-15 04:25:40.923' AS DateTime), NULL, 1, 9)
INSERT [dbo].[Post] ([PostID], [Title], [Body], [CoverImage], [Author], [CreatedTime], [PublishedTime], [Status], [User_UserID], [SubCategory_SubCategoryID]) VALUES (49, N'Quy định học vụ', N'<p><br data-cke-filler="true"></p>', N'49.svg', N'Hoàng Huỳnh Nhi', CAST(N'2019-01-15 04:26:21.043' AS DateTime), CAST(N'2019-01-15 04:26:21.043' AS DateTime), 1, 1, 9)
INSERT [dbo].[Post] ([PostID], [Title], [Body], [CoverImage], [Author], [CreatedTime], [PublishedTime], [Status], [User_UserID], [SubCategory_SubCategoryID]) VALUES (50, N' Văn hóa sinh viên', N'<p><br data-cke-filler="true"></p>', N'50.svg', NULL, CAST(N'2019-01-15 04:26:58.623' AS DateTime), CAST(N'2019-01-15 04:26:58.623' AS DateTime), NULL, 1, 9)
INSERT [dbo].[Post] ([PostID], [Title], [Body], [CoverImage], [Author], [CreatedTime], [PublishedTime], [Status], [User_UserID], [SubCategory_SubCategoryID]) VALUES (51, N'Kí túc xá', N'<p>​​​​​​​<br><br data-cke-filler="true"></p>', N'51.svg', NULL, CAST(N'2019-01-15 04:40:59.797' AS DateTime), CAST(N'2019-01-15 04:40:59.797' AS DateTime), NULL, 1, 9)
INSERT [dbo].[Post] ([PostID], [Title], [Body], [CoverImage], [Author], [CreatedTime], [PublishedTime], [Status], [User_UserID], [SubCategory_SubCategoryID]) VALUES (52, N'Các tiện ích', N'<p>​​​​​​​<br><br data-cke-filler="true"></p>', N'52.svg', NULL, CAST(N'2019-01-15 04:33:41.030' AS DateTime), CAST(N'2019-01-15 04:33:41.030' AS DateTime), NULL, 1, 9)
INSERT [dbo].[Post] ([PostID], [Title], [Body], [CoverImage], [Author], [CreatedTime], [PublishedTime], [Status], [User_UserID], [SubCategory_SubCategoryID]) VALUES (53, N'Các hình thức tuyển sinh của Trường kinh tế Huế 2019', N'<p>​​​​​​​<br><br><br><br data-cke-filler="true"></p>', N'53.png', NULL, CAST(N'2019-01-15 04:42:55.180' AS DateTime), CAST(N'2019-01-15 04:42:55.180' AS DateTime), NULL, 1, 1)
INSERT [dbo].[Post] ([PostID], [Title], [Body], [CoverImage], [Author], [CreatedTime], [PublishedTime], [Status], [User_UserID], [SubCategory_SubCategoryID]) VALUES (55, N'Chương trình Rennes', N'<p><br data-cke-filler="true"></p>', N'55.jpg', NULL, CAST(N'2019-01-15 04:37:15.420' AS DateTime), CAST(N'2019-01-15 04:37:15.420' AS DateTime), NULL, 1, 36)
INSERT [dbo].[Post] ([PostID], [Title], [Body], [CoverImage], [Author], [CreatedTime], [PublishedTime], [Status], [User_UserID], [SubCategory_SubCategoryID]) VALUES (56, N'Chương trình Tallaught', N'<p><br data-cke-filler="true"></p>', N'56.jpg', NULL, CAST(N'2019-01-15 04:38:27.240' AS DateTime), CAST(N'2019-01-15 04:38:27.240' AS DateTime), NULL, 1, 36)
INSERT [dbo].[Post] ([PostID], [Title], [Body], [CoverImage], [Author], [CreatedTime], [PublishedTime], [Status], [User_UserID], [SubCategory_SubCategoryID]) VALUES (57, N'Chương trình tiên tiến', N'<p><br data-cke-filler="true"></p>', N'57.jpg', NULL, CAST(N'2019-01-15 04:39:16.630' AS DateTime), CAST(N'2019-01-15 04:39:16.630' AS DateTime), NULL, 1, 36)
INSERT [dbo].[Post] ([PostID], [Title], [Body], [CoverImage], [Author], [CreatedTime], [PublishedTime], [Status], [User_UserID], [SubCategory_SubCategoryID]) VALUES (58, N'Hỗ trợ sinh viên', N'<p><br data-cke-filler="true"></p>', N'58.svg', NULL, CAST(N'2019-01-15 04:45:09.900' AS DateTime), CAST(N'2019-01-15 04:45:09.900' AS DateTime), NULL, 1, 9)
INSERT [dbo].[Post] ([PostID], [Title], [Body], [CoverImage], [Author], [CreatedTime], [PublishedTime], [Status], [User_UserID], [SubCategory_SubCategoryID]) VALUES (59, N'KHOA TÀI CHÍNH NGÂN HÀNG', N'<p><br data-cke-filler="true"></p>', N'59.jpg', NULL, CAST(N'2019-01-15 04:48:56.357' AS DateTime), CAST(N'2019-01-15 04:48:56.357' AS DateTime), NULL, 1, 15)
INSERT [dbo].[Post] ([PostID], [Title], [Body], [CoverImage], [Author], [CreatedTime], [PublishedTime], [Status], [User_UserID], [SubCategory_SubCategoryID]) VALUES (60, N'KHOA KẾ TOÁN - KIỂM TOÁN', N'<p><br data-cke-filler="true"></p>', N'60.JPG', NULL, CAST(N'2019-01-15 04:49:40.113' AS DateTime), CAST(N'2019-01-15 04:49:40.113' AS DateTime), NULL, 1, 15)
INSERT [dbo].[Post] ([PostID], [Title], [Body], [CoverImage], [Author], [CreatedTime], [PublishedTime], [Status], [User_UserID], [SubCategory_SubCategoryID]) VALUES (61, N'Chương trình liên kết', N'<p><br data-cke-filler="true"></p>', NULL, NULL, CAST(N'2019-01-15 04:50:58.087' AS DateTime), CAST(N'2019-01-15 04:50:58.087' AS DateTime), NULL, 1, 26)
INSERT [dbo].[Post] ([PostID], [Title], [Body], [CoverImage], [Author], [CreatedTime], [PublishedTime], [Status], [User_UserID], [SubCategory_SubCategoryID]) VALUES (62, N'Tra cứu và đăng kí xét tuyển', N'<p><br data-cke-filler="true"></p>', NULL, N'Nguyễn Như Nam', CAST(N'2019-01-15 04:52:10.487' AS DateTime), CAST(N'2019-01-15 04:52:10.487' AS DateTime), NULL, 1, 26)
INSERT [dbo].[Post] ([PostID], [Title], [Body], [CoverImage], [Author], [CreatedTime], [PublishedTime], [Status], [User_UserID], [SubCategory_SubCategoryID]) VALUES (63, N'Tư vấn', N'<p><br data-cke-filler="true"></p>', N'63.png', NULL, CAST(N'2019-01-15 05:02:50.847' AS DateTime), CAST(N'2019-01-15 05:02:50.847' AS DateTime), NULL, 1, 26)
INSERT [dbo].[Post] ([PostID], [Title], [Body], [CoverImage], [Author], [CreatedTime], [PublishedTime], [Status], [User_UserID], [SubCategory_SubCategoryID]) VALUES (64, N'Chương trình tuyển sinh 2019', N'<p><br data-cke-filler="true"></p>', N'64.jpg', N'Nguyễn Như Nam', CAST(N'2019-01-15 10:03:39.600' AS DateTime), CAST(N'2019-01-15 10:03:39.600' AS DateTime), 1, 1, 1)
SET IDENTITY_INSERT [dbo].[Post] OFF
SET IDENTITY_INSERT [dbo].[Privilege] ON 

INSERT [dbo].[Privilege] ([PrivilegeID], [Name], [Description]) VALUES (1, N'Admin', N'Toàn quyền quản lý.')
INSERT [dbo].[Privilege] ([PrivilegeID], [Name], [Description]) VALUES (2, N'Super Mod', N'Quản lí Mod và có thể thực hiện thêm, sửa và xóa bài của Mod')
INSERT [dbo].[Privilege] ([PrivilegeID], [Name], [Description]) VALUES (3, N'Mod', N'Cung cấp thông tin vể viết Post chỉ được thêm và sửa bài Post')
INSERT [dbo].[Privilege] ([PrivilegeID], [Name], [Description]) VALUES (4, N'User', N'Thành viên ')
SET IDENTITY_INSERT [dbo].[Privilege] OFF
SET IDENTITY_INSERT [dbo].[SubCategory] ON 

INSERT [dbo].[SubCategory] ([SubCategoryID], [Name], [ViewName], [Position], [ParentCategory_ParentCatPath]) VALUES (1, N'TIN TUYỂN SINH', N'_TrangChu_Row1', 12, N'trang-chu')
INSERT [dbo].[SubCategory] ([SubCategoryID], [Name], [ViewName], [Position], [ParentCategory_ParentCatPath]) VALUES (2, N'Phương thức tuyển sinh', N'_TrangChu_Row2', 11, N'tin-tuc')
INSERT [dbo].[SubCategory] ([SubCategoryID], [Name], [ViewName], [Position], [ParentCategory_ParentCatPath]) VALUES (3, N'NỘP HỒ SƠ', N'_TinTuc_ThongBao_Row1', 5, N'tin-tuc')
INSERT [dbo].[SubCategory] ([SubCategoryID], [Name], [ViewName], [Position], [ParentCategory_ParentCatPath]) VALUES (5, N'Ngành tuyển sinh', N'_TinTuc_ThongBao_Row1', 8, N'tin-tuc')
INSERT [dbo].[SubCategory] ([SubCategoryID], [Name], [ViewName], [Position], [ParentCategory_ParentCatPath]) VALUES (6, N'Kết quả tuyển sinh', N'_TinTuc_ThongBao_Row1', 7, N'tin-tuc')
INSERT [dbo].[SubCategory] ([SubCategoryID], [Name], [ViewName], [Position], [ParentCategory_ParentCatPath]) VALUES (8, N'Thông tin cần biết', N'_TrangChu_Row1', 10, N'tin-tuc')
INSERT [dbo].[SubCategory] ([SubCategoryID], [Name], [ViewName], [Position], [ParentCategory_ParentCatPath]) VALUES (9, N'HỌC TẠI HCE', N'_TinTuc_ThongBao_Row4', 8, N'tin-tuc')
INSERT [dbo].[SubCategory] ([SubCategoryID], [Name], [ViewName], [Position], [ParentCategory_ParentCatPath]) VALUES (15, N'Danh sách khoa', N'_Khoa_DaoTao', 6, N'khoa')
INSERT [dbo].[SubCategory] ([SubCategoryID], [Name], [ViewName], [Position], [ParentCategory_ParentCatPath]) VALUES (19, N'TUYỂN SINH ĐẠI HỌC', N'_TrangChu_Row2', 4, N'trang-chu')
INSERT [dbo].[SubCategory] ([SubCategoryID], [Name], [ViewName], [Position], [ParentCategory_ParentCatPath]) VALUES (24, N'Slides', N'_TrangChu_Slide', 13, N'trang-chu')
INSERT [dbo].[SubCategory] ([SubCategoryID], [Name], [ViewName], [Position], [ParentCategory_ParentCatPath]) VALUES (25, N'Youtube', N'_TrangChu_Youtube', 1, N'trang-chu')
INSERT [dbo].[SubCategory] ([SubCategoryID], [Name], [ViewName], [Position], [ParentCategory_ParentCatPath]) VALUES (26, N'Phân loại câu hỏi', N'_TuVan_ViewTrai', 6, N'tu-van')
INSERT [dbo].[SubCategory] ([SubCategoryID], [Name], [ViewName], [Position], [ParentCategory_ParentCatPath]) VALUES (28, N'MÔI TRƯỜNG HCE', N'_TrangChu_Row2', 1, N'hoc-tai-hce')
INSERT [dbo].[SubCategory] ([SubCategoryID], [Name], [ViewName], [Position], [ParentCategory_ParentCatPath]) VALUES (29, N'DỰ BÁO', N'_TrangChu_Row2', 3, N'trang-chu')
INSERT [dbo].[SubCategory] ([SubCategoryID], [Name], [ViewName], [Position], [ParentCategory_ParentCatPath]) VALUES (31, N'thư gửi hiệu trưởng', N'_Khoa_DaoTao', 2, N'gioi-thieu')
INSERT [dbo].[SubCategory] ([SubCategoryID], [Name], [ViewName], [Position], [ParentCategory_ParentCatPath]) VALUES (32, N'THÔNG TIN CẦN BIẾT', N'_TinTuc_ThongBao_Row3', 9, N'tin-tuc')
INSERT [dbo].[SubCategory] ([SubCategoryID], [Name], [ViewName], [Position], [ParentCategory_ParentCatPath]) VALUES (36, N'LIÊN KẾT ĐÀO TẠO', N'_TinTuc_ThongBao_Row2', 9, N'tin-tuc')
SET IDENTITY_INSERT [dbo].[SubCategory] OFF
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([UserID], [UserName], [PassWord], [FullName], [Email], [Address], [Status], [Privilege_PrivilegeID]) VALUES (1, N'hongtrinh', N'42-97-F4-4B-13-95-52-35-24-5B-24-97-39-9D-7A-93', N'Nguyễn Thị Hồng Trinh', N'htrinhpadu@gmail.com', N'phú hòa phú yên', 1, 1)
INSERT [dbo].[User] ([UserID], [UserName], [PassWord], [FullName], [Email], [Address], [Status], [Privilege_PrivilegeID]) VALUES (2, N'huynhnhi', N'42-97-F4-4B-13-95-52-35-24-5B-24-97-39-9D-7A-93', N'Hoàng Thị Huỳnh Nhi', N'nhi@gmail.com', N'đông hà quảng trị', 1, 2)
INSERT [dbo].[User] ([UserID], [UserName], [PassWord], [FullName], [Email], [Address], [Status], [Privilege_PrivilegeID]) VALUES (3, N'trieuhuy', N'42-97-F4-4B-13-95-52-35-24-5B-24-97-39-9D-7A-93', N'Phan Mai Triều Huy', N'huy@gmail.com', N'hải phòng', 1, 3)
INSERT [dbo].[User] ([UserID], [UserName], [PassWord], [FullName], [Email], [Address], [Status], [Privilege_PrivilegeID]) VALUES (4, N'namnguyen', N'42-97-F4-4B-13-95-52-35-24-5B-24-97-39-9D-7A-93', N'Đoàn Văn Nam', N'nam@gmail.com', N'hà tĩnh', 1, 3)
INSERT [dbo].[User] ([UserID], [UserName], [PassWord], [FullName], [Email], [Address], [Status], [Privilege_PrivilegeID]) VALUES (7, N'nthtrinh', N'42-97-F4-4B-13-95-52-35-24-5B-24-97-39-9D-7A-93', N'Hồng Trinh', N'nthtrinh@gmail.com', N'ahihi', 1, 1)
INSERT [dbo].[User] ([UserID], [UserName], [PassWord], [FullName], [Email], [Address], [Status], [Privilege_PrivilegeID]) VALUES (8, N'thamdavies', N'42-97-F4-4B-13-95-52-35-24-5B-24-97-39-9D-7A-93', N'Thâm Davies', N'thamdavies@gmail.com', N'gia lai', NULL, 1)
INSERT [dbo].[User] ([UserID], [UserName], [PassWord], [FullName], [Email], [Address], [Status], [Privilege_PrivilegeID]) VALUES (9, N'ht', N'42-97-F4-4B-13-95-52-35-24-5B-24-97-39-9D-7A-93', N'hanh tran', N'hanh@gmail.com', N'phú tho', 1, 1)
INSERT [dbo].[User] ([UserID], [UserName], [PassWord], [FullName], [Email], [Address], [Status], [Privilege_PrivilegeID]) VALUES (10, N'hnhi', N'42-97-F4-4B-13-95-52-35-24-5B-24-97-39-9D-7A-93', N' Hoàng Thi Huỳnh Nhi', N'nhihoang@gmail.con', N'đông hà quảng trị', NULL, 1)
INSERT [dbo].[User] ([UserID], [UserName], [PassWord], [FullName], [Email], [Address], [Status], [Privilege_PrivilegeID]) VALUES (11, N'nthnhi', N'42-97-F4-4B-13-95-52-35-24-5B-24-97-39-9D-7A-93', N' Hoàng Thi Huỳnh Nhi', N'hthnhi@gmail.com', N'sdfsdf', NULL, 4)
INSERT [dbo].[User] ([UserID], [UserName], [PassWord], [FullName], [Email], [Address], [Status], [Privilege_PrivilegeID]) VALUES (12, N'httt', N'42-97-F4-4B-13-95-52-35-24-5B-24-97-39-9D-7A-93', N' Hoàng Thi Huỳnh Nhi', N'ht1@gmail.com', N'đông hà quảng trị', NULL, 4)
SET IDENTITY_INSERT [dbo].[User] OFF
ALTER TABLE [dbo].[Feedback]  WITH CHECK ADD  CONSTRAINT [FK_Feedback_Post] FOREIGN KEY([Post_PostID])
REFERENCES [dbo].[Post] ([PostID])
GO
ALTER TABLE [dbo].[Feedback] CHECK CONSTRAINT [FK_Feedback_Post]
GO
ALTER TABLE [dbo].[Feedback]  WITH CHECK ADD  CONSTRAINT [FK_FeedBack_User] FOREIGN KEY([User_UserID])
REFERENCES [dbo].[User] ([UserID])
GO
ALTER TABLE [dbo].[Feedback] CHECK CONSTRAINT [FK_FeedBack_User]
GO
ALTER TABLE [dbo].[Footers]  WITH CHECK ADD  CONSTRAINT [FK_Footers_Post] FOREIGN KEY([PostId])
REFERENCES [dbo].[Post] ([PostID])
GO
ALTER TABLE [dbo].[Footers] CHECK CONSTRAINT [FK_Footers_Post]
GO
ALTER TABLE [dbo].[Post]  WITH CHECK ADD  CONSTRAINT [FK_Post_SubCategory] FOREIGN KEY([SubCategory_SubCategoryID])
REFERENCES [dbo].[SubCategory] ([SubCategoryID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Post] CHECK CONSTRAINT [FK_Post_SubCategory]
GO
ALTER TABLE [dbo].[Post]  WITH CHECK ADD  CONSTRAINT [FK_Post_User] FOREIGN KEY([User_UserID])
REFERENCES [dbo].[User] ([UserID])
GO
ALTER TABLE [dbo].[Post] CHECK CONSTRAINT [FK_Post_User]
GO
ALTER TABLE [dbo].[SubCategory]  WITH CHECK ADD  CONSTRAINT [FK_SubCategory_ParentCategory] FOREIGN KEY([ParentCategory_ParentCatPath])
REFERENCES [dbo].[ParentCategory] ([ParentCatPath])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[SubCategory] CHECK CONSTRAINT [FK_SubCategory_ParentCategory]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_Privilege] FOREIGN KEY([Privilege_PrivilegeID])
REFERENCES [dbo].[Privilege] ([PrivilegeID])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_Privilege]
GO
USE [master]
GO
ALTER DATABASE [WebsiteAdmission] SET  READ_WRITE 
GO
