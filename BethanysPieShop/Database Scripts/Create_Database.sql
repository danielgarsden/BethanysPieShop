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



