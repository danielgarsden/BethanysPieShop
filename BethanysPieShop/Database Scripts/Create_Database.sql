CREATE DATABASE [BethanysPieShop]

USE [BethanysPieShop]
GO

/****** Object: Table [dbo].[Categories] Script Date: 09/06/2020 21:10:07 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Categories] (
    [CategoryId]   INT            IDENTITY (1, 1) NOT NULL,
    [CategoryName] NVARCHAR (MAX) NULL,
    [Description]  NVARCHAR (MAX) NULL
);

/****** Object: Table [dbo].[Pies] Script Date: 09/06/2020 21:10:18 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Pies] (
    [PieId]              INT             IDENTITY (1, 1) NOT NULL,
    [Name]               NVARCHAR (MAX)  NULL,
    [ShortDescription]   NVARCHAR (MAX)  NULL,
    [LongDescription]    NVARCHAR (MAX)  NULL,
    [AllergyInformation] NVARCHAR (MAX)  NULL,
    [Price]              DECIMAL (18, 2) NOT NULL,
    [ImageUrl]           NVARCHAR (MAX)  NULL,
    [ImageThumbnailUrl]  NVARCHAR (MAX)  NULL,
    [IsPieOfTheWeek]     BIT             NOT NULL,
    [InStock]            BIT             NOT NULL,
    [CategoryId]         INT             NOT NULL,
    [Notes]              NVARCHAR (MAX)  NULL
);


GO
CREATE NONCLUSTERED INDEX [IX_Pies_CategoryId]
    ON [dbo].[Pies]([CategoryId] ASC);


GO
ALTER TABLE [dbo].[Pies]
    ADD CONSTRAINT [PK_Pies] PRIMARY KEY CLUSTERED ([PieId] ASC);


GO
ALTER TABLE [dbo].[Pies]
    ADD CONSTRAINT [FK_Pies_Categories_CategoryId] FOREIGN KEY ([CategoryId]) REFERENCES [dbo].[Categories] ([CategoryId]) ON DELETE CASCADE;


/****** Object: Table [dbo].[ShoppingCartItems] Script Date: 09/06/2020 21:10:44 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[ShoppingCartItems] (
    [ShoppingCartItemId] INT            IDENTITY (1, 1) NOT NULL,
    [PieId]              INT            NULL,
    [Amount]             INT            NOT NULL,
    [ShoppingCartId]     NVARCHAR (MAX) NULL
);


GO
CREATE NONCLUSTERED INDEX [IX_ShoppingCartItems_PieId]
    ON [dbo].[ShoppingCartItems]([PieId] ASC);


GO
ALTER TABLE [dbo].[ShoppingCartItems]
    ADD CONSTRAINT [PK_ShoppingCartItems] PRIMARY KEY CLUSTERED ([ShoppingCartItemId] ASC);


GO
ALTER TABLE [dbo].[ShoppingCartItems]
    ADD CONSTRAINT [FK_ShoppingCartItems_Pies_PieId] FOREIGN KEY ([PieId]) REFERENCES [dbo].[Pies] ([PieId]);

SET IDENTITY_INSERT [dbo].[Categories] ON
INSERT INTO [dbo].[Categories] ([CategoryId], [CategoryName], [Description]) VALUES (1, N'Fruit pies', NULL)
INSERT INTO [dbo].[Categories] ([CategoryId], [CategoryName], [Description]) VALUES (2, N'Cheese cakes', NULL)
INSERT INTO [dbo].[Categories] ([CategoryId], [CategoryName], [Description]) VALUES (3, N'Seasonal pies', NULL)
SET IDENTITY_INSERT [dbo].[Categories] OFF

SET IDENTITY_INSERT [dbo].[Pies] ON
INSERT INTO [dbo].[Pies] ([PieId], [Name], [ShortDescription], [LongDescription], [AllergyInformation], [Price], [ImageUrl], [ImageThumbnailUrl], [IsPieOfTheWeek], [InStock], [CategoryId], [Notes]) VALUES (1, N'Apple Pie', N'Our famous apple pies!', N'Icing carrot cake jelly-o cheesecake. Sweet roll marzipan marshmallow toffee brownie brownie candy tootsie roll. Chocolate cake gingerbread tootsie roll oat cake pie chocolate bar cookie dragée brownie. Lollipop cotton candy cake bear claw oat cake. Dragée candy canes dessert tart. Marzipan dragée gummies lollipop jujubes chocolate bar candy canes. Icing gingerbread chupa chups cotton candy cookie sweet icing bonbon gummies. Gummies lollipop brownie biscuit danish chocolate cake. Danish powder cookie macaroon chocolate donut tart. Carrot cake dragée croissant lemon drops liquorice lemon drops cookie lollipop toffee. Carrot cake carrot cake liquorice sugar plum topping bonbon pie muffin jujubes. Jelly pastry wafer tart caramels bear claw. Tiramisu tart pie cake danish lemon drops. Brownie cupcake dragée gummies.', N'', CAST(12.95 AS Decimal(18, 2)), N'https://gillcleerenpluralsight.blob.core.windows.net/files/applepie.jpg', N'https://gillcleerenpluralsight.blob.core.windows.net/files/applepiesmall.jpg', 1, 1, 1, NULL)
INSERT INTO [dbo].[Pies] ([PieId], [Name], [ShortDescription], [LongDescription], [AllergyInformation], [Price], [ImageUrl], [ImageThumbnailUrl], [IsPieOfTheWeek], [InStock], [CategoryId], [Notes]) VALUES (2, N'Blueberry Cheese Cake', N'You''ll love it!', N'Icing carrot cake jelly-o cheesecake. Sweet roll marzipan marshmallow toffee brownie brownie candy tootsie roll. Chocolate cake gingerbread tootsie roll oat cake pie chocolate bar cookie dragée brownie. Lollipop cotton candy cake bear claw oat cake. Dragée candy canes dessert tart. Marzipan dragée gummies lollipop jujubes chocolate bar candy canes. Icing gingerbread chupa chups cotton candy cookie sweet icing bonbon gummies. Gummies lollipop brownie biscuit danish chocolate cake. Danish powder cookie macaroon chocolate donut tart. Carrot cake dragée croissant lemon drops liquorice lemon drops cookie lollipop toffee. Carrot cake carrot cake liquorice sugar plum topping bonbon pie muffin jujubes. Jelly pastry wafer tart caramels bear claw. Tiramisu tart pie cake danish lemon drops. Brownie cupcake dragée gummies.', N'', CAST(18.95 AS Decimal(18, 2)), N'https://gillcleerenpluralsight.blob.core.windows.net/files/blueberrycheesecake.jpg', N'https://gillcleerenpluralsight.blob.core.windows.net/files/blueberrycheesecakesmall.jpg', 0, 1, 2, NULL)
INSERT INTO [dbo].[Pies] ([PieId], [Name], [ShortDescription], [LongDescription], [AllergyInformation], [Price], [ImageUrl], [ImageThumbnailUrl], [IsPieOfTheWeek], [InStock], [CategoryId], [Notes]) VALUES (3, N'Cheese Cake', N'Plain cheese cake. Plain pleasure.', N'Icing carrot cake jelly-o cheesecake. Sweet roll marzipan marshmallow toffee brownie brownie candy tootsie roll. Chocolate cake gingerbread tootsie roll oat cake pie chocolate bar cookie dragée brownie. Lollipop cotton candy cake bear claw oat cake. Dragée candy canes dessert tart. Marzipan dragée gummies lollipop jujubes chocolate bar candy canes. Icing gingerbread chupa chups cotton candy cookie sweet icing bonbon gummies. Gummies lollipop brownie biscuit danish chocolate cake. Danish powder cookie macaroon chocolate donut tart. Carrot cake dragée croissant lemon drops liquorice lemon drops cookie lollipop toffee. Carrot cake carrot cake liquorice sugar plum topping bonbon pie muffin jujubes. Jelly pastry wafer tart caramels bear claw. Tiramisu tart pie cake danish lemon drops. Brownie cupcake dragée gummies.', N'', CAST(18.95 AS Decimal(18, 2)), N'https://gillcleerenpluralsight.blob.core.windows.net/files/cheesecake.jpg', N'https://gillcleerenpluralsight.blob.core.windows.net/files/cheesecakesmall.jpg', 0, 1, 2, NULL)
INSERT INTO [dbo].[Pies] ([PieId], [Name], [ShortDescription], [LongDescription], [AllergyInformation], [Price], [ImageUrl], [ImageThumbnailUrl], [IsPieOfTheWeek], [InStock], [CategoryId], [Notes]) VALUES (4, N'Cherry Pie', N'A summer classic!', N'Icing carrot cake jelly-o cheesecake. Sweet roll marzipan marshmallow toffee brownie brownie candy tootsie roll. Chocolate cake gingerbread tootsie roll oat cake pie chocolate bar cookie dragée brownie. Lollipop cotton candy cake bear claw oat cake. Dragée candy canes dessert tart. Marzipan dragée gummies lollipop jujubes chocolate bar candy canes. Icing gingerbread chupa chups cotton candy cookie sweet icing bonbon gummies. Gummies lollipop brownie biscuit danish chocolate cake. Danish powder cookie macaroon chocolate donut tart. Carrot cake dragée croissant lemon drops liquorice lemon drops cookie lollipop toffee. Carrot cake carrot cake liquorice sugar plum topping bonbon pie muffin jujubes. Jelly pastry wafer tart caramels bear claw. Tiramisu tart pie cake danish lemon drops. Brownie cupcake dragée gummies.', N'', CAST(15.95 AS Decimal(18, 2)), N'https://gillcleerenpluralsight.blob.core.windows.net/files/cherrypie.jpg', N'https://gillcleerenpluralsight.blob.core.windows.net/files/cherrypiesmall.jpg', 0, 1, 1, NULL)
INSERT INTO [dbo].[Pies] ([PieId], [Name], [ShortDescription], [LongDescription], [AllergyInformation], [Price], [ImageUrl], [ImageThumbnailUrl], [IsPieOfTheWeek], [InStock], [CategoryId], [Notes]) VALUES (5, N'Christmas Apple Pie', N'Happy holidays with this pie!', N'Icing carrot cake jelly-o cheesecake. Sweet roll marzipan marshmallow toffee brownie brownie candy tootsie roll. Chocolate cake gingerbread tootsie roll oat cake pie chocolate bar cookie dragée brownie. Lollipop cotton candy cake bear claw oat cake. Dragée candy canes dessert tart. Marzipan dragée gummies lollipop jujubes chocolate bar candy canes. Icing gingerbread chupa chups cotton candy cookie sweet icing bonbon gummies. Gummies lollipop brownie biscuit danish chocolate cake. Danish powder cookie macaroon chocolate donut tart. Carrot cake dragée croissant lemon drops liquorice lemon drops cookie lollipop toffee. Carrot cake carrot cake liquorice sugar plum topping bonbon pie muffin jujubes. Jelly pastry wafer tart caramels bear claw. Tiramisu tart pie cake danish lemon drops. Brownie cupcake dragée gummies.', N'', CAST(13.95 AS Decimal(18, 2)), N'https://gillcleerenpluralsight.blob.core.windows.net/files/christmasapplepie.jpg', N'https://gillcleerenpluralsight.blob.core.windows.net/files/christmasapplepiesmall.jpg', 0, 1, 3, NULL)
INSERT INTO [dbo].[Pies] ([PieId], [Name], [ShortDescription], [LongDescription], [AllergyInformation], [Price], [ImageUrl], [ImageThumbnailUrl], [IsPieOfTheWeek], [InStock], [CategoryId], [Notes]) VALUES (6, N'Cranberry Pie', N'A Christmas favorite', N'Icing carrot cake jelly-o cheesecake. Sweet roll marzipan marshmallow toffee brownie brownie candy tootsie roll. Chocolate cake gingerbread tootsie roll oat cake pie chocolate bar cookie dragée brownie. Lollipop cotton candy cake bear claw oat cake. Dragée candy canes dessert tart. Marzipan dragée gummies lollipop jujubes chocolate bar candy canes. Icing gingerbread chupa chups cotton candy cookie sweet icing bonbon gummies. Gummies lollipop brownie biscuit danish chocolate cake. Danish powder cookie macaroon chocolate donut tart. Carrot cake dragée croissant lemon drops liquorice lemon drops cookie lollipop toffee. Carrot cake carrot cake liquorice sugar plum topping bonbon pie muffin jujubes. Jelly pastry wafer tart caramels bear claw. Tiramisu tart pie cake danish lemon drops. Brownie cupcake dragée gummies.', N'', CAST(17.95 AS Decimal(18, 2)), N'https://gillcleerenpluralsight.blob.core.windows.net/files/cranberrypie.jpg', N'https://gillcleerenpluralsight.blob.core.windows.net/files/cranberrypiesmall.jpg', 0, 1, 3, NULL)
INSERT INTO [dbo].[Pies] ([PieId], [Name], [ShortDescription], [LongDescription], [AllergyInformation], [Price], [ImageUrl], [ImageThumbnailUrl], [IsPieOfTheWeek], [InStock], [CategoryId], [Notes]) VALUES (7, N'Peach Pie', N'Sweet as peach', N'Icing carrot cake jelly-o cheesecake. Sweet roll marzipan marshmallow toffee brownie brownie candy tootsie roll. Chocolate cake gingerbread tootsie roll oat cake pie chocolate bar cookie dragée brownie. Lollipop cotton candy cake bear claw oat cake. Dragée candy canes dessert tart. Marzipan dragée gummies lollipop jujubes chocolate bar candy canes. Icing gingerbread chupa chups cotton candy cookie sweet icing bonbon gummies. Gummies lollipop brownie biscuit danish chocolate cake. Danish powder cookie macaroon chocolate donut tart. Carrot cake dragée croissant lemon drops liquorice lemon drops cookie lollipop toffee. Carrot cake carrot cake liquorice sugar plum topping bonbon pie muffin jujubes. Jelly pastry wafer tart caramels bear claw. Tiramisu tart pie cake danish lemon drops. Brownie cupcake dragée gummies.', N'', CAST(15.95 AS Decimal(18, 2)), N'https://gillcleerenpluralsight.blob.core.windows.net/files/peachpie.jpg', N'https://gillcleerenpluralsight.blob.core.windows.net/files/peachpiesmall.jpg', 0, 0, 1, NULL)
INSERT INTO [dbo].[Pies] ([PieId], [Name], [ShortDescription], [LongDescription], [AllergyInformation], [Price], [ImageUrl], [ImageThumbnailUrl], [IsPieOfTheWeek], [InStock], [CategoryId], [Notes]) VALUES (8, N'Pumpkin Pie', N'Our Halloween favorite', N'Icing carrot cake jelly-o cheesecake. Sweet roll marzipan marshmallow toffee brownie brownie candy tootsie roll. Chocolate cake gingerbread tootsie roll oat cake pie chocolate bar cookie dragée brownie. Lollipop cotton candy cake bear claw oat cake. Dragée candy canes dessert tart. Marzipan dragée gummies lollipop jujubes chocolate bar candy canes. Icing gingerbread chupa chups cotton candy cookie sweet icing bonbon gummies. Gummies lollipop brownie biscuit danish chocolate cake. Danish powder cookie macaroon chocolate donut tart. Carrot cake dragée croissant lemon drops liquorice lemon drops cookie lollipop toffee. Carrot cake carrot cake liquorice sugar plum topping bonbon pie muffin jujubes. Jelly pastry wafer tart caramels bear claw. Tiramisu tart pie cake danish lemon drops. Brownie cupcake dragée gummies.', N'', CAST(12.95 AS Decimal(18, 2)), N'https://gillcleerenpluralsight.blob.core.windows.net/files/pumpkinpie.jpg', N'https://gillcleerenpluralsight.blob.core.windows.net/files/pumpkinpiesmall.jpg', 1, 1, 3, NULL)
INSERT INTO [dbo].[Pies] ([PieId], [Name], [ShortDescription], [LongDescription], [AllergyInformation], [Price], [ImageUrl], [ImageThumbnailUrl], [IsPieOfTheWeek], [InStock], [CategoryId], [Notes]) VALUES (9, N'Rhubarb Pie', N'My God, so sweet!', N'Icing carrot cake jelly-o cheesecake. Sweet roll marzipan marshmallow toffee brownie brownie candy tootsie roll. Chocolate cake gingerbread tootsie roll oat cake pie chocolate bar cookie dragée brownie. Lollipop cotton candy cake bear claw oat cake. Dragée candy canes dessert tart. Marzipan dragée gummies lollipop jujubes chocolate bar candy canes. Icing gingerbread chupa chups cotton candy cookie sweet icing bonbon gummies. Gummies lollipop brownie biscuit danish chocolate cake. Danish powder cookie macaroon chocolate donut tart. Carrot cake dragée croissant lemon drops liquorice lemon drops cookie lollipop toffee. Carrot cake carrot cake liquorice sugar plum topping bonbon pie muffin jujubes. Jelly pastry wafer tart caramels bear claw. Tiramisu tart pie cake danish lemon drops. Brownie cupcake dragée gummies.', N'', CAST(15.95 AS Decimal(18, 2)), N'https://gillcleerenpluralsight.blob.core.windows.net/files/rhubarbpie.jpg', N'https://gillcleerenpluralsight.blob.core.windows.net/files/rhubarbpiesmall.jpg', 1, 1, 1, NULL)
INSERT INTO [dbo].[Pies] ([PieId], [Name], [ShortDescription], [LongDescription], [AllergyInformation], [Price], [ImageUrl], [ImageThumbnailUrl], [IsPieOfTheWeek], [InStock], [CategoryId], [Notes]) VALUES (10, N'Strawberry Pie', N'Our delicious strawberry pie!', N'Icing carrot cake jelly-o cheesecake. Sweet roll marzipan marshmallow toffee brownie brownie candy tootsie roll. Chocolate cake gingerbread tootsie roll oat cake pie chocolate bar cookie dragée brownie. Lollipop cotton candy cake bear claw oat cake. Dragée candy canes dessert tart. Marzipan dragée gummies lollipop jujubes chocolate bar candy canes. Icing gingerbread chupa chups cotton candy cookie sweet icing bonbon gummies. Gummies lollipop brownie biscuit danish chocolate cake. Danish powder cookie macaroon chocolate donut tart. Carrot cake dragée croissant lemon drops liquorice lemon drops cookie lollipop toffee. Carrot cake carrot cake liquorice sugar plum topping bonbon pie muffin jujubes. Jelly pastry wafer tart caramels bear claw. Tiramisu tart pie cake danish lemon drops. Brownie cupcake dragée gummies.', N'', CAST(15.95 AS Decimal(18, 2)), N'https://gillcleerenpluralsight.blob.core.windows.net/files/strawberrypie.jpg', N'https://gillcleerenpluralsight.blob.core.windows.net/files/strawberrypiesmall.jpg', 0, 1, 1, NULL)
INSERT INTO [dbo].[Pies] ([PieId], [Name], [ShortDescription], [LongDescription], [AllergyInformation], [Price], [ImageUrl], [ImageThumbnailUrl], [IsPieOfTheWeek], [InStock], [CategoryId], [Notes]) VALUES (11, N'Strawberry Cheese Cake', N'You''ll love it!', N'Icing carrot cake jelly-o cheesecake. Sweet roll marzipan marshmallow toffee brownie brownie candy tootsie roll. Chocolate cake gingerbread tootsie roll oat cake pie chocolate bar cookie dragée brownie. Lollipop cotton candy cake bear claw oat cake. Dragée candy canes dessert tart. Marzipan dragée gummies lollipop jujubes chocolate bar candy canes. Icing gingerbread chupa chups cotton candy cookie sweet icing bonbon gummies. Gummies lollipop brownie biscuit danish chocolate cake. Danish powder cookie macaroon chocolate donut tart. Carrot cake dragée croissant lemon drops liquorice lemon drops cookie lollipop toffee. Carrot cake carrot cake liquorice sugar plum topping bonbon pie muffin jujubes. Jelly pastry wafer tart caramels bear claw. Tiramisu tart pie cake danish lemon drops. Brownie cupcake dragée gummies.', N'', CAST(18.95 AS Decimal(18, 2)), N'https://gillcleerenpluralsight.blob.core.windows.net/files/strawberrycheesecake.jpg', N'https://gillcleerenpluralsight.blob.core.windows.net/files/strawberrycheesecakesmall.jpg', 0, 0, 2, NULL)
SET IDENTITY_INSERT [dbo].[Pies] OFF

