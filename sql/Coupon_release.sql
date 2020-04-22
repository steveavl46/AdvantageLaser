SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[CouponCategory](
	[CouponCategoryKey] [int] IDENTITY(1,1) NOT NULL,
	[Description] [varchar](35) NOT NULL,
 CONSTRAINT [PK_CouponCategory] PRIMARY KEY CLUSTERED 
(
	[CouponCategoryKey] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

insert into CouponCategory (Description) values ('Printed Materials')
insert into CouponCategory (Description) values ('Envelopes')
insert into CouponCategory (Description) values ('All')

go


SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[CouponType](
	[CouponTypeKey] [int] IDENTITY(1,1) NOT NULL,
	[Description] [varchar](35) NOT NULL,
 CONSTRAINT [PK_CouponType] PRIMARY KEY CLUSTERED 
(
	[CouponTypeKey] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

insert into CouponType (Description) values ('Dollar Discount')
insert into CouponType (Description) values ('Percent Discount')
go

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[Coupon](
	[CouponKey] [int] IDENTITY(1,1) NOT NULL,
	[CouponCode] [varchar] (8) NOT NULL,
	[Description] [varchar](25) NOT NULL,
	[StartDate] [DateTime] NOT NULL,
	[EndDate] [DateTime] NOT NULL,
	[CouponTypeKey] [int] NOT NULL,
	[CouponCategoryKey] [int] NOT NULL,
	[DollarValue] [numeric](18, 2) NULL,
	[PercentValue] [numeric](18, 2) NULL,
	[MinimumOrder] [numeric](18, 2) NULL,
 CONSTRAINT [PK_Coupon] PRIMARY KEY CLUSTERED 
(
	[CouponKey] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

ALTER TABLE [dbo].[Coupon]  WITH CHECK ADD  CONSTRAINT [FK_Coupon_CouponType] FOREIGN KEY([CouponTypeKey])
REFERENCES [dbo].[CouponType] ([CouponTypeKey])
GO

ALTER TABLE [dbo].[Coupon] CHECK CONSTRAINT [FK_Coupon_CouponType]
GO

ALTER TABLE [dbo].[Coupon]  WITH CHECK ADD  CONSTRAINT [FK_Coupon_CouponCategory] FOREIGN KEY([CouponCategoryKey])
REFERENCES [dbo].[CouponCategory] ([CouponCategoryKey])
GO

ALTER TABLE [dbo].[Coupon] CHECK CONSTRAINT [FK_Coupon_CouponType]
GO


alter table invoice add CouponKey int null
go

ALTER TABLE [dbo].[Invoice]  WITH CHECK ADD  CONSTRAINT [FK_Invoice_Coupon] FOREIGN KEY([CouponKey])
REFERENCES [dbo].[Coupon] ([CouponKey])
GO

ALTER TABLE [dbo].[Invoice] CHECK CONSTRAINT [FK_Invoice_Coupon]
GO

alter table invoice add CouponDiscount [numeric](18, 2) NULL
go

alter table invoice add ReferralCode varchar(30) null
go

/*

*/

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[ProductCategoryCouponCategoryXref](
	[ProductCategoryCouponCategoryXrefKey] [int] IDENTITY(1,1) NOT NULL,
	[ProductCategoryKey] int NOT NULL,
	[CouponCategoryKey] int NOT NULL,
 CONSTRAINT [PK_ProductCategoryCouponTypeXref] PRIMARY KEY CLUSTERED 
(
	[ProductCategoryCouponCategoryXrefKey] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[ProductCategoryCouponCategoryXref]  WITH CHECK ADD  CONSTRAINT [FK_ProductCategoryCouponCategoryXref_CouponCategory] FOREIGN KEY([CouponCategoryKey])
REFERENCES [dbo].[CouponCategory] ([CouponCategoryKey])
GO

ALTER TABLE [dbo].[ProductCategoryCouponCategoryXref] CHECK CONSTRAINT [FK_ProductCategoryCouponCategoryXref_CouponCategory]
GO

ALTER TABLE [dbo].[ProductCategoryCouponCategoryXref]  WITH CHECK ADD  CONSTRAINT [FK_ProductCategoryCouponCategoryXref_ProductCategory] FOREIGN KEY([ProductCategoryKey])
REFERENCES [dbo].[ProductCategory] ([ProductCategoryKey])
GO

ALTER TABLE [dbo].[ProductCategoryCouponCategoryXref] CHECK CONSTRAINT [FK_ProductCategoryCouponCategoryXref_ProductCategory]
GO

insert into ProductCategoryCouponCategoryXref (ProductCategoryKey, CouponCategoryKey) values (1, 1)
go
insert into ProductCategoryCouponCategoryXref (ProductCategoryKey, CouponCategoryKey) values (3, 1)
go
insert into ProductCategoryCouponCategoryXref (ProductCategoryKey, CouponCategoryKey) values (5, 1)
go

insert into ProductCategoryCouponCategoryXref (ProductCategoryKey, CouponCategoryKey) values (4, 2)
go

insert into ProductCategoryCouponCategoryXref (ProductCategoryKey, CouponCategoryKey) values (1, 3)
go
insert into ProductCategoryCouponCategoryXref (ProductCategoryKey, CouponCategoryKey) values (3, 3)
go
insert into ProductCategoryCouponCategoryXref (ProductCategoryKey, CouponCategoryKey) values (4, 3)
go
insert into ProductCategoryCouponCategoryXref (ProductCategoryKey, CouponCategoryKey) values (5, 3)
go
insert into ProductCategoryCouponCategoryXref (ProductCategoryKey, CouponCategoryKey) values (2, 3)
go

/****** Object:  StoredProcedure [dbo].[Coupon_Create]    Script Date: 02/25/2017 08:40:20 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Coupon_Create]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Coupon_Create]
GO

/****** Object:  StoredProcedure [dbo].[Coupon_Create]    Script Date: 02/25/2017 08:40:20 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[Coupon_Create]
(
@CouponCode varchar(8) ,
@Description varchar(25) ,
@StartDate DateTime ,
@EndDate DateTime,
@CouponTypeKey int ,
@CouponCategoryKey int,
@DollarValue numeric (18, 2),
@PercentValue numeric (18, 2),
@MinimumOrder numeric (18, 2),
@retval int OUTPUT

)
AS
SET NOCOUNT ON

Insert into Coupon
(
CouponCode,
Description,
StartDate,
EndDate,
CouponTypeKey,
CouponCategoryKey,
DollarValue,
PercentValue,
MinimumOrder
)
Values
(
@CouponCode,
@Description,
@StartDate,
@EndDate,
@CouponTypeKey,
@CouponCategoryKey,
@DollarValue,
@PercentValue,
@MinimumOrder
)
SET @retval = (Select Scope_Identity())

GO


/****** Object:  StoredProcedure [dbo].[Coupon_Update]    Script Date: 02/25/2017 08:43:56 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Coupon_Update]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Coupon_Update]
GO



/****** Object:  StoredProcedure [dbo].[Coupon_Update]    Script Date: 02/25/2017 08:43:56 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[Coupon_Update]
(
@ID int,
@CouponCode varchar(8) ,
@Description varchar(25) ,
@StartDate DateTime ,
@EndDate DateTime,
@CouponTypeKey int ,
@CouponCategoryKey int,
@DollarValue numeric (18, 2),
@PercentValue numeric (18, 2),
@MinimumOrder numeric (18, 2)
)
AS
SET NOCOUNT ON
Update Coupon Set 
CouponCode = @CouponCode,
Description = @Description,
StartDate = @StartDate,
EndDate = @EndDate,
CouponTypeKey = @CouponTypeKey,
CouponCategoryKey = @CouponCategoryKey,
DollarValue = @DollarValue,
PercentValue = @PercentValue,
MinimumOrder = @MinimumOrder
where
CouponKey = @ID

GO


/****** Object:  StoredProcedure [dbo].[Coupon_GetOne]    Script Date: 02/25/2017 08:42:41 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Coupon_GetOne]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Coupon_GetOne]
GO


/****** Object:  StoredProcedure [dbo].[Coupon_GetOne]    Script Date: 02/25/2017 08:42:41 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[Coupon_GetOne]
(
@ID int
)
AS
SET NOCOUNT ON
select 
     CouponKey
     ,CouponCode
     ,Description
     ,StartDate
     ,EndDate
     ,CouponTypeKey
     ,CouponCategoryKey
     ,DollarValue
     ,PercentValue
     ,MinimumOrder
from
     Coupon
where
     CouponKey = @ID

GO




/****** Object:  StoredProcedure [dbo].[GetCoupons]    Script Date: 06/29/2017 20:39:27 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GetCoupons]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[GetCoupons]
GO


/****** Object:  StoredProcedure [dbo].[GetCoupons]    Script Date: 06/29/2017 20:39:27 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[GetCoupons]

AS
SET NOCOUNT ON
select 
     CouponKey
     ,CouponCode
     ,c.Description
     ,StartDate
     ,EndDate
     ,DollarValue
     ,PercentValue
     ,MinimumOrder
     ,t.Description as CouponTypeDescription
     ,cat.Description as CouponCategoryDescription
     ,c.CouponTypeKey
from
     Coupon c
     join CouponType t on c.CouponTypeKey = t.CouponTypeKey
     join CouponCategory cat on cat.CouponCategoryKey = c.CouponCategoryKey



GO




/****** Object:  StoredProcedure [dbo].[Invoice_Create]    Script Date: 07/01/2017 08:18:18 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


ALTER procedure [dbo].[Invoice_Create]
(
@CustomerKey int ,
@OrderDate datetime ,
@ShippingDate datetime ,
@Comment varchar(200) ,
@ShippingTotal numeric(18,2) ,
@CreditCardKey int ,
@ShippingTypeKey int ,
@ExpediteTypeKey int ,
@DebitAccount varchar(20) ,
@BillCharges bit ,
@ExpediteAmount numeric(18,2) ,
@ComputerIP varchar(50),
@SalesPersonID varchar(100),
@ExpediteSubTypeKey int,
@CouponKey int,
@ReferralCode varchar(30),
@CouponDiscount numeric(18,2),
@retval int OUTPUT

)
AS
SET NOCOUNT ON

Insert into Invoice
(
CustomerKey,
OrderDate,
ShippingDate,
Comment,
ShippingTotal,
CreditCardKey,
ShippingTypeKey,
ExpediteTypeKey,
DebitAccount, 
BillCharges,
ExpediteAmount,
ComputerIP,
SalesPersonID,
ExpediteSubTypeKey,
CouponKey,
ReferralCode,
CouponDiscount
)
Values
(
@CustomerKey,
@OrderDate,
@ShippingDate,
@Comment,
@ShippingTotal,
@CreditCardKey,
@ShippingTypeKey,
@ExpediteTypeKey,
@DebitAccount,
@BillCharges,
@ExpediteAmount,
@ComputerIP,
@SalesPersonID,
@ExpediteSubTypeKey,
@CouponKey,
@ReferralCode,
@CouponDiscount
)
SET @retval = (Select Scope_Identity())


GO



/****** Object:  StoredProcedure [dbo].[Invoice_GetOne]    Script Date: 07/01/2017 08:20:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


ALTER procedure [dbo].[Invoice_GetOne]
(
@ID int
)
AS
SET NOCOUNT ON
select 
     InvoiceKey
     ,CustomerKey
     ,OrderDate
     ,ShippingDate
     ,Comment
     ,ShippingTotal
     ,CreditCardKey
     ,ShippingTypeKey
     ,ExpediteTypeKey
     ,DebitAccount
     ,BillCharges
     ,ExpediteAmount
     ,ComputerIP
     ,SalesPersonID
     ,ExpediteSubTypeKey
     ,CouponKey
     ,ReferralCode
     ,CouponDiscount
from
     Invoice
where
     InvoiceKey = @ID



go


/****** Object:  StoredProcedure [dbo].[Invoice_Update]    Script Date: 07/01/2017 08:20:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER procedure [dbo].[Invoice_Update]
(
@ID int
, @CustomerKey int 
, @OrderDate datetime 
, @ShippingDate datetime 
, @Comment varchar(200) 
, @ShippingTotal numeric(18,2) 
, @CreditCardKey int 
, @ShippingTypeKey int 
, @ExpediteTypeKey int 
, @DebitAccount varchar(20)
, @BillCharges bit
, @ExpediteAmount numeric(18,2)
, @ComputerIP varchar(50)
, @SalesPersonID varchar(100)
, @ExpediteSubTypeKey int
,@CouponKey int
,@CouponDiscount numeric(18,2)
,@ReferralCode varchar(30)
)
AS
SET NOCOUNT ON
Update Invoice Set 
CustomerKey = @CustomerKey,
OrderDate = @OrderDate,
ShippingDate = @ShippingDate,
Comment = @Comment,
ShippingTotal = @ShippingTotal,
CreditCardKey = @CreditCardKey,
ShippingTypeKey = @ShippingTypeKey,
ExpediteTypeKey = @ExpediteTypeKey,
DebitAccount = @DebitAccount,
BillCharges = @BillCharges,
ExpediteAmount = @ExpediteAmount,
ComputerIP = @ComputerIP,
SalesPersonID = @SalesPersonID,
ExpediteSubTypeKey = @ExpediteSubTypeKey,
CouponKey = @CouponKey,
CouponDiscount = @CouponDiscount,
ReferralCode = @ReferralCode
where
InvoiceKey = @ID


go

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GetCouponByCode]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[GetCouponByCode]
GO


/****** Object:  StoredProcedure [dbo].[GetCouponByCode]    Script Date: 06/29/2017 20:39:27 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[GetCouponByCode]
(
@CouponCode varchar(8)
)
AS
SET NOCOUNT ON
select 
     CouponKey
     ,CouponCode
     ,Description
     ,StartDate
     ,EndDate
     ,CouponTypeKey
     ,CouponCategoryKey
     ,DollarValue
     ,PercentValue
     ,MinimumOrder
from
     Coupon
where
	CouponCode = @CouponCode    

GO


IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GetProductCategoriesForCoupon]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[GetProductCategoriesForCoupon]
GO


/****** Object:  StoredProcedure [dbo].[GetProductCategoriesForCoupon]    Script Date: 06/29/2017 20:39:27 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[GetProductCategoriesForCoupon]
(
@CouponCategoryKey int
)
AS
SET NOCOUNT ON
select p.ProductCategoryKey, p.Description
from ProductCategory p
join ProductCategoryCouponCategoryXref xr on xr.ProductCategoryKey = p.ProductCategoryKey
where
xr.CouponCategoryKey = @CouponCategoryKey

GO

ALTER TABLE Coupon
ADD CONSTRAINT UC_CouponCode UNIQUE (CouponCode);
go

USE [CheckProject_Test]
GO

/****** Object:  View [dbo].[v_OrderInfo]    Script Date: 07/03/2017 15:21:50 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO




ALTER VIEW [dbo].[v_OrderInfo]
AS
SELECT        
i.InvoiceKey, 
i.OrderDate, 
dbo.ProductType.Description AS ProductTypeDescription, 
v.Description AS InvoiceItemDescription, 
ISNULL(v.SoftwareName,'') as SoftwareAlias,
v.Quantity, 
v.Price, 
i.ShippingTotal, 
c.FirstName, 
c.LastName, 
c.BusinessName, 
c.EMailAddress, 
c.AlternateEMailAddress, 
c.DayPhone, 
c.FaxNumber,
a.Line1 AS ShippingAddressLine1, 
a.Line2 AS ShippingAddressLine2, 
a.City AS ShippingAddressCity, 
a.State AS ShippingAddressState, 
a.ZipCode AS ShippingAddressZipCode, 
case 
							when product.ProductTypeKey = 1 then d.RoutingNumber
							when product.ProductTypeKey = 3 then null
							when Product.ProductTypeKey = 4 then cd.RoutingNumber
							when Product.ProductTypeKey = 5 then cd.RoutingNumber
							when Product.ProductTypeKey = 6 then cd.RoutingNumber
							when Product.ProductTypeKey = 8 then cd.RoutingNumber
							when Product.ProductTypeKey = 9 then cd.RoutingNumber
							when Product.ProductTypeKey = 12 then db.RoutingNumber
						 end AS RoutingNumber, 
						 case 
							when product.ProductTypeKey = 1 then d.AccountNumber
							when product.ProductTypeKey = 3 then ds.AccountNumber
							when Product.ProductTypeKey = 4 then cd.BankAccountNumber
							when Product.ProductTypeKey = 5 then cd.BankAccountNumber
							when Product.ProductTypeKey = 6 then cd.BankAccountNumber
							when Product.ProductTypeKey = 8 then cd.BankAccountNumber
							when Product.ProductTypeKey = 9 then cd.BankAccountNumber
							when Product.ProductTypeKey = 12 then db.AccountNumber
						 end AS AccountNumber, 
						 case 
							when product.ProductTypeKey = 1 then d.Fraction
							when product.ProductTypeKey = 3 then null
							when Product.ProductTypeKey = 4 then cd.Fraction
							when Product.ProductTypeKey = 5 then cd.Fraction
							when Product.ProductTypeKey = 6 then cd.Fraction
							when Product.ProductTypeKey = 8 then cd.Fraction
							when Product.ProductTypeKey = 9 then cd.Fraction
							when Product.ProductTypeKey = 12 then db.Fraction
						 end AS Fraction, 
                         case 
							when product.ProductTypeKey = 1 then d.BankInfoLine1
							when product.ProductTypeKey = 3 then ds.BankName
							when Product.ProductTypeKey = 4 then cd.BankInfoLine1
							when Product.ProductTypeKey = 5 then cd.BankInfoLine1
							when Product.ProductTypeKey = 6 then cd.BankInfoLine1
							when Product.ProductTypeKey = 8 then cd.BankInfoLine1
							when Product.ProductTypeKey = 9 then cd.BankInfoLine1
							when Product.ProductTypeKey = 12 then db.BankInfoLine1
						 end AS BankInfoLine1, 
                         
                         case 
							when product.ProductTypeKey = 1 then d.BankInfoLine2
							when product.ProductTypeKey = 3 then null
							when Product.ProductTypeKey = 4 then cd.BankInfoLine2
							when Product.ProductTypeKey = 5 then cd.BankInfoLine2
							when Product.ProductTypeKey = 6 then cd.BankInfoLine2
							when Product.ProductTypeKey = 8 then cd.BankInfoLine2
							when Product.ProductTypeKey = 9 then cd.BankInfoLine2
							when Product.ProductTypeKey = 12 then db.BankInfoLine2
						 end AS BankInfoLine2,
						 case 
							when product.ProductTypeKey = 1 then d.BankInfoLine3
							when product.ProductTypeKey = 3 then null
							when Product.ProductTypeKey = 4 then cd.BankInfoLine3
							when Product.ProductTypeKey = 5 then cd.BankInfoLine3
							when Product.ProductTypeKey = 6 then cd.BankInfoLine3
							when Product.ProductTypeKey = 8 then cd.BankInfoLine3
							when Product.ProductTypeKey = 9 then cd.BankInfoLine3
							when Product.ProductTypeKey = 12 then db.BankInfoLine3
						 end AS BankInfoLine3,
						 case 
							when product.ProductTypeKey = 1 then d.Line1
							when product.ProductTypeKey = 3 then ds.Line1
							when Product.ProductTypeKey = 4 then cd.Line1
							when Product.ProductTypeKey = 5 then cd.Line1
							when Product.ProductTypeKey = 6 then cd.Line1
							when Product.ProductTypeKey = 8 then cd.Line1
							when Product.ProductTypeKey = 9 then cd.Line1
							when Product.ProductTypeKey = 12 then db.Line1
						 end AS Line1,
						 case 
							when product.ProductTypeKey = 1 then d.Line2
							when product.ProductTypeKey = 3 then null
							when Product.ProductTypeKey = 4 then cd.Line2
							when Product.ProductTypeKey = 5 then cd.Line2
							when Product.ProductTypeKey = 6 then cd.Line2
							when Product.ProductTypeKey = 8 then cd.Line2
							when Product.ProductTypeKey = 9 then cd.Line2
							when Product.ProductTypeKey = 12 then db.Line2
						 end AS Line2,
						 case 
							when product.ProductTypeKey = 1 then d.Line3
							when product.ProductTypeKey = 3 then null
							when Product.ProductTypeKey = 4 then cd.Line3
							when Product.ProductTypeKey = 5 then cd.Line3
							when Product.ProductTypeKey = 6 then cd.Line3
							when Product.ProductTypeKey = 8 then cd.Line3
							when Product.ProductTypeKey = 9 then cd.Line3
							when Product.ProductTypeKey = 12 then db.Line3
						 end AS Line3,
                         case 
							when product.ProductTypeKey = 1 then d.Line4
							when product.ProductTypeKey = 3 then null
							when Product.ProductTypeKey = 4 then cd.Line4
							when Product.ProductTypeKey = 5 then cd.Line4
							when Product.ProductTypeKey = 6 then cd.Line4
							when Product.ProductTypeKey = 8 then cd.Line4
							when Product.ProductTypeKey = 9 then cd.Line4
							when Product.ProductTypeKey = 12 then db.Line4
						 end AS Line4,
						 case 
							when product.ProductTypeKey = 1 then d.Line5
							when product.ProductTypeKey = 3 then null
							when Product.ProductTypeKey = 4 then cd.Line5
							when Product.ProductTypeKey = 5 then cd.Line5
							when Product.ProductTypeKey = 6 then cd.Line5
							when Product.ProductTypeKey = 8 then cd.Line5
							when Product.ProductTypeKey = 9 then cd.Line5
							when Product.ProductTypeKey = 12 then db.Line5
						 end AS Line5,
cd.StartingNumber as StartingCheckNumber,
ta.Description as CheckTextAlignment,	
tf.Description as CheckTypeFace,
fw.Description as Line1FontWeight,
fw1.Description as Line2FontWeight,					 
cc.Description as CheckColor,
case 
	when Product.ProductTypeKey = 4 then cc.PartNumber
	when Product.ProductTypeKey = 5 then cc.PartNumber
	when Product.ProductTypeKey = 6 then cc.PartNumber
	when Product.ProductTypeKey = 8 then cc.PartNumber
	when Product.ProductTypeKey = 9 then cc.PartNumber
	else null
end as PartNumber,
cd.PrintLines,
cd.SignatureLineCount,
cd.MessageAboveSignature,
cd.PrintPaymentRecordOnStub,
cd.ShowCheckNo,
csl.Description as CheckStubLines,
case when cd.UseLogo = 1 then 'Yes' else 'No' end as UseLogo,
cd.LogoWidth,
cd.LogoHeight,
cd.LogoPath,
cd.PreviewPath,
co.description as checkorder,
i.BillCharges, 
i.DebitAccount, 
dbo.ExpediteType.ShortDescription AS ExpediteTypeDescription, 
dbo.ExpediteSubType.ShortDescription AS ExpediteSubTypeDescription, 
st.Description as ShippingTypeDescription,
i.ExpediteAmount, 
dbo.CreditCard.Number AS CreditCardNumber, 
dbo.CreditCard.ExpirationMonth, 
dbo.CreditCard.ExpirationYear, 
dbo.CreditCard.CCV, 
dbo.CreditCardType.Description AS CreditCardTypeDescription, 
CASE WHEN a.State = 'GA' THEN 'yes' ELSE 'no' END AS taxable, 
dbo.Address.Line1 AS BillingAddressLine1, 
dbo.Address.Line2 AS BillingAddressLine2, 
dbo.Address.City AS BillingAddressCity, 
dbo.Address.State AS BillingAddressState, 
dbo.Address.ZipCode AS BillingAddressZipCode,
i.ComputerIP,
cd.LogoLeftPosition,
cd.LogoVerticalPosition,
cd.AddressBlockLeftPosition,
cd.AddressBlockVerticalPosition,
ll.Description as LogoLocationDescription,
cd.SuppressLine1,
cd.ColorLogo,
i.SalesPersonID,
i.CouponKey,
i.CouponDiscount,
cp.CouponCode,
i.ReferralCode
FROM            dbo.Invoice AS i INNER JOIN
                         dbo.Customer AS c ON c.CustomerKey = i.CustomerKey INNER JOIN
                         dbo.InvoiceItem AS v ON v.InvoiceKey = i.InvoiceKey LEFT OUTER JOIN
                         dbo.DepositSlip AS d ON v.DepositSlipKey = d.DepositSlipKey 
                         Left Join Coupon cp on cp.CouponKey = i.CouponKey
                         Left join DepositBook db on db.DepositBookKey = v.DepositBookKey
                         LEFT join CheckDetail cd on cd.CheckDetailKey = v.CheckDetailKey
                         LEFT join CheckColor cc on cd.CheckColorKey = cc.CheckColorKey
                         LEFT join LogoLocation ll on ll.LogoLocationKey = cd.LogoLocationKey
                         LEFT join FontWeight fw on cd.Line1FontWeightKey = fw.FontWeightKey
                         LEFT join FontWeight fw1 on cd.Line2FontWeightKey = fw1.FontWeightKey
                         LEFT join TextAlign ta on cd.TextAlignKey = ta.TextAlignKey
                         LEFT join TypeFace tf on cd.TypeFaceKey = tf.TypeFaceKey
                         LEFT join CheckStubLine csl on cd.CheckStubLineKey = csl.CheckStubLineKey
                         LEFT join DepositStamp ds on ds.DepositStampKey = v.DepositStampKey
                         LEFT join CheckOrder co on co.checkorderkey = cd.checkorderkey
                         LEFT Join ShippingType st on st.ShippingTypeKey = i.ShippingTypeKey
                         INNER JOIN
                         dbo.Address AS a ON a.CustomerKey = c.CustomerKey INNER JOIN
                         dbo.Address ON c.CustomerKey = dbo.Address.CustomerKey INNER JOIN
                         dbo.Product ON v.ProductKey = dbo.Product.ProductKey INNER JOIN
                         dbo.ProductType ON dbo.Product.ProductTypeKey = dbo.ProductType.ProductTypeKey LEFT OUTER JOIN
                         dbo.DepositStamp ON c.CustomerKey = dbo.DepositStamp.CustomerKey AND v.DepositStampKey = dbo.DepositStamp.DepositStampKey 
                         LEFT OUTER JOIN dbo.ExpediteType ON i.ExpediteTypeKey = dbo.ExpediteType.ExpediteTypeKey 
                         LEFT OUTER JOIN dbo.ExpediteSubType ON i.ExpediteSubTypeKey = dbo.ExpediteSubType.ExpediteSubTypeKey 
                         LEFT OUTER JOIN dbo.CreditCard ON i.CreditCardKey = dbo.CreditCard.CreditCardKey AND c.CustomerKey = dbo.CreditCard.CustomerKey LEFT OUTER JOIN
                         dbo.CreditCardType ON dbo.CreditCard.CreditCardTypeKey = dbo.CreditCardType.CreditCardTypeKey
WHERE        (1 = 1) AND (a.AddressTypeKey = 1) AND (dbo.Address.AddressTypeKey = 2)




GO


