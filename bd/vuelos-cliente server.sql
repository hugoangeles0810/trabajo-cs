/*
Navicat SQL Server Data Transfer

Source Server         : server
Source Server Version : 110000
Source Host           : ROBERTO-PC\MSSQLSERVER2:1433
Source Database       : vuelos-cliente
Source Schema         : dbo

Target Server Type    : SQL Server
Target Server Version : 110000
File Encoding         : 65001

Date: 2017-02-19 21:04:36
*/


-- ----------------------------
-- Table structure for lugar
-- ----------------------------
DROP TABLE [dbo].[lugar]
GO
CREATE TABLE [dbo].[lugar] (
[id] int NOT NULL IDENTITY(1,1) ,
[nombre] varchar(1) NOT NULL 
)


GO

-- ----------------------------
-- Table structure for ticket
-- ----------------------------
DROP TABLE [dbo].[ticket]
GO
CREATE TABLE [dbo].[ticket] (
[id] int NOT NULL IDENTITY(1,1) ,
[vuelo] int NOT NULL ,
[asiento] int NOT NULL ,
[precio] real NOT NULL 
)


GO

-- ----------------------------
-- Table structure for vuelo
-- ----------------------------
DROP TABLE [dbo].[vuelo]
GO
CREATE TABLE [dbo].[vuelo] (
[id] int NOT NULL IDENTITY(1,1) ,
[fecha] datetime NOT NULL ,
[destino] int NOT NULL ,
[origen] int NOT NULL 
)


GO

-- ----------------------------
-- Indexes structure for table lugar
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table lugar
-- ----------------------------
ALTER TABLE [dbo].[lugar] ADD PRIMARY KEY ([id])
GO

-- ----------------------------
-- Indexes structure for table ticket
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table ticket
-- ----------------------------
ALTER TABLE [dbo].[ticket] ADD PRIMARY KEY ([id])
GO

-- ----------------------------
-- Indexes structure for table vuelo
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table vuelo
-- ----------------------------
ALTER TABLE [dbo].[vuelo] ADD PRIMARY KEY ([id])
GO

-- ----------------------------
-- Foreign Key structure for table [dbo].[ticket]
-- ----------------------------
ALTER TABLE [dbo].[ticket] ADD FOREIGN KEY ([vuelo]) REFERENCES [dbo].[vuelo] ([id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

-- ----------------------------
-- Foreign Key structure for table [dbo].[vuelo]
-- ----------------------------
ALTER TABLE [dbo].[vuelo] ADD FOREIGN KEY ([destino]) REFERENCES [dbo].[lugar] ([id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO
ALTER TABLE [dbo].[vuelo] ADD FOREIGN KEY ([origen]) REFERENCES [dbo].[lugar] ([id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO
