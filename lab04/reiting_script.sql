use [reiting]
GO
/****** Object:  Table [dbo].[dbo_groups]    Script Date: 26.03.2018 15:29:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dbo_groups](
	[Kod_group] [varchar](7) NOT NULL,
	[Kod_men] [int] NULL,
	[Kod_zhurn] [int] NULL,
	[K_navch_plan] [int] NOT NULL,
	[kilk] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[dbo_student]    Script Date: 26.03.2018 15:29:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dbo_student](
	[Kod_stud] [int] IDENTITY(1,1) NOT NULL,
	[Name_ini]  AS ((((([Sname]+' ')+left([Name],(1)))+'.')+left([FName],(1)))+'.') PERSISTED,
	[Sname] [varchar](25) NULL,
	[Name] [varchar](25) NULL,
	[Fname] [varchar](25) NULL,
	[N_ingroup] [int] NULL,
	[Kod_group] [varchar](7) NULL,
 CONSTRAINT [PK_dbo_student] PRIMARY KEY CLUSTERED 
(
	[Kod_stud] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[form_kontr]    Script Date: 26.03.2018 15:29:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[form_kontr](
	[k_fk] [int] IDENTITY(1,1) NOT NULL,
	[forma_kontr] [varchar](50) NULL,
	[Prim] [varchar](100) NULL,
 CONSTRAINT [PK_form_kontr_1] PRIMARY KEY CLUSTERED 
(
	[k_fk] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Form_navch]    Script Date: 26.03.2018 15:29:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Form_navch](
	[K_form] [varchar](5) NOT NULL,
	[V_form] [varchar](20) NULL,
	[prim] [varchar](50) NULL,
 CONSTRAINT [PK_Form_kontr] PRIMARY KEY CLUSTERED 
(
	[K_form] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Navch_plan]    Script Date: 26.03.2018 15:29:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Navch_plan](
	[K_navch_plan] [int] IDENTITY(1,1) NOT NULL,
	[K_spets] [int] NOT NULL,
	[year_nabor] [datetime] NULL,
	[year_vypusk] [datetime] NULL,
	[k_form] [varchar](5) NULL,
 CONSTRAINT [XPKNavch_plan] PRIMARY KEY CLUSTERED 
(
	[K_navch_plan] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[predmet]    Script Date: 26.03.2018 15:29:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[predmet](
	[K_predmet] [int] IDENTITY(1,1) NOT NULL,
	[Nazva] [varchar](55) NULL,
	[Nazva_skor] [varchar](10) NULL,
 CONSTRAINT [PK_predmet] PRIMARY KEY CLUSTERED 
(
	[K_predmet] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Predmet_plan]    Script Date: 26.03.2018 15:29:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Predmet_plan](
	[K_predm_pl] [int] IDENTITY(1,1) NOT NULL,
	[K_predmet] [int] NOT NULL,
	[K_navch_plan] [int] NOT NULL,
	[Chas_Lek] [smallint] NULL,
	[Cahs_pr] [smallint] NULL,
	[Chas_all] [smallint] NULL,
	[Chas_Labor] [smallint] NULL,
	[Chas_sem] [smallint] NULL,
	[Kilk_modul] [smallint] NULL,
	[Cahs_sam] [smallint] NULL,
	[Semestr] [smallint] NULL,
	[Shifr_predmet] [varchar](20) NULL,
	[k_fk] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Reiting]    Script Date: 26.03.2018 15:29:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reiting](
	[K_zapis] [int] NOT NULL,
	[Kod_student] [int] NOT NULL,
	[Reiting] [smallint] NULL,
	[Prisutn] [bit] NULL,
 CONSTRAINT [PK_Reiting_1] PRIMARY KEY CLUSTERED 
(
	[K_zapis] ASC,
	[Kod_student] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Rozklad_pids]    Script Date: 26.03.2018 15:29:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rozklad_pids](
	[K_zapis] [int] IDENTITY(1,1) NOT NULL,
	[Date] [date] NULL,
	[K_predm_pl] [int] NOT NULL,
	[Kod_group] [varchar](7) NOT NULL,
	[k_vilkad] [int] NOT NULL,
	[N_vedomost] [int] NULL,
	[Zdacha_type] [bit] NOT NULL,
 CONSTRAINT [PK_Rozklad_pids] PRIMARY KEY CLUSTERED 
(
	[K_zapis] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Spetsialnost]    Script Date: 26.03.2018 15:29:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Spetsialnost](
	[Shifr] [varchar](10) NULL,
	[Nazva] [varchar](60) NULL,
	[Kvalif] [varchar](50) NULL,
	[K_spets] [int] IDENTITY(1,1) NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Vikladach]    Script Date: 26.03.2018 15:29:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Vikladach](
	[k_vilkad] [int] IDENTITY(1,1) NOT NULL,
	[FIO]  AS ((((([Sname]+' ')+left([Name],(1)))+'.')+left([FName],(1)))+'.'),
	[SName] [varchar](20) NULL,
	[Name] [varchar](20) NULL,
	[FName] [varchar](20) NULL,
	[Posada] [varchar](20) NULL,
	[Zvannya] [varchar](20) NULL,
	[Stupen] [varchar](20) NULL,
	[Kafedra] [varchar](50) NULL
) ON [PRIMARY]

GO
INSERT [dbo].[dbo_groups] ([Kod_group], [Kod_men], [Kod_zhurn], [K_navch_plan], [kilk]) VALUES (N'ПІ-53', 2, 3, 13, 19)
GO
INSERT [dbo].[dbo_groups] ([Kod_group], [Kod_men], [Kod_zhurn], [K_navch_plan], [kilk]) VALUES (N'ПІ-54', 3, 2, 14, 19)
GO
INSERT [dbo].[dbo_groups] ([Kod_group], [Kod_men], [Kod_zhurn], [K_navch_plan], [kilk]) VALUES (N'ПІ-55', 4, 3, 17, 0)
GO
SET IDENTITY_INSERT [dbo].[dbo_student] ON 

GO
INSERT [dbo].[dbo_student] ([Kod_stud], [Sname], [Name], [Fname], [N_ingroup], [Kod_group]) VALUES (46, N'Базелюк', N'Олександр', N'Володимирович', 1, N'ПІ-53')
GO
INSERT [dbo].[dbo_student] ([Kod_stud], [Sname], [Name], [Fname], [N_ingroup], [Kod_group]) VALUES (47, N'Білявська', N'Валентина', N'Сергіївна', 2, N'ПІ-53')
GO
INSERT [dbo].[dbo_student] ([Kod_stud], [Sname], [Name], [Fname], [N_ingroup], [Kod_group]) VALUES (48, N'Герасимович', N'В''Ячеслав', N'Дмитрович', 3, N'ПІ-53')
GO
INSERT [dbo].[dbo_student] ([Kod_stud], [Sname], [Name], [Fname], [N_ingroup], [Kod_group]) VALUES (49, N'Гриневич', N'Дмитро', N'Миколайович', 4, N'ПІ-53')
GO
INSERT [dbo].[dbo_student] ([Kod_stud], [Sname], [Name], [Fname], [N_ingroup], [Kod_group]) VALUES (50, N'Зосименко', N'Олексій', N'Іванович', 5, N'ПІ-53')
GO
INSERT [dbo].[dbo_student] ([Kod_stud], [Sname], [Name], [Fname], [N_ingroup], [Kod_group]) VALUES (51, N'Клепус', N'Олександр', N'Іванович', 6, N'ПІ-53')
GO
INSERT [dbo].[dbo_student] ([Kod_stud], [Sname], [Name], [Fname], [N_ingroup], [Kod_group]) VALUES (52, N'Кузьменко', N'Олександр', N'Олександрович', 7, N'ПІ-53')
GO
INSERT [dbo].[dbo_student] ([Kod_stud], [Sname], [Name], [Fname], [N_ingroup], [Kod_group]) VALUES (53, N'Кухарець', N'Андрій', N'Олегович', 8, N'ПІ-53')
GO
INSERT [dbo].[dbo_student] ([Kod_stud], [Sname], [Name], [Fname], [N_ingroup], [Kod_group]) VALUES (54, N'Лайчук', N'Олена', N'Василівна', 9, N'ПІ-53')
GO
INSERT [dbo].[dbo_student] ([Kod_stud], [Sname], [Name], [Fname], [N_ingroup], [Kod_group]) VALUES (55, N'Маляренко', N'Євгеній', N'Олександрович', 10, N'ПІ-53')
GO
INSERT [dbo].[dbo_student] ([Kod_stud], [Sname], [Name], [Fname], [N_ingroup], [Kod_group]) VALUES (56, N'Мелько', N'Володимир', N'Миронович', 11, N'ПІ-53')
GO
INSERT [dbo].[dbo_student] ([Kod_stud], [Sname], [Name], [Fname], [N_ingroup], [Kod_group]) VALUES (57, N'Петрович', N'Олександр', N'Миронович', 12, N'ПІ-53')
GO
INSERT [dbo].[dbo_student] ([Kod_stud], [Sname], [Name], [Fname], [N_ingroup], [Kod_group]) VALUES (58, N'Прищепа', N'Володимир', N'Андрійович', 13, N'ПІ-53')
GO
INSERT [dbo].[dbo_student] ([Kod_stud], [Sname], [Name], [Fname], [N_ingroup], [Kod_group]) VALUES (59, N'Радіонов', N'Андрій', N'Юрійович', 14, N'ПІ-53')
GO
INSERT [dbo].[dbo_student] ([Kod_stud], [Sname], [Name], [Fname], [N_ingroup], [Kod_group]) VALUES (60, N'Радчук', N'Олег', N'Ігорович', 15, N'ПІ-53')
GO
INSERT [dbo].[dbo_student] ([Kod_stud], [Sname], [Name], [Fname], [N_ingroup], [Kod_group]) VALUES (61, N'Сарган', N'Олексій', N'Валерійович', 16, N'ПІ-53')
GO
INSERT [dbo].[dbo_student] ([Kod_stud], [Sname], [Name], [Fname], [N_ingroup], [Kod_group]) VALUES (62, N'Сікорський', N'Дмитро', N'Сергійович', 17, N'ПІ-53')
GO
INSERT [dbo].[dbo_student] ([Kod_stud], [Sname], [Name], [Fname], [N_ingroup], [Kod_group]) VALUES (63, N'Чернецька', N'Ірина', N'Сергіївна', 18, N'ПІ-53')
GO
INSERT [dbo].[dbo_student] ([Kod_stud], [Sname], [Name], [Fname], [N_ingroup], [Kod_group]) VALUES (64, N'Шпаківський', N'Андрій', N'Вікторович', 19, N'ПІ-53')
GO
INSERT [dbo].[dbo_student] ([Kod_stud], [Sname], [Name], [Fname], [N_ingroup], [Kod_group]) VALUES (84, N'Бобунов', N'Іван', N'Андрійович', 1, N'ПІ-54')
GO
INSERT [dbo].[dbo_student] ([Kod_stud], [Sname], [Name], [Fname], [N_ingroup], [Kod_group]) VALUES (85, N'Головко', N'Володимир', N'Володимирович', 2, N'ПІ-54')
GO
INSERT [dbo].[dbo_student] ([Kod_stud], [Sname], [Name], [Fname], [N_ingroup], [Kod_group]) VALUES (86, N'Горницький', N'Олексій', N'Валентинові', 3, N'ПІ-54')
GO
INSERT [dbo].[dbo_student] ([Kod_stud], [Sname], [Name], [Fname], [N_ingroup], [Kod_group]) VALUES (87, N'Дерпак', N'Юрій', N'Іванович', 4, N'ПІ-54')
GO
INSERT [dbo].[dbo_student] ([Kod_stud], [Sname], [Name], [Fname], [N_ingroup], [Kod_group]) VALUES (88, N'Кравченко', N'Катерина', N'Святославівна', 5, N'ПІ-54')
GO
INSERT [dbo].[dbo_student] ([Kod_stud], [Sname], [Name], [Fname], [N_ingroup], [Kod_group]) VALUES (89, N'Крамарчук', N'Олена', N'Вікторівна', 6, N'ПІ-54')
GO
INSERT [dbo].[dbo_student] ([Kod_stud], [Sname], [Name], [Fname], [N_ingroup], [Kod_group]) VALUES (90, N'Краснюк', N'Світлана', N'Ігорівна', 7, N'ПІ-54')
GO
INSERT [dbo].[dbo_student] ([Kod_stud], [Sname], [Name], [Fname], [N_ingroup], [Kod_group]) VALUES (91, N'Марченко', N'Ольга', N'Юріївна', 8, N'ПІ-54')
GO
INSERT [dbo].[dbo_student] ([Kod_stud], [Sname], [Name], [Fname], [N_ingroup], [Kod_group]) VALUES (92, N'Мінчук', N'Дмитро', N'Володимирович', 9, N'ПІ-54')
GO
INSERT [dbo].[dbo_student] ([Kod_stud], [Sname], [Name], [Fname], [N_ingroup], [Kod_group]) VALUES (93, N'Нижник', N'Віталій', N'Миколайович', 10, N'ПІ-54')
GO
INSERT [dbo].[dbo_student] ([Kod_stud], [Sname], [Name], [Fname], [N_ingroup], [Kod_group]) VALUES (94, N'Прокопович', N'Сергій', N'Володимирович', 11, N'ПІ-54')
GO
INSERT [dbo].[dbo_student] ([Kod_stud], [Sname], [Name], [Fname], [N_ingroup], [Kod_group]) VALUES (95, N'Родіонова', N'Любов', N'Володимирівна', 12, N'ПІ-54')
GO
INSERT [dbo].[dbo_student] ([Kod_stud], [Sname], [Name], [Fname], [N_ingroup], [Kod_group]) VALUES (96, N'Романчук', N'Юлія', N'Володимирівна', 13, N'ПІ-54')
GO
INSERT [dbo].[dbo_student] ([Kod_stud], [Sname], [Name], [Fname], [N_ingroup], [Kod_group]) VALUES (97, N'Сащук', N'Ірина', N'Ігорівна', 14, N'ПІ-54')
GO
INSERT [dbo].[dbo_student] ([Kod_stud], [Sname], [Name], [Fname], [N_ingroup], [Kod_group]) VALUES (98, N'Скрипнік', N'Максим', N'Михайлович', 15, N'ПІ-54')
GO
INSERT [dbo].[dbo_student] ([Kod_stud], [Sname], [Name], [Fname], [N_ingroup], [Kod_group]) VALUES (99, N'Сорочук', N'Олег', N'Дмитрович', 16, N'ПІ-54')
GO
INSERT [dbo].[dbo_student] ([Kod_stud], [Sname], [Name], [Fname], [N_ingroup], [Kod_group]) VALUES (100, N'Халімончук', N'Анатолій', N'Олександрович', 17, N'ПІ-54')
GO
INSERT [dbo].[dbo_student] ([Kod_stud], [Sname], [Name], [Fname], [N_ingroup], [Kod_group]) VALUES (101, N'Чистяков', N'Костянтин', N'Олегович', 18, N'ПІ-54')
GO
INSERT [dbo].[dbo_student] ([Kod_stud], [Sname], [Name], [Fname], [N_ingroup], [Kod_group]) VALUES (102, N'Шелуха', N'Олексій', N'Олегович', 19, N'ПІ-54')
GO
SET IDENTITY_INSERT [dbo].[dbo_student] OFF
GO
SET IDENTITY_INSERT [dbo].[form_kontr] ON 

GO
INSERT [dbo].[form_kontr] ([k_fk], [forma_kontr], [Prim]) VALUES (1, N'Іспит', NULL)
GO
INSERT [dbo].[form_kontr] ([k_fk], [forma_kontr], [Prim]) VALUES (2, N'Диференційований залік', NULL)
GO
INSERT [dbo].[form_kontr] ([k_fk], [forma_kontr], [Prim]) VALUES (3, N'Залік', NULL)
GO
INSERT [dbo].[form_kontr] ([k_fk], [forma_kontr], [Prim]) VALUES (4, N'Захист(КР)', NULL)
GO
INSERT [dbo].[form_kontr] ([k_fk], [forma_kontr], [Prim]) VALUES (5, N'Захист(ДР)', NULL)
GO
INSERT [dbo].[form_kontr] ([k_fk], [forma_kontr], [Prim]) VALUES (6, N'Захист(ВП)', NULL)
GO
INSERT [dbo].[form_kontr] ([k_fk], [forma_kontr], [Prim]) VALUES (7, N'Захист(КвР)', NULL)
GO
SET IDENTITY_INSERT [dbo].[form_kontr] OFF
GO
INSERT [dbo].[Form_navch] ([K_form], [V_form], [prim]) VALUES (N'З', N'Заочна', NULL)
GO
INSERT [dbo].[Form_navch] ([K_form], [V_form], [prim]) VALUES (N'С', N'Денна', NULL)
GO
SET IDENTITY_INSERT [dbo].[Navch_plan] ON 

GO
INSERT [dbo].[Navch_plan] ([K_navch_plan], [K_spets], [year_nabor], [year_vypusk], [k_form]) VALUES (13, 1, CAST(N'2010-09-01T00:00:00.000' AS DateTime), CAST(N'2015-06-01T00:00:00.000' AS DateTime), N'с')
GO
INSERT [dbo].[Navch_plan] ([K_navch_plan], [K_spets], [year_nabor], [year_vypusk], [k_form]) VALUES (14, 2, CAST(N'2010-09-01T00:00:00.000' AS DateTime), CAST(N'2015-06-01T00:00:00.000' AS DateTime), N'с')
GO
INSERT [dbo].[Navch_plan] ([K_navch_plan], [K_spets], [year_nabor], [year_vypusk], [k_form]) VALUES (17, 2, CAST(N'2010-09-01T00:00:00.000' AS DateTime), CAST(N'2015-06-01T00:00:00.000' AS DateTime), N'З')
GO
INSERT [dbo].[Navch_plan] ([K_navch_plan], [K_spets], [year_nabor], [year_vypusk], [k_form]) VALUES (18, 2, CAST(N'2010-09-01T00:00:00.000' AS DateTime), CAST(N'2015-06-01T00:00:00.000' AS DateTime), N'З')
GO
SET IDENTITY_INSERT [dbo].[Navch_plan] OFF
GO
SET IDENTITY_INSERT [dbo].[predmet] ON 

GO
INSERT [dbo].[predmet] ([K_predmet], [Nazva], [Nazva_skor]) VALUES (343, N'Автоматизовані системи управління спеціального призначе', N'АСУСП')
GO
INSERT [dbo].[predmet] ([K_predmet], [Nazva], [Nazva_skor]) VALUES (344, N'Автономні джерела енергії', N'АДЕ')
GO
INSERT [dbo].[predmet] ([K_predmet], [Nazva], [Nazva_skor]) VALUES (345, N'Алгоритмічни мови та програмування', N'АМТП')
GO
INSERT [dbo].[predmet] ([K_predmet], [Nazva], [Nazva_skor]) VALUES (346, N'Аналогові електронні пристрої', N'АЕП')
GO
INSERT [dbo].[predmet] ([K_predmet], [Nazva], [Nazva_skor]) VALUES (347, N'Архітектура комп''ютерних систем', N'АКС')
GO
INSERT [dbo].[predmet] ([K_predmet], [Nazva], [Nazva_skor]) VALUES (348, N'Архітектура та програмування мікроконтролерів', N'АТПМ')
GO
INSERT [dbo].[predmet] ([K_predmet], [Nazva], [Nazva_skor]) VALUES (349, N'Безпека життєдіяльності', N'БЖ')
GO
INSERT [dbo].[predmet] ([K_predmet], [Nazva], [Nazva_skor]) VALUES (350, N'Безпека інформаційно-комунікаційних систем та мереж', N'БІСТМ')
GO
INSERT [dbo].[predmet] ([K_predmet], [Nazva], [Nazva_skor]) VALUES (351, N'Виконання та захист дипломних проектів (робіт)', N'ВТЗДПР')
GO
INSERT [dbo].[predmet] ([K_predmet], [Nazva], [Nazva_skor]) VALUES (352, N'Виробнича практика', N'ВП')
GO
INSERT [dbo].[predmet] ([K_predmet], [Nazva], [Nazva_skor]) VALUES (353, N'Вища математика', N'ВМ')
GO
INSERT [dbo].[predmet] ([K_predmet], [Nazva], [Nazva_skor]) VALUES (354, N'Військова підготовка', N'ВП')
GO
INSERT [dbo].[predmet] ([K_predmet], [Nazva], [Nazva_skor]) VALUES (355, N'Волоконно-оптичні лінії зв’язку', N'ВЛЗ')
GO
INSERT [dbo].[predmet] ([K_predmet], [Nazva], [Nazva_skor]) VALUES (356, N'Генерування та формування сигналів', N'ГТФС')
GO
INSERT [dbo].[predmet] ([K_predmet], [Nazva], [Nazva_skor]) VALUES (357, N'Геополітика', N'Геопо.')
GO
INSERT [dbo].[predmet] ([K_predmet], [Nazva], [Nazva_skor]) VALUES (358, N'Дискретна математика', N'ДМ')
GO
INSERT [dbo].[predmet] ([K_predmet], [Nazva], [Nazva_skor]) VALUES (359, N'Дослідження операцій', N'ДО')
GO
INSERT [dbo].[predmet] ([K_predmet], [Nazva], [Nazva_skor]) VALUES (360, N'Екологія', N'Еколо.')
GO
INSERT [dbo].[predmet] ([K_predmet], [Nazva], [Nazva_skor]) VALUES (361, N'Економіка', N'Еконо.')
GO
INSERT [dbo].[predmet] ([K_predmet], [Nazva], [Nazva_skor]) VALUES (362, N'Економіка і організація підприємства', N'ЕІОП')
GO
INSERT [dbo].[predmet] ([K_predmet], [Nazva], [Nazva_skor]) VALUES (363, N'Економіка та організація виробництва', N'ЕТОВ')
GO
INSERT [dbo].[predmet] ([K_predmet], [Nazva], [Nazva_skor]) VALUES (364, N'Економічна теорія', N'ЕТ')
GO
INSERT [dbo].[predmet] ([K_predmet], [Nazva], [Nazva_skor]) VALUES (365, N'Електрічна частина станцій та підстанцій', N'ЕЧСТП')
GO
INSERT [dbo].[predmet] ([K_predmet], [Nazva], [Nazva_skor]) VALUES (366, N'Електрічні машини', N'ЕМ')
GO
INSERT [dbo].[predmet] ([K_predmet], [Nazva], [Nazva_skor]) VALUES (367, N'Електрічні системи та мережі', N'ЕСТМ')
GO
INSERT [dbo].[predmet] ([K_predmet], [Nazva], [Nazva_skor]) VALUES (368, N'Електробезпека', N'Елект.')
GO
INSERT [dbo].[predmet] ([K_predmet], [Nazva], [Nazva_skor]) VALUES (369, N'Електробезпека промислових установок', N'ЕПУ')
GO
INSERT [dbo].[predmet] ([K_predmet], [Nazva], [Nazva_skor]) VALUES (370, N'Електродинаміка та поширення радіохвиль', N'ЕТПР')
GO
INSERT [dbo].[predmet] ([K_predmet], [Nazva], [Nazva_skor]) VALUES (371, N'Електронні та квантові прилади надвисоких частот', N'ЕТКПНЧ')
GO
INSERT [dbo].[predmet] ([K_predmet], [Nazva], [Nazva_skor]) VALUES (372, N'Електропостачання промислових підприємств', N'ЕПП')
GO
INSERT [dbo].[predmet] ([K_predmet], [Nazva], [Nazva_skor]) VALUES (373, N'Електротехнічні матеріали', N'ЕМ')
GO
INSERT [dbo].[predmet] ([K_predmet], [Nazva], [Nazva_skor]) VALUES (374, N'Електротехнічні пристрої', N'ЕП')
GO
INSERT [dbo].[predmet] ([K_predmet], [Nazva], [Nazva_skor]) VALUES (375, N'Електротехнологічні установки та пристрої', N'ЕУТП')
GO
INSERT [dbo].[predmet] ([K_predmet], [Nazva], [Nazva_skor]) VALUES (376, N'Елементи систем управління', N'ЕСУ')
GO
INSERT [dbo].[predmet] ([K_predmet], [Nazva], [Nazva_skor]) VALUES (377, N'Естетика', N'Естет.')
GO
INSERT [dbo].[predmet] ([K_predmet], [Nazva], [Nazva_skor]) VALUES (378, N'Етика', N'Етика.')
GO
INSERT [dbo].[predmet] ([K_predmet], [Nazva], [Nazva_skor]) VALUES (379, N'Етнографія', N'Етног.')
GO
INSERT [dbo].[predmet] ([K_predmet], [Nazva], [Nazva_skor]) VALUES (380, N'Загальна фізика', N'ЗФ')
GO
INSERT [dbo].[predmet] ([K_predmet], [Nazva], [Nazva_skor]) VALUES (381, N'Захист інформації в автоматизованих системах управління', N'ЗІВАСУ')
GO
INSERT [dbo].[predmet] ([K_predmet], [Nazva], [Nazva_skor]) VALUES (382, N'Інженерна графіка', N'ІГ')
GO
INSERT [dbo].[predmet] ([K_predmet], [Nazva], [Nazva_skor]) VALUES (383, N'Інженерна та комп''ютерна графіка', N'ІТКГ')
GO
INSERT [dbo].[predmet] ([K_predmet], [Nazva], [Nazva_skor]) VALUES (384, N'Іноземна мова', N'ІМ')
GO
INSERT [dbo].[predmet] ([K_predmet], [Nazva], [Nazva_skor]) VALUES (385, N'Інформатика та обчислювальна техніка', N'ІТОТ')
GO
INSERT [dbo].[predmet] ([K_predmet], [Nazva], [Nazva_skor]) VALUES (386, N'Інформаційно-комунікаційні системи та мережі', N'ІСТМ')
GO
INSERT [dbo].[predmet] ([K_predmet], [Nazva], [Nazva_skor]) VALUES (387, N'Історія світової цивілізації', N'ІСЦ')
GO
INSERT [dbo].[predmet] ([K_predmet], [Nazva], [Nazva_skor]) VALUES (388, N'Історія України', N'ІУ')
GO
INSERT [dbo].[predmet] ([K_predmet], [Nazva], [Nazva_skor]) VALUES (389, N'Історія української культури', N'ІУК')
GO
INSERT [dbo].[predmet] ([K_predmet], [Nazva], [Nazva_skor]) VALUES (390, N'Комп’ютерна графіка', N'КГ')
GO
INSERT [dbo].[predmet] ([K_predmet], [Nazva], [Nazva_skor]) VALUES (391, N'Комплексні системи захисту інформації', N'КСЗІ')
GO
INSERT [dbo].[predmet] ([K_predmet], [Nazva], [Nazva_skor]) VALUES (392, N'Компонентна база радіоелектронних засобів', N'КБРЗ')
GO
INSERT [dbo].[predmet] ([K_predmet], [Nazva], [Nazva_skor]) VALUES (393, N'Комп''ютерна електроніка', N'КЕ')
GO
INSERT [dbo].[predmet] ([K_predmet], [Nazva], [Nazva_skor]) VALUES (394, N'Комп''ютерні мережі, системи та мережі передачі даних', N'КМСТМПД')
GO
INSERT [dbo].[predmet] ([K_predmet], [Nazva], [Nazva_skor]) VALUES (395, N'Конструювання та технологія електротехнічгого обладнанн', N'КТТЕО')
GO
INSERT [dbo].[predmet] ([K_predmet], [Nazva], [Nazva_skor]) VALUES (396, N'Конструювання та технологія радіоелектронних засобів', N'КТТРЗ')
GO
INSERT [dbo].[predmet] ([K_predmet], [Nazva], [Nazva_skor]) VALUES (397, N'Літературознавство', N'Літер.')
GO
INSERT [dbo].[predmet] ([K_predmet], [Nazva], [Nazva_skor]) VALUES (398, N'Логіка', N'Логік.')
GO
INSERT [dbo].[predmet] ([K_predmet], [Nazva], [Nazva_skor]) VALUES (399, N'Маркетинг', N'Марке.')
GO
INSERT [dbo].[predmet] ([K_predmet], [Nazva], [Nazva_skor]) VALUES (400, N'Менеджмент', N'Менед.')
GO
INSERT [dbo].[predmet] ([K_predmet], [Nazva], [Nazva_skor]) VALUES (401, N'Монтаж та експлуатація електроустановок', N'МТЕЕ')
GO
INSERT [dbo].[predmet] ([K_predmet], [Nazva], [Nazva_skor]) VALUES (402, N'Нормативно-правове забезпечення інформаційної безпеки', N'НЗІБ')
GO
INSERT [dbo].[predmet] ([K_predmet], [Nazva], [Nazva_skor]) VALUES (403, N'Оброблення табличних та текстових даних', N'ОТТТД')
GO
INSERT [dbo].[predmet] ([K_predmet], [Nazva], [Nazva_skor]) VALUES (404, N'Обчислювальна техніка та алгоритмічні мови', N'ОТТАМ')
GO
INSERT [dbo].[predmet] ([K_predmet], [Nazva], [Nazva_skor]) VALUES (405, N'Операційні системи', N'ОС')
GO
INSERT [dbo].[predmet] ([K_predmet], [Nazva], [Nazva_skor]) VALUES (406, N'Оптимальне та адаптивне управління', N'ОТАУ')
GO
INSERT [dbo].[predmet] ([K_predmet], [Nazva], [Nazva_skor]) VALUES (407, N'Організаційне забезпечення захисту інформації', N'ОЗЗІ')
GO
INSERT [dbo].[predmet] ([K_predmet], [Nazva], [Nazva_skor]) VALUES (408, N'Основи експлуатації радіоелектронної апаратури', N'ОЕРА')
GO
INSERT [dbo].[predmet] ([K_predmet], [Nazva], [Nazva_skor]) VALUES (409, N'Основи електричних вимірювань', N'ОЕВ')
GO
INSERT [dbo].[predmet] ([K_predmet], [Nazva], [Nazva_skor]) VALUES (410, N'Основи електроприводу', N'ОЕ')
GO
INSERT [dbo].[predmet] ([K_predmet], [Nazva], [Nazva_skor]) VALUES (411, N'Основи інформаційної безпеки', N'ОІБ')
GO
INSERT [dbo].[predmet] ([K_predmet], [Nazva], [Nazva_skor]) VALUES (412, N'Основи комп''ютерного проектування та моделювання електр', N'ОКПТМЕО')
GO
INSERT [dbo].[predmet] ([K_predmet], [Nazva], [Nazva_skor]) VALUES (413, N'Основи комп''ютерного проектування та моделювання радіое', N'ОКПТМРЗ')
GO
INSERT [dbo].[predmet] ([K_predmet], [Nazva], [Nazva_skor]) VALUES (414, N'Основи комп''ютерного проектування та моделювання систем', N'ОКПТМСАУ')
GO
INSERT [dbo].[predmet] ([K_predmet], [Nazva], [Nazva_skor]) VALUES (415, N'Основи комп''ютерного проектування та моделювання систем', N'ОКПТМСЗІ')
GO
INSERT [dbo].[predmet] ([K_predmet], [Nazva], [Nazva_skor]) VALUES (416, N'Основи комп''ютерної стеганографії', N'ОКС')
GO
INSERT [dbo].[predmet] ([K_predmet], [Nazva], [Nazva_skor]) VALUES (417, N'Основи метрології', N'ОМ')
GO
INSERT [dbo].[predmet] ([K_predmet], [Nazva], [Nazva_skor]) VALUES (418, N'Основи оброблення та передавання інформації', N'ООТПІ')
GO
INSERT [dbo].[predmet] ([K_predmet], [Nazva], [Nazva_skor]) VALUES (419, N'Основи охорони праці', N'ООП')
GO
INSERT [dbo].[predmet] ([K_predmet], [Nazva], [Nazva_skor]) VALUES (420, N'Основи побудови автоматизованих систем управління', N'ОПАСУ')
GO
INSERT [dbo].[predmet] ([K_predmet], [Nazva], [Nazva_skor]) VALUES (421, N'Основи релейного захисту та автоматизації енергосистем', N'ОРЗТАЕ')
GO
INSERT [dbo].[predmet] ([K_predmet], [Nazva], [Nazva_skor]) VALUES (422, N'Основи телебачення', N'ОТ')
GO
INSERT [dbo].[predmet] ([K_predmet], [Nazva], [Nazva_skor]) VALUES (423, N'Основи теорії кіл', N'ОТК')
GO
INSERT [dbo].[predmet] ([K_predmet], [Nazva], [Nazva_skor]) VALUES (424, N'Основи теорії кіл, сигнали та процеси в електроніці', N'ОТКСТПВЕ')
GO
INSERT [dbo].[predmet] ([K_predmet], [Nazva], [Nazva_skor]) VALUES (425, N'Основи теорії передавання інформації', N'ОТПІ')
GO
INSERT [dbo].[predmet] ([K_predmet], [Nazva], [Nazva_skor]) VALUES (426, N'Офісні пристрої', N'ОП')
GO
INSERT [dbo].[predmet] ([K_predmet], [Nazva], [Nazva_skor]) VALUES (427, N'Охорона конфіденційної інформації підприємства', N'ОКІП')
GO
INSERT [dbo].[predmet] ([K_predmet], [Nazva], [Nazva_skor]) VALUES (428, N'Педагогіка', N'Педаг.')
GO
INSERT [dbo].[predmet] ([K_predmet], [Nazva], [Nazva_skor]) VALUES (429, N'Переддипломна практика', N'ПП')
GO
INSERT [dbo].[predmet] ([K_predmet], [Nazva], [Nazva_skor]) VALUES (430, N'Перетворювальна техніка', N'ПТ')
GO
INSERT [dbo].[predmet] ([K_predmet], [Nazva], [Nazva_skor]) VALUES (431, N'Побудова системи захисту інформації', N'ПСЗІ')
GO
INSERT [dbo].[predmet] ([K_predmet], [Nazva], [Nazva_skor]) VALUES (432, N'Політологія *', N'Політ.')
GO
INSERT [dbo].[predmet] ([K_predmet], [Nazva], [Nazva_skor]) VALUES (433, N'Правознавство *', N'Право.')
GO
INSERT [dbo].[predmet] ([K_predmet], [Nazva], [Nazva_skor]) VALUES (434, N'Приватне право', N'ПП')
GO
INSERT [dbo].[predmet] ([K_predmet], [Nazva], [Nazva_skor]) VALUES (435, N'Приймання та оброблення сигналів', N'ПТОС')
GO
INSERT [dbo].[predmet] ([K_predmet], [Nazva], [Nazva_skor]) VALUES (436, N'Прикладна криптографія', N'ПК')
GO
INSERT [dbo].[predmet] ([K_predmet], [Nazva], [Nazva_skor]) VALUES (437, N'Пристрої надвисоких частот та антени', N'ПНЧТА')
GO
INSERT [dbo].[predmet] ([K_predmet], [Nazva], [Nazva_skor]) VALUES (438, N'Прогностика', N'Прогн.')
GO
INSERT [dbo].[predmet] ([K_predmet], [Nazva], [Nazva_skor]) VALUES (439, N'Проектування компютерних та інформаційних систем', N'ПКТІС')
GO
INSERT [dbo].[predmet] ([K_predmet], [Nazva], [Nazva_skor]) VALUES (440, N'Промислова електроніка', N'ПЕ')
GO
INSERT [dbo].[predmet] ([K_predmet], [Nazva], [Nazva_skor]) VALUES (441, N'Психологія *', N'Психо.')
GO
INSERT [dbo].[predmet] ([K_predmet], [Nazva], [Nazva_skor]) VALUES (442, N'Психологія мас', N'ПМ')
GO
INSERT [dbo].[predmet] ([K_predmet], [Nazva], [Nazva_skor]) VALUES (443, N'Психологія права', N'ПП')
GO
INSERT [dbo].[predmet] ([K_predmet], [Nazva], [Nazva_skor]) VALUES (444, N'Радіоавтоматика', N'Радіо.')
GO
INSERT [dbo].[predmet] ([K_predmet], [Nazva], [Nazva_skor]) VALUES (445, N'Радіовимірювання', N'Радіо.')
GO
INSERT [dbo].[predmet] ([K_predmet], [Nazva], [Nazva_skor]) VALUES (446, N'Радіоелектронні системи', N'РС')
GO
INSERT [dbo].[predmet] ([K_predmet], [Nazva], [Nazva_skor]) VALUES (447, N'Радіопередавальні пристрої', N'РП')
GO
INSERT [dbo].[predmet] ([K_predmet], [Nazva], [Nazva_skor]) VALUES (448, N'Радіоприймальні пристрої', N'РП')
GO
INSERT [dbo].[predmet] ([K_predmet], [Nazva], [Nazva_skor]) VALUES (449, N'Радіосистеми передавання інформації', N'РПІ')
GO
INSERT [dbo].[predmet] ([K_predmet], [Nazva], [Nazva_skor]) VALUES (450, N'Релігієзнавство', N'Реліг.')
GO
INSERT [dbo].[predmet] ([K_predmet], [Nazva], [Nazva_skor]) VALUES (451, N'Риторика', N'Ритор.')
GO
INSERT [dbo].[predmet] ([K_predmet], [Nazva], [Nazva_skor]) VALUES (452, N'Сигнали та процеси в радіотехніці', N'СТПВР')
GO
INSERT [dbo].[predmet] ([K_predmet], [Nazva], [Nazva_skor]) VALUES (453, N'Системи життєзабезпечення', N'СЖ')
GO
INSERT [dbo].[predmet] ([K_predmet], [Nazva], [Nazva_skor]) VALUES (454, N'Системи підтримки прийняття рішень', N'СППР')
GO
INSERT [dbo].[predmet] ([K_predmet], [Nazva], [Nazva_skor]) VALUES (455, N'Системи теле- і радіомереж', N'СТІР')
GO
INSERT [dbo].[predmet] ([K_predmet], [Nazva], [Nazva_skor]) VALUES (456, N'Системи технічного захисту інформації', N'СТЗІ')
GO
INSERT [dbo].[predmet] ([K_predmet], [Nazva], [Nazva_skor]) VALUES (457, N'Системи управління базами даних', N'СУБД')
GO
INSERT [dbo].[predmet] ([K_predmet], [Nazva], [Nazva_skor]) VALUES (458, N'Соціологія *', N'Соціо.')
GO
INSERT [dbo].[predmet] ([K_predmet], [Nazva], [Nazva_skor]) VALUES (459, N'Спеціальні розділи математики', N'СРМ')
GO
INSERT [dbo].[predmet] ([K_predmet], [Nazva], [Nazva_skor]) VALUES (460, N'Теоретичні основи електротехніки І, ІІ,III', N'ТОЕІІ')
GO
INSERT [dbo].[predmet] ([K_predmet], [Nazva], [Nazva_skor]) VALUES (461, N'Теоретичні основи радіотехнічних систем', N'ТОРС')
GO
INSERT [dbo].[predmet] ([K_predmet], [Nazva], [Nazva_skor]) VALUES (462, N'Теорія автоматичного управління', N'ТАУ')
GO
INSERT [dbo].[predmet] ([K_predmet], [Nazva], [Nazva_skor]) VALUES (463, N'Теорія електрічних та магнітних кіл', N'ТЕТМК')
GO
INSERT [dbo].[predmet] ([K_predmet], [Nazva], [Nazva_skor]) VALUES (464, N'Теорія інформації та кодування', N'ТІТК')
GO
INSERT [dbo].[predmet] ([K_predmet], [Nazva], [Nazva_skor]) VALUES (465, N'Теорія ймовірностей і математична статистика', N'ТЙІМС')
GO
INSERT [dbo].[predmet] ([K_predmet], [Nazva], [Nazva_skor]) VALUES (466, N'Теорія систем та системний аналіз', N'ТСТСА')
GO
INSERT [dbo].[predmet] ([K_predmet], [Nazva], [Nazva_skor]) VALUES (467, N'Теорія та практика освіти', N'ТТПО')
GO
INSERT [dbo].[predmet] ([K_predmet], [Nazva], [Nazva_skor]) VALUES (468, N'Теплоенергетика', N'Тепло.')
GO
INSERT [dbo].[predmet] ([K_predmet], [Nazva], [Nazva_skor]) VALUES (469, N'Техніка високих напруг', N'ТВН')
GO
INSERT [dbo].[predmet] ([K_predmet], [Nazva], [Nazva_skor]) VALUES (470, N'Технічна механіка', N'ТМ')
GO
INSERT [dbo].[predmet] ([K_predmet], [Nazva], [Nazva_skor]) VALUES (471, N'Технології програмування', N'ТП')
GO
INSERT [dbo].[predmet] ([K_predmet], [Nazva], [Nazva_skor]) VALUES (472, N'Типовий електропривод', N'ТЕ')
GO
INSERT [dbo].[predmet] ([K_predmet], [Nazva], [Nazva_skor]) VALUES (473, N'Українська мова (за професійним спрямуванням)', N'УМ(ПС')
GO
INSERT [dbo].[predmet] ([K_predmet], [Nazva], [Nazva_skor]) VALUES (474, N'Управління інформаційної безпекою', N'УІБ')
GO
INSERT [dbo].[predmet] ([K_predmet], [Nazva], [Nazva_skor]) VALUES (475, N'Фізика', N'Фізик.')
GO
INSERT [dbo].[predmet] ([K_predmet], [Nazva], [Nazva_skor]) VALUES (476, N'Фізичне виховання *', N'ФВ')
GO
INSERT [dbo].[predmet] ([K_predmet], [Nazva], [Nazva_skor]) VALUES (477, N'Філософія', N'Філос.')
GO
INSERT [dbo].[predmet] ([K_predmet], [Nazva], [Nazva_skor]) VALUES (478, N'Філософія права', N'ФП')
GO
INSERT [dbo].[predmet] ([K_predmet], [Nazva], [Nazva_skor]) VALUES (479, N'Хімія та електрорадіоматеріали', N'ХТЕ')
GO
INSERT [dbo].[predmet] ([K_predmet], [Nazva], [Nazva_skor]) VALUES (480, N'Цифрове оброблення сигналів', N'ЦОС')
GO
INSERT [dbo].[predmet] ([K_predmet], [Nazva], [Nazva_skor]) VALUES (481, N'Цифрові пристрої та мікроконтролери', N'ЦПТМ')
GO
SET IDENTITY_INSERT [dbo].[predmet] OFF
GO
SET IDENTITY_INSERT [dbo].[Predmet_plan] ON 

GO
INSERT [dbo].[Predmet_plan] ([K_predm_pl], [K_predmet], [K_navch_plan], [Chas_Lek], [Cahs_pr], [Chas_all], [Chas_Labor], [Chas_sem], [Kilk_modul], [Cahs_sam], [Semestr], [Shifr_predmet], [k_fk]) VALUES (86, 388, 17, NULL, NULL, 108, NULL, NULL, NULL, NULL, 1, N'НГСЕ.01', 1)
GO
INSERT [dbo].[Predmet_plan] ([K_predm_pl], [K_predmet], [K_navch_plan], [Chas_Lek], [Cahs_pr], [Chas_all], [Chas_Labor], [Chas_sem], [Kilk_modul], [Cahs_sam], [Semestr], [Shifr_predmet], [k_fk]) VALUES (87, 389, 17, NULL, NULL, 72, NULL, NULL, NULL, NULL, 2, N'НГСЕ.02', 1)
GO
INSERT [dbo].[Predmet_plan] ([K_predm_pl], [K_predmet], [K_navch_plan], [Chas_Lek], [Cahs_pr], [Chas_all], [Chas_Labor], [Chas_sem], [Kilk_modul], [Cahs_sam], [Semestr], [Shifr_predmet], [k_fk]) VALUES (88, 384, 17, NULL, NULL, 180, NULL, NULL, NULL, NULL, 1, N'НГСЕ.03', 1)
GO
INSERT [dbo].[Predmet_plan] ([K_predm_pl], [K_predmet], [K_navch_plan], [Chas_Lek], [Cahs_pr], [Chas_all], [Chas_Labor], [Chas_sem], [Kilk_modul], [Cahs_sam], [Semestr], [Shifr_predmet], [k_fk]) VALUES (89, 473, 17, NULL, NULL, 108, NULL, NULL, NULL, NULL, 1, N'НГСЕ.04', 1)
GO
INSERT [dbo].[Predmet_plan] ([K_predm_pl], [K_predmet], [K_navch_plan], [Chas_Lek], [Cahs_pr], [Chas_all], [Chas_Labor], [Chas_sem], [Kilk_modul], [Cahs_sam], [Semestr], [Shifr_predmet], [k_fk]) VALUES (90, 477, 17, NULL, NULL, 108, NULL, NULL, NULL, NULL, 3, N'НГСЕ.05', 1)
GO
INSERT [dbo].[Predmet_plan] ([K_predm_pl], [K_predmet], [K_navch_plan], [Chas_Lek], [Cahs_pr], [Chas_all], [Chas_Labor], [Chas_sem], [Kilk_modul], [Cahs_sam], [Semestr], [Shifr_predmet], [k_fk]) VALUES (91, 433, 17, NULL, NULL, 72, NULL, NULL, NULL, NULL, 1, N'ВГСЕ.01', 2)
GO
INSERT [dbo].[Predmet_plan] ([K_predm_pl], [K_predmet], [K_navch_plan], [Chas_Lek], [Cahs_pr], [Chas_all], [Chas_Labor], [Chas_sem], [Kilk_modul], [Cahs_sam], [Semestr], [Shifr_predmet], [k_fk]) VALUES (92, 432, 17, NULL, NULL, 72, NULL, NULL, NULL, NULL, 8, N'ВГСЕ.02', 2)
GO
INSERT [dbo].[Predmet_plan] ([K_predm_pl], [K_predmet], [K_navch_plan], [Chas_Lek], [Cahs_pr], [Chas_all], [Chas_Labor], [Chas_sem], [Kilk_modul], [Cahs_sam], [Semestr], [Shifr_predmet], [k_fk]) VALUES (93, 441, 17, NULL, NULL, 72, NULL, NULL, NULL, NULL, 7, N'ВГСЕ.03', 2)
GO
INSERT [dbo].[Predmet_plan] ([K_predm_pl], [K_predmet], [K_navch_plan], [Chas_Lek], [Cahs_pr], [Chas_all], [Chas_Labor], [Chas_sem], [Kilk_modul], [Cahs_sam], [Semestr], [Shifr_predmet], [k_fk]) VALUES (94, 458, 17, NULL, NULL, 72, NULL, NULL, NULL, NULL, 7, N'ВГСЕ.04', 2)
GO
INSERT [dbo].[Predmet_plan] ([K_predm_pl], [K_predmet], [K_navch_plan], [Chas_Lek], [Cahs_pr], [Chas_all], [Chas_Labor], [Chas_sem], [Kilk_modul], [Cahs_sam], [Semestr], [Shifr_predmet], [k_fk]) VALUES (95, 353, 17, NULL, NULL, 558, NULL, NULL, NULL, NULL, 1, N'НМПН.01', 1)
GO
INSERT [dbo].[Predmet_plan] ([K_predm_pl], [K_predmet], [K_navch_plan], [Chas_Lek], [Cahs_pr], [Chas_all], [Chas_Labor], [Chas_sem], [Kilk_modul], [Cahs_sam], [Semestr], [Shifr_predmet], [k_fk]) VALUES (96, 475, 17, NULL, NULL, 414, NULL, NULL, NULL, NULL, 1, N'НМПН.02', 1)
GO
INSERT [dbo].[Predmet_plan] ([K_predm_pl], [K_predmet], [K_navch_plan], [Chas_Lek], [Cahs_pr], [Chas_all], [Chas_Labor], [Chas_sem], [Kilk_modul], [Cahs_sam], [Semestr], [Shifr_predmet], [k_fk]) VALUES (97, 465, 17, NULL, NULL, 126, NULL, NULL, NULL, NULL, 3, N'НМПН.03', 1)
GO
INSERT [dbo].[Predmet_plan] ([K_predm_pl], [K_predmet], [K_navch_plan], [Chas_Lek], [Cahs_pr], [Chas_all], [Chas_Labor], [Chas_sem], [Kilk_modul], [Cahs_sam], [Semestr], [Shifr_predmet], [k_fk]) VALUES (98, 364, 17, NULL, NULL, 72, NULL, NULL, NULL, NULL, 4, N'ВМПН.01', 2)
GO
INSERT [dbo].[Predmet_plan] ([K_predm_pl], [K_predmet], [K_navch_plan], [Chas_Lek], [Cahs_pr], [Chas_all], [Chas_Labor], [Chas_sem], [Kilk_modul], [Cahs_sam], [Semestr], [Shifr_predmet], [k_fk]) VALUES (99, 360, 17, NULL, NULL, 72, NULL, NULL, NULL, NULL, 1, N'ВМПН.02', 1)
GO
INSERT [dbo].[Predmet_plan] ([K_predm_pl], [K_predmet], [K_navch_plan], [Chas_Lek], [Cahs_pr], [Chas_all], [Chas_Labor], [Chas_sem], [Kilk_modul], [Cahs_sam], [Semestr], [Shifr_predmet], [k_fk]) VALUES (100, 417, 17, NULL, NULL, 108, NULL, NULL, NULL, NULL, 4, N'ВМПН.03', 2)
GO
INSERT [dbo].[Predmet_plan] ([K_predm_pl], [K_predmet], [K_navch_plan], [Chas_Lek], [Cahs_pr], [Chas_all], [Chas_Labor], [Chas_sem], [Kilk_modul], [Cahs_sam], [Semestr], [Shifr_predmet], [k_fk]) VALUES (101, 382, 17, NULL, NULL, 144, NULL, NULL, NULL, NULL, 2, N'ВМПН.04', 2)
GO
INSERT [dbo].[Predmet_plan] ([K_predm_pl], [K_predmet], [K_navch_plan], [Chas_Lek], [Cahs_pr], [Chas_all], [Chas_Labor], [Chas_sem], [Kilk_modul], [Cahs_sam], [Semestr], [Shifr_predmet], [k_fk]) VALUES (102, 459, 17, NULL, NULL, 108, NULL, NULL, NULL, NULL, 4, N'ВМПН.05', 2)
GO
INSERT [dbo].[Predmet_plan] ([K_predm_pl], [K_predmet], [K_navch_plan], [Chas_Lek], [Cahs_pr], [Chas_all], [Chas_Labor], [Chas_sem], [Kilk_modul], [Cahs_sam], [Semestr], [Shifr_predmet], [k_fk]) VALUES (103, 359, 17, NULL, NULL, 126, NULL, NULL, NULL, NULL, 3, N'ВМПН.06', 2)
GO
INSERT [dbo].[Predmet_plan] ([K_predm_pl], [K_predmet], [K_navch_plan], [Chas_Lek], [Cahs_pr], [Chas_all], [Chas_Labor], [Chas_sem], [Kilk_modul], [Cahs_sam], [Semestr], [Shifr_predmet], [k_fk]) VALUES (104, 471, 17, NULL, NULL, 468, NULL, NULL, NULL, NULL, 3, N'ВМПН.07', 1)
GO
INSERT [dbo].[Predmet_plan] ([K_predm_pl], [K_predmet], [K_navch_plan], [Chas_Lek], [Cahs_pr], [Chas_all], [Chas_Labor], [Chas_sem], [Kilk_modul], [Cahs_sam], [Semestr], [Shifr_predmet], [k_fk]) VALUES (105, 349, 17, NULL, NULL, 54, NULL, NULL, NULL, NULL, 5, N'НПП.01', 2)
GO
INSERT [dbo].[Predmet_plan] ([K_predm_pl], [K_predmet], [K_navch_plan], [Chas_Lek], [Cahs_pr], [Chas_all], [Chas_Labor], [Chas_sem], [Kilk_modul], [Cahs_sam], [Semestr], [Shifr_predmet], [k_fk]) VALUES (106, 419, 17, NULL, NULL, 54, NULL, NULL, NULL, NULL, 6, N'НПП.02', 2)
GO
INSERT [dbo].[Predmet_plan] ([K_predm_pl], [K_predmet], [K_navch_plan], [Chas_Lek], [Cahs_pr], [Chas_all], [Chas_Labor], [Chas_sem], [Kilk_modul], [Cahs_sam], [Semestr], [Shifr_predmet], [k_fk]) VALUES (107, 363, 17, NULL, NULL, 108, NULL, NULL, NULL, NULL, 6, N'НПП.03', 2)
GO
INSERT [dbo].[Predmet_plan] ([K_predm_pl], [K_predmet], [K_navch_plan], [Chas_Lek], [Cahs_pr], [Chas_all], [Chas_Labor], [Chas_sem], [Kilk_modul], [Cahs_sam], [Semestr], [Shifr_predmet], [k_fk]) VALUES (108, 390, 17, NULL, NULL, 108, NULL, NULL, NULL, NULL, 3, N'НПП.04', 2)
GO
INSERT [dbo].[Predmet_plan] ([K_predm_pl], [K_predmet], [K_navch_plan], [Chas_Lek], [Cahs_pr], [Chas_all], [Chas_Labor], [Chas_sem], [Kilk_modul], [Cahs_sam], [Semestr], [Shifr_predmet], [k_fk]) VALUES (109, 347, 17, NULL, NULL, 252, NULL, NULL, NULL, NULL, 3, N'НПП.05', 1)
GO
INSERT [dbo].[Predmet_plan] ([K_predm_pl], [K_predmet], [K_navch_plan], [Chas_Lek], [Cahs_pr], [Chas_all], [Chas_Labor], [Chas_sem], [Kilk_modul], [Cahs_sam], [Semestr], [Shifr_predmet], [k_fk]) VALUES (110, 405, 17, NULL, NULL, 144, NULL, NULL, NULL, NULL, 5, N'НПП.06', 1)
GO
INSERT [dbo].[Predmet_plan] ([K_predm_pl], [K_predmet], [K_navch_plan], [Chas_Lek], [Cahs_pr], [Chas_all], [Chas_Labor], [Chas_sem], [Kilk_modul], [Cahs_sam], [Semestr], [Shifr_predmet], [k_fk]) VALUES (111, 394, 17, NULL, NULL, 324, NULL, NULL, NULL, NULL, 5, N'НПП.07', 1)
GO
INSERT [dbo].[Predmet_plan] ([K_predm_pl], [K_predmet], [K_navch_plan], [Chas_Lek], [Cahs_pr], [Chas_all], [Chas_Labor], [Chas_sem], [Kilk_modul], [Cahs_sam], [Semestr], [Shifr_predmet], [k_fk]) VALUES (112, 393, 17, NULL, NULL, 180, NULL, NULL, NULL, NULL, 3, N'НПП.08', 1)
GO
INSERT [dbo].[Predmet_plan] ([K_predm_pl], [K_predmet], [K_navch_plan], [Chas_Lek], [Cahs_pr], [Chas_all], [Chas_Labor], [Chas_sem], [Kilk_modul], [Cahs_sam], [Semestr], [Shifr_predmet], [k_fk]) VALUES (113, 457, 17, NULL, NULL, 180, NULL, NULL, NULL, NULL, 6, N'НПП.09', 1)
GO
INSERT [dbo].[Predmet_plan] ([K_predm_pl], [K_predmet], [K_navch_plan], [Chas_Lek], [Cahs_pr], [Chas_all], [Chas_Labor], [Chas_sem], [Kilk_modul], [Cahs_sam], [Semestr], [Shifr_predmet], [k_fk]) VALUES (114, 464, 17, NULL, NULL, 162, NULL, NULL, NULL, NULL, 4, N'НПП.10', 1)
GO
INSERT [dbo].[Predmet_plan] ([K_predm_pl], [K_predmet], [K_navch_plan], [Chas_Lek], [Cahs_pr], [Chas_all], [Chas_Labor], [Chas_sem], [Kilk_modul], [Cahs_sam], [Semestr], [Shifr_predmet], [k_fk]) VALUES (115, 439, 17, NULL, NULL, 162, NULL, NULL, NULL, NULL, 7, N'НПП.11', 1)
GO
INSERT [dbo].[Predmet_plan] ([K_predm_pl], [K_predmet], [K_navch_plan], [Chas_Lek], [Cahs_pr], [Chas_all], [Chas_Labor], [Chas_sem], [Kilk_modul], [Cahs_sam], [Semestr], [Shifr_predmet], [k_fk]) VALUES (116, 470, 17, NULL, NULL, 144, NULL, NULL, NULL, NULL, 3, N'НПП.12', 2)
GO
INSERT [dbo].[Predmet_plan] ([K_predm_pl], [K_predmet], [K_navch_plan], [Chas_Lek], [Cahs_pr], [Chas_all], [Chas_Labor], [Chas_sem], [Kilk_modul], [Cahs_sam], [Semestr], [Shifr_predmet], [k_fk]) VALUES (117, 462, 17, NULL, NULL, 324, NULL, NULL, NULL, NULL, 6, N'НПП.13', 1)
GO
INSERT [dbo].[Predmet_plan] ([K_predm_pl], [K_predmet], [K_navch_plan], [Chas_Lek], [Cahs_pr], [Chas_all], [Chas_Labor], [Chas_sem], [Kilk_modul], [Cahs_sam], [Semestr], [Shifr_predmet], [k_fk]) VALUES (118, 466, 17, NULL, NULL, 162, NULL, NULL, NULL, NULL, 7, N'НПП.14', 1)
GO
INSERT [dbo].[Predmet_plan] ([K_predm_pl], [K_predmet], [K_navch_plan], [Chas_Lek], [Cahs_pr], [Chas_all], [Chas_Labor], [Chas_sem], [Kilk_modul], [Cahs_sam], [Semestr], [Shifr_predmet], [k_fk]) VALUES (119, 381, 17, NULL, NULL, 180, NULL, NULL, NULL, NULL, 7, N'НПП.15', 1)
GO
INSERT [dbo].[Predmet_plan] ([K_predm_pl], [K_predmet], [K_navch_plan], [Chas_Lek], [Cahs_pr], [Chas_all], [Chas_Labor], [Chas_sem], [Kilk_modul], [Cahs_sam], [Semestr], [Shifr_predmet], [k_fk]) VALUES (120, 403, 17, NULL, NULL, 225, NULL, NULL, NULL, NULL, 5, N'ВПП.01', 2)
GO
INSERT [dbo].[Predmet_plan] ([K_predm_pl], [K_predmet], [K_navch_plan], [Chas_Lek], [Cahs_pr], [Chas_all], [Chas_Labor], [Chas_sem], [Kilk_modul], [Cahs_sam], [Semestr], [Shifr_predmet], [k_fk]) VALUES (121, 454, 17, NULL, NULL, 108, NULL, NULL, NULL, NULL, 7, N'ВПП.02', 2)
GO
INSERT [dbo].[Predmet_plan] ([K_predm_pl], [K_predmet], [K_navch_plan], [Chas_Lek], [Cahs_pr], [Chas_all], [Chas_Labor], [Chas_sem], [Kilk_modul], [Cahs_sam], [Semestr], [Shifr_predmet], [k_fk]) VALUES (122, 427, 17, NULL, NULL, 90, NULL, NULL, NULL, NULL, 8, N'ВПП.03', 2)
GO
INSERT [dbo].[Predmet_plan] ([K_predm_pl], [K_predmet], [K_navch_plan], [Chas_Lek], [Cahs_pr], [Chas_all], [Chas_Labor], [Chas_sem], [Kilk_modul], [Cahs_sam], [Semestr], [Shifr_predmet], [k_fk]) VALUES (123, 434, 17, NULL, NULL, 90, NULL, NULL, NULL, NULL, 6, N'ВПП.04', 2)
GO
INSERT [dbo].[Predmet_plan] ([K_predm_pl], [K_predmet], [K_navch_plan], [Chas_Lek], [Cahs_pr], [Chas_all], [Chas_Labor], [Chas_sem], [Kilk_modul], [Cahs_sam], [Semestr], [Shifr_predmet], [k_fk]) VALUES (124, 442, 17, NULL, NULL, 90, NULL, NULL, NULL, NULL, 8, N'ВПП.05', 2)
GO
INSERT [dbo].[Predmet_plan] ([K_predm_pl], [K_predmet], [K_navch_plan], [Chas_Lek], [Cahs_pr], [Chas_all], [Chas_Labor], [Chas_sem], [Kilk_modul], [Cahs_sam], [Semestr], [Shifr_predmet], [k_fk]) VALUES (125, 400, 17, NULL, NULL, 72, NULL, NULL, NULL, NULL, 7, N'ВПП.06', 2)
GO
INSERT [dbo].[Predmet_plan] ([K_predm_pl], [K_predmet], [K_navch_plan], [Chas_Lek], [Cahs_pr], [Chas_all], [Chas_Labor], [Chas_sem], [Kilk_modul], [Cahs_sam], [Semestr], [Shifr_predmet], [k_fk]) VALUES (126, 368, 17, NULL, NULL, 36, NULL, NULL, NULL, NULL, 2, N'ВПП.07', 2)
GO
INSERT [dbo].[Predmet_plan] ([K_predm_pl], [K_predmet], [K_navch_plan], [Chas_Lek], [Cahs_pr], [Chas_all], [Chas_Labor], [Chas_sem], [Kilk_modul], [Cahs_sam], [Semestr], [Shifr_predmet], [k_fk]) VALUES (127, 348, 17, NULL, NULL, 162, NULL, NULL, NULL, NULL, 4, N'ВПП.08', 2)
GO
INSERT [dbo].[Predmet_plan] ([K_predm_pl], [K_predmet], [K_navch_plan], [Chas_Lek], [Cahs_pr], [Chas_all], [Chas_Labor], [Chas_sem], [Kilk_modul], [Cahs_sam], [Semestr], [Shifr_predmet], [k_fk]) VALUES (128, 345, 17, NULL, NULL, 324, NULL, NULL, NULL, NULL, 1, N'ВПП.09', 1)
GO
INSERT [dbo].[Predmet_plan] ([K_predm_pl], [K_predmet], [K_navch_plan], [Chas_Lek], [Cahs_pr], [Chas_all], [Chas_Labor], [Chas_sem], [Kilk_modul], [Cahs_sam], [Semestr], [Shifr_predmet], [k_fk]) VALUES (129, 418, 17, NULL, NULL, 135, NULL, NULL, NULL, NULL, 5, N'ВПП.10', 1)
GO
INSERT [dbo].[Predmet_plan] ([K_predm_pl], [K_predmet], [K_navch_plan], [Chas_Lek], [Cahs_pr], [Chas_all], [Chas_Labor], [Chas_sem], [Kilk_modul], [Cahs_sam], [Semestr], [Shifr_predmet], [k_fk]) VALUES (130, 463, 17, NULL, NULL, 144, NULL, NULL, NULL, NULL, 2, N'ВПП.11', 2)
GO
INSERT [dbo].[Predmet_plan] ([K_predm_pl], [K_predmet], [K_navch_plan], [Chas_Lek], [Cahs_pr], [Chas_all], [Chas_Labor], [Chas_sem], [Kilk_modul], [Cahs_sam], [Semestr], [Shifr_predmet], [k_fk]) VALUES (131, 414, 17, NULL, NULL, 162, NULL, NULL, NULL, NULL, 5, N'ВПП.12', 1)
GO
INSERT [dbo].[Predmet_plan] ([K_predm_pl], [K_predmet], [K_navch_plan], [Chas_Lek], [Cahs_pr], [Chas_all], [Chas_Labor], [Chas_sem], [Kilk_modul], [Cahs_sam], [Semestr], [Shifr_predmet], [k_fk]) VALUES (132, 374, 17, NULL, NULL, 108, NULL, NULL, NULL, NULL, 4, N'ВПП.13', 2)
GO
INSERT [dbo].[Predmet_plan] ([K_predm_pl], [K_predmet], [K_navch_plan], [Chas_Lek], [Cahs_pr], [Chas_all], [Chas_Labor], [Chas_sem], [Kilk_modul], [Cahs_sam], [Semestr], [Shifr_predmet], [k_fk]) VALUES (133, 420, 17, NULL, NULL, 108, NULL, NULL, NULL, NULL, 5, N'ВПП.14', 2)
GO
INSERT [dbo].[Predmet_plan] ([K_predm_pl], [K_predmet], [K_navch_plan], [Chas_Lek], [Cahs_pr], [Chas_all], [Chas_Labor], [Chas_sem], [Kilk_modul], [Cahs_sam], [Semestr], [Shifr_predmet], [k_fk]) VALUES (134, 376, 17, NULL, NULL, 72, NULL, NULL, NULL, NULL, 5, N'ВПП.15', 2)
GO
INSERT [dbo].[Predmet_plan] ([K_predm_pl], [K_predmet], [K_navch_plan], [Chas_Lek], [Cahs_pr], [Chas_all], [Chas_Labor], [Chas_sem], [Kilk_modul], [Cahs_sam], [Semestr], [Shifr_predmet], [k_fk]) VALUES (135, 343, 17, NULL, NULL, 144, NULL, NULL, NULL, NULL, 8, N'ВПП.16', 1)
GO
INSERT [dbo].[Predmet_plan] ([K_predm_pl], [K_predmet], [K_navch_plan], [Chas_Lek], [Cahs_pr], [Chas_all], [Chas_Labor], [Chas_sem], [Kilk_modul], [Cahs_sam], [Semestr], [Shifr_predmet], [k_fk]) VALUES (136, 406, 17, NULL, NULL, 144, NULL, NULL, NULL, NULL, 8, N'ВПП.17', 1)
GO
INSERT [dbo].[Predmet_plan] ([K_predm_pl], [K_predmet], [K_navch_plan], [Chas_Lek], [Cahs_pr], [Chas_all], [Chas_Labor], [Chas_sem], [Kilk_modul], [Cahs_sam], [Semestr], [Shifr_predmet], [k_fk]) VALUES (137, 426, 17, NULL, NULL, 126, NULL, NULL, NULL, NULL, 7, N'ВПП.18', 1)
GO
INSERT [dbo].[Predmet_plan] ([K_predm_pl], [K_predmet], [K_navch_plan], [Chas_Lek], [Cahs_pr], [Chas_all], [Chas_Labor], [Chas_sem], [Kilk_modul], [Cahs_sam], [Semestr], [Shifr_predmet], [k_fk]) VALUES (138, 352, 17, NULL, NULL, 162, NULL, NULL, NULL, NULL, 6, N'НПП.16', 6)
GO
INSERT [dbo].[Predmet_plan] ([K_predm_pl], [K_predmet], [K_navch_plan], [Chas_Lek], [Cahs_pr], [Chas_all], [Chas_Labor], [Chas_sem], [Kilk_modul], [Cahs_sam], [Semestr], [Shifr_predmet], [k_fk]) VALUES (139, 429, 17, NULL, NULL, 216, NULL, NULL, NULL, NULL, 8, N'ВПП.19', 6)
GO
INSERT [dbo].[Predmet_plan] ([K_predm_pl], [K_predmet], [K_navch_plan], [Chas_Lek], [Cahs_pr], [Chas_all], [Chas_Labor], [Chas_sem], [Kilk_modul], [Cahs_sam], [Semestr], [Shifr_predmet], [k_fk]) VALUES (140, 351, 17, NULL, NULL, 324, NULL, NULL, NULL, NULL, 8, NULL, 5)
GO
INSERT [dbo].[Predmet_plan] ([K_predm_pl], [K_predmet], [K_navch_plan], [Chas_Lek], [Cahs_pr], [Chas_all], [Chas_Labor], [Chas_sem], [Kilk_modul], [Cahs_sam], [Semestr], [Shifr_predmet], [k_fk]) VALUES (242, 388, 13, NULL, NULL, 108, NULL, NULL, NULL, NULL, 1, N'НГСЕ.01', 1)
GO
INSERT [dbo].[Predmet_plan] ([K_predm_pl], [K_predmet], [K_navch_plan], [Chas_Lek], [Cahs_pr], [Chas_all], [Chas_Labor], [Chas_sem], [Kilk_modul], [Cahs_sam], [Semestr], [Shifr_predmet], [k_fk]) VALUES (243, 389, 13, NULL, NULL, 72, NULL, NULL, NULL, NULL, 3, N'НГСЕ.02', 1)
GO
INSERT [dbo].[Predmet_plan] ([K_predm_pl], [K_predmet], [K_navch_plan], [Chas_Lek], [Cahs_pr], [Chas_all], [Chas_Labor], [Chas_sem], [Kilk_modul], [Cahs_sam], [Semestr], [Shifr_predmet], [k_fk]) VALUES (244, 384, 13, NULL, NULL, 180, NULL, NULL, NULL, NULL, 1, N'НГСЕ.03', 1)
GO
INSERT [dbo].[Predmet_plan] ([K_predm_pl], [K_predmet], [K_navch_plan], [Chas_Lek], [Cahs_pr], [Chas_all], [Chas_Labor], [Chas_sem], [Kilk_modul], [Cahs_sam], [Semestr], [Shifr_predmet], [k_fk]) VALUES (245, 473, 13, NULL, NULL, 108, NULL, NULL, NULL, NULL, 1, N'НГСЕ.04', 1)
GO
INSERT [dbo].[Predmet_plan] ([K_predm_pl], [K_predmet], [K_navch_plan], [Chas_Lek], [Cahs_pr], [Chas_all], [Chas_Labor], [Chas_sem], [Kilk_modul], [Cahs_sam], [Semestr], [Shifr_predmet], [k_fk]) VALUES (246, 477, 13, NULL, NULL, 108, NULL, NULL, NULL, NULL, 3, N'НГСЕ.05', 1)
GO
INSERT [dbo].[Predmet_plan] ([K_predm_pl], [K_predmet], [K_navch_plan], [Chas_Lek], [Cahs_pr], [Chas_all], [Chas_Labor], [Chas_sem], [Kilk_modul], [Cahs_sam], [Semestr], [Shifr_predmet], [k_fk]) VALUES (247, 476, 13, NULL, NULL, 0, NULL, NULL, NULL, NULL, 1, N'НГСЕ.06', 2)
GO
INSERT [dbo].[Predmet_plan] ([K_predm_pl], [K_predmet], [K_navch_plan], [Chas_Lek], [Cahs_pr], [Chas_all], [Chas_Labor], [Chas_sem], [Kilk_modul], [Cahs_sam], [Semestr], [Shifr_predmet], [k_fk]) VALUES (248, 433, 13, NULL, NULL, 72, NULL, NULL, NULL, NULL, 1, N'ВГСЕ.01', 2)
GO
INSERT [dbo].[Predmet_plan] ([K_predm_pl], [K_predmet], [K_navch_plan], [Chas_Lek], [Cahs_pr], [Chas_all], [Chas_Labor], [Chas_sem], [Kilk_modul], [Cahs_sam], [Semestr], [Shifr_predmet], [k_fk]) VALUES (249, 432, 13, NULL, NULL, 72, NULL, NULL, NULL, NULL, 8, N'ВГСЕ.02', 2)
GO
INSERT [dbo].[Predmet_plan] ([K_predm_pl], [K_predmet], [K_navch_plan], [Chas_Lek], [Cahs_pr], [Chas_all], [Chas_Labor], [Chas_sem], [Kilk_modul], [Cahs_sam], [Semestr], [Shifr_predmet], [k_fk]) VALUES (250, 441, 13, NULL, NULL, 72, NULL, NULL, NULL, NULL, 7, N'ВГСЕ.03', 2)
GO
INSERT [dbo].[Predmet_plan] ([K_predm_pl], [K_predmet], [K_navch_plan], [Chas_Lek], [Cahs_pr], [Chas_all], [Chas_Labor], [Chas_sem], [Kilk_modul], [Cahs_sam], [Semestr], [Shifr_predmet], [k_fk]) VALUES (251, 458, 13, NULL, NULL, 72, NULL, NULL, NULL, NULL, 7, N'ВГСЕ.04', 2)
GO
INSERT [dbo].[Predmet_plan] ([K_predm_pl], [K_predmet], [K_navch_plan], [Chas_Lek], [Cahs_pr], [Chas_all], [Chas_Labor], [Chas_sem], [Kilk_modul], [Cahs_sam], [Semestr], [Shifr_predmet], [k_fk]) VALUES (252, 399, 13, NULL, NULL, 72, NULL, NULL, NULL, NULL, 0, N'ВГСЕ.05', NULL)
GO
INSERT [dbo].[Predmet_plan] ([K_predm_pl], [K_predmet], [K_navch_plan], [Chas_Lek], [Cahs_pr], [Chas_all], [Chas_Labor], [Chas_sem], [Kilk_modul], [Cahs_sam], [Semestr], [Shifr_predmet], [k_fk]) VALUES (253, 357, 13, NULL, NULL, 72, NULL, NULL, NULL, NULL, 0, N'ВГСЕ.06', NULL)
GO
INSERT [dbo].[Predmet_plan] ([K_predm_pl], [K_predmet], [K_navch_plan], [Chas_Lek], [Cahs_pr], [Chas_all], [Chas_Labor], [Chas_sem], [Kilk_modul], [Cahs_sam], [Semestr], [Shifr_predmet], [k_fk]) VALUES (254, 361, 13, NULL, NULL, 72, NULL, NULL, NULL, NULL, 0, N'ВГСЕ.07', NULL)
GO
INSERT [dbo].[Predmet_plan] ([K_predm_pl], [K_predmet], [K_navch_plan], [Chas_Lek], [Cahs_pr], [Chas_all], [Chas_Labor], [Chas_sem], [Kilk_modul], [Cahs_sam], [Semestr], [Shifr_predmet], [k_fk]) VALUES (255, 377, 13, NULL, NULL, 72, NULL, NULL, NULL, NULL, 0, N'ВГСЕ.08', NULL)
GO
INSERT [dbo].[Predmet_plan] ([K_predm_pl], [K_predmet], [K_navch_plan], [Chas_Lek], [Cahs_pr], [Chas_all], [Chas_Labor], [Chas_sem], [Kilk_modul], [Cahs_sam], [Semestr], [Shifr_predmet], [k_fk]) VALUES (256, 378, 13, NULL, NULL, 72, NULL, NULL, NULL, NULL, 0, N'ВГСЕ.09', NULL)
GO
INSERT [dbo].[Predmet_plan] ([K_predm_pl], [K_predmet], [K_navch_plan], [Chas_Lek], [Cahs_pr], [Chas_all], [Chas_Labor], [Chas_sem], [Kilk_modul], [Cahs_sam], [Semestr], [Shifr_predmet], [k_fk]) VALUES (257, 379, 13, NULL, NULL, 72, NULL, NULL, NULL, NULL, 0, N'ВГСЕ.10', NULL)
GO
INSERT [dbo].[Predmet_plan] ([K_predm_pl], [K_predmet], [K_navch_plan], [Chas_Lek], [Cahs_pr], [Chas_all], [Chas_Labor], [Chas_sem], [Kilk_modul], [Cahs_sam], [Semestr], [Shifr_predmet], [k_fk]) VALUES (258, 387, 13, NULL, NULL, 72, NULL, NULL, NULL, NULL, 0, N'ВГСЕ.11', NULL)
GO
INSERT [dbo].[Predmet_plan] ([K_predm_pl], [K_predmet], [K_navch_plan], [Chas_Lek], [Cahs_pr], [Chas_all], [Chas_Labor], [Chas_sem], [Kilk_modul], [Cahs_sam], [Semestr], [Shifr_predmet], [k_fk]) VALUES (259, 398, 13, NULL, NULL, 72, NULL, NULL, NULL, NULL, 0, N'ВГСЕ.12', NULL)
GO
INSERT [dbo].[Predmet_plan] ([K_predm_pl], [K_predmet], [K_navch_plan], [Chas_Lek], [Cahs_pr], [Chas_all], [Chas_Labor], [Chas_sem], [Kilk_modul], [Cahs_sam], [Semestr], [Shifr_predmet], [k_fk]) VALUES (260, 397, 13, NULL, NULL, 72, NULL, NULL, NULL, NULL, 0, N'ВГСЕ.13', NULL)
GO
INSERT [dbo].[Predmet_plan] ([K_predm_pl], [K_predmet], [K_navch_plan], [Chas_Lek], [Cahs_pr], [Chas_all], [Chas_Labor], [Chas_sem], [Kilk_modul], [Cahs_sam], [Semestr], [Shifr_predmet], [k_fk]) VALUES (261, 428, 13, NULL, NULL, 72, NULL, NULL, NULL, NULL, 0, N'ВГСЕ.14', NULL)
GO
INSERT [dbo].[Predmet_plan] ([K_predm_pl], [K_predmet], [K_navch_plan], [Chas_Lek], [Cahs_pr], [Chas_all], [Chas_Labor], [Chas_sem], [Kilk_modul], [Cahs_sam], [Semestr], [Shifr_predmet], [k_fk]) VALUES (262, 438, 13, NULL, NULL, 72, NULL, NULL, NULL, NULL, 0, N'ВГСЕ.15', NULL)
GO
INSERT [dbo].[Predmet_plan] ([K_predm_pl], [K_predmet], [K_navch_plan], [Chas_Lek], [Cahs_pr], [Chas_all], [Chas_Labor], [Chas_sem], [Kilk_modul], [Cahs_sam], [Semestr], [Shifr_predmet], [k_fk]) VALUES (263, 443, 13, NULL, NULL, 72, NULL, NULL, NULL, NULL, 0, N'ВГСЕ.16', NULL)
GO
INSERT [dbo].[Predmet_plan] ([K_predm_pl], [K_predmet], [K_navch_plan], [Chas_Lek], [Cahs_pr], [Chas_all], [Chas_Labor], [Chas_sem], [Kilk_modul], [Cahs_sam], [Semestr], [Shifr_predmet], [k_fk]) VALUES (264, 450, 13, NULL, NULL, 72, NULL, NULL, NULL, NULL, 0, N'ВГСЕ.17', NULL)
GO
INSERT [dbo].[Predmet_plan] ([K_predm_pl], [K_predmet], [K_navch_plan], [Chas_Lek], [Cahs_pr], [Chas_all], [Chas_Labor], [Chas_sem], [Kilk_modul], [Cahs_sam], [Semestr], [Shifr_predmet], [k_fk]) VALUES (265, 451, 13, NULL, NULL, 72, NULL, NULL, NULL, NULL, 0, N'ВГСЕ.18', NULL)
GO
INSERT [dbo].[Predmet_plan] ([K_predm_pl], [K_predmet], [K_navch_plan], [Chas_Lek], [Cahs_pr], [Chas_all], [Chas_Labor], [Chas_sem], [Kilk_modul], [Cahs_sam], [Semestr], [Shifr_predmet], [k_fk]) VALUES (266, 467, 13, NULL, NULL, 72, NULL, NULL, NULL, NULL, 0, N'ВГСЕ.19', NULL)
GO
INSERT [dbo].[Predmet_plan] ([K_predm_pl], [K_predmet], [K_navch_plan], [Chas_Lek], [Cahs_pr], [Chas_all], [Chas_Labor], [Chas_sem], [Kilk_modul], [Cahs_sam], [Semestr], [Shifr_predmet], [k_fk]) VALUES (267, 478, 13, NULL, NULL, 72, NULL, NULL, NULL, NULL, 0, N'ВГСЕ.20', NULL)
GO
INSERT [dbo].[Predmet_plan] ([K_predm_pl], [K_predmet], [K_navch_plan], [Chas_Lek], [Cahs_pr], [Chas_all], [Chas_Labor], [Chas_sem], [Kilk_modul], [Cahs_sam], [Semestr], [Shifr_predmet], [k_fk]) VALUES (268, 353, 13, NULL, NULL, 558, NULL, NULL, NULL, NULL, 1, N'НМПН.01', 1)
GO
INSERT [dbo].[Predmet_plan] ([K_predm_pl], [K_predmet], [K_navch_plan], [Chas_Lek], [Cahs_pr], [Chas_all], [Chas_Labor], [Chas_sem], [Kilk_modul], [Cahs_sam], [Semestr], [Shifr_predmet], [k_fk]) VALUES (269, 475, 13, NULL, NULL, 414, NULL, NULL, NULL, NULL, 1, N'НМПН.02', 1)
GO
INSERT [dbo].[Predmet_plan] ([K_predm_pl], [K_predmet], [K_navch_plan], [Chas_Lek], [Cahs_pr], [Chas_all], [Chas_Labor], [Chas_sem], [Kilk_modul], [Cahs_sam], [Semestr], [Shifr_predmet], [k_fk]) VALUES (270, 465, 13, NULL, NULL, 126, NULL, NULL, NULL, NULL, 3, N'НМПН.03', 1)
GO
INSERT [dbo].[Predmet_plan] ([K_predm_pl], [K_predmet], [K_navch_plan], [Chas_Lek], [Cahs_pr], [Chas_all], [Chas_Labor], [Chas_sem], [Kilk_modul], [Cahs_sam], [Semestr], [Shifr_predmet], [k_fk]) VALUES (271, 364, 13, NULL, NULL, 72, NULL, NULL, NULL, NULL, 4, N'ВМПН.01', 2)
GO
INSERT [dbo].[Predmet_plan] ([K_predm_pl], [K_predmet], [K_navch_plan], [Chas_Lek], [Cahs_pr], [Chas_all], [Chas_Labor], [Chas_sem], [Kilk_modul], [Cahs_sam], [Semestr], [Shifr_predmet], [k_fk]) VALUES (272, 360, 13, NULL, NULL, 72, NULL, NULL, NULL, NULL, 1, N'ВМПН.02', 1)
GO
INSERT [dbo].[Predmet_plan] ([K_predm_pl], [K_predmet], [K_navch_plan], [Chas_Lek], [Cahs_pr], [Chas_all], [Chas_Labor], [Chas_sem], [Kilk_modul], [Cahs_sam], [Semestr], [Shifr_predmet], [k_fk]) VALUES (273, 417, 13, NULL, NULL, 108, NULL, NULL, NULL, NULL, 4, N'ВМПН.03', 2)
GO
INSERT [dbo].[Predmet_plan] ([K_predm_pl], [K_predmet], [K_navch_plan], [Chas_Lek], [Cahs_pr], [Chas_all], [Chas_Labor], [Chas_sem], [Kilk_modul], [Cahs_sam], [Semestr], [Shifr_predmet], [k_fk]) VALUES (274, 382, 13, NULL, NULL, 144, NULL, NULL, NULL, NULL, 2, N'ВМПН.04', 2)
GO
INSERT [dbo].[Predmet_plan] ([K_predm_pl], [K_predmet], [K_navch_plan], [Chas_Lek], [Cahs_pr], [Chas_all], [Chas_Labor], [Chas_sem], [Kilk_modul], [Cahs_sam], [Semestr], [Shifr_predmet], [k_fk]) VALUES (275, 459, 13, NULL, NULL, 108, NULL, NULL, NULL, NULL, 4, N'ВМПН.05', 2)
GO
INSERT [dbo].[Predmet_plan] ([K_predm_pl], [K_predmet], [K_navch_plan], [Chas_Lek], [Cahs_pr], [Chas_all], [Chas_Labor], [Chas_sem], [Kilk_modul], [Cahs_sam], [Semestr], [Shifr_predmet], [k_fk]) VALUES (276, 359, 13, NULL, NULL, 126, NULL, NULL, NULL, NULL, 3, N'ВМПН.06', 2)
GO
INSERT [dbo].[Predmet_plan] ([K_predm_pl], [K_predmet], [K_navch_plan], [Chas_Lek], [Cahs_pr], [Chas_all], [Chas_Labor], [Chas_sem], [Kilk_modul], [Cahs_sam], [Semestr], [Shifr_predmet], [k_fk]) VALUES (277, 471, 13, NULL, NULL, 468, NULL, NULL, NULL, NULL, 3, N'ВМПН.07', 1)
GO
INSERT [dbo].[Predmet_plan] ([K_predm_pl], [K_predmet], [K_navch_plan], [Chas_Lek], [Cahs_pr], [Chas_all], [Chas_Labor], [Chas_sem], [Kilk_modul], [Cahs_sam], [Semestr], [Shifr_predmet], [k_fk]) VALUES (278, 349, 13, NULL, NULL, 54, NULL, NULL, NULL, NULL, 5, N'НПП.01', 2)
GO
INSERT [dbo].[Predmet_plan] ([K_predm_pl], [K_predmet], [K_navch_plan], [Chas_Lek], [Cahs_pr], [Chas_all], [Chas_Labor], [Chas_sem], [Kilk_modul], [Cahs_sam], [Semestr], [Shifr_predmet], [k_fk]) VALUES (279, 419, 13, NULL, NULL, 54, NULL, NULL, NULL, NULL, 6, N'НПП.02', 2)
GO
INSERT [dbo].[Predmet_plan] ([K_predm_pl], [K_predmet], [K_navch_plan], [Chas_Lek], [Cahs_pr], [Chas_all], [Chas_Labor], [Chas_sem], [Kilk_modul], [Cahs_sam], [Semestr], [Shifr_predmet], [k_fk]) VALUES (280, 363, 13, NULL, NULL, 108, NULL, NULL, NULL, NULL, 6, N'НПП.03', 2)
GO
INSERT [dbo].[Predmet_plan] ([K_predm_pl], [K_predmet], [K_navch_plan], [Chas_Lek], [Cahs_pr], [Chas_all], [Chas_Labor], [Chas_sem], [Kilk_modul], [Cahs_sam], [Semestr], [Shifr_predmet], [k_fk]) VALUES (281, 390, 13, NULL, NULL, 108, NULL, NULL, NULL, NULL, 3, N'НПП.04', 2)
GO
INSERT [dbo].[Predmet_plan] ([K_predm_pl], [K_predmet], [K_navch_plan], [Chas_Lek], [Cahs_pr], [Chas_all], [Chas_Labor], [Chas_sem], [Kilk_modul], [Cahs_sam], [Semestr], [Shifr_predmet], [k_fk]) VALUES (282, 347, 13, NULL, NULL, 252, NULL, NULL, NULL, NULL, 3, N'НПП.05', 1)
GO
INSERT [dbo].[Predmet_plan] ([K_predm_pl], [K_predmet], [K_navch_plan], [Chas_Lek], [Cahs_pr], [Chas_all], [Chas_Labor], [Chas_sem], [Kilk_modul], [Cahs_sam], [Semestr], [Shifr_predmet], [k_fk]) VALUES (283, 405, 13, NULL, NULL, 144, NULL, NULL, NULL, NULL, 5, N'НПП.06', 1)
GO
INSERT [dbo].[Predmet_plan] ([K_predm_pl], [K_predmet], [K_navch_plan], [Chas_Lek], [Cahs_pr], [Chas_all], [Chas_Labor], [Chas_sem], [Kilk_modul], [Cahs_sam], [Semestr], [Shifr_predmet], [k_fk]) VALUES (284, 394, 13, NULL, NULL, 324, NULL, NULL, NULL, NULL, 5, N'НПП.07', 1)
GO
INSERT [dbo].[Predmet_plan] ([K_predm_pl], [K_predmet], [K_navch_plan], [Chas_Lek], [Cahs_pr], [Chas_all], [Chas_Labor], [Chas_sem], [Kilk_modul], [Cahs_sam], [Semestr], [Shifr_predmet], [k_fk]) VALUES (285, 393, 13, NULL, NULL, 180, NULL, NULL, NULL, NULL, 3, N'НПП.08', 1)
GO
INSERT [dbo].[Predmet_plan] ([K_predm_pl], [K_predmet], [K_navch_plan], [Chas_Lek], [Cahs_pr], [Chas_all], [Chas_Labor], [Chas_sem], [Kilk_modul], [Cahs_sam], [Semestr], [Shifr_predmet], [k_fk]) VALUES (286, 457, 13, NULL, NULL, 180, NULL, NULL, NULL, NULL, 6, N'НПП.09', 1)
GO
INSERT [dbo].[Predmet_plan] ([K_predm_pl], [K_predmet], [K_navch_plan], [Chas_Lek], [Cahs_pr], [Chas_all], [Chas_Labor], [Chas_sem], [Kilk_modul], [Cahs_sam], [Semestr], [Shifr_predmet], [k_fk]) VALUES (287, 464, 13, NULL, NULL, 162, NULL, NULL, NULL, NULL, 4, N'НПП.10', 1)
GO
INSERT [dbo].[Predmet_plan] ([K_predm_pl], [K_predmet], [K_navch_plan], [Chas_Lek], [Cahs_pr], [Chas_all], [Chas_Labor], [Chas_sem], [Kilk_modul], [Cahs_sam], [Semestr], [Shifr_predmet], [k_fk]) VALUES (288, 439, 13, NULL, NULL, 162, NULL, NULL, NULL, NULL, 7, N'НПП.11', 1)
GO
INSERT [dbo].[Predmet_plan] ([K_predm_pl], [K_predmet], [K_navch_plan], [Chas_Lek], [Cahs_pr], [Chas_all], [Chas_Labor], [Chas_sem], [Kilk_modul], [Cahs_sam], [Semestr], [Shifr_predmet], [k_fk]) VALUES (289, 470, 13, NULL, NULL, 144, NULL, NULL, NULL, NULL, 3, N'НПП.12', 2)
GO
INSERT [dbo].[Predmet_plan] ([K_predm_pl], [K_predmet], [K_navch_plan], [Chas_Lek], [Cahs_pr], [Chas_all], [Chas_Labor], [Chas_sem], [Kilk_modul], [Cahs_sam], [Semestr], [Shifr_predmet], [k_fk]) VALUES (290, 462, 13, NULL, NULL, 324, NULL, NULL, NULL, NULL, 6, N'НПП.13', 1)
GO
INSERT [dbo].[Predmet_plan] ([K_predm_pl], [K_predmet], [K_navch_plan], [Chas_Lek], [Cahs_pr], [Chas_all], [Chas_Labor], [Chas_sem], [Kilk_modul], [Cahs_sam], [Semestr], [Shifr_predmet], [k_fk]) VALUES (291, 466, 13, NULL, NULL, 162, NULL, NULL, NULL, NULL, 7, N'НПП.14', 1)
GO
INSERT [dbo].[Predmet_plan] ([K_predm_pl], [K_predmet], [K_navch_plan], [Chas_Lek], [Cahs_pr], [Chas_all], [Chas_Labor], [Chas_sem], [Kilk_modul], [Cahs_sam], [Semestr], [Shifr_predmet], [k_fk]) VALUES (292, 381, 13, NULL, NULL, 180, NULL, NULL, NULL, NULL, 7, N'НПП.15', 1)
GO
INSERT [dbo].[Predmet_plan] ([K_predm_pl], [K_predmet], [K_navch_plan], [Chas_Lek], [Cahs_pr], [Chas_all], [Chas_Labor], [Chas_sem], [Kilk_modul], [Cahs_sam], [Semestr], [Shifr_predmet], [k_fk]) VALUES (293, 403, 13, NULL, NULL, 225, NULL, NULL, NULL, NULL, 5, N'ВПП.01', 2)
GO
INSERT [dbo].[Predmet_plan] ([K_predm_pl], [K_predmet], [K_navch_plan], [Chas_Lek], [Cahs_pr], [Chas_all], [Chas_Labor], [Chas_sem], [Kilk_modul], [Cahs_sam], [Semestr], [Shifr_predmet], [k_fk]) VALUES (294, 454, 13, NULL, NULL, 108, NULL, NULL, NULL, NULL, 7, N'ВПП.02', 2)
GO
INSERT [dbo].[Predmet_plan] ([K_predm_pl], [K_predmet], [K_navch_plan], [Chas_Lek], [Cahs_pr], [Chas_all], [Chas_Labor], [Chas_sem], [Kilk_modul], [Cahs_sam], [Semestr], [Shifr_predmet], [k_fk]) VALUES (295, 427, 13, NULL, NULL, 90, NULL, NULL, NULL, NULL, 8, N'ВПП.03', 2)
GO
INSERT [dbo].[Predmet_plan] ([K_predm_pl], [K_predmet], [K_navch_plan], [Chas_Lek], [Cahs_pr], [Chas_all], [Chas_Labor], [Chas_sem], [Kilk_modul], [Cahs_sam], [Semestr], [Shifr_predmet], [k_fk]) VALUES (296, 434, 13, NULL, NULL, 90, NULL, NULL, NULL, NULL, 6, N'ВПП.04', 2)
GO
INSERT [dbo].[Predmet_plan] ([K_predm_pl], [K_predmet], [K_navch_plan], [Chas_Lek], [Cahs_pr], [Chas_all], [Chas_Labor], [Chas_sem], [Kilk_modul], [Cahs_sam], [Semestr], [Shifr_predmet], [k_fk]) VALUES (297, 442, 13, NULL, NULL, 90, NULL, NULL, NULL, NULL, 8, N'ВПП.05', 2)
GO
INSERT [dbo].[Predmet_plan] ([K_predm_pl], [K_predmet], [K_navch_plan], [Chas_Lek], [Cahs_pr], [Chas_all], [Chas_Labor], [Chas_sem], [Kilk_modul], [Cahs_sam], [Semestr], [Shifr_predmet], [k_fk]) VALUES (298, 400, 13, NULL, NULL, 72, NULL, NULL, NULL, NULL, 7, N'ВПП.06', 2)
GO
INSERT [dbo].[Predmet_plan] ([K_predm_pl], [K_predmet], [K_navch_plan], [Chas_Lek], [Cahs_pr], [Chas_all], [Chas_Labor], [Chas_sem], [Kilk_modul], [Cahs_sam], [Semestr], [Shifr_predmet], [k_fk]) VALUES (299, 368, 13, NULL, NULL, 36, NULL, NULL, NULL, NULL, 2, N'ВПП.07', 2)
GO
INSERT [dbo].[Predmet_plan] ([K_predm_pl], [K_predmet], [K_navch_plan], [Chas_Lek], [Cahs_pr], [Chas_all], [Chas_Labor], [Chas_sem], [Kilk_modul], [Cahs_sam], [Semestr], [Shifr_predmet], [k_fk]) VALUES (300, 348, 13, NULL, NULL, 162, NULL, NULL, NULL, NULL, 4, N'ВПП.08', 2)
GO
INSERT [dbo].[Predmet_plan] ([K_predm_pl], [K_predmet], [K_navch_plan], [Chas_Lek], [Cahs_pr], [Chas_all], [Chas_Labor], [Chas_sem], [Kilk_modul], [Cahs_sam], [Semestr], [Shifr_predmet], [k_fk]) VALUES (301, 345, 13, NULL, NULL, 324, NULL, NULL, NULL, NULL, 1, N'ВПП.09', 1)
GO
INSERT [dbo].[Predmet_plan] ([K_predm_pl], [K_predmet], [K_navch_plan], [Chas_Lek], [Cahs_pr], [Chas_all], [Chas_Labor], [Chas_sem], [Kilk_modul], [Cahs_sam], [Semestr], [Shifr_predmet], [k_fk]) VALUES (302, 418, 13, NULL, NULL, 135, NULL, NULL, NULL, NULL, 5, N'ВПП.10', 1)
GO
INSERT [dbo].[Predmet_plan] ([K_predm_pl], [K_predmet], [K_navch_plan], [Chas_Lek], [Cahs_pr], [Chas_all], [Chas_Labor], [Chas_sem], [Kilk_modul], [Cahs_sam], [Semestr], [Shifr_predmet], [k_fk]) VALUES (303, 463, 13, NULL, NULL, 144, NULL, NULL, NULL, NULL, 2, N'ВПП.11', 2)
GO
INSERT [dbo].[Predmet_plan] ([K_predm_pl], [K_predmet], [K_navch_plan], [Chas_Lek], [Cahs_pr], [Chas_all], [Chas_Labor], [Chas_sem], [Kilk_modul], [Cahs_sam], [Semestr], [Shifr_predmet], [k_fk]) VALUES (304, 414, 13, NULL, NULL, 162, NULL, NULL, NULL, NULL, 5, N'ВПП.12', 1)
GO
INSERT [dbo].[Predmet_plan] ([K_predm_pl], [K_predmet], [K_navch_plan], [Chas_Lek], [Cahs_pr], [Chas_all], [Chas_Labor], [Chas_sem], [Kilk_modul], [Cahs_sam], [Semestr], [Shifr_predmet], [k_fk]) VALUES (305, 374, 13, NULL, NULL, 108, NULL, NULL, NULL, NULL, 4, N'ВПП.13', 2)
GO
INSERT [dbo].[Predmet_plan] ([K_predm_pl], [K_predmet], [K_navch_plan], [Chas_Lek], [Cahs_pr], [Chas_all], [Chas_Labor], [Chas_sem], [Kilk_modul], [Cahs_sam], [Semestr], [Shifr_predmet], [k_fk]) VALUES (306, 420, 13, NULL, NULL, 108, NULL, NULL, NULL, NULL, 5, N'ВПП.14', 2)
GO
INSERT [dbo].[Predmet_plan] ([K_predm_pl], [K_predmet], [K_navch_plan], [Chas_Lek], [Cahs_pr], [Chas_all], [Chas_Labor], [Chas_sem], [Kilk_modul], [Cahs_sam], [Semestr], [Shifr_predmet], [k_fk]) VALUES (307, 376, 13, NULL, NULL, 72, NULL, NULL, NULL, NULL, 5, N'ВПП.15', 2)
GO
INSERT [dbo].[Predmet_plan] ([K_predm_pl], [K_predmet], [K_navch_plan], [Chas_Lek], [Cahs_pr], [Chas_all], [Chas_Labor], [Chas_sem], [Kilk_modul], [Cahs_sam], [Semestr], [Shifr_predmet], [k_fk]) VALUES (308, 343, 13, NULL, NULL, 144, NULL, NULL, NULL, NULL, 8, N'ВПП.16', 1)
GO
INSERT [dbo].[Predmet_plan] ([K_predm_pl], [K_predmet], [K_navch_plan], [Chas_Lek], [Cahs_pr], [Chas_all], [Chas_Labor], [Chas_sem], [Kilk_modul], [Cahs_sam], [Semestr], [Shifr_predmet], [k_fk]) VALUES (309, 406, 13, NULL, NULL, 144, NULL, NULL, NULL, NULL, 8, N'ВПП.17', 1)
GO
INSERT [dbo].[Predmet_plan] ([K_predm_pl], [K_predmet], [K_navch_plan], [Chas_Lek], [Cahs_pr], [Chas_all], [Chas_Labor], [Chas_sem], [Kilk_modul], [Cahs_sam], [Semestr], [Shifr_predmet], [k_fk]) VALUES (310, 426, 13, NULL, NULL, 126, NULL, NULL, NULL, NULL, 7, N'ВПП.18', 1)
GO
INSERT [dbo].[Predmet_plan] ([K_predm_pl], [K_predmet], [K_navch_plan], [Chas_Lek], [Cahs_pr], [Chas_all], [Chas_Labor], [Chas_sem], [Kilk_modul], [Cahs_sam], [Semestr], [Shifr_predmet], [k_fk]) VALUES (311, 352, 13, NULL, NULL, 162, NULL, NULL, NULL, NULL, 6, N'НПП.16', 6)
GO
INSERT [dbo].[Predmet_plan] ([K_predm_pl], [K_predmet], [K_navch_plan], [Chas_Lek], [Cahs_pr], [Chas_all], [Chas_Labor], [Chas_sem], [Kilk_modul], [Cahs_sam], [Semestr], [Shifr_predmet], [k_fk]) VALUES (312, 429, 13, NULL, NULL, 216, NULL, NULL, NULL, NULL, 8, N'ВПП.19', 6)
GO
INSERT [dbo].[Predmet_plan] ([K_predm_pl], [K_predmet], [K_navch_plan], [Chas_Lek], [Cahs_pr], [Chas_all], [Chas_Labor], [Chas_sem], [Kilk_modul], [Cahs_sam], [Semestr], [Shifr_predmet], [k_fk]) VALUES (313, 388, 13, NULL, NULL, 108, NULL, NULL, NULL, NULL, 1, N'НГСЕ.01', 1)
GO
INSERT [dbo].[Predmet_plan] ([K_predm_pl], [K_predmet], [K_navch_plan], [Chas_Lek], [Cahs_pr], [Chas_all], [Chas_Labor], [Chas_sem], [Kilk_modul], [Cahs_sam], [Semestr], [Shifr_predmet], [k_fk]) VALUES (314, 389, 13, NULL, NULL, 72, NULL, NULL, NULL, NULL, 2, N'НГСЕ.02', 1)
GO
INSERT [dbo].[Predmet_plan] ([K_predm_pl], [K_predmet], [K_navch_plan], [Chas_Lek], [Cahs_pr], [Chas_all], [Chas_Labor], [Chas_sem], [Kilk_modul], [Cahs_sam], [Semestr], [Shifr_predmet], [k_fk]) VALUES (315, 384, 13, NULL, NULL, 180, NULL, NULL, NULL, NULL, 1, N'НГСЕ.03', 1)
GO
INSERT [dbo].[Predmet_plan] ([K_predm_pl], [K_predmet], [K_navch_plan], [Chas_Lek], [Cahs_pr], [Chas_all], [Chas_Labor], [Chas_sem], [Kilk_modul], [Cahs_sam], [Semestr], [Shifr_predmet], [k_fk]) VALUES (316, 473, 13, NULL, NULL, 108, NULL, NULL, NULL, NULL, 1, N'НГСЕ.04', 1)
GO
INSERT [dbo].[Predmet_plan] ([K_predm_pl], [K_predmet], [K_navch_plan], [Chas_Lek], [Cahs_pr], [Chas_all], [Chas_Labor], [Chas_sem], [Kilk_modul], [Cahs_sam], [Semestr], [Shifr_predmet], [k_fk]) VALUES (317, 477, 13, NULL, NULL, 108, NULL, NULL, NULL, NULL, 3, N'НГСЕ.05', 1)
GO
INSERT [dbo].[Predmet_plan] ([K_predm_pl], [K_predmet], [K_navch_plan], [Chas_Lek], [Cahs_pr], [Chas_all], [Chas_Labor], [Chas_sem], [Kilk_modul], [Cahs_sam], [Semestr], [Shifr_predmet], [k_fk]) VALUES (318, 476, 13, NULL, NULL, 0, NULL, NULL, NULL, NULL, 1, N'НГСЕ.06', 2)
GO
INSERT [dbo].[Predmet_plan] ([K_predm_pl], [K_predmet], [K_navch_plan], [Chas_Lek], [Cahs_pr], [Chas_all], [Chas_Labor], [Chas_sem], [Kilk_modul], [Cahs_sam], [Semestr], [Shifr_predmet], [k_fk]) VALUES (319, 433, 13, NULL, NULL, 72, NULL, NULL, NULL, NULL, 1, N'ВГСЕ.01', 2)
GO
INSERT [dbo].[Predmet_plan] ([K_predm_pl], [K_predmet], [K_navch_plan], [Chas_Lek], [Cahs_pr], [Chas_all], [Chas_Labor], [Chas_sem], [Kilk_modul], [Cahs_sam], [Semestr], [Shifr_predmet], [k_fk]) VALUES (320, 432, 13, NULL, NULL, 72, NULL, NULL, NULL, NULL, 8, N'ВГСЕ.02', 2)
GO
INSERT [dbo].[Predmet_plan] ([K_predm_pl], [K_predmet], [K_navch_plan], [Chas_Lek], [Cahs_pr], [Chas_all], [Chas_Labor], [Chas_sem], [Kilk_modul], [Cahs_sam], [Semestr], [Shifr_predmet], [k_fk]) VALUES (321, 441, 13, NULL, NULL, 72, NULL, NULL, NULL, NULL, 7, N'ВГСЕ.03', 2)
GO
INSERT [dbo].[Predmet_plan] ([K_predm_pl], [K_predmet], [K_navch_plan], [Chas_Lek], [Cahs_pr], [Chas_all], [Chas_Labor], [Chas_sem], [Kilk_modul], [Cahs_sam], [Semestr], [Shifr_predmet], [k_fk]) VALUES (322, 458, 13, NULL, NULL, 72, NULL, NULL, NULL, NULL, 7, N'ВГСЕ.04', 2)
GO
INSERT [dbo].[Predmet_plan] ([K_predm_pl], [K_predmet], [K_navch_plan], [Chas_Lek], [Cahs_pr], [Chas_all], [Chas_Labor], [Chas_sem], [Kilk_modul], [Cahs_sam], [Semestr], [Shifr_predmet], [k_fk]) VALUES (323, 353, 13, NULL, NULL, 558, NULL, NULL, NULL, NULL, 1, N'НМПН.01', 1)
GO
INSERT [dbo].[Predmet_plan] ([K_predm_pl], [K_predmet], [K_navch_plan], [Chas_Lek], [Cahs_pr], [Chas_all], [Chas_Labor], [Chas_sem], [Kilk_modul], [Cahs_sam], [Semestr], [Shifr_predmet], [k_fk]) VALUES (324, 475, 13, NULL, NULL, 414, NULL, NULL, NULL, NULL, 1, N'НМПН.02', 1)
GO
INSERT [dbo].[Predmet_plan] ([K_predm_pl], [K_predmet], [K_navch_plan], [Chas_Lek], [Cahs_pr], [Chas_all], [Chas_Labor], [Chas_sem], [Kilk_modul], [Cahs_sam], [Semestr], [Shifr_predmet], [k_fk]) VALUES (325, 465, 13, NULL, NULL, 126, NULL, NULL, NULL, NULL, 3, N'НМПН.03', 1)
GO
INSERT [dbo].[Predmet_plan] ([K_predm_pl], [K_predmet], [K_navch_plan], [Chas_Lek], [Cahs_pr], [Chas_all], [Chas_Labor], [Chas_sem], [Kilk_modul], [Cahs_sam], [Semestr], [Shifr_predmet], [k_fk]) VALUES (326, 364, 13, NULL, NULL, 72, NULL, NULL, NULL, NULL, 4, N'ВМПН.01', 2)
GO
INSERT [dbo].[Predmet_plan] ([K_predm_pl], [K_predmet], [K_navch_plan], [Chas_Lek], [Cahs_pr], [Chas_all], [Chas_Labor], [Chas_sem], [Kilk_modul], [Cahs_sam], [Semestr], [Shifr_predmet], [k_fk]) VALUES (327, 360, 13, NULL, NULL, 72, NULL, NULL, NULL, NULL, 1, N'ВМПН.02', 1)
GO
INSERT [dbo].[Predmet_plan] ([K_predm_pl], [K_predmet], [K_navch_plan], [Chas_Lek], [Cahs_pr], [Chas_all], [Chas_Labor], [Chas_sem], [Kilk_modul], [Cahs_sam], [Semestr], [Shifr_predmet], [k_fk]) VALUES (328, 417, 13, NULL, NULL, 108, NULL, NULL, NULL, NULL, 4, N'ВМПН.03', 2)
GO
INSERT [dbo].[Predmet_plan] ([K_predm_pl], [K_predmet], [K_navch_plan], [Chas_Lek], [Cahs_pr], [Chas_all], [Chas_Labor], [Chas_sem], [Kilk_modul], [Cahs_sam], [Semestr], [Shifr_predmet], [k_fk]) VALUES (329, 382, 13, NULL, NULL, 144, NULL, NULL, NULL, NULL, 2, N'ВМПН.04', 2)
GO
INSERT [dbo].[Predmet_plan] ([K_predm_pl], [K_predmet], [K_navch_plan], [Chas_Lek], [Cahs_pr], [Chas_all], [Chas_Labor], [Chas_sem], [Kilk_modul], [Cahs_sam], [Semestr], [Shifr_predmet], [k_fk]) VALUES (330, 459, 13, NULL, NULL, 108, NULL, NULL, NULL, NULL, 4, N'ВМПН.05', 2)
GO
INSERT [dbo].[Predmet_plan] ([K_predm_pl], [K_predmet], [K_navch_plan], [Chas_Lek], [Cahs_pr], [Chas_all], [Chas_Labor], [Chas_sem], [Kilk_modul], [Cahs_sam], [Semestr], [Shifr_predmet], [k_fk]) VALUES (331, 358, 13, NULL, NULL, 126, NULL, NULL, NULL, NULL, 3, N'ВМПН.06', 2)
GO
INSERT [dbo].[Predmet_plan] ([K_predm_pl], [K_predmet], [K_navch_plan], [Chas_Lek], [Cahs_pr], [Chas_all], [Chas_Labor], [Chas_sem], [Kilk_modul], [Cahs_sam], [Semestr], [Shifr_predmet], [k_fk]) VALUES (332, 471, 13, NULL, NULL, 468, NULL, NULL, NULL, NULL, 3, N'ВМПН.07', 1)
GO
INSERT [dbo].[Predmet_plan] ([K_predm_pl], [K_predmet], [K_navch_plan], [Chas_Lek], [Cahs_pr], [Chas_all], [Chas_Labor], [Chas_sem], [Kilk_modul], [Cahs_sam], [Semestr], [Shifr_predmet], [k_fk]) VALUES (333, 349, 13, NULL, NULL, 54, NULL, NULL, NULL, NULL, 5, N'НПП.01', 2)
GO
INSERT [dbo].[Predmet_plan] ([K_predm_pl], [K_predmet], [K_navch_plan], [Chas_Lek], [Cahs_pr], [Chas_all], [Chas_Labor], [Chas_sem], [Kilk_modul], [Cahs_sam], [Semestr], [Shifr_predmet], [k_fk]) VALUES (334, 419, 13, NULL, NULL, 54, NULL, NULL, NULL, NULL, 6, N'НПП.02', 2)
GO
INSERT [dbo].[Predmet_plan] ([K_predm_pl], [K_predmet], [K_navch_plan], [Chas_Lek], [Cahs_pr], [Chas_all], [Chas_Labor], [Chas_sem], [Kilk_modul], [Cahs_sam], [Semestr], [Shifr_predmet], [k_fk]) VALUES (335, 363, 13, NULL, NULL, 108, NULL, NULL, NULL, NULL, 6, N'НПП.03', 2)
GO
INSERT [dbo].[Predmet_plan] ([K_predm_pl], [K_predmet], [K_navch_plan], [Chas_Lek], [Cahs_pr], [Chas_all], [Chas_Labor], [Chas_sem], [Kilk_modul], [Cahs_sam], [Semestr], [Shifr_predmet], [k_fk]) VALUES (336, 390, 13, NULL, NULL, 108, NULL, NULL, NULL, NULL, 3, N'НПП.04', 2)
GO
INSERT [dbo].[Predmet_plan] ([K_predm_pl], [K_predmet], [K_navch_plan], [Chas_Lek], [Cahs_pr], [Chas_all], [Chas_Labor], [Chas_sem], [Kilk_modul], [Cahs_sam], [Semestr], [Shifr_predmet], [k_fk]) VALUES (337, 347, 13, NULL, NULL, 252, NULL, NULL, NULL, NULL, 3, N'НПП.05', 1)
GO
INSERT [dbo].[Predmet_plan] ([K_predm_pl], [K_predmet], [K_navch_plan], [Chas_Lek], [Cahs_pr], [Chas_all], [Chas_Labor], [Chas_sem], [Kilk_modul], [Cahs_sam], [Semestr], [Shifr_predmet], [k_fk]) VALUES (338, 405, 13, NULL, NULL, 144, NULL, NULL, NULL, NULL, 5, N'НПП.06', 1)
GO
INSERT [dbo].[Predmet_plan] ([K_predm_pl], [K_predmet], [K_navch_plan], [Chas_Lek], [Cahs_pr], [Chas_all], [Chas_Labor], [Chas_sem], [Kilk_modul], [Cahs_sam], [Semestr], [Shifr_predmet], [k_fk]) VALUES (339, 386, 13, NULL, NULL, 324, NULL, NULL, NULL, NULL, 5, N'НПП.07', 1)
GO
INSERT [dbo].[Predmet_plan] ([K_predm_pl], [K_predmet], [K_navch_plan], [Chas_Lek], [Cahs_pr], [Chas_all], [Chas_Labor], [Chas_sem], [Kilk_modul], [Cahs_sam], [Semestr], [Shifr_predmet], [k_fk]) VALUES (340, 393, 13, NULL, NULL, 144, NULL, NULL, NULL, NULL, 3, N'НПП.08', 1)
GO
INSERT [dbo].[Predmet_plan] ([K_predm_pl], [K_predmet], [K_navch_plan], [Chas_Lek], [Cahs_pr], [Chas_all], [Chas_Labor], [Chas_sem], [Kilk_modul], [Cahs_sam], [Semestr], [Shifr_predmet], [k_fk]) VALUES (341, 457, 13, NULL, NULL, 180, NULL, NULL, NULL, NULL, 6, N'НПП.09', 1)
GO
INSERT [dbo].[Predmet_plan] ([K_predm_pl], [K_predmet], [K_navch_plan], [Chas_Lek], [Cahs_pr], [Chas_all], [Chas_Labor], [Chas_sem], [Kilk_modul], [Cahs_sam], [Semestr], [Shifr_predmet], [k_fk]) VALUES (342, 464, 13, NULL, NULL, 162, NULL, NULL, NULL, NULL, 4, N'НПП.10', 1)
GO
INSERT [dbo].[Predmet_plan] ([K_predm_pl], [K_predmet], [K_navch_plan], [Chas_Lek], [Cahs_pr], [Chas_all], [Chas_Labor], [Chas_sem], [Kilk_modul], [Cahs_sam], [Semestr], [Shifr_predmet], [k_fk]) VALUES (343, 436, 13, NULL, NULL, 378, NULL, NULL, NULL, NULL, 6, N'НПП.11', 1)
GO
INSERT [dbo].[Predmet_plan] ([K_predm_pl], [K_predmet], [K_navch_plan], [Chas_Lek], [Cahs_pr], [Chas_all], [Chas_Labor], [Chas_sem], [Kilk_modul], [Cahs_sam], [Semestr], [Shifr_predmet], [k_fk]) VALUES (344, 411, 13, NULL, NULL, 108, NULL, NULL, NULL, NULL, 4, N'НПП.12', 2)
GO
INSERT [dbo].[Predmet_plan] ([K_predm_pl], [K_predmet], [K_navch_plan], [Chas_Lek], [Cahs_pr], [Chas_all], [Chas_Labor], [Chas_sem], [Kilk_modul], [Cahs_sam], [Semestr], [Shifr_predmet], [k_fk]) VALUES (345, 402, 13, NULL, NULL, 54, NULL, NULL, NULL, NULL, 5, N'НПП.13', 2)
GO
INSERT [dbo].[Predmet_plan] ([K_predm_pl], [K_predmet], [K_navch_plan], [Chas_Lek], [Cahs_pr], [Chas_all], [Chas_Labor], [Chas_sem], [Kilk_modul], [Cahs_sam], [Semestr], [Shifr_predmet], [k_fk]) VALUES (346, 350, 13, NULL, NULL, 288, NULL, NULL, NULL, NULL, 7, N'НПП.14', 1)
GO
INSERT [dbo].[Predmet_plan] ([K_predm_pl], [K_predmet], [K_navch_plan], [Chas_Lek], [Cahs_pr], [Chas_all], [Chas_Labor], [Chas_sem], [Kilk_modul], [Cahs_sam], [Semestr], [Shifr_predmet], [k_fk]) VALUES (347, 403, 13, NULL, NULL, 225, NULL, NULL, NULL, NULL, 5, N'ВПП.01', 2)
GO
INSERT [dbo].[Predmet_plan] ([K_predm_pl], [K_predmet], [K_navch_plan], [Chas_Lek], [Cahs_pr], [Chas_all], [Chas_Labor], [Chas_sem], [Kilk_modul], [Cahs_sam], [Semestr], [Shifr_predmet], [k_fk]) VALUES (348, 454, 13, NULL, NULL, 108, NULL, NULL, NULL, NULL, 7, N'ВПП.02', 2)
GO
INSERT [dbo].[Predmet_plan] ([K_predm_pl], [K_predmet], [K_navch_plan], [Chas_Lek], [Cahs_pr], [Chas_all], [Chas_Labor], [Chas_sem], [Kilk_modul], [Cahs_sam], [Semestr], [Shifr_predmet], [k_fk]) VALUES (349, 427, 13, NULL, NULL, 90, NULL, NULL, NULL, NULL, 8, N'ВПП.03', 2)
GO
INSERT [dbo].[Predmet_plan] ([K_predm_pl], [K_predmet], [K_navch_plan], [Chas_Lek], [Cahs_pr], [Chas_all], [Chas_Labor], [Chas_sem], [Kilk_modul], [Cahs_sam], [Semestr], [Shifr_predmet], [k_fk]) VALUES (350, 434, 13, NULL, NULL, 90, NULL, NULL, NULL, NULL, 6, N'ВПП.04', 2)
GO
INSERT [dbo].[Predmet_plan] ([K_predm_pl], [K_predmet], [K_navch_plan], [Chas_Lek], [Cahs_pr], [Chas_all], [Chas_Labor], [Chas_sem], [Kilk_modul], [Cahs_sam], [Semestr], [Shifr_predmet], [k_fk]) VALUES (351, 442, 13, NULL, NULL, 90, NULL, NULL, NULL, NULL, 8, N'ВПП.05', 2)
GO
INSERT [dbo].[Predmet_plan] ([K_predm_pl], [K_predmet], [K_navch_plan], [Chas_Lek], [Cahs_pr], [Chas_all], [Chas_Labor], [Chas_sem], [Kilk_modul], [Cahs_sam], [Semestr], [Shifr_predmet], [k_fk]) VALUES (352, 400, 13, NULL, NULL, 72, NULL, NULL, NULL, NULL, 7, N'ВПП.06', 2)
GO
INSERT [dbo].[Predmet_plan] ([K_predm_pl], [K_predmet], [K_navch_plan], [Chas_Lek], [Cahs_pr], [Chas_all], [Chas_Labor], [Chas_sem], [Kilk_modul], [Cahs_sam], [Semestr], [Shifr_predmet], [k_fk]) VALUES (353, 368, 13, NULL, NULL, 36, NULL, NULL, NULL, NULL, 2, N'ВПП.07', 2)
GO
INSERT [dbo].[Predmet_plan] ([K_predm_pl], [K_predmet], [K_navch_plan], [Chas_Lek], [Cahs_pr], [Chas_all], [Chas_Labor], [Chas_sem], [Kilk_modul], [Cahs_sam], [Semestr], [Shifr_predmet], [k_fk]) VALUES (354, 348, 13, NULL, NULL, 162, NULL, NULL, NULL, NULL, 4, N'ВПП.08', 2)
GO
INSERT [dbo].[Predmet_plan] ([K_predm_pl], [K_predmet], [K_navch_plan], [Chas_Lek], [Cahs_pr], [Chas_all], [Chas_Labor], [Chas_sem], [Kilk_modul], [Cahs_sam], [Semestr], [Shifr_predmet], [k_fk]) VALUES (355, 345, 13, NULL, NULL, 324, NULL, NULL, NULL, NULL, 1, N'ВПП.09', 1)
GO
INSERT [dbo].[Predmet_plan] ([K_predm_pl], [K_predmet], [K_navch_plan], [Chas_Lek], [Cahs_pr], [Chas_all], [Chas_Labor], [Chas_sem], [Kilk_modul], [Cahs_sam], [Semestr], [Shifr_predmet], [k_fk]) VALUES (356, 418, 13, NULL, NULL, 135, NULL, NULL, NULL, NULL, 5, N'ВПП.10', 1)
GO
INSERT [dbo].[Predmet_plan] ([K_predm_pl], [K_predmet], [K_navch_plan], [Chas_Lek], [Cahs_pr], [Chas_all], [Chas_Labor], [Chas_sem], [Kilk_modul], [Cahs_sam], [Semestr], [Shifr_predmet], [k_fk]) VALUES (357, 424, 13, NULL, NULL, 324, NULL, NULL, NULL, NULL, 2, N'ВПП.11', 2)
GO
INSERT [dbo].[Predmet_plan] ([K_predm_pl], [K_predmet], [K_navch_plan], [Chas_Lek], [Cahs_pr], [Chas_all], [Chas_Labor], [Chas_sem], [Kilk_modul], [Cahs_sam], [Semestr], [Shifr_predmet], [k_fk]) VALUES (358, 431, 13, NULL, NULL, 126, NULL, NULL, NULL, NULL, 5, N'ВПП.13', 2)
GO
INSERT [dbo].[Predmet_plan] ([K_predm_pl], [K_predmet], [K_navch_plan], [Chas_Lek], [Cahs_pr], [Chas_all], [Chas_Labor], [Chas_sem], [Kilk_modul], [Cahs_sam], [Semestr], [Shifr_predmet], [k_fk]) VALUES (359, 391, 13, NULL, NULL, 108, NULL, NULL, NULL, NULL, 8, N'ВПП.14', 1)
GO
INSERT [dbo].[Predmet_plan] ([K_predm_pl], [K_predmet], [K_navch_plan], [Chas_Lek], [Cahs_pr], [Chas_all], [Chas_Labor], [Chas_sem], [Kilk_modul], [Cahs_sam], [Semestr], [Shifr_predmet], [k_fk]) VALUES (360, 407, 13, NULL, NULL, 54, NULL, NULL, NULL, NULL, 8, N'ВПП.15', 2)
GO
INSERT [dbo].[Predmet_plan] ([K_predm_pl], [K_predmet], [K_navch_plan], [Chas_Lek], [Cahs_pr], [Chas_all], [Chas_Labor], [Chas_sem], [Kilk_modul], [Cahs_sam], [Semestr], [Shifr_predmet], [k_fk]) VALUES (361, 416, 13, NULL, NULL, 144, NULL, NULL, NULL, NULL, 7, N'ВПП.16', 1)
GO
INSERT [dbo].[Predmet_plan] ([K_predm_pl], [K_predmet], [K_navch_plan], [Chas_Lek], [Cahs_pr], [Chas_all], [Chas_Labor], [Chas_sem], [Kilk_modul], [Cahs_sam], [Semestr], [Shifr_predmet], [k_fk]) VALUES (362, 474, 13, NULL, NULL, 126, NULL, NULL, NULL, NULL, 7, N'ВПП.17', 2)
GO
INSERT [dbo].[Predmet_plan] ([K_predm_pl], [K_predmet], [K_navch_plan], [Chas_Lek], [Cahs_pr], [Chas_all], [Chas_Labor], [Chas_sem], [Kilk_modul], [Cahs_sam], [Semestr], [Shifr_predmet], [k_fk]) VALUES (363, 456, 13, NULL, NULL, 144, NULL, NULL, NULL, NULL, 7, N'ВПП.18', 1)
GO
INSERT [dbo].[Predmet_plan] ([K_predm_pl], [K_predmet], [K_navch_plan], [Chas_Lek], [Cahs_pr], [Chas_all], [Chas_Labor], [Chas_sem], [Kilk_modul], [Cahs_sam], [Semestr], [Shifr_predmet], [k_fk]) VALUES (364, 352, 13, NULL, NULL, 162, NULL, NULL, NULL, NULL, 6, NULL, 6)
GO
INSERT [dbo].[Predmet_plan] ([K_predm_pl], [K_predmet], [K_navch_plan], [Chas_Lek], [Cahs_pr], [Chas_all], [Chas_Labor], [Chas_sem], [Kilk_modul], [Cahs_sam], [Semestr], [Shifr_predmet], [k_fk]) VALUES (365, 429, 13, NULL, NULL, 216, NULL, NULL, NULL, NULL, 8, NULL, 6)
GO
INSERT [dbo].[Predmet_plan] ([K_predm_pl], [K_predmet], [K_navch_plan], [Chas_Lek], [Cahs_pr], [Chas_all], [Chas_Labor], [Chas_sem], [Kilk_modul], [Cahs_sam], [Semestr], [Shifr_predmet], [k_fk]) VALUES (366, 351, 13, NULL, NULL, 324, NULL, NULL, NULL, NULL, 8, NULL, 5)
GO
SET IDENTITY_INSERT [dbo].[Predmet_plan] OFF
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (10, 84, 80, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (10, 85, 60, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (10, 86, 39, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (10, 87, 45, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (10, 88, 52, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (10, 89, 60, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (10, 90, 100, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (10, 91, 86, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (10, 92, 51, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (10, 93, 74, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (10, 94, 44, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (10, 95, 44, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (10, 96, 45, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (10, 97, 53, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (10, 98, 63, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (10, 99, 91, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (10, 100, 45, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (10, 101, 98, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (10, 102, 38, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (16, 84, 38, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (16, 85, 61, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (16, 86, 52, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (16, 87, 72, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (16, 88, 51, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (16, 89, 51, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (16, 90, 35, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (16, 91, 70, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (16, 92, 65, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (16, 93, 98, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (16, 94, 43, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (16, 95, 47, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (16, 96, 76, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (16, 97, 73, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (16, 98, 83, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (16, 99, 62, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (16, 100, 61, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (16, 101, 91, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (16, 102, 47, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (17, 84, 64, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (17, 85, 67, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (17, 86, 91, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (17, 87, 70, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (17, 88, 57, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (17, 89, 70, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (17, 90, 59, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (17, 91, 52, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (17, 92, 39, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (17, 93, 60, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (17, 94, 73, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (17, 95, 67, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (17, 96, 50, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (17, 97, 43, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (17, 98, 79, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (17, 99, 70, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (17, 100, 76, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (17, 101, 91, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (17, 102, 76, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (18, 46, 43, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (18, 47, 66, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (18, 48, 54, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (18, 49, 89, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (18, 50, 59, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (18, 51, 81, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (18, 52, 52, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (18, 53, 44, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (18, 54, 50, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (18, 55, 95, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (18, 56, 42, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (18, 57, 74, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (18, 58, 74, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (18, 59, 41, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (18, 60, 37, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (18, 61, 93, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (18, 62, 77, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (18, 63, 37, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (18, 64, 42, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (19, 84, 61, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (19, 85, 100, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (19, 86, 37, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (19, 87, 57, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (19, 88, 95, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (19, 89, 39, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (19, 90, 57, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (19, 91, 46, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (19, 92, 51, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (19, 93, 82, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (19, 94, 50, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (19, 95, 44, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (19, 96, 91, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (19, 97, 64, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (19, 98, 46, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (19, 99, 79, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (19, 100, 67, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (19, 101, 86, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (19, 102, 95, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (28, 84, 77, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (28, 85, 40, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (28, 86, 57, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (28, 87, 88, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (28, 88, 42, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (28, 89, 37, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (28, 90, 59, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (28, 91, 50, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (28, 92, 84, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (28, 93, 90, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (28, 94, 63, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (28, 95, 90, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (28, 96, 91, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (28, 97, 66, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (28, 98, 96, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (28, 99, 48, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (28, 100, 35, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (28, 101, 67, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (28, 102, 77, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (29, 84, 99, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (29, 85, 94, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (29, 86, 38, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (29, 87, 97, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (29, 88, 88, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (29, 89, 75, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (29, 90, 57, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (29, 91, 61, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (29, 92, 91, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (29, 93, 94, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (29, 94, 87, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (29, 95, 55, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (29, 96, 77, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (29, 97, 77, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (29, 98, 81, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (29, 99, 74, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (29, 100, 64, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (29, 101, 90, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (29, 102, 43, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (31, 84, 86, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (31, 85, 40, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (31, 86, 93, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (31, 87, 59, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (31, 88, 35, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (31, 89, 46, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (31, 90, 83, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (31, 91, 96, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (31, 92, 81, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (31, 93, 64, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (31, 94, 83, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (31, 95, 38, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (31, 96, 59, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (31, 97, 62, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (31, 98, 89, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (31, 99, 47, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (31, 100, 94, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (31, 101, 85, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (31, 102, 77, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (32, 84, 75, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (32, 85, 60, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (32, 86, 74, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (32, 87, 93, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (32, 88, 85, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (32, 89, 43, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (32, 90, 69, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (32, 91, 51, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (32, 92, 100, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (32, 93, 39, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (32, 94, 88, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (32, 95, 82, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (32, 96, 63, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (32, 97, 61, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (32, 98, 87, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (32, 99, 66, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (32, 100, 61, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (32, 101, 87, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (32, 102, 42, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (33, 84, 52, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (33, 85, 51, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (33, 86, 51, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (33, 87, 92, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (33, 88, 97, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (33, 89, 89, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (33, 90, 68, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (33, 91, 59, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (33, 92, 77, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (33, 93, 99, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (33, 94, 71, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (33, 95, 44, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (33, 96, 48, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (33, 97, 46, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (33, 98, 81, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (33, 99, 77, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (33, 100, 39, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (33, 101, 69, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (33, 102, 63, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (34, 84, 90, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (34, 85, 74, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (34, 86, 44, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (34, 87, 99, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (34, 88, 55, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (34, 89, 72, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (34, 90, 46, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (34, 91, 76, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (34, 92, 80, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (34, 93, 69, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (34, 94, 85, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (34, 95, 98, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (34, 96, 77, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (34, 97, 51, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (34, 98, 81, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (34, 99, 44, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (34, 100, 72, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (34, 101, 40, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (34, 102, 81, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (35, 84, 96, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (35, 85, 92, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (35, 86, 95, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (35, 87, 84, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (35, 88, 64, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (35, 89, 76, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (35, 90, 81, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (35, 91, 84, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (35, 92, 65, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (35, 93, 81, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (35, 94, 85, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (35, 95, 88, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (35, 96, 92, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (35, 97, 69, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (35, 98, 70, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (35, 99, 76, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (35, 100, 38, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (35, 101, 93, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (35, 102, 53, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (36, 84, 42, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (36, 85, 59, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (36, 86, 60, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (36, 87, 50, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (36, 88, 72, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (36, 89, 51, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (36, 90, 79, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (36, 91, 88, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (36, 92, 50, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (36, 93, 99, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (36, 94, 99, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (36, 95, 39, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (36, 96, 100, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (36, 97, 91, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (36, 98, 63, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (36, 99, 82, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (36, 100, 81, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (36, 101, 76, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (36, 102, 95, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (37, 84, 49, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (37, 85, 67, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (37, 86, 51, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (37, 87, 49, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (37, 88, 71, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (37, 89, 41, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (37, 90, 66, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (37, 91, 96, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (37, 92, 42, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (37, 93, 47, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (37, 94, 97, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (37, 95, 45, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (37, 96, 91, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (37, 97, 99, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (37, 98, 39, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (37, 99, 80, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (37, 100, 42, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (37, 101, 53, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (37, 102, 73, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (38, 84, 85, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (38, 85, 67, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (38, 86, 64, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (38, 87, 93, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (38, 88, 81, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (38, 89, 98, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (38, 90, 89, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (38, 91, 48, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (38, 92, 78, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (38, 93, 82, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (38, 94, 77, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (38, 95, 45, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (38, 96, 38, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (38, 97, 67, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (38, 98, 81, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (38, 99, 81, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (38, 100, 96, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (38, 101, 36, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (38, 102, 59, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (39, 84, 86, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (39, 85, 59, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (39, 86, 88, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (39, 87, 57, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (39, 88, 84, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (39, 89, 93, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (39, 90, 61, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (39, 91, 50, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (39, 92, 93, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (39, 93, 43, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (39, 94, 53, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (39, 95, 99, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (39, 96, 37, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (39, 97, 55, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (39, 98, 69, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (39, 99, 78, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (39, 100, 52, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (39, 101, 52, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (39, 102, 56, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (51, 84, 64, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (51, 85, 76, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (51, 86, 78, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (51, 87, 59, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (51, 88, 74, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (51, 89, 42, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (51, 90, 59, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (51, 91, 48, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (51, 92, 61, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (51, 93, 98, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (51, 94, 68, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (51, 95, 49, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (51, 96, 36, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (51, 97, 92, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (51, 98, 37, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (51, 99, 47, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (51, 100, 41, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (51, 101, 76, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (51, 102, 76, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (55, 84, 97, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (55, 85, 50, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (55, 86, 52, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (55, 87, 70, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (55, 88, 65, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (55, 89, 97, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (55, 90, 61, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (55, 91, 71, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (55, 92, 45, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (55, 93, 73, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (55, 94, 38, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (55, 95, 88, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (55, 96, 35, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (55, 97, 96, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (55, 98, 46, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (55, 99, 93, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (55, 100, 50, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (55, 101, 88, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (55, 102, 75, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (57, 84, 49, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (57, 85, 63, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (57, 86, 36, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (57, 87, 54, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (57, 88, 37, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (57, 89, 37, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (57, 90, 58, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (57, 91, 63, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (57, 92, 92, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (57, 93, 88, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (57, 94, 87, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (57, 95, 57, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (57, 96, 62, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (57, 97, 98, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (57, 98, 76, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (57, 99, 46, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (57, 100, 57, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (57, 101, 52, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (57, 102, 40, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (63, 84, 56, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (63, 85, 79, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (63, 86, 84, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (63, 87, 87, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (63, 88, 66, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (63, 89, 89, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (63, 90, 68, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (63, 91, 98, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (63, 92, 66, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (63, 93, 68, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (63, 94, 98, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (63, 95, 98, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (63, 96, 72, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (63, 97, 77, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (63, 98, 63, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (63, 99, 39, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (63, 100, 69, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (63, 101, 52, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (63, 102, 72, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (71, 84, 79, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (71, 85, 87, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (71, 86, 43, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (71, 87, 97, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (71, 88, 82, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (71, 89, 76, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (71, 90, 74, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (71, 91, 63, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (71, 92, 45, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (71, 93, 40, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (71, 94, 81, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (71, 95, 80, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (71, 96, 40, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (71, 97, 99, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (71, 98, 79, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (71, 99, 89, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (71, 100, 51, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (71, 101, 60, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (71, 102, 84, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (72, 84, 65, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (72, 85, 84, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (72, 86, 64, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (72, 87, 54, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (72, 88, 56, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (72, 89, 56, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (72, 90, 96, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (72, 91, 44, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (72, 92, 85, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (72, 93, 59, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (72, 94, 46, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (72, 95, 72, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (72, 96, 38, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (72, 97, 81, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (72, 98, 61, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (72, 99, 77, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (72, 100, 39, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (72, 101, 46, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (72, 102, 83, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (73, 84, 78, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (73, 85, 84, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (73, 86, 68, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (73, 87, 49, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (73, 88, 42, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (73, 89, 89, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (73, 90, 47, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (73, 91, 96, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (73, 92, 100, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (73, 93, 38, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (73, 94, 93, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (73, 95, 97, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (73, 96, 42, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (73, 97, 68, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (73, 98, 43, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (73, 99, 74, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (73, 100, 93, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (73, 101, 49, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (73, 102, 72, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (74, 84, 93, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (74, 85, 74, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (74, 86, 57, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (74, 87, 66, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (74, 88, 58, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (74, 89, 82, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (74, 90, 36, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (74, 91, 51, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (74, 92, 68, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (74, 93, 73, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (74, 94, 57, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (74, 95, 68, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (74, 96, 93, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (74, 97, 72, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (74, 98, 95, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (74, 99, 67, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (74, 100, 61, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (74, 101, 87, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (74, 102, 75, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (75, 84, 85, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (75, 85, 87, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (75, 86, 89, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (75, 87, 84, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (75, 88, 65, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (75, 89, 60, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (75, 90, 72, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (75, 91, 74, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (75, 92, 64, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (75, 93, 82, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (75, 94, 93, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (75, 95, 94, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (75, 96, 72, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (75, 97, 68, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (75, 98, 57, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (75, 99, 38, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (75, 100, 68, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (75, 101, 69, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (75, 102, 48, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (76, 84, 96, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (76, 85, 83, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (76, 86, 52, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (76, 87, 59, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (76, 88, 83, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (76, 89, 67, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (76, 90, 97, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (76, 91, 96, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (76, 92, 88, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (76, 93, 74, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (76, 94, 57, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (76, 95, 66, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (76, 96, 82, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (76, 97, 70, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (76, 98, 94, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (76, 99, 91, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (76, 100, 51, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (76, 101, 78, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (76, 102, 66, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (77, 84, 52, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (77, 85, 69, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (77, 86, 69, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (77, 87, 97, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (77, 88, 43, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (77, 89, 66, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (77, 90, 66, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (77, 91, 66, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (77, 92, 45, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (77, 93, 73, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (77, 94, 95, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (77, 95, 55, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (77, 96, 50, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (77, 97, 35, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (77, 98, 95, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (77, 99, 93, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (77, 100, 53, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (77, 101, 74, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (77, 102, 98, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (78, 84, 88, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (78, 85, 97, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (78, 86, 46, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (78, 87, 55, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (78, 88, 60, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (78, 89, 68, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (78, 90, 67, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (78, 91, 62, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (78, 92, 93, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (78, 93, 52, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (78, 94, 67, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (78, 95, 38, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (78, 96, 75, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (78, 97, 78, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (78, 98, 54, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (78, 99, 43, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (78, 100, 82, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (78, 101, 62, 0)
GO
INSERT [dbo].[Reiting] ([K_zapis], [Kod_student], [Reiting], [Prisutn]) VALUES (78, 102, 99, 0)
GO
SET IDENTITY_INSERT [dbo].[Rozklad_pids] ON 

GO
INSERT [dbo].[Rozklad_pids] ([K_zapis], [Date], [K_predm_pl], [Kod_group], [k_vilkad], [N_vedomost], [Zdacha_type]) VALUES (10, CAST(N'2017-01-06' AS Date), 244, N'ПІ-54', 1, NULL, 1)
GO
INSERT [dbo].[Rozklad_pids] ([K_zapis], [Date], [K_predm_pl], [Kod_group], [k_vilkad], [N_vedomost], [Zdacha_type]) VALUES (16, CAST(N'2017-01-06' AS Date), 245, N'ПІ-54', 2, NULL, 1)
GO
INSERT [dbo].[Rozklad_pids] ([K_zapis], [Date], [K_predm_pl], [Kod_group], [k_vilkad], [N_vedomost], [Zdacha_type]) VALUES (17, CAST(N'2017-01-06' AS Date), 90, N'ПІ-54', 1, NULL, 1)
GO
INSERT [dbo].[Rozklad_pids] ([K_zapis], [Date], [K_predm_pl], [Kod_group], [k_vilkad], [N_vedomost], [Zdacha_type]) VALUES (18, CAST(N'2017-01-06' AS Date), 87, N'ПІ-53', 2, NULL, 1)
GO
INSERT [dbo].[Rozklad_pids] ([K_zapis], [Date], [K_predm_pl], [Kod_group], [k_vilkad], [N_vedomost], [Zdacha_type]) VALUES (19, CAST(N'2017-01-06' AS Date), 86, N'ПІ-54', 2, NULL, 1)
GO
INSERT [dbo].[Rozklad_pids] ([K_zapis], [Date], [K_predm_pl], [Kod_group], [k_vilkad], [N_vedomost], [Zdacha_type]) VALUES (28, CAST(N'2017-06-01' AS Date), 89, N'ПІ-54', 2, NULL, 1)
GO
INSERT [dbo].[Rozklad_pids] ([K_zapis], [Date], [K_predm_pl], [Kod_group], [k_vilkad], [N_vedomost], [Zdacha_type]) VALUES (29, CAST(N'2017-06-01' AS Date), 87, N'ПІ-54', 2, NULL, 1)
GO
INSERT [dbo].[Rozklad_pids] ([K_zapis], [Date], [K_predm_pl], [Kod_group], [k_vilkad], [N_vedomost], [Zdacha_type]) VALUES (31, CAST(N'2018-01-06' AS Date), 87, N'ПІ-54', 2, NULL, 1)
GO
INSERT [dbo].[Rozklad_pids] ([K_zapis], [Date], [K_predm_pl], [Kod_group], [k_vilkad], [N_vedomost], [Zdacha_type]) VALUES (32, CAST(N'2018-01-06' AS Date), 90, N'ПІ-54', 2, NULL, 1)
GO
INSERT [dbo].[Rozklad_pids] ([K_zapis], [Date], [K_predm_pl], [Kod_group], [k_vilkad], [N_vedomost], [Zdacha_type]) VALUES (33, CAST(N'2018-01-06' AS Date), 97, N'ПІ-54', 2, NULL, 1)
GO
INSERT [dbo].[Rozklad_pids] ([K_zapis], [Date], [K_predm_pl], [Kod_group], [k_vilkad], [N_vedomost], [Zdacha_type]) VALUES (34, CAST(N'2018-01-06' AS Date), 95, N'ПІ-54', 2, NULL, 1)
GO
INSERT [dbo].[Rozklad_pids] ([K_zapis], [Date], [K_predm_pl], [Kod_group], [k_vilkad], [N_vedomost], [Zdacha_type]) VALUES (35, CAST(N'2018-01-06' AS Date), 99, N'ПІ-54', 2, NULL, 1)
GO
INSERT [dbo].[Rozklad_pids] ([K_zapis], [Date], [K_predm_pl], [Kod_group], [k_vilkad], [N_vedomost], [Zdacha_type]) VALUES (36, CAST(N'2018-01-06' AS Date), 94, N'ПІ-54', 2, NULL, 1)
GO
INSERT [dbo].[Rozklad_pids] ([K_zapis], [Date], [K_predm_pl], [Kod_group], [k_vilkad], [N_vedomost], [Zdacha_type]) VALUES (37, CAST(N'2018-01-06' AS Date), 93, N'ПІ-54', 3, NULL, 0)
GO
INSERT [dbo].[Rozklad_pids] ([K_zapis], [Date], [K_predm_pl], [Kod_group], [k_vilkad], [N_vedomost], [Zdacha_type]) VALUES (38, CAST(N'2018-01-06' AS Date), 92, N'ПІ-54', 2, NULL, 1)
GO
INSERT [dbo].[Rozklad_pids] ([K_zapis], [Date], [K_predm_pl], [Kod_group], [k_vilkad], [N_vedomost], [Zdacha_type]) VALUES (39, CAST(N'2018-01-06' AS Date), 91, N'ПІ-54', 3, NULL, 1)
GO
INSERT [dbo].[Rozklad_pids] ([K_zapis], [Date], [K_predm_pl], [Kod_group], [k_vilkad], [N_vedomost], [Zdacha_type]) VALUES (51, CAST(N'2018-07-01' AS Date), 90, N'ПІ-54', 1, NULL, 1)
GO
INSERT [dbo].[Rozklad_pids] ([K_zapis], [Date], [K_predm_pl], [Kod_group], [k_vilkad], [N_vedomost], [Zdacha_type]) VALUES (55, CAST(N'2018-07-01' AS Date), 90, N'ПІ-54', 2, NULL, 1)
GO
INSERT [dbo].[Rozklad_pids] ([K_zapis], [Date], [K_predm_pl], [Kod_group], [k_vilkad], [N_vedomost], [Zdacha_type]) VALUES (57, CAST(N'2018-07-01' AS Date), 90, N'ПІ-54', 2, NULL, 1)
GO
INSERT [dbo].[Rozklad_pids] ([K_zapis], [Date], [K_predm_pl], [Kod_group], [k_vilkad], [N_vedomost], [Zdacha_type]) VALUES (63, CAST(N'2018-09-06' AS Date), 90, N'ПІ-54', 1, NULL, 1)
GO
INSERT [dbo].[Rozklad_pids] ([K_zapis], [Date], [K_predm_pl], [Kod_group], [k_vilkad], [N_vedomost], [Zdacha_type]) VALUES (71, CAST(N'2018-09-06' AS Date), 90, N'ПІ-54', 1, NULL, 1)
GO
INSERT [dbo].[Rozklad_pids] ([K_zapis], [Date], [K_predm_pl], [Kod_group], [k_vilkad], [N_vedomost], [Zdacha_type]) VALUES (72, CAST(N'2018-09-06' AS Date), 92, N'ПІ-54', 1, NULL, 1)
GO
INSERT [dbo].[Rozklad_pids] ([K_zapis], [Date], [K_predm_pl], [Kod_group], [k_vilkad], [N_vedomost], [Zdacha_type]) VALUES (73, CAST(N'2018-09-06' AS Date), 94, N'ПІ-54', 1, NULL, 1)
GO
INSERT [dbo].[Rozklad_pids] ([K_zapis], [Date], [K_predm_pl], [Kod_group], [k_vilkad], [N_vedomost], [Zdacha_type]) VALUES (74, CAST(N'2018-09-06' AS Date), 91, N'ПІ-54', 3, NULL, 1)
GO
INSERT [dbo].[Rozklad_pids] ([K_zapis], [Date], [K_predm_pl], [Kod_group], [k_vilkad], [N_vedomost], [Zdacha_type]) VALUES (75, CAST(N'2018-09-06' AS Date), 94, N'ПІ-54', 2, NULL, 1)
GO
INSERT [dbo].[Rozklad_pids] ([K_zapis], [Date], [K_predm_pl], [Kod_group], [k_vilkad], [N_vedomost], [Zdacha_type]) VALUES (76, CAST(N'2018-09-06' AS Date), 90, N'ПІ-54', 3, NULL, 1)
GO
INSERT [dbo].[Rozklad_pids] ([K_zapis], [Date], [K_predm_pl], [Kod_group], [k_vilkad], [N_vedomost], [Zdacha_type]) VALUES (77, CAST(N'2018-09-06' AS Date), 91, N'ПІ-54', 2, NULL, 1)
GO
INSERT [dbo].[Rozklad_pids] ([K_zapis], [Date], [K_predm_pl], [Kod_group], [k_vilkad], [N_vedomost], [Zdacha_type]) VALUES (78, CAST(N'2018-09-06' AS Date), 89, N'ПІ-54', 3, NULL, 1)
GO
SET IDENTITY_INSERT [dbo].[Rozklad_pids] OFF
GO
SET IDENTITY_INSERT [dbo].[Spetsialnost] ON 

GO
INSERT [dbo].[Spetsialnost] ([Shifr], [Nazva], [Kvalif], [K_spets]) VALUES (N'6.050201', N'Системна інженерія', N'Фахівець з системної інженерії', 1)
GO
INSERT [dbo].[Spetsialnost] ([Shifr], [Nazva], [Kvalif], [K_spets]) VALUES (N'6.170101', N'Безпека інформаційних і комунікаційних систем', N'Фахівець з безпеки інф. І ком.систем', 2)
GO
SET IDENTITY_INSERT [dbo].[Spetsialnost] OFF
GO
SET IDENTITY_INSERT [dbo].[Vikladach] ON 

GO
INSERT [dbo].[Vikladach] ([k_vilkad], [SName], [Name], [FName], [Posada], [Zvannya], [Stupen], [Kafedra]) VALUES (1, N'ывап', N'ывап', N'вап', N'асистент', N'с.н.с.', N'к.т.н.', N'7')
GO
INSERT [dbo].[Vikladach] ([k_vilkad], [SName], [Name], [FName], [Posada], [Zvannya], [Stupen], [Kafedra]) VALUES (2, N'чсаичи', N'чсмичс', N'чсмич', N'доцент', N'доцент', N'к.ф.н.', N'8')
GO
INSERT [dbo].[Vikladach] ([k_vilkad], [SName], [Name], [FName], [Posada], [Zvannya], [Stupen], [Kafedra]) VALUES (3, N'йцук', N'йцук', N'цйку', N'асистент', NULL, N'к.пед.н.', N'7')
GO
SET IDENTITY_INSERT [dbo].[Vikladach] OFF
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [PrimaryKey]    Script Date: 26.03.2018 15:29:58 ******/
ALTER TABLE [dbo].[dbo_groups] ADD  CONSTRAINT [PrimaryKey] PRIMARY KEY NONCLUSTERED 
(
	[Kod_group] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [XPKPredmet_plan]    Script Date: 26.03.2018 15:29:58 ******/
ALTER TABLE [dbo].[Predmet_plan] ADD  CONSTRAINT [XPKPredmet_plan] PRIMARY KEY NONCLUSTERED 
(
	[K_predm_pl] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [XPKSpetsialnost]    Script Date: 26.03.2018 15:29:58 ******/
ALTER TABLE [dbo].[Spetsialnost] ADD  CONSTRAINT [XPKSpetsialnost] PRIMARY KEY NONCLUSTERED 
(
	[K_spets] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [XPKVikladach]    Script Date: 26.03.2018 15:29:58 ******/
ALTER TABLE [dbo].[Vikladach] ADD  CONSTRAINT [XPKVikladach] PRIMARY KEY NONCLUSTERED 
(
	[k_vilkad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Reiting] ADD  CONSTRAINT [DEFAULT_1_0_1033926184]  DEFAULT ((1)) FOR [Kod_student]
GO
ALTER TABLE [dbo].[Reiting] ADD  CONSTRAINT [DEFAULT_1_0_1158685018]  DEFAULT ((1)) FOR [Reiting]
GO
ALTER TABLE [dbo].[Reiting] ADD  CONSTRAINT [DEFAULT_1_0_1276062573]  DEFAULT ((1)) FOR [Prisutn]
GO
ALTER TABLE [dbo].[Rozklad_pids] ADD  CONSTRAINT [DF_Rozklad_pids_Zdacha_type]  DEFAULT ((0)) FOR [Zdacha_type]
GO
ALTER TABLE [dbo].[dbo_student]  WITH CHECK ADD FOREIGN KEY([Kod_group])
REFERENCES [dbo].[dbo_groups] ([Kod_group])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Navch_plan]  WITH CHECK ADD  CONSTRAINT [FK_Navch_plan_Form_navch1] FOREIGN KEY([k_form])
REFERENCES [dbo].[Form_navch] ([K_form])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Navch_plan] CHECK CONSTRAINT [FK_Navch_plan_Form_navch1]
GO
ALTER TABLE [dbo].[Navch_plan]  WITH CHECK ADD  CONSTRAINT [R_18] FOREIGN KEY([K_spets])
REFERENCES [dbo].[Spetsialnost] ([K_spets])
GO
ALTER TABLE [dbo].[Navch_plan] CHECK CONSTRAINT [R_18]
GO
ALTER TABLE [dbo].[Predmet_plan]  WITH CHECK ADD  CONSTRAINT [FK_Predmet_plan_Form_kontr1] FOREIGN KEY([k_fk])
REFERENCES [dbo].[form_kontr] ([k_fk])
GO
ALTER TABLE [dbo].[Predmet_plan] CHECK CONSTRAINT [FK_Predmet_plan_Form_kontr1]
GO
ALTER TABLE [dbo].[Predmet_plan]  WITH CHECK ADD  CONSTRAINT [FK_Predmet_plan_predmet] FOREIGN KEY([K_predmet])
REFERENCES [dbo].[predmet] ([K_predmet])
GO
ALTER TABLE [dbo].[Predmet_plan] CHECK CONSTRAINT [FK_Predmet_plan_predmet]
GO
ALTER TABLE [dbo].[Predmet_plan]  WITH CHECK ADD  CONSTRAINT [R_12] FOREIGN KEY([K_navch_plan])
REFERENCES [dbo].[Navch_plan] ([K_navch_plan])
GO
ALTER TABLE [dbo].[Predmet_plan] CHECK CONSTRAINT [R_12]
GO
ALTER TABLE [dbo].[Reiting]  WITH CHECK ADD  CONSTRAINT [FK_Reiting_dbo_student] FOREIGN KEY([Kod_student])
REFERENCES [dbo].[dbo_student] ([Kod_stud])
GO
ALTER TABLE [dbo].[Reiting] CHECK CONSTRAINT [FK_Reiting_dbo_student]
GO
ALTER TABLE [dbo].[Reiting]  WITH NOCHECK ADD  CONSTRAINT [FK_Reiting_Rozklad_pids] FOREIGN KEY([K_zapis])
REFERENCES [dbo].[Rozklad_pids] ([K_zapis])
GO
ALTER TABLE [dbo].[Reiting] CHECK CONSTRAINT [FK_Reiting_Rozklad_pids]
GO
ALTER TABLE [dbo].[Rozklad_pids]  WITH CHECK ADD FOREIGN KEY([Kod_group])
REFERENCES [dbo].[dbo_groups] ([Kod_group])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
EXEC sys.sp_addextendedproperty @name=N'MS_AggregateType', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dbo_groups', @level2type=N'COLUMN',@level2name=N'Kod_group'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dbo_groups', @level2type=N'COLUMN',@level2name=N'Kod_group'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dbo_groups', @level2type=N'COLUMN',@level2name=N'Kod_group'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dbo_groups', @level2type=N'COLUMN',@level2name=N'Kod_group'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TextAlign', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dbo_groups', @level2type=N'COLUMN',@level2name=N'Kod_group'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_AggregateType', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dbo_groups', @level2type=N'COLUMN',@level2name=N'Kod_men'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dbo_groups', @level2type=N'COLUMN',@level2name=N'Kod_men'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dbo_groups', @level2type=N'COLUMN',@level2name=N'Kod_men'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dbo_groups', @level2type=N'COLUMN',@level2name=N'Kod_men'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TextAlign', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dbo_groups', @level2type=N'COLUMN',@level2name=N'Kod_men'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_AggregateType', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dbo_groups', @level2type=N'COLUMN',@level2name=N'Kod_zhurn'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dbo_groups', @level2type=N'COLUMN',@level2name=N'Kod_zhurn'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dbo_groups', @level2type=N'COLUMN',@level2name=N'Kod_zhurn'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dbo_groups', @level2type=N'COLUMN',@level2name=N'Kod_zhurn'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TextAlign', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dbo_groups', @level2type=N'COLUMN',@level2name=N'Kod_zhurn'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_AggregateType', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dbo_groups', @level2type=N'COLUMN',@level2name=N'K_navch_plan'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dbo_groups', @level2type=N'COLUMN',@level2name=N'K_navch_plan'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dbo_groups', @level2type=N'COLUMN',@level2name=N'K_navch_plan'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dbo_groups', @level2type=N'COLUMN',@level2name=N'K_navch_plan'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TextAlign', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dbo_groups', @level2type=N'COLUMN',@level2name=N'K_navch_plan'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_AggregateType', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dbo_groups', @level2type=N'COLUMN',@level2name=N'kilk'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dbo_groups', @level2type=N'COLUMN',@level2name=N'kilk'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dbo_groups', @level2type=N'COLUMN',@level2name=N'kilk'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dbo_groups', @level2type=N'COLUMN',@level2name=N'kilk'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TextAlign', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dbo_groups', @level2type=N'COLUMN',@level2name=N'kilk'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DefaultView', @value=0x02 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dbo_groups'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Filter', @value=NULL , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dbo_groups'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_FilterOnLoad', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dbo_groups'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_HideNewField', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dbo_groups'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_LinkChildFields', @value=N'Kod_group' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dbo_groups'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_LinkMasterFields', @value=N'Kod_group' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dbo_groups'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_OrderBy', @value=NULL , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dbo_groups'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_OrderByOn', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dbo_groups'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_OrderByOnLoad', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dbo_groups'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Orientation', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dbo_groups'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SubdatasheetName', @value=N'dbo.dbo_student' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dbo_groups'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TableMaxRecords', @value=10000 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dbo_groups'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TotalsRow', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dbo_groups'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Navch_plan', @level2type=N'COLUMN',@level2name=N'K_navch_plan'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Navch_plan', @level2type=N'COLUMN',@level2name=N'K_navch_plan'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Navch_plan', @level2type=N'COLUMN',@level2name=N'K_navch_plan'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Navch_plan', @level2type=N'COLUMN',@level2name=N'K_spets'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Navch_plan', @level2type=N'COLUMN',@level2name=N'K_spets'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=1440 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Navch_plan', @level2type=N'COLUMN',@level2name=N'K_spets'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Navch_plan', @level2type=N'COLUMN',@level2name=N'year_nabor'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Navch_plan', @level2type=N'COLUMN',@level2name=N'year_nabor'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Navch_plan', @level2type=N'COLUMN',@level2name=N'year_nabor'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Navch_plan', @level2type=N'COLUMN',@level2name=N'year_vypusk'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Navch_plan', @level2type=N'COLUMN',@level2name=N'year_vypusk'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Navch_plan', @level2type=N'COLUMN',@level2name=N'year_vypusk'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Navch_plan', @level2type=N'COLUMN',@level2name=N'k_form'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Navch_plan', @level2type=N'COLUMN',@level2name=N'k_form'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Navch_plan', @level2type=N'COLUMN',@level2name=N'k_form'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DefaultView', @value=0x02 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Navch_plan'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Filter', @value=NULL , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Navch_plan'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_LinkChildFields', @value=N'K_navch_plan' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Navch_plan'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_LinkMasterFields', @value=N'K_navch_plan' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Navch_plan'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_OrderBy', @value=NULL , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Navch_plan'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_OrderByOn', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Navch_plan'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Orientation', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Navch_plan'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SubdatasheetName', @value=N'dbo.dbo_groups' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Navch_plan'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TableMaxRecords', @value=10000 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Navch_plan'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'predmet', @level2type=N'COLUMN',@level2name=N'K_predmet'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'predmet', @level2type=N'COLUMN',@level2name=N'K_predmet'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'predmet', @level2type=N'COLUMN',@level2name=N'K_predmet'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'predmet', @level2type=N'COLUMN',@level2name=N'Nazva'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'predmet', @level2type=N'COLUMN',@level2name=N'Nazva'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=1695 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'predmet', @level2type=N'COLUMN',@level2name=N'Nazva'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'predmet', @level2type=N'COLUMN',@level2name=N'Nazva_skor'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'predmet', @level2type=N'COLUMN',@level2name=N'Nazva_skor'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'predmet', @level2type=N'COLUMN',@level2name=N'Nazva_skor'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DefaultView', @value=0x02 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'predmet'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Filter', @value=NULL , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'predmet'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_OrderBy', @value=NULL , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'predmet'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_OrderByOn', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'predmet'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Orientation', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'predmet'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TableMaxRecords', @value=10000 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'predmet'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_AggregateType', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Predmet_plan', @level2type=N'COLUMN',@level2name=N'K_predm_pl'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Predmet_plan', @level2type=N'COLUMN',@level2name=N'K_predm_pl'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Predmet_plan', @level2type=N'COLUMN',@level2name=N'K_predm_pl'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Predmet_plan', @level2type=N'COLUMN',@level2name=N'K_predm_pl'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TextAlign', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Predmet_plan', @level2type=N'COLUMN',@level2name=N'K_predm_pl'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_AggregateType', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Predmet_plan', @level2type=N'COLUMN',@level2name=N'K_predmet'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Predmet_plan', @level2type=N'COLUMN',@level2name=N'K_predmet'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Predmet_plan', @level2type=N'COLUMN',@level2name=N'K_predmet'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Predmet_plan', @level2type=N'COLUMN',@level2name=N'K_predmet'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TextAlign', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Predmet_plan', @level2type=N'COLUMN',@level2name=N'K_predmet'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_AggregateType', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Predmet_plan', @level2type=N'COLUMN',@level2name=N'K_navch_plan'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Predmet_plan', @level2type=N'COLUMN',@level2name=N'K_navch_plan'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Predmet_plan', @level2type=N'COLUMN',@level2name=N'K_navch_plan'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Predmet_plan', @level2type=N'COLUMN',@level2name=N'K_navch_plan'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TextAlign', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Predmet_plan', @level2type=N'COLUMN',@level2name=N'K_navch_plan'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_AggregateType', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Predmet_plan', @level2type=N'COLUMN',@level2name=N'Chas_Lek'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Predmet_plan', @level2type=N'COLUMN',@level2name=N'Chas_Lek'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Predmet_plan', @level2type=N'COLUMN',@level2name=N'Chas_Lek'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Predmet_plan', @level2type=N'COLUMN',@level2name=N'Chas_Lek'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TextAlign', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Predmet_plan', @level2type=N'COLUMN',@level2name=N'Chas_Lek'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_AggregateType', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Predmet_plan', @level2type=N'COLUMN',@level2name=N'Cahs_pr'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Predmet_plan', @level2type=N'COLUMN',@level2name=N'Cahs_pr'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Predmet_plan', @level2type=N'COLUMN',@level2name=N'Cahs_pr'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Predmet_plan', @level2type=N'COLUMN',@level2name=N'Cahs_pr'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TextAlign', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Predmet_plan', @level2type=N'COLUMN',@level2name=N'Cahs_pr'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_AggregateType', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Predmet_plan', @level2type=N'COLUMN',@level2name=N'Chas_all'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Predmet_plan', @level2type=N'COLUMN',@level2name=N'Chas_all'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Predmet_plan', @level2type=N'COLUMN',@level2name=N'Chas_all'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Predmet_plan', @level2type=N'COLUMN',@level2name=N'Chas_all'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TextAlign', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Predmet_plan', @level2type=N'COLUMN',@level2name=N'Chas_all'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_AggregateType', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Predmet_plan', @level2type=N'COLUMN',@level2name=N'Chas_Labor'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Predmet_plan', @level2type=N'COLUMN',@level2name=N'Chas_Labor'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Predmet_plan', @level2type=N'COLUMN',@level2name=N'Chas_Labor'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Predmet_plan', @level2type=N'COLUMN',@level2name=N'Chas_Labor'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TextAlign', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Predmet_plan', @level2type=N'COLUMN',@level2name=N'Chas_Labor'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_AggregateType', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Predmet_plan', @level2type=N'COLUMN',@level2name=N'Chas_sem'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Predmet_plan', @level2type=N'COLUMN',@level2name=N'Chas_sem'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Predmet_plan', @level2type=N'COLUMN',@level2name=N'Chas_sem'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Predmet_plan', @level2type=N'COLUMN',@level2name=N'Chas_sem'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TextAlign', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Predmet_plan', @level2type=N'COLUMN',@level2name=N'Chas_sem'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_AggregateType', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Predmet_plan', @level2type=N'COLUMN',@level2name=N'Kilk_modul'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Predmet_plan', @level2type=N'COLUMN',@level2name=N'Kilk_modul'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Predmet_plan', @level2type=N'COLUMN',@level2name=N'Kilk_modul'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Predmet_plan', @level2type=N'COLUMN',@level2name=N'Kilk_modul'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TextAlign', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Predmet_plan', @level2type=N'COLUMN',@level2name=N'Kilk_modul'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_AggregateType', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Predmet_plan', @level2type=N'COLUMN',@level2name=N'Cahs_sam'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Predmet_plan', @level2type=N'COLUMN',@level2name=N'Cahs_sam'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Predmet_plan', @level2type=N'COLUMN',@level2name=N'Cahs_sam'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Predmet_plan', @level2type=N'COLUMN',@level2name=N'Cahs_sam'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TextAlign', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Predmet_plan', @level2type=N'COLUMN',@level2name=N'Cahs_sam'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_AggregateType', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Predmet_plan', @level2type=N'COLUMN',@level2name=N'Semestr'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Predmet_plan', @level2type=N'COLUMN',@level2name=N'Semestr'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Predmet_plan', @level2type=N'COLUMN',@level2name=N'Semestr'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Predmet_plan', @level2type=N'COLUMN',@level2name=N'Semestr'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TextAlign', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Predmet_plan', @level2type=N'COLUMN',@level2name=N'Semestr'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_AggregateType', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Predmet_plan', @level2type=N'COLUMN',@level2name=N'Shifr_predmet'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Predmet_plan', @level2type=N'COLUMN',@level2name=N'Shifr_predmet'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Predmet_plan', @level2type=N'COLUMN',@level2name=N'Shifr_predmet'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Predmet_plan', @level2type=N'COLUMN',@level2name=N'Shifr_predmet'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TextAlign', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Predmet_plan', @level2type=N'COLUMN',@level2name=N'Shifr_predmet'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_AggregateType', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Predmet_plan', @level2type=N'COLUMN',@level2name=N'k_fk'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Predmet_plan', @level2type=N'COLUMN',@level2name=N'k_fk'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Predmet_plan', @level2type=N'COLUMN',@level2name=N'k_fk'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Predmet_plan', @level2type=N'COLUMN',@level2name=N'k_fk'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TextAlign', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Predmet_plan', @level2type=N'COLUMN',@level2name=N'k_fk'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DefaultView', @value=0x02 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Predmet_plan'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Filter', @value=N'([Predmet_plan].[K_navch_plan]=17)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Predmet_plan'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_FilterOnLoad', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Predmet_plan'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_HideNewField', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Predmet_plan'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_OrderBy', @value=NULL , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Predmet_plan'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_OrderByOn', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Predmet_plan'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_OrderByOnLoad', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Predmet_plan'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Orientation', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Predmet_plan'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TableMaxRecords', @value=10000 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Predmet_plan'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TotalsRow', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Predmet_plan'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Vikladach', @level2type=N'COLUMN',@level2name=N'k_vilkad'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Vikladach', @level2type=N'COLUMN',@level2name=N'k_vilkad'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Vikladach', @level2type=N'COLUMN',@level2name=N'k_vilkad'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Vikladach', @level2type=N'COLUMN',@level2name=N'FIO'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Vikladach', @level2type=N'COLUMN',@level2name=N'FIO'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Vikladach', @level2type=N'COLUMN',@level2name=N'FIO'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Vikladach', @level2type=N'COLUMN',@level2name=N'SName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=3 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Vikladach', @level2type=N'COLUMN',@level2name=N'SName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Vikladach', @level2type=N'COLUMN',@level2name=N'SName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Vikladach', @level2type=N'COLUMN',@level2name=N'Name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=4 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Vikladach', @level2type=N'COLUMN',@level2name=N'Name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Vikladach', @level2type=N'COLUMN',@level2name=N'Name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Vikladach', @level2type=N'COLUMN',@level2name=N'FName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=5 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Vikladach', @level2type=N'COLUMN',@level2name=N'FName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Vikladach', @level2type=N'COLUMN',@level2name=N'FName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Vikladach', @level2type=N'COLUMN',@level2name=N'Posada'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=6 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Vikladach', @level2type=N'COLUMN',@level2name=N'Posada'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Vikladach', @level2type=N'COLUMN',@level2name=N'Posada'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Vikladach', @level2type=N'COLUMN',@level2name=N'Zvannya'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=7 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Vikladach', @level2type=N'COLUMN',@level2name=N'Zvannya'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Vikladach', @level2type=N'COLUMN',@level2name=N'Zvannya'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Vikladach', @level2type=N'COLUMN',@level2name=N'Stupen'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=8 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Vikladach', @level2type=N'COLUMN',@level2name=N'Stupen'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Vikladach', @level2type=N'COLUMN',@level2name=N'Stupen'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHidden', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Vikladach', @level2type=N'COLUMN',@level2name=N'Kafedra'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnOrder', @value=9 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Vikladach', @level2type=N'COLUMN',@level2name=N'Kafedra'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidth', @value=-1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Vikladach', @level2type=N'COLUMN',@level2name=N'Kafedra'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DefaultView', @value=0x02 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Vikladach'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Filter', @value=NULL , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Vikladach'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_OrderBy', @value=NULL , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Vikladach'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_OrderByOn', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Vikladach'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Orientation', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Vikladach'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TableMaxRecords', @value=10000 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Vikladach'
GO
