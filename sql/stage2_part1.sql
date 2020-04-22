insert into ProductCategory (Description) values ('Preprinted Check')
go
insert into ProductType (ProductCategoryKey,Description,ShippingRateGroupKey)
values (4,'QuickBooks Voucher Check',1)
go
insert into Product (ProductTypeKey,Description,Price,ShippingRate,Quantity)
values (4, '250 Preprinted Checks', .11,null,250)
go
insert into Product (ProductTypeKey,Description,Price,ShippingRate,Quantity)
values (4, '500 Preprinted Checks', .08,null,500)
go
insert into Product (ProductTypeKey,Description,Price,ShippingRate,Quantity)
values (4, '1000 Preprinted Checks', .06,null,1000)
go
insert into Product (ProductTypeKey,Description,Price,ShippingRate,Quantity)
values (4, '2000 Preprinted Checks', .04,null,2000)
go
insert into Product (ProductTypeKey,Description,Price,ShippingRate,Quantity)
values (4, '3000 Preprinted Checks', .03,null,3000)
go
insert into Product (ProductTypeKey,Description,Price,ShippingRate,Quantity)
values (4, '5000 Preprinted Checks', .03,null,5000)
go

/*
insert into Product
(ProductTypeKey, Description,Price,Quantity)
select 5,description,price,quantity from Product where ProductTypeKey = 4
go
insert into Product
(ProductTypeKey, Description,Price,Quantity)
select 6,description,price,quantity from Product where ProductTypeKey = 4
go
insert into Product
(ProductTypeKey, Description,Price,Quantity)
select 7,description,price,quantity from Product where ProductTypeKey = 4
go
*/

CREATE TABLE [TypeFace] (
[TypeFaceKey] int not null identity(1,1)
, [Description]  varchar(50) not null
)
GO

/****** Object:  Index [PK_TypeFace]    Script Date: 08/28/2011 06:06:54 ******/
ALTER TABLE [dbo].[TypeFace] ADD  CONSTRAINT [PK_TypeFace] PRIMARY KEY CLUSTERED 
(
	[TypeFaceKey] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO



CREATE TABLE [CheckColor] (
[CheckColorKey] int not null identity(1,1)
, [ProductTypeKey]  int not null
, [Description]  varchar(50) not null
, [ImagePath]  varchar(50) not null
)
GO

/****** Object:  Index [PK_CheckColor]    Script Date: 08/28/2011 06:05:51 ******/
ALTER TABLE [dbo].[CheckColor] ADD  CONSTRAINT [PK_CheckColor] PRIMARY KEY CLUSTERED 
(
	[CheckColorKey] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO


ALTER TABLE [dbo].[CheckColor]  WITH CHECK ADD  CONSTRAINT [FK_CheckColor_ProductType] FOREIGN KEY([ProductTypeKey])
REFERENCES [dbo].[ProductType] ([ProductTypeKey])
GO

ALTER TABLE [dbo].[CheckColor] CHECK CONSTRAINT [FK_CheckColor_ProductType]
GO

CREATE TABLE [CheckFeatureOption] (
[CheckFeatureOptionKey] int not null identity(1,1)
, [Description]  varchar(50) not null
)
GO

/****** Object:  Index [PK_CheckFeatureOption]    Script Date: 08/28/2011 06:07:24 ******/
ALTER TABLE [dbo].[CheckFeatureOption] ADD  CONSTRAINT [PK_CheckFeatureOption] PRIMARY KEY CLUSTERED 
(
	[CheckFeatureOptionKey] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO



/****** Object:  Table [dbo].[CheckStubLine]    Script Date: 08/28/2011 06:04:52 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[CheckStubLine](
	[CheckStubLineKey] [int] IDENTITY(1,1) NOT NULL,
	[Description] [varchar](50) NOT NULL,
 CONSTRAINT [PK_CheckStubLine] PRIMARY KEY CLUSTERED 
(
	[CheckStubLineKey] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO


/****** Object:  Table [dbo].[ProductTypeCheckOptionXRef]    Script Date: 08/28/2011 06:09:51 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[ProductTypeCheckOptionXRef](
	[ProductTypeCheckOptionXRefKey] [int] IDENTITY(1,1) NOT NULL,
	[ProductTypeKey] [int] NOT NULL,
	[CheckFeatureOptionKey] [int] NOT NULL,
	[IsAvailable] [bit] NOT NULL,
 CONSTRAINT [PK_ProductTypeCheckOptionXRef] PRIMARY KEY CLUSTERED 
(
	[ProductTypeCheckOptionXRefKey] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[ProductTypeCheckOptionXRef]  WITH CHECK ADD  CONSTRAINT [FK_ProductTypeCheckOptionXRef_CheckFeatureOption] FOREIGN KEY([CheckFeatureOptionKey])
REFERENCES [dbo].[CheckFeatureOption] ([CheckFeatureOptionKey])
GO

ALTER TABLE [dbo].[ProductTypeCheckOptionXRef] CHECK CONSTRAINT [FK_ProductTypeCheckOptionXRef_CheckFeatureOption]
GO

ALTER TABLE [dbo].[ProductTypeCheckOptionXRef]  WITH CHECK ADD  CONSTRAINT [FK_ProductTypeCheckOptionXRef_ProductType] FOREIGN KEY([ProductTypeKey])
REFERENCES [dbo].[ProductType] ([ProductTypeKey])
GO

ALTER TABLE [dbo].[ProductTypeCheckOptionXRef] CHECK CONSTRAINT [FK_ProductTypeCheckOptionXRef_ProductType]
GO


/****** Object:  Table [dbo].[CheckDetail]    Script Date: 08/31/2011 20:10:26 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[CheckDetail](
	[CheckDetailKey] [int] IDENTITY(1,1) NOT NULL,
	[CustomerKey] [int] NOT NULL,
	[Line1] [varchar](35) NOT NULL,
	[Line2] [varchar](35) NULL,
	[Line3] [varchar](35) NULL,
	[Line4] [varchar](35) NULL,
	[Line5] [varchar](35) NULL,
	[BankAccountNumber] [varchar](35) NOT NULL,
	[RoutingNumber] [varchar](35) NOT NULL,
	[BankInfoLine1] [varchar](35) NULL,
	[BankInfoLine2] [varchar](35) NULL,
	[BankInfoLine3] [varchar](35) NULL,
	[BankCSZ] [varchar](35) NOT NULL,
	[BankPhone] [varchar](35) NULL,
	[CheckColorKey] [int] NOT NULL,
	[PrintLines] [bit] NOT NULL,
	[SignatureLineCount] [int] NOT NULL,
	[MessageAboveSignature] [varchar](35) NULL,
	[PrintPaymentRecordOnStub] [bit] NOT NULL,
	[CheckStubLineKey] [int] NULL,
	[Line1FontWeightKey] [int] NULL,
	[Line2FontWeightKey] [int] NULL,
	[TextAlignKey] [int] NULL,
	[TypeFaceKey] [int] NULL,
	[Fraction] [varchar](20) NULL,
	[UseLogo] [bit] NOT NULL,	
 CONSTRAINT [PK_CheckDetail] PRIMARY KEY CLUSTERED 
(
	[CheckDetailKey] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

ALTER TABLE [dbo].[CheckDetail]  WITH CHECK ADD  CONSTRAINT [FK_CheckDetail_CheckColor] FOREIGN KEY([CheckColorKey])
REFERENCES [dbo].[CheckColor] ([CheckColorKey])
GO

ALTER TABLE [dbo].[CheckDetail] CHECK CONSTRAINT [FK_CheckDetail_CheckColor]
GO

ALTER TABLE [dbo].[CheckDetail]  WITH CHECK ADD  CONSTRAINT [FK_CheckDetail_CheckDetail] FOREIGN KEY([CheckDetailKey])
REFERENCES [dbo].[CheckDetail] ([CheckDetailKey])
GO

ALTER TABLE [dbo].[CheckDetail] CHECK CONSTRAINT [FK_CheckDetail_CheckDetail]
GO

ALTER TABLE [dbo].[CheckDetail]  WITH CHECK ADD  CONSTRAINT [FK_CheckDetail_CheckStubLine] FOREIGN KEY([CheckStubLineKey])
REFERENCES [dbo].[CheckStubLine] ([CheckStubLineKey])
GO

ALTER TABLE [dbo].[CheckDetail] CHECK CONSTRAINT [FK_CheckDetail_CheckStubLine]
GO

ALTER TABLE [dbo].[CheckDetail]  WITH CHECK ADD  CONSTRAINT [FK_CheckDetail_FontWeight] FOREIGN KEY([Line1FontWeightKey])
REFERENCES [dbo].[FontWeight] ([FontWeightKey])
GO

ALTER TABLE [dbo].[CheckDetail] CHECK CONSTRAINT [FK_CheckDetail_FontWeight]
GO

ALTER TABLE [dbo].[CheckDetail]  WITH CHECK ADD  CONSTRAINT [FK_CheckDetail_FontWeight1] FOREIGN KEY([Line2FontWeightKey])
REFERENCES [dbo].[FontWeight] ([FontWeightKey])
GO

ALTER TABLE [dbo].[CheckDetail] CHECK CONSTRAINT [FK_CheckDetail_FontWeight1]
GO

ALTER TABLE [dbo].[CheckDetail]  WITH CHECK ADD  CONSTRAINT [FK_CheckDetail_TextAlign] FOREIGN KEY([TextAlignKey])
REFERENCES [dbo].[TextAlign] ([TextAlignKey])
GO

ALTER TABLE [dbo].[CheckDetail] CHECK CONSTRAINT [FK_CheckDetail_TextAlign]
GO

ALTER TABLE [dbo].[CheckDetail]  WITH CHECK ADD  CONSTRAINT [FK_CheckDetail_TypeFace] FOREIGN KEY([TypeFaceKey])
REFERENCES [dbo].[TypeFace] ([TypeFaceKey])
GO

ALTER TABLE [dbo].[CheckDetail] CHECK CONSTRAINT [FK_CheckDetail_TypeFace]
GO

ALTER TABLE [dbo].[CheckDetail] ADD  DEFAULT ((0)) FOR [UseLogo]
GO





/****** Object:  StoredProcedure [dbo].[CheckDetail_Create]    Script Date: 08/31/2011 20:26:57 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CheckDetail_Create]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[CheckDetail_Create]
GO

/****** Object:  StoredProcedure [dbo].[CheckDetail_Create]    Script Date: 08/31/2011 20:26:57 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE procedure [dbo].[CheckDetail_Create]
(
@CustomerKey int ,
@Line1 varchar(35) ,
@Line2 varchar(35) ,
@Line3 varchar(35) ,
@Line4 varchar(35) ,
@Line5 varchar(35) ,
@BankAccountNumber varchar(35) ,
@RoutingNumber varchar(35) ,
@BankInfoLine1 varchar(35) ,
@BankInfoLine2 varchar(35) ,
@BankInfoLine3 varchar(35) ,
@BankCSZ varchar(35) ,
@BankPhone varchar(35) ,
@CheckColorKey int ,
@PrintLines bit ,
@SignatureLineCount int ,
@MessageAboveSignature varchar(35) ,
@PrintPaymentRecordOnStub bit ,
@CheckStubLineKey int ,
@Line1FontWeightKey int ,
@Line2FontWeightKey int ,
@TextAlignKey int ,
@TypeFaceKey int ,
@Fraction varchar(20) ,
@UseLogo bit,
@retval int OUTPUT

)
AS
SET NOCOUNT ON

Insert into CheckDetail
(
CustomerKey,
Line1,
Line2,
Line3,
Line4,
Line5,
BankAccountNumber,
RoutingNumber,
BankInfoLine1,
BankInfoLine2,
BankInfoLine3,
BankCSZ,
BankPhone,
CheckColorKey,
PrintLines,
SignatureLineCount,
MessageAboveSignature,
PrintPaymentRecordOnStub,
CheckStubLineKey,
Line1FontWeightKey,
Line2FontWeightKey,
TextAlignKey,
TypeFaceKey,
Fraction,
UseLogo
)
Values
(
@CustomerKey,
@Line1,
@Line2,
@Line3,
@Line4,
@Line5,
@BankAccountNumber,
@RoutingNumber,
@BankInfoLine1,
@BankInfoLine2,
@BankInfoLine3,
@BankCSZ,
@BankPhone,
@CheckColorKey,
@PrintLines,
@SignatureLineCount,
@MessageAboveSignature,
@PrintPaymentRecordOnStub,
@CheckStubLineKey,
@Line1FontWeightKey,
@Line2FontWeightKey,
@TextAlignKey,
@TypeFaceKey,
@Fraction,
@UseLogo
)
SET @retval = (Select Scope_Identity())

GO




/****** Object:  StoredProcedure [dbo].[CheckDetail_Update]    Script Date: 08/28/2011 06:44:34 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CheckDetail_Update]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[CheckDetail_Update]
GO


/****** Object:  StoredProcedure [dbo].[CheckDetail_Update]    Script Date: 08/28/2011 06:44:34 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[CheckDetail_Update]
(
@ID int
, @CustomerKey int 
, @Line1 varchar(35) 
, @Line2 varchar(35) 
, @Line3 varchar(35) 
, @Line4 varchar(35) 
, @Line5 varchar(35) 
, @BankAccountNumber varchar(35) 
, @RoutingNumber varchar(35) 
,@BankInfoLine1 varchar(35) 
,@BankInfoLine2 varchar(35) 
,@BankInfoLine3 varchar(35)  
, @BankCSZ varchar(35) 
, @BankPhone varchar(35) 
, @CheckColorKey int 
, @PrintLines bit 
, @SignatureLineCount int 
, @MessageAboveSignature varchar(35) 
, @PrintPaymentRecordOnStub bit 
, @CheckStubLineKey int 
, @Line1FontWeightKey int 
, @Line2FontWeightKey int 
, @TextAlignKey int 
, @TypeFaceKey int 
, @Fraction varchar(20)
, @UseLogo bit
)
AS
SET NOCOUNT ON
Update CheckDetail Set 
CustomerKey = @CustomerKey,
Line1 = @Line1,
Line2 = @Line2,
Line3 = @Line3,
Line4 = @Line4,
Line5 = @Line5,
BankAccountNumber = @BankAccountNumber,
RoutingNumber = @RoutingNumber,
BankInfoLine1 = @BankInfoLine1,
BankInfoLine2 = @BankInfoLine2,
BankInfoLine3 = @BankInfoLine3,
BankCSZ = @BankCSZ,
BankPhone = @BankPhone,
CheckColorKey = @CheckColorKey,
PrintLines = @PrintLines,
SignatureLineCount = @SignatureLineCount,
MessageAboveSignature = @MessageAboveSignature,
PrintPaymentRecordOnStub = @PrintPaymentRecordOnStub,
CheckStubLineKey = @CheckStubLineKey,
Line1FontWeightKey = @Line1FontWeightKey,
Line2FontWeightKey = @Line2FontWeightKey,
TextAlignKey = @TextAlignKey,
TypeFaceKey = @TypeFaceKey,
Fraction = @Fraction,
UseLogo = @UseLogo
where
CheckDetailKey = @ID

GO



/****** Object:  StoredProcedure [dbo].[CheckDetail_GetOne]    Script Date: 08/28/2011 06:43:56 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CheckDetail_GetOne]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[CheckDetail_GetOne]
GO
/****** Object:  StoredProcedure [dbo].[CheckDetail_GetOne]    Script Date: 08/28/2011 06:43:56 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE procedure [dbo].[CheckDetail_GetOne]
(
@ID int
)
AS
SET NOCOUNT ON
select 
     CheckDetailKey
     ,CustomerKey
     ,Line1
     ,Line2
     ,Line3
     ,Line4
     ,Line5
     ,BankAccountNumber
     ,RoutingNumber
     ,BankInfoLine1
	 ,BankInfoLine2 
	 ,BankInfoLine3   
     ,BankCSZ
     ,BankPhone
     ,CheckColorKey
     ,PrintLines
     ,SignatureLineCount
     ,MessageAboveSignature
     ,PrintPaymentRecordOnStub
     ,CheckStubLineKey
     ,Line1FontWeightKey
     ,Line2FontWeightKey
     ,TextAlignKey
     ,TypeFaceKey
     ,Fraction
     ,UseLogo
from
     CheckDetail
where
     CheckDetailKey = @ID

GO


alter table invoiceitem add CheckDetailKey int null

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_InvoiceItem_CheckDetail]') AND parent_object_id = OBJECT_ID(N'[dbo].[InvoiceItem]'))
ALTER TABLE [dbo].[InvoiceItem] DROP CONSTRAINT [FK_InvoiceItem_CheckDetail]
GO


ALTER TABLE [dbo].[InvoiceItem]  WITH CHECK ADD  CONSTRAINT [FK_InvoiceItem_CheckDetail] FOREIGN KEY([CheckDetailKey])
REFERENCES [dbo].[CheckDetail] ([CheckDetailKey])
GO

ALTER TABLE [dbo].[InvoiceItem] CHECK CONSTRAINT [FK_InvoiceItem_CheckDetail]
GO


/****** Object:  StoredProcedure [dbo].[InvoiceItem_Create]    Script Date: 08/02/2011 19:26:43 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[InvoiceItem_Create]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[InvoiceItem_Create]
GO


/****** Object:  StoredProcedure [dbo].[InvoiceItem_Create]    Script Date: 08/02/2011 19:26:43 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[InvoiceItem_Create]
(
@InvoiceKey int ,
@ProductKey int ,
@DepositSlipKey int,
@Description varchar(100) ,
@Quantity int ,
@Price numeric(18,2),
@ShippingRate numeric(18,2),
@DepositStampKey int ,
@CheckDetailKey int,
@retval int OUTPUT

)
AS
SET NOCOUNT ON

Insert into InvoiceItem
(
InvoiceKey,
ProductKey,
DepositSlipKey,
Description,
Quantity,
Price,
ShippingRate,
DepositStampKey,
CheckDetailKey
)
Values
(
@InvoiceKey,
@ProductKey,
@DepositSlipKey,
@Description,
@Quantity,
@Price,
@ShippingRate,
@DepositStampKey,
@CheckDetailKey
)
SET @retval = (Select Scope_Identity())
GO




/****** Object:  StoredProcedure [dbo].[InvoiceItem_GetOne]    Script Date: 08/02/2011 19:27:38 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[InvoiceItem_GetOne]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[InvoiceItem_GetOne]
GO


/****** Object:  StoredProcedure [dbo].[InvoiceItem_GetOne]    Script Date: 08/02/2011 19:27:38 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[InvoiceItem_GetOne]
(
@ID int
)
AS
SET NOCOUNT ON
select 
     InvoiceItemKey
     ,InvoiceKey
     ,ProductKey
     ,DepositSlipKey
     ,Description
     ,Quantity
     ,Price
     ,ShippingRate
     ,DepositStampKey
     ,CheckDetailKey
from
     InvoiceItem
where
     InvoiceItemKey = @ID
GO

/****** Object:  StoredProcedure [dbo].[InvoiceItem_Update]    Script Date: 08/02/2011 19:28:32 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[InvoiceItem_Update]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[InvoiceItem_Update]
GO


/****** Object:  StoredProcedure [dbo].[InvoiceItem_Update]    Script Date: 08/02/2011 19:28:32 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[InvoiceItem_Update]
(
@ID int
, @InvoiceKey int 
, @ProductKey int 
, @DepositSlipKey int
, @Description varchar(100) 
, @Quantity int 
, @Price numeric(18,2)
, @ShippingRate numeric(18,2)
, @DepositStampKey int
, @CheckDetailKey int
)
AS
SET NOCOUNT ON
Update InvoiceItem Set 
InvoiceKey = @InvoiceKey,
ProductKey = @ProductKey,
Description = @Description,
Quantity = @Quantity,
Price = @Price,
ShippingRate = @ShippingRate,
DepositStampKey = @DepositStampKey,
CheckDetailKey = @CheckDetailKey
where
InvoiceItemKey = @ID
GO




insert into checkcolor (producttypekey, description,imagepath)
values (3, 'Blue','../images/checks/QBVoucher/Background-blue.jpg')
go
insert into CheckColor (ProductTypeKey,Description,ImagePath)
values (3,'Green','../images/checks/QBVoucher/Background-green.jpg')
go


if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[CheckColor_Create]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[CheckColor_Create]
GO

create procedure [dbo].[CheckColor_Create]
(
@ProductTypeKey int ,
@Description varchar(50) ,
@ImagePath varchar(50) ,
@retval int OUTPUT

)
AS
SET NOCOUNT ON

Insert into CheckColor
(
ProductTypeKey,
Description,
ImagePath
)
Values
(
@ProductTypeKey,
@Description,
@ImagePath
)
SET @retval = (Select Scope_Identity())
GO


if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[CheckColor_Update]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[CheckColor_Update]
GO
create procedure [dbo].[CheckColor_Update]
(
@ID int
, @ProductTypeKey int 
, @Description varchar(50) 
, @ImagePath varchar(50) 
)
AS
SET NOCOUNT ON
Update CheckColor Set 
ProductTypeKey = @ProductTypeKey,
Description = @Description,
ImagePath = @ImagePath
where
CheckColorKey = @ID
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[CheckColor_GetOne]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[CheckColor_GetOne]
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
from
     CheckColor
where
     CheckColorKey = @ID
GO

insert into TypeFace (Description) values ('Arial')
go
insert into TypeFace (Description) values ('Times Roman')
go

insert into TextAlign (Description) values ('Left')
go
insert into TextAlign (Description) values ('Center')
go


if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TypeFace_Create]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[TypeFace_Create]
GO

create procedure [dbo].[TypeFace_Create]
(
@Description varchar(50) ,
@retval int OUTPUT

)
AS
SET NOCOUNT ON

Insert into TypeFace
(
Description
)
Values
(
@Description
)
SET @retval = (Select Scope_Identity())
GO


if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TypeFace_Update]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[TypeFace_Update]
GO
create procedure [dbo].[TypeFace_Update]
(
@ID int
, @Description varchar(50) 
)
AS
SET NOCOUNT ON
Update TypeFace Set 
Description = @Description
where
TypeFaceKey = @ID
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TypeFace_GetOne]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[TypeFace_GetOne]
GO

create procedure [dbo].[TypeFace_GetOne]
(
@ID int
)
AS
SET NOCOUNT ON
select 
     TypeFaceKey
     ,Description
from
     TypeFace
where
     TypeFaceKey = @ID
GO

insert into FontWeight (Description) values ('Normal')
go
insert into FontWeight (Description) values ('Bold')
go



/****** Object:  Table [dbo].[CheckFeatureOption]    Script Date: 08/27/2011 13:23:16 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CheckFeatureOption]') AND type in (N'U'))
DROP TABLE [dbo].[CheckFeatureOption]
GO


/****** Object:  Table [dbo].[CheckFeatureOption]    Script Date: 08/27/2011 13:23:16 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[CheckFeatureOption](
	[CheckFeatureOptionKey] [int] IDENTITY(1,1) NOT NULL,
	[Description] [varchar](50) NOT NULL,
 CONSTRAINT [PK_CheckFeatureOption] PRIMARY KEY CLUSTERED 
(
	[CheckFeatureOptionKey] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

insert into CheckFeatureOption (Description) values ('Has Print Lines Option')
go
insert into CheckFeatureOption (Description) values ('Has Stub Options')
go

/*
insert into ProductType (ProductCategoryKey,Description,ShippingRateGroupKey)
values(3,'Peachtree Accounting Check',1)
go
insert into ProductType (ProductCategoryKey,Description,ShippingRateGroupKey)
values(3,'Quicken Standard Check',1)
go
insert into ProductType (ProductCategoryKey,Description,ShippingRateGroupKey)
values(3,'Blackbaud Check',1)
go
*/


/****** Object:  Table [dbo].[ProductTypeCheckOptionXRef]    Script Date: 08/27/2011 13:39:44 ******/
insert into ProductTypeCheckOptionXRef (ProductTypeKey,CheckFeatureOptionKey,IsAvailable)
values (4,1,1)
go
insert into ProductTypeCheckOptionXRef (ProductTypeKey,CheckFeatureOptionKey,IsAvailable)
values (4,2,1)
go

/*
insert into ProductTypeCheckOptionXRef (ProductTypeKey,CheckFeatureOptionKey,IsAvailable)
values (5,2,1)
go
insert into ProductTypeCheckOptionXRef (ProductTypeKey,CheckFeatureOptionKey,IsAvailable)
values (6,1,1)
go
*/


insert into CheckStubLine (Description) values ('Print Line 1 On Stub')
go
insert into CheckStubLine (Description) values ('Print Line 1 and 2 On Stub')
go


/****** Object:  StoredProcedure [dbo].[usp_SelectProduct_DepositSlipList]    Script Date: 09/03/2011 04:00:11 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_SelectProduct_DepositSlipList]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_SelectProduct_DepositSlipList]
GO


/****** Object:  StoredProcedure [dbo].[usp_SelectProduct_DepositSlipList]    Script Date: 09/03/2011 04:00:11 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_SelectProduct_DepositSlipList] 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
	select 
		producttypekey, 
		productcategorykey, 
		description, 
		shippingrategroupkey 
	from 
		producttype 
	where 
		producttypekey in (1) 
	order by productcategorykey, description
END

GO


/****** Object:  StoredProcedure [dbo].[usp_SelectProduct_PrePrintedCheckList]    Script Date: 09/03/2011 04:00:29 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_SelectProduct_PrePrintedCheckList]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_SelectProduct_PrePrintedCheckList]
GO


/****** Object:  StoredProcedure [dbo].[usp_SelectProduct_PrePrintedCheckList]    Script Date: 09/03/2011 04:00:29 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_SelectProduct_PrePrintedCheckList] 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
	select 
		producttypekey, 
		productcategorykey, 
		description, 
		shippingrategroupkey 
	from 
		producttype 
	where 
		producttypekey in (4) 
	order by productcategorykey, description
END

GO


