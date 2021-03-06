USE [master]
GO
/****** Object:  Database [pizzawoolf]    Script Date: 07.10.2020 13:19:30 ******/
CREATE DATABASE [pizzawoolf]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'pizzawoolf', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\pizzawoolf.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'pizzawoolf_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\pizzawoolf_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [pizzawoolf] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [pizzawoolf].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [pizzawoolf] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [pizzawoolf] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [pizzawoolf] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [pizzawoolf] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [pizzawoolf] SET ARITHABORT OFF 
GO
ALTER DATABASE [pizzawoolf] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [pizzawoolf] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [pizzawoolf] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [pizzawoolf] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [pizzawoolf] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [pizzawoolf] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [pizzawoolf] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [pizzawoolf] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [pizzawoolf] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [pizzawoolf] SET  DISABLE_BROKER 
GO
ALTER DATABASE [pizzawoolf] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [pizzawoolf] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [pizzawoolf] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [pizzawoolf] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [pizzawoolf] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [pizzawoolf] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [pizzawoolf] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [pizzawoolf] SET RECOVERY FULL 
GO
ALTER DATABASE [pizzawoolf] SET  MULTI_USER 
GO
ALTER DATABASE [pizzawoolf] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [pizzawoolf] SET DB_CHAINING OFF 
GO
ALTER DATABASE [pizzawoolf] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [pizzawoolf] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [pizzawoolf] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'pizzawoolf', N'ON'
GO
ALTER DATABASE [pizzawoolf] SET QUERY_STORE = OFF
GO
USE [pizzawoolf]
GO
/****** Object:  Table [dbo].[блюда]    Script Date: 07.10.2020 13:19:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[блюда](
	[id_блюда] [bigint] IDENTITY(1,1) NOT NULL,
	[наименование] [nvarchar](50) NOT NULL,
	[цена] [bigint] NOT NULL,
	[id_категории] [bigint] NOT NULL,
 CONSTRAINT [PK_блюда] PRIMARY KEY CLUSTERED 
(
	[id_блюда] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[блюда_в_заказе]    Script Date: 07.10.2020 13:19:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[блюда_в_заказе](
	[id_БЗ] [bigint] IDENTITY(1,1) NOT NULL,
	[кол-во] [nvarchar](50) NOT NULL,
	[id_заказа] [bigint] NOT NULL,
	[id_блюда] [bigint] NOT NULL,
 CONSTRAINT [PK_блюда_в_заказе] PRIMARY KEY CLUSTERED 
(
	[id_БЗ] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Заказ]    Script Date: 07.10.2020 13:19:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Заказ](
	[id_заказа] [bigint] IDENTITY(1,1) NOT NULL,
	[сумма] [nvarchar](50) NOT NULL,
	[id_клиента] [bigint] NOT NULL,
	[id_сотрудника] [bigint] NULL,
 CONSTRAINT [PK_Заказ] PRIMARY KEY CLUSTERED 
(
	[id_заказа] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[категории]    Script Date: 07.10.2020 13:19:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[категории](
	[id_категории] [bigint] IDENTITY(1,1) NOT NULL,
	[наименование] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_категории] PRIMARY KEY CLUSTERED 
(
	[id_категории] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Клиенты]    Script Date: 07.10.2020 13:19:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Клиенты](
	[id_клиента] [bigint] IDENTITY(1,1) NOT NULL,
	[ФИО] [nvarchar](50) NOT NULL,
	[Адрес] [nvarchar](50) NOT NULL,
	[Телефон] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Клиенты] PRIMARY KEY CLUSTERED 
(
	[id_клиента] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[сотрудники]    Script Date: 07.10.2020 13:19:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[сотрудники](
	[id_сотрудника] [bigint] IDENTITY(1,1) NOT NULL,
	[ФИО] [nvarchar](50) NOT NULL,
	[должность] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_сотрудники] PRIMARY KEY CLUSTERED 
(
	[id_сотрудника] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[блюда] ON 

INSERT [dbo].[блюда] ([id_блюда], [наименование], [цена], [id_категории]) VALUES (1, N'Пепперони', 455, 1)
INSERT [dbo].[блюда] ([id_блюда], [наименование], [цена], [id_категории]) VALUES (2, N'Маргарита', 285, 1)
INSERT [dbo].[блюда] ([id_блюда], [наименование], [цена], [id_категории]) VALUES (3, N'Грибная', 395, 1)
INSERT [dbo].[блюда] ([id_блюда], [наименование], [цена], [id_категории]) VALUES (5, N'Чизкейк', 170, 3)
INSERT [dbo].[блюда] ([id_блюда], [наименование], [цена], [id_категории]) VALUES (6, N'Морс ', 80, 4)
INSERT [dbo].[блюда] ([id_блюда], [наименование], [цена], [id_категории]) VALUES (7, N'Coca-Cola', 80, 4)
INSERT [dbo].[блюда] ([id_блюда], [наименование], [цена], [id_категории]) VALUES (8, N'Fanta', 80, 4)
INSERT [dbo].[блюда] ([id_блюда], [наименование], [цена], [id_категории]) VALUES (9, N'Пироженое "Сметанное"', 105, 3)
INSERT [dbo].[блюда] ([id_блюда], [наименование], [цена], [id_категории]) VALUES (10, N'Пончик', 50, 3)
INSERT [dbo].[блюда] ([id_блюда], [наименование], [цена], [id_категории]) VALUES (11, N'Пиво светлое', 94, 2)
INSERT [dbo].[блюда] ([id_блюда], [наименование], [цена], [id_категории]) VALUES (12, N'Пиво темное ', 80, 2)
INSERT [dbo].[блюда] ([id_блюда], [наименование], [цена], [id_категории]) VALUES (13, N'Водка', 265, 2)
INSERT [dbo].[блюда] ([id_блюда], [наименование], [цена], [id_категории]) VALUES (14, N'Бургер "Эль Рояль"', 295, 5)
INSERT [dbo].[блюда] ([id_блюда], [наименование], [цена], [id_категории]) VALUES (15, N'Бургер "Тори" ', 165, 5)
INSERT [dbo].[блюда] ([id_блюда], [наименование], [цена], [id_категории]) VALUES (16, N'Чизбургер', 89, 5)
INSERT [dbo].[блюда] ([id_блюда], [наименование], [цена], [id_категории]) VALUES (17, N'Терияки', 30, 6)
INSERT [dbo].[блюда] ([id_блюда], [наименование], [цена], [id_категории]) VALUES (18, N'Сырный', 30, 6)
INSERT [dbo].[блюда] ([id_блюда], [наименование], [цена], [id_категории]) VALUES (19, N'Барбекю', 30, 6)
SET IDENTITY_INSERT [dbo].[блюда] OFF
GO
SET IDENTITY_INSERT [dbo].[блюда_в_заказе] ON 

INSERT [dbo].[блюда_в_заказе] ([id_БЗ], [кол-во], [id_заказа], [id_блюда]) VALUES (1, N'1', 1, 1)
INSERT [dbo].[блюда_в_заказе] ([id_БЗ], [кол-во], [id_заказа], [id_блюда]) VALUES (2, N'1', 2, 5)
INSERT [dbo].[блюда_в_заказе] ([id_БЗ], [кол-во], [id_заказа], [id_блюда]) VALUES (3, N'1', 3, 6)
INSERT [dbo].[блюда_в_заказе] ([id_БЗ], [кол-во], [id_заказа], [id_блюда]) VALUES (4, N'1', 4, 14)
INSERT [dbo].[блюда_в_заказе] ([id_БЗ], [кол-во], [id_заказа], [id_блюда]) VALUES (5, N'1', 5, 17)
SET IDENTITY_INSERT [dbo].[блюда_в_заказе] OFF
GO
SET IDENTITY_INSERT [dbo].[Заказ] ON 

INSERT [dbo].[Заказ] ([id_заказа], [сумма], [id_клиента], [id_сотрудника]) VALUES (1, N'455', 6, 5)
INSERT [dbo].[Заказ] ([id_заказа], [сумма], [id_клиента], [id_сотрудника]) VALUES (2, N'170', 7, 1)
INSERT [dbo].[Заказ] ([id_заказа], [сумма], [id_клиента], [id_сотрудника]) VALUES (3, N'80', 4, 3)
INSERT [dbo].[Заказ] ([id_заказа], [сумма], [id_клиента], [id_сотрудника]) VALUES (4, N'295', 9, 8)
INSERT [dbo].[Заказ] ([id_заказа], [сумма], [id_клиента], [id_сотрудника]) VALUES (5, N'30', 3, 2)
SET IDENTITY_INSERT [dbo].[Заказ] OFF
GO
SET IDENTITY_INSERT [dbo].[категории] ON 

INSERT [dbo].[категории] ([id_категории], [наименование]) VALUES (1, N'Пицца')
INSERT [dbo].[категории] ([id_категории], [наименование]) VALUES (2, N'Алкоголь')
INSERT [dbo].[категории] ([id_категории], [наименование]) VALUES (3, N'Десерт')
INSERT [dbo].[категории] ([id_категории], [наименование]) VALUES (4, N'Холодные напитки')
INSERT [dbo].[категории] ([id_категории], [наименование]) VALUES (5, N'Фастфуд')
INSERT [dbo].[категории] ([id_категории], [наименование]) VALUES (6, N'Соус')
SET IDENTITY_INSERT [dbo].[категории] OFF
GO
SET IDENTITY_INSERT [dbo].[Клиенты] ON 

INSERT [dbo].[Клиенты] ([id_клиента], [ФИО], [Адрес], [Телефон]) VALUES (1, N'Пупкин Василий Игоревич', N'ул. 4-я рабочая, д. 32, кв. 4', N'+7(999)4778523')
INSERT [dbo].[Клиенты] ([id_клиента], [ФИО], [Адрес], [Телефон]) VALUES (3, N'Иванов Михаил Кириллович', N'ул. Ленина, д. 24, кв. 58', N'+7(913)6589457')
INSERT [dbo].[Клиенты] ([id_клиента], [ФИО], [Адрес], [Телефон]) VALUES (4, N'Куликов Сергей Дмитриевич', N'ул. Орджоникидзе, д. 17, кв. 23', N'+7(980)5007469')
INSERT [dbo].[Клиенты] ([id_клиента], [ФИО], [Адрес], [Телефон]) VALUES (5, N'Цыпкова Елена Сергеевна', N'ул. 7-я северная, д. 20, кв 62', N'+7(987)4557469')
INSERT [dbo].[Клиенты] ([id_клиента], [ФИО], [Адрес], [Телефон]) VALUES (6, N'Лузков Арсений Михайлович', N'ул. 1-я марьяновская, д. 39, кв. 45', N'+7(982)1456987')
INSERT [dbo].[Клиенты] ([id_клиента], [ФИО], [Адрес], [Телефон]) VALUES (7, N'Сидоров Владислав Николевич', N'ул. Батумская, д. 74, кв. 54', N'+7(900)8004012')
INSERT [dbo].[Клиенты] ([id_клиента], [ФИО], [Адрес], [Телефон]) VALUES (8, N'Бумага Влад Никитович', N'ул. Серова, д. 85, кв. 85', N'+7(980)2556978')
INSERT [dbo].[Клиенты] ([id_клиента], [ФИО], [Адрес], [Телефон]) VALUES (9, N'Незыбкина Мария Сергеевна', N'ул. Рожденственского, д. 84, кв. 23', N'+7(982)5669874')
INSERT [dbo].[Клиенты] ([id_клиента], [ФИО], [Адрес], [Телефон]) VALUES (10, N'Сидорова Дарья Михайловна', N'ул. Либнехта, д. 45, кв. 98', N'+7(913)6599754')
SET IDENTITY_INSERT [dbo].[Клиенты] OFF
GO
SET IDENTITY_INSERT [dbo].[сотрудники] ON 

INSERT [dbo].[сотрудники] ([id_сотрудника], [ФИО], [должность]) VALUES (1, N'Леванов Дмитрий Иванович', N'Повар')
INSERT [dbo].[сотрудники] ([id_сотрудника], [ФИО], [должность]) VALUES (2, N'Распопов Данила Игоревич', N'Поставщик')
INSERT [dbo].[сотрудники] ([id_сотрудника], [ФИО], [должность]) VALUES (3, N'Егер Кирилл Александрович', N'Грузчик')
INSERT [dbo].[сотрудники] ([id_сотрудника], [ФИО], [должность]) VALUES (4, N'Кожухар Михаил Евгеньвич', N'Курьер')
INSERT [dbo].[сотрудники] ([id_сотрудника], [ФИО], [должность]) VALUES (5, N'Лавров Михаил Сергеевич', N'Управляющий складом')
INSERT [dbo].[сотрудники] ([id_сотрудника], [ФИО], [должность]) VALUES (6, N'Цируль Вадим Максимович', N'Управляющий доставкой')
INSERT [dbo].[сотрудники] ([id_сотрудника], [ФИО], [должность]) VALUES (7, N'Булычев Арсений Владимирович', N'Директор')
INSERT [dbo].[сотрудники] ([id_сотрудника], [ФИО], [должность]) VALUES (8, N'Рудопысов Игорь Александрович', N'Грузчик')
INSERT [dbo].[сотрудники] ([id_сотрудника], [ФИО], [должность]) VALUES (9, N'Безметный Владислав Владимирович ', N'Администратор')
INSERT [dbo].[сотрудники] ([id_сотрудника], [ФИО], [должность]) VALUES (10, N'Чалый Никита Никитович', N'Оператор ')
SET IDENTITY_INSERT [dbo].[сотрудники] OFF
GO
ALTER TABLE [dbo].[блюда]  WITH CHECK ADD  CONSTRAINT [FK_блюда_категории] FOREIGN KEY([id_категории])
REFERENCES [dbo].[категории] ([id_категории])
GO
ALTER TABLE [dbo].[блюда] CHECK CONSTRAINT [FK_блюда_категории]
GO
ALTER TABLE [dbo].[блюда_в_заказе]  WITH CHECK ADD  CONSTRAINT [FK_блюда_в_заказе_блюда] FOREIGN KEY([id_блюда])
REFERENCES [dbo].[блюда] ([id_блюда])
GO
ALTER TABLE [dbo].[блюда_в_заказе] CHECK CONSTRAINT [FK_блюда_в_заказе_блюда]
GO
ALTER TABLE [dbo].[блюда_в_заказе]  WITH CHECK ADD  CONSTRAINT [FK_блюда_в_заказе_Заказ] FOREIGN KEY([id_заказа])
REFERENCES [dbo].[Заказ] ([id_заказа])
GO
ALTER TABLE [dbo].[блюда_в_заказе] CHECK CONSTRAINT [FK_блюда_в_заказе_Заказ]
GO
ALTER TABLE [dbo].[Заказ]  WITH CHECK ADD  CONSTRAINT [FK_Заказ_Клиенты] FOREIGN KEY([id_клиента])
REFERENCES [dbo].[Клиенты] ([id_клиента])
GO
ALTER TABLE [dbo].[Заказ] CHECK CONSTRAINT [FK_Заказ_Клиенты]
GO
ALTER TABLE [dbo].[Заказ]  WITH CHECK ADD  CONSTRAINT [FK_Заказ_сотрудники] FOREIGN KEY([id_сотрудника])
REFERENCES [dbo].[сотрудники] ([id_сотрудника])
GO
ALTER TABLE [dbo].[Заказ] CHECK CONSTRAINT [FK_Заказ_сотрудники]
GO
USE [master]
GO
ALTER DATABASE [pizzawoolf] SET  READ_WRITE 
GO
