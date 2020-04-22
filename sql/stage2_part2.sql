sp_RENAME 'DepositSlip.[BankName]' , 'BankInfoLine1', 'COLUMN'
go
sp_RENAME 'DepositSlip.[BankCSZ]' , 'BankInfoLine2', 'COLUMN'
go
sp_RENAME 'DepositSlip.[BankPhone]' , 'BankInfoLine3', 'COLUMN'
go

ALTER TABLE DepositSlip
ALTER COLUMN BankInfoLine1 varchar(35)
go
ALTER TABLE DepositSlip
ALTER COLUMN BankInfoLine2 varchar(35)
go
ALTER TABLE DepositSlip
ALTER COLUMN BankInfoLine3 varchar(35)
go


update Product set Price = .16 where ProductTypeKey in (4,5,6,7) and Quantity = 250
go
update Product set Price = .12 where ProductTypeKey in (4,5,6,7) and Quantity = 500
go
update Product set Price = .08 where ProductTypeKey in (4,5,6,7) and Quantity = 1000
go
update Product set Price = .07 where ProductTypeKey in (4,5,6,7) and Quantity in (2000,3000,5000)
go

alter table CheckColor add FullCheckImagePath varchar(50) null
go

update CheckColor set fullcheckimagepath = '../images/checks/QBVoucher/Blue-Full.jpg' where CheckColorKey = 1
go
update CheckColor set fullcheckimagepath = '../images/checks/QBVoucher/Green-Full.jpg' where CheckColorKey = 2
go


ALTER TABLE CheckColor
ALTER COLUMN ImagePath varchar(100)
go
ALTER TABLE CheckColor
ALTER COLUMN FullCheckImagePath varchar(100)
go

insert into CheckColor (ProductTypeKey,Description,ImagePath,FullCheckImagePath)
values
(4,
'Blue Burgundy',
'../images/checks/QBVoucher/Background-blue-burgundy.jpg',
'../images/checks/QBVoucher/Blue-Burgundy-Full.jpg'
)
go

insert into CheckColor (ProductTypeKey,Description,ImagePath,FullCheckImagePath)
values
(4,
'Blue Green',
'../images/checks/QBVoucher/Background-blue-green.jpg',
'../images/checks/QBVoucher/Blue-Green-Full.jpg'
)
go

insert into CheckColor (ProductTypeKey,Description,ImagePath,FullCheckImagePath)
values
(4,
'Blue Burgundy Green',
'../images/checks/QBVoucher/Background-blue-burgundy-gr.jpg',
'../images/checks/QBVoucher/Blue-Burgundy-Green-Full.jpg'
)
go


insert into CheckColor (ProductTypeKey,Description,ImagePath,FullCheckImagePath)
values
(4,
'Burgundy',
'../images/checks/QBVoucher/Background-Burgundy.jpg',
'../images/checks/QBVoucher/Burgundy-Full.jpg'
)
go

insert into CheckColor (ProductTypeKey,Description,ImagePath,FullCheckImagePath)
values
(4,
'Tan',
'../images/checks/QBVoucher/Background-Tan.jpg',
'../images/checks/QBVoucher/Tan-Full.jpg'
)
go

insert into CheckColor (ProductTypeKey,Description,ImagePath,FullCheckImagePath)
values
(4,
'Burgundy Tan',
'../images/checks/QBVoucher/Background-burgundy-tan.jpg',
'../images/checks/QBVoucher/Burgundy-Tan-Full.jpg'
)
go




/****** Object:  StoredProcedure [dbo].[CheckColor_Update]    Script Date: 10/22/2011 06:42:24 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CheckColor_Update]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[CheckColor_Update]
GO

/****** Object:  StoredProcedure [dbo].[CheckColor_Update]    Script Date: 10/22/2011 06:42:25 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[CheckColor_Update]
(
@ID int
, @ProductTypeKey int 
, @Description varchar(50) 
, @ImagePath varchar(50) 
, @FullCheckImagePath varchar(50)
)
AS
SET NOCOUNT ON
Update CheckColor Set 
ProductTypeKey = @ProductTypeKey,
Description = @Description,
ImagePath = @ImagePath,
FullCheckImagePath = @FullCheckImagePath
where
CheckColorKey = @ID

GO


/****** Object:  StoredProcedure [dbo].[CheckColor_Create]    Script Date: 10/22/2011 06:44:04 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CheckColor_Create]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[CheckColor_Create]
GO


/****** Object:  StoredProcedure [dbo].[CheckColor_Create]    Script Date: 10/22/2011 06:44:04 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


create procedure [dbo].[CheckColor_Create]
(
@ProductTypeKey int ,
@Description varchar(50) ,
@ImagePath varchar(50) ,
@FullCheckImagePath varchar(50),
@retval int OUTPUT

)
AS
SET NOCOUNT ON

Insert into CheckColor
(
ProductTypeKey,
Description,
ImagePath,
FullCheckImagePath
)
Values
(
@ProductTypeKey,
@Description,
@ImagePath,
@FullCheckImagePath
)
SET @retval = (Select Scope_Identity())

GO


/****** Object:  StoredProcedure [dbo].[CheckColor_GetOne]    Script Date: 10/22/2011 06:45:28 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CheckColor_GetOne]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[CheckColor_GetOne]
GO

/****** Object:  StoredProcedure [dbo].[CheckColor_GetOne]    Script Date: 10/22/2011 06:45:28 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


create procedure [dbo].[CheckColor_GetOne]
(
@ID int
)
AS
SET NOCOUNT ON
select 
     CheckColorKey
     ,ProductTypeKey
     ,Description
     ,ImagePath
     ,FullCheckImagePath
from
     CheckColor
where
     CheckColorKey = @ID

GO


/****** Object:  StoredProcedure [dbo].[DepositSlip_Update]    Script Date: 11/09/2011 17:11:38 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DepositSlip_Update]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[DepositSlip_Update]
GO


/****** Object:  StoredProcedure [dbo].[DepositSlip_Update]    Script Date: 11/09/2011 17:11:38 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[DepositSlip_Update]
(
@ID int
, @CustomerKey int  
, @RoutingNumber varchar(20) 
, @AccountNumber varchar(20) 
, @Fraction varchar(20) 
, @Line1 varchar(100) 
, @Line2 varchar(100) 
, @Line3 varchar(100) 
, @Line4 varchar(100) 
, @Line5 varchar(100) 
,@BankInfoLine1 varchar(35)
,@BankInfoLine2 varchar(35)
,@BankInfoLine3 varchar(35)
)
AS
SET NOCOUNT ON
Update DepositSlip Set 
CustomerKey = @CustomerKey,
BankInfoLine1 = @BankInfoLine1,
RoutingNumber = @RoutingNumber,
AccountNumber = @AccountNumber,
Fraction = @Fraction,
BankInfoLine2 = @BankInfoLine2,
BankInfoLine3 = @BankInfoLine3,
Line1 = @Line1,
Line2 = @Line2,
Line3 = @Line3,
Line4 = @Line4,
Line5 = @Line5
where
DepositSlipKey = @ID
GO



/****** Object:  StoredProcedure [dbo].[DepositSlip_GetOne]    Script Date: 11/09/2011 17:10:32 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DepositSlip_GetOne]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[DepositSlip_GetOne]
GO


/****** Object:  StoredProcedure [dbo].[DepositSlip_GetOne]    Script Date: 11/09/2011 17:10:32 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[DepositSlip_GetOne]
(
@ID int
)
AS
SET NOCOUNT ON
select 
     DepositSlipKey
     ,CustomerKey
     ,RoutingNumber
     ,AccountNumber
     ,Fraction
     ,Line1
     ,Line2
     ,Line3
     ,Line4
     ,Line5
     ,BankInfoLine1
     ,BankInfoLine2
     ,BankInfoLine3
from
     DepositSlip
where
     DepositSlipKey = @ID
GO




/****** Object:  StoredProcedure [dbo].[DepositSlip_Create]    Script Date: 11/09/2011 17:05:01 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DepositSlip_Create]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[DepositSlip_Create]
GO


/****** Object:  StoredProcedure [dbo].[DepositSlip_Create]    Script Date: 11/09/2011 17:05:01 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[DepositSlip_Create]
(
@CustomerKey int ,
@RoutingNumber varchar(20) ,
@AccountNumber varchar(20) ,
@Fraction varchar(20) ,
@Line1 varchar(100) ,
@Line2 varchar(100) ,
@Line3 varchar(100) ,
@Line4 varchar(100) ,
@Line5 varchar(100) ,
@BankInfoLine1 varchar(35),
@BankInfoLine2 varchar(35),
@BankInfoLine3 varchar(35),
@retval int OUTPUT

)
AS
SET NOCOUNT ON

Insert into DepositSlip
(
CustomerKey,
RoutingNumber,
AccountNumber,
Fraction,
Line1,
Line2,
Line3,
Line4,
Line5,
BankInfoLine1,
BankInfoLine2,
BankInfoLine3
)
Values
(
@CustomerKey,
@RoutingNumber,
@AccountNumber,
@Fraction,
@Line1,
@Line2,
@Line3,
@Line4,
@Line5,
@BankInfoLine1,
@BankInfoLine2,
@BankInfoLine3
)
SET @retval = (Select Scope_Identity())
GO




