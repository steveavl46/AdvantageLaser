

/****** Object:  Table [dbo].[ShippingZone]    Script Date: 06/25/2011 04:57:54 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[ShippingZone](
	[ShippingZoneKey] [int] IDENTITY(1,1) NOT NULL,
	[Description] [varchar](50) NOT NULL,
 CONSTRAINT [PK_ShippingZone] PRIMARY KEY CLUSTERED 
(
	[ShippingZoneKey] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

insert into ShippingZone (Description) values ('Zone 1')
go
insert into ShippingZone (Description) values ('Zone 2')
go
insert into ShippingZone (Description) values ('Zone 3')
go
insert into ShippingZone (Description) values ('Zone 4')
go
insert into ShippingZone (Description) values ('Zone 5')
go
insert into ShippingZone (Description) values ('Zone 6')
go

alter table state add ShippingZoneKey int null

ALTER TABLE [dbo].[State]  WITH CHECK ADD  CONSTRAINT [FK_State_ShippingZone] FOREIGN KEY([ShippingZoneKey])
REFERENCES [dbo].[ShippingZone] ([ShippingZoneKey])
GO

ALTER TABLE [dbo].[State] CHECK CONSTRAINT [FK_State_ShippingZone]
GO

update state set shippingzonekey = null where abbreviation = 'AK'
go
update state set shippingzonekey = 2 where abbreviation = 'AL'
go
update state set shippingzonekey = 2 where abbreviation = 'AR'
go
update state set shippingzonekey = 5 where abbreviation = 'AZ'
go
update state set shippingzonekey = 6 where abbreviation = 'CA'
go
update state set shippingzonekey = 4 where abbreviation = 'CO'
go
update state set shippingzonekey = 3 where abbreviation = 'CT'
go
update state set shippingzonekey = 2 where abbreviation = 'DC'
go
update state set shippingzonekey = 3 where abbreviation = 'DE'
go
update state set shippingzonekey = 2 where abbreviation = 'FL'
go
update state set shippingzonekey = 1 where abbreviation = 'GA'
go
update state set shippingzonekey = null where abbreviation = 'HI'
go
update state set shippingzonekey = 3 where abbreviation = 'IA'
go
update state set shippingzonekey = 6 where abbreviation = 'ID'
go
update state set shippingzonekey = 2 where abbreviation = 'IL'
go
update state set shippingzonekey = 2 where abbreviation = 'IN'
go
update state set shippingzonekey = 3 where abbreviation = 'KS'
go
update state set shippingzonekey = 2 where abbreviation = 'KY'
go
update state set shippingzonekey = 2 where abbreviation = 'LA'
go
update state set shippingzonekey = 3 where abbreviation = 'MA'
go
update state set shippingzonekey = 2 where abbreviation = 'MD'
go
update state set shippingzonekey = 4 where abbreviation = 'ME'
go
update state set shippingzonekey = 3 where abbreviation = 'MI'
go
update state set shippingzonekey = 3 where abbreviation = 'MN'
go
update state set shippingzonekey = 3 where abbreviation = 'MO'
go
update state set shippingzonekey = 2 where abbreviation = 'MS'
go
update state set shippingzonekey = 5 where abbreviation = 'MT'
go
update state set shippingzonekey = 2 where abbreviation = 'NC'
go
update state set shippingzonekey = 4 where abbreviation = 'ND'
go
update state set shippingzonekey = 3 where abbreviation = 'NE'
go
update state set shippingzonekey = 4 where abbreviation = 'NH'
go
update state set shippingzonekey = 3 where abbreviation = 'NJ'
go
update state set shippingzonekey = 4 where abbreviation = 'NM'
go
update state set shippingzonekey = 5 where abbreviation = 'NV'
go
update state set shippingzonekey = 3 where abbreviation = 'NY'
go
update state set shippingzonekey = 3 where abbreviation = 'OH'
go
update state set shippingzonekey = 3 where abbreviation = 'OK'
go
update state set shippingzonekey = 6 where abbreviation = 'OR'
go
update state set shippingzonekey = 3 where abbreviation = 'PA'
go
update state set shippingzonekey = 3 where abbreviation = 'RI'
go
update state set shippingzonekey = 2 where abbreviation = 'SC'
go
update state set shippingzonekey = 4 where abbreviation = 'SD'
go
update state set shippingzonekey = 2 where abbreviation = 'TN'
go
update state set shippingzonekey = 3 where abbreviation = 'TX'
go
update state set shippingzonekey = 5 where abbreviation = 'UT'
go
update state set shippingzonekey = 2 where abbreviation = 'VA'
go
update state set shippingzonekey = 3 where abbreviation = 'VT'
go
update state set shippingzonekey = 6 where abbreviation = 'WA'
go
update state set shippingzonekey = 3 where abbreviation = 'WI'
go
update state set shippingzonekey = 2 where abbreviation = 'WV'
go
update state set shippingzonekey = 4 where abbreviation = 'WY'
go

-- ShippingRateType



/****** Object:  Table [dbo].[ShippingRateType]    Script Date: 06/25/2011 05:37:02 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[ShippingRateType](
	[ShippingRateTypeKey] [int] IDENTITY(1,1) NOT NULL,
	[Description] [varchar](50) NOT NULL,
 CONSTRAINT [PK_ShippingRateType] PRIMARY KEY CLUSTERED 
(
	[ShippingRateTypeKey] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

insert into ShippingRateType (Description) values ('Up To')
go
insert into ShippingRateType (Description) values ('Per Unit')
go

-- ShippingRateGroup

USE [CheckProject]
GO

/****** Object:  Table [dbo].[ShippingRateGroup]    Script Date: 06/25/2011 15:35:33 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[ShippingRateGroup](
	[ShippingRateGroupKey] [int] IDENTITY(1,1) NOT NULL,
	[Description] [varchar](50) NOT NULL,
 CONSTRAINT [PK_ShippingRateGroup] PRIMARY KEY CLUSTERED 
(
	[ShippingRateGroupKey] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

insert into ShippingRateGroup (Description) values ('Deposit Slips')

-----ShippingZoneRate


/****** Object:  Table [dbo].[ShippingZoneRate]    Script Date: 06/25/2011 05:57:05 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[ShippingZoneRate](
	[ShippingZoneRateKey] [int] IDENTITY(1,1) NOT NULL,
	[ShippingZoneKey] [int] NOT NULL,
	[ShippingRateGroupKey] [int] NOT NULL,
	[ShippingRateTypeKey] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
	[Rate] [numeric](18, 6) NOT NULL,
 CONSTRAINT [PK_ShippingZoneRate] PRIMARY KEY CLUSTERED 
(
	[ShippingZoneRateKey] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

----------------------------


-----------------------------

ALTER TABLE [dbo].[ShippingZoneRate]  WITH CHECK ADD  CONSTRAINT [FK_ShippingZoneRate_ShippingZone] FOREIGN KEY([ShippingZoneKey])
REFERENCES [dbo].[ShippingZone] ([ShippingZoneKey])
GO

ALTER TABLE [dbo].[ShippingZoneRate] CHECK CONSTRAINT [FK_ShippingZoneRate_ShippingZone]
GO

--------------------------

ALTER TABLE [dbo].[ShippingZoneRate]  WITH CHECK ADD  CONSTRAINT [FK_ShippingZoneRate_ShippingRateType] FOREIGN KEY([ShippingRateTypeKey])
REFERENCES [dbo].[ShippingRateType] ([ShippingRateTypeKey])
GO

ALTER TABLE [dbo].[ShippingZoneRate] CHECK CONSTRAINT [FK_ShippingZoneRate_ShippingRateType]
GO

-------------------------
ALTER TABLE [dbo].[ShippingZoneRate]  WITH CHECK ADD  CONSTRAINT [FK_ShippingZoneRate_ShippingRateGroup] FOREIGN KEY([ShippingRateGroupKey])
REFERENCES [dbo].[ShippingRateGroup] ([ShippingRateGroupKey])
GO

ALTER TABLE [dbo].[ShippingZoneRate] CHECK CONSTRAINT [FK_ShippingZoneRate_ShippingRateType]
GO

-- Zone 1 Deposit Slips
insert into ShippingZoneRate (ShippingZoneKey,ShippingRateGroupKey,ShippingRateTypeKey,Quantity,Rate)
values (1,1,1,500,6.64)
go
insert into ShippingZoneRate (ShippingZoneKey,ShippingRateGroupKey,ShippingRateTypeKey,Quantity,Rate)
values (1,1,1,1000,7.91)
go
insert into ShippingZoneRate (ShippingZoneKey,ShippingRateGroupKey,ShippingRateTypeKey,Quantity,Rate)
values (1,1,1,2000,10.13)
go
insert into ShippingZoneRate (ShippingZoneKey,ShippingRateGroupKey,ShippingRateTypeKey,Quantity,Rate)
values (1,1,1,2500,11.33)
go
insert into ShippingZoneRate (ShippingZoneKey,ShippingRateGroupKey,ShippingRateTypeKey,Quantity,Rate)
values (1,1,2,12500,.004532)
go
insert into ShippingZoneRate (ShippingZoneKey,ShippingRateGroupKey,ShippingRateTypeKey,Quantity,Rate)
values (1,1,2,1000000,.003696)
go

-- Zone 2 Deposit Slips
insert into ShippingZoneRate (ShippingZoneKey,ShippingRateGroupKey,ShippingRateTypeKey,Quantity,Rate)
values (2,1,1,500,7.85)
go
insert into ShippingZoneRate (ShippingZoneKey,ShippingRateGroupKey,ShippingRateTypeKey,Quantity,Rate)
values (2,1,1,1000,8.68)
go
insert into ShippingZoneRate (ShippingZoneKey,ShippingRateGroupKey,ShippingRateTypeKey,Quantity,Rate)
values (2,1,1,2000,12.58)
go
insert into ShippingZoneRate (ShippingZoneKey,ShippingRateGroupKey,ShippingRateTypeKey,Quantity,Rate)
values (2,1,1,2500,14.82)
go
insert into ShippingZoneRate (ShippingZoneKey,ShippingRateGroupKey,ShippingRateTypeKey,Quantity,Rate)
values (2,1,2,12500,.005982)
go
insert into ShippingZoneRate (ShippingZoneKey,ShippingRateGroupKey,ShippingRateTypeKey,Quantity,Rate)
values (2,1,2,1000000,.005216)
go

-- Zone 3 Deposit Slips
insert into ShippingZoneRate (ShippingZoneKey,ShippingRateGroupKey,ShippingRateTypeKey,Quantity,Rate)
values (3,1,1,500,8.32)
go
insert into ShippingZoneRate (ShippingZoneKey,ShippingRateGroupKey,ShippingRateTypeKey,Quantity,Rate)
values (3,1,1,1000,9.39)
go
insert into ShippingZoneRate (ShippingZoneKey,ShippingRateGroupKey,ShippingRateTypeKey,Quantity,Rate)
values (3,1,1,2000,14.78)
go
insert into ShippingZoneRate (ShippingZoneKey,ShippingRateGroupKey,ShippingRateTypeKey,Quantity,Rate)
values (3,1,1,2500,17.48)
go
insert into ShippingZoneRate (ShippingZoneKey,ShippingRateGroupKey,ShippingRateTypeKey,Quantity,Rate)
values (3,1,2,12500,.006992)
go
insert into ShippingZoneRate (ShippingZoneKey,ShippingRateGroupKey,ShippingRateTypeKey,Quantity,Rate)
values (3,1,2,1000000,.006064)
go

-- Zone 4 Deposit Slips
insert into ShippingZoneRate (ShippingZoneKey,ShippingRateGroupKey,ShippingRateTypeKey,Quantity,Rate)
values (4,1,1,500,8.69)
go
insert into ShippingZoneRate (ShippingZoneKey,ShippingRateGroupKey,ShippingRateTypeKey,Quantity,Rate)
values (4,1,1,1000,10.73)
go
insert into ShippingZoneRate (ShippingZoneKey,ShippingRateGroupKey,ShippingRateTypeKey,Quantity,Rate)
values (4,1,1,2000,18.69)
go
insert into ShippingZoneRate (ShippingZoneKey,ShippingRateGroupKey,ShippingRateTypeKey,Quantity,Rate)
values (4,1,1,2500,22.38)
go
insert into ShippingZoneRate (ShippingZoneKey,ShippingRateGroupKey,ShippingRateTypeKey,Quantity,Rate)
values (4,1,2,12500,.008952)
go
insert into ShippingZoneRate (ShippingZoneKey,ShippingRateGroupKey,ShippingRateTypeKey,Quantity,Rate)
values (4,1,2,1000000,.007608)
go

-- Zone 5 Deposit Slips
insert into ShippingZoneRate (ShippingZoneKey,ShippingRateGroupKey,ShippingRateTypeKey,Quantity,Rate)
values (5,1,1,500,9.18)
go
insert into ShippingZoneRate (ShippingZoneKey,ShippingRateGroupKey,ShippingRateTypeKey,Quantity,Rate)
values (5,1,1,1000,12.83)
go
insert into ShippingZoneRate (ShippingZoneKey,ShippingRateGroupKey,ShippingRateTypeKey,Quantity,Rate)
values (5,1,1,2000,21.82)
go
insert into ShippingZoneRate (ShippingZoneKey,ShippingRateGroupKey,ShippingRateTypeKey,Quantity,Rate)
values (5,1,1,2500,25.89)
go
insert into ShippingZoneRate (ShippingZoneKey,ShippingRateGroupKey,ShippingRateTypeKey,Quantity,Rate)
values (5,1,2,12500,.010356)
go
insert into ShippingZoneRate (ShippingZoneKey,ShippingRateGroupKey,ShippingRateTypeKey,Quantity,Rate)
values (5,1,2,1000000,.008716)
go

-- Zone 6 Deposit Slips
insert into ShippingZoneRate (ShippingZoneKey,ShippingRateGroupKey,ShippingRateTypeKey,Quantity,Rate)
values (6,1,1,500,9.96)
go
insert into ShippingZoneRate (ShippingZoneKey,ShippingRateGroupKey,ShippingRateTypeKey,Quantity,Rate)
values (6,1,1,1000,14.37)
go
insert into ShippingZoneRate (ShippingZoneKey,ShippingRateGroupKey,ShippingRateTypeKey,Quantity,Rate)
values (6,1,1,2000,25.58)
go
insert into ShippingZoneRate (ShippingZoneKey,ShippingRateGroupKey,ShippingRateTypeKey,Quantity,Rate)
values (6,1,1,2500,30.8)
go
insert into ShippingZoneRate (ShippingZoneKey,ShippingRateGroupKey,ShippingRateTypeKey,Quantity,Rate)
values (6,1,2,12500,.01232)
go
insert into ShippingZoneRate (ShippingZoneKey,ShippingRateGroupKey,ShippingRateTypeKey,Quantity,Rate)
values (6,1,2,1000000,.010084)
go

---------------- ProductType table change
alter table producttype add ShippingRateGroupKey int null 


ALTER TABLE [dbo].[ProductType]  WITH CHECK ADD  CONSTRAINT [FK_ProductType_ShippingRateGroup] FOREIGN KEY([ShippingRateGroupKey])
REFERENCES [dbo].[ShippingRateGroup] ([ShippingRateGroupKey])
GO

ALTER TABLE [dbo].[ProductType] CHECK CONSTRAINT [FK_ProductType_ShippingRateGroup]
GO

update ProductType set shippingrategroupkey = 1 where ProductTypeKey = 1

--------------- Product table changes
alter table product add Quantity numeric(18,0)
alter table product alter column ShippingRate numeric(18,2) null

update Product set quantity = 250, Price = .1, ShippingRate = null where ProductKey = 1
go
update Product set quantity = 500, Price = .08, ShippingRate = null where ProductKey = 2
go
update Product set quantity = 1000, Price = .07, ShippingRate = null where ProductKey = 3
go
update Product set quantity = 2000, Price = .06, ShippingRate = null where ProductKey = 4
go
update Product set quantity = 3000, Price = .06, ShippingRate = null where ProductKey = 5
go
update Product set quantity = 5000, Price = .06, ShippingRate = null where ProductKey = 6
go
update Product set quantity = 1 where ProductKey = 7
go

--------------

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[ShippingRateGroup_Create]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[ShippingRateGroup_Create]
GO

create procedure [dbo].[ShippingRateGroup_Create]
(
@Description varchar(50) ,
@retval int OUTPUT

)
AS
SET NOCOUNT ON

Insert into ShippingRateGroup
(
Description
)
Values
(
@Description
)
SET @retval = (Select Scope_Identity())
GO


if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[ShippingRateGroup_Update]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[ShippingRateGroup_Update]
GO
create procedure [dbo].[ShippingRateGroup_Update]
(
@ID int
, @Description varchar(50) 
)
AS
SET NOCOUNT ON
Update ShippingRateGroup Set 
Description = @Description
where
ShippingRateGroupKey = @ID
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[ShippingRateGroup_GetOne]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[ShippingRateGroup_GetOne]
GO

create procedure [dbo].[ShippingRateGroup_GetOne]
(
@ID int
)
AS
SET NOCOUNT ON
select 
     ShippingRateGroupKey
     ,Description
from
     ShippingRateGroup
where
     ShippingRateGroupKey = @ID
GO

-----------------------


if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[ShippingRateType_Create]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[ShippingRateType_Create]
GO

create procedure [dbo].[ShippingRateType_Create]
(
@Description varchar(50) ,
@retval int OUTPUT

)
AS
SET NOCOUNT ON

Insert into ShippingRateType
(
Description
)
Values
(
@Description
)
SET @retval = (Select Scope_Identity())
GO


if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[ShippingRateType_Update]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[ShippingRateType_Update]
GO
create procedure [dbo].[ShippingRateType_Update]
(
@ID int
, @Description varchar(50) 
)
AS
SET NOCOUNT ON
Update ShippingRateType Set 
Description = @Description
where
ShippingRateTypeKey = @ID
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[ShippingRateType_GetOne]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[ShippingRateType_GetOne]
GO

create procedure [dbo].[ShippingRateType_GetOne]
(
@ID int
)
AS
SET NOCOUNT ON
select 
     ShippingRateTypeKey
     ,Description
from
     ShippingRateType
where
     ShippingRateTypeKey = @ID
GO

---------------------------


if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[ShippingZoneRate_Create]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[ShippingZoneRate_Create]
GO

create procedure [dbo].[ShippingZoneRate_Create]
(
@ShippingZoneKey int ,
@ShippingRateGroupKey int ,
@ShippingRateTypeKey int ,
@Quantity int ,
@Rate numeric(18,6) ,
@retval int OUTPUT

)
AS
SET NOCOUNT ON

Insert into ShippingZoneRate
(
ShippingZoneKey,
ShippingRateGroupKey,
ShippingRateTypeKey,
Quantity,
Rate
)
Values
(
@ShippingZoneKey,
@ShippingRateGroupKey,
@ShippingRateTypeKey,
@Quantity,
@Rate
)
SET @retval = (Select Scope_Identity())
GO


if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[ShippingZoneRate_Update]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[ShippingZoneRate_Update]
GO
create procedure [dbo].[ShippingZoneRate_Update]
(
@ID int
, @ShippingZoneKey int 
, @ShippingRateGroupKey int 
, @ShippingRateTypeKey int 
, @Quantity int 
, @Rate numeric(18,6) 
)
AS
SET NOCOUNT ON
Update ShippingZoneRate Set 
ShippingZoneKey = @ShippingZoneKey,
ShippingRateGroupKey = @ShippingRateGroupKey,
ShippingRateTypeKey = @ShippingRateTypeKey,
Quantity = @Quantity,
Rate = @Rate
where
ShippingZoneRateKey = @ID
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[ShippingZoneRate_GetOne]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[ShippingZoneRate_GetOne]
GO

create procedure [dbo].[ShippingZoneRate_GetOne]
(
@ID int
)
AS
SET NOCOUNT ON
select 
     ShippingZoneRateKey
     ,ShippingZoneKey
     ,ShippingRateGroupKey
     ,ShippingRateTypeKey
     ,Quantity
     ,Rate
from
     ShippingZoneRate
where
     ShippingZoneRateKey = @ID
GO

--------------------------


if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[ShippingZone_Create]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[ShippingZone_Create]
GO

create procedure [dbo].[ShippingZone_Create]
(
@Description varchar(50) ,
@retval int OUTPUT

)
AS
SET NOCOUNT ON

Insert into ShippingZone
(
Description
)
Values
(
@Description
)
SET @retval = (Select Scope_Identity())
GO


if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[ShippingZone_Update]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[ShippingZone_Update]
GO
create procedure [dbo].[ShippingZone_Update]
(
@ID int
, @Description varchar(50) 
)
AS
SET NOCOUNT ON
Update ShippingZone Set 
Description = @Description
where
ShippingZoneKey = @ID
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[ShippingZone_GetOne]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[ShippingZone_GetOne]
GO

create procedure [dbo].[ShippingZone_GetOne]
(
@ID int
)
AS
SET NOCOUNT ON
select 
     ShippingZoneKey
     ,Description
from
     ShippingZone
where
     ShippingZoneKey = @ID
GO

--------------------------

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[State_Create]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[State_Create]
GO

create procedure [dbo].[State_Create]
(
@Abbreviation varchar(2) ,
@Name varchar(50) ,
@ShippingZoneKey int ,
@retval int OUTPUT

)
AS
SET NOCOUNT ON

Insert into State
(
Abbreviation,
Name,
ShippingZoneKey
)
Values
(
@Abbreviation,
@Name,
@ShippingZoneKey
)
SET @retval = (Select Scope_Identity())
GO


if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[State_Update]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[State_Update]
GO
create procedure [dbo].[State_Update]
(
@ID int
, @Abbreviation varchar(2) 
, @Name varchar(50) 
, @ShippingZoneKey int 
)
AS
SET NOCOUNT ON
Update State Set 
Abbreviation = @Abbreviation,
Name = @Name,
ShippingZoneKey = @ShippingZoneKey
where
StateKey = @ID
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[State_GetOne]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[State_GetOne]
GO

create procedure [dbo].[State_GetOne]
(
@ID int
)
AS
SET NOCOUNT ON
select 
     StateKey
     ,Abbreviation
     ,Name
     ,ShippingZoneKey
from
     State
where
     StateKey = @ID
GO

---------------------

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Product_Create]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[Product_Create]
GO

create procedure [dbo].[Product_Create]
(
@ProductTypeKey int ,
@Description varchar(100) ,
@Price numeric(18,2) ,
@ShippingRate numeric(18,2) ,
@Quantity int ,
@retval int OUTPUT

)
AS
SET NOCOUNT ON

Insert into Product
(
ProductTypeKey,
Description,
Price,
ShippingRate,
Quantity
)
Values
(
@ProductTypeKey,
@Description,
@Price,
@ShippingRate,
@Quantity
)
SET @retval = (Select Scope_Identity())
GO


if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Product_Update]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[Product_Update]
GO
create procedure [dbo].[Product_Update]
(
@ID int
, @ProductTypeKey int 
, @Description varchar(100) 
, @Price numeric(18,2) 
, @ShippingRate numeric(18,2) 
, @Quantity int 
)
AS
SET NOCOUNT ON
Update Product Set 
ProductTypeKey = @ProductTypeKey,
Description = @Description,
Price = @Price,
ShippingRate = @ShippingRate,
Quantity = @Quantity
where
ProductKey = @ID
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Product_GetOne]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[Product_GetOne]
GO

create procedure [dbo].[Product_GetOne]
(
@ID int
)
AS
SET NOCOUNT ON
select 
     ProductKey
     ,ProductTypeKey
     ,Description
     ,Price
     ,ShippingRate
     ,Quantity
from
     Product
where
     ProductKey = @ID
GO

------------------------


if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[ProductType_Create]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[ProductType_Create]
GO

create procedure [dbo].[ProductType_Create]
(
@ProductCategoryKey int ,
@Description varchar(100) ,
@ShippingRateGroupKey int ,
@retval int OUTPUT

)
AS
SET NOCOUNT ON

Insert into ProductType
(
ProductCategoryKey,
Description,
ShippingRateGroupKey
)
Values
(
@ProductCategoryKey,
@Description,
@ShippingRateGroupKey
)
SET @retval = (Select Scope_Identity())
GO


if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[ProductType_Update]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[ProductType_Update]
GO
create procedure [dbo].[ProductType_Update]
(
@ID int
, @ProductCategoryKey int 
, @Description varchar(100) 
, @ShippingRateGroupKey int 
)
AS
SET NOCOUNT ON
Update ProductType Set 
ProductCategoryKey = @ProductCategoryKey,
Description = @Description,
ShippingRateGroupKey = @ShippingRateGroupKey
where
ProductTypeKey = @ID
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[ProductType_GetOne]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[ProductType_GetOne]
GO

create procedure [dbo].[ProductType_GetOne]
(
@ID int
)
AS
SET NOCOUNT ON
select 
     ProductTypeKey
     ,ProductCategoryKey
     ,Description
     ,ShippingRateGroupKey
from
     ProductType
where
     ProductTypeKey = @ID
GO

-------------------
alter table invoiceitem alter column ShippingRate numeric(18,2) null

------------------------------------


/****** Object:  StoredProcedure [dbo].[GetShippingZoneInfo]    Script Date: 07/02/2011 06:44:36 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GetShippingZoneInfo]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[GetShippingZoneInfo]
GO


SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE GetShippingZoneInfo 

-- exec GetShippingZoneInfo

AS
BEGIN

declare @ShippingZoneKey int
declare @description varchar(200)
declare @abbreviation varchar(2)

declare @current_description varchar(50)

set @current_description = ''

create table #ShippingZoneStates
(
ShippingZoneKey int,
ShippingZoneDescription varchar(50),
StateList varchar(200)
)


declare shipping_zone_cursor cursor for

select z.ShippingZoneKey, z.description, s.abbreviation
from 
State s 
join ShippingZone z on s.ShippingZoneKey = z.ShippingZoneKey
order by Description,Abbreviation

open shipping_zone_cursor
fetch next from shipping_zone_cursor into @shippingzonekey, @description, @abbreviation
while @@FETCH_STATUS = 0

BEGIN
	if @description <> @current_description
		BEGIN
			set @current_description = @description
			insert into #ShippingZoneStates (ShippingZoneKey, ShippingZoneDescription,StateList) values (@ShippingZoneKey,@description,@abbreviation)
		END
	else
		BEGIN
			update #ShippingZoneStates set StateList = StateList + ', ' + @abbreviation where ShippingZoneKey = @ShippingZoneKey
		END
	fetch next from shipping_zone_cursor into @shippingzonekey, @description, @abbreviation
END

close shipping_zone_cursor
deallocate shipping_zone_cursor

select * from #ShippingZoneStates
drop table #ShippingZoneStates

END
GO

---------------------------------------


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[v_ZoneShippingRates]'))
DROP VIEW [dbo].[v_ZoneShippingRates]
GO

CREATE VIEW [dbo].[v_ZoneShippingRates]
AS

select 
	z.Description as ZoneDescription, 
	g.Description as GroupDescription, 
	t.Description as RateTypeDescription,
	szr.Quantity,
	szr.Rate,
	case 
		when szr.ShippingRateTypeKey = 1 then rate
		when szr.ShippingRateTypeKey = 2 then rate * 1000
		else 0
	end as ShippingRate,
	szr.ShippingZoneRateKey,
	szr.ShippingZoneKey,
	szr.ShippingRateGroupKey,
	szr.ShippingRateTypeKey
from 
	ShippingZoneRate szr
	join ShippingZone z on szr.ShippingZoneKey = z.ShippingZoneKey
	join ShippingRateGroup g on g.ShippingRateGroupKey = szr.ShippingRateGroupKey
	join ShippingRateType t on t.ShippingRateTypeKey = szr.ShippingRateTypeKey

GO

-------------------------------------------

update ShippingType set Description = 'Standard Rate' where ShippingTypeKey = 1 and Description = 'Fed Ex Ground $8 per 1,000'

update ShippingType set Description = 'RUSH Shipping - 100 checks Next Day Air, remainder Fed Ex ground Standard Rate plus'
where ShippingTypeKey = 2 and Description = 'RUSH Shipping - 100 checks Next Day Air, remainder Fed Ex ground $8 per 1,000 plus'