

/****** Object:  Table [dbo].[LogoLocation]    Script Date: 03/19/2012 19:44:50 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[LogoLocation](
	[LogoLocationKey] [int] IDENTITY(1,1) NOT NULL,
	[Description] [varchar](50) NOT NULL,
 CONSTRAINT [PK_LogoLocation] PRIMARY KEY CLUSTERED 
(
	[LogoLocationKey] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

insert into LogoLocation (Description) values ('Left Of Address')
go
insert into LogoLocation (Description) values ('Right Of Address')
go
insert into LogoLocation (Description) values('Above Address')
go
insert into LogoLocation (Description) values('Below Address')
go

alter table CheckDetail add LogoLeftPosition int null
go
alter table CheckDetail add LogoVerticalPosition int null
go
alter table CheckDetail add AddressBlockLeftPosition int null
go
alter table CheckDetail add AddressBlockVerticalPosition int null
go
alter table CheckDetail add LogoLeftAdjustment int null
go
alter table CheckDetail add LogoVerticalAdjustment int null
go
alter table CheckDetail add AddressBlockLeftAdjustment int null
go
alter table CheckDetail add AddressBlockVerticalAdjustment int null
go
alter table CheckDetail add SuppressLine1 bit not null default 0
go
alter table CheckDetail add LogoLocationKey int null
go
alter table CheckDetail add SizedLogoName varchar(200) null
go
alter table CheckDetail add ColorLogo bit not null default 0
go




/****** Object:  StoredProcedure [dbo].[CheckDetail_Create]    Script Date: 03/19/2012 20:13:51 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CheckDetail_Create]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[CheckDetail_Create]
GO


/****** Object:  StoredProcedure [dbo].[CheckDetail_Create]    Script Date: 03/19/2012 20:13:51 ******/
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
@StartingNumber varchar(35),
@Approved bit,
@LogoPath varchar(200),
@PreviewPath varchar(200),
@LogoWidth int,
@LogoHeight int,
@CheckOrderKey int,
@LogoLeftPosition int,
@LogoVerticalPosition int,
@AddressBlockLeftPosition int,
@AddressBlockVerticalPosition int,
@LogoLeftAdjustment int,
@LogoVerticalAdjustment int,
@AddressBlockLeftAdjustment int,
@AddressBlockVerticalAdjustment int,
@SuppressLine1 bit,
@LogoLocationKey int,
@SizedLogoName varchar(200),
@ColorLogo bit,
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
UseLogo,
StartingNumber,
Approved,
LogoPath,
PreviewPath,
LogoWidth,
LogoHeight,
CheckOrderKey,
LogoLeftPosition,
LogoVerticalPosition,
AddressBlockLeftPosition,
AddressBlockVerticalPosition,
LogoLeftAdjustment,
LogoVerticalAdjustment,
AddressBlockLeftAdjustment,
AddressBlockVerticalAdjustment,
SuppressLine1,
LogoLocationKey,
SizedLogoName,
ColorLogo
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
@UseLogo,
@StartingNumber,
@Approved,
@LogoPath,
@PreviewPath,
@LogoWidth,
@LogoHeight,
@CheckOrderKey,
@LogoLeftPosition,
@LogoVerticalPosition,
@AddressBlockLeftPosition,
@AddressBlockVerticalPosition,
@LogoLeftAdjustment,
@LogoVerticalAdjustment,
@AddressBlockLeftAdjustment,
@AddressBlockVerticalAdjustment,
@SuppressLine1,
@LogoLocationKey,
@SizedLogoName,
@ColorLogo
)
SET @retval = (Select Scope_Identity())


GO




/****** Object:  StoredProcedure [dbo].[CheckDetail_GetOne]    Script Date: 03/19/2012 20:17:44 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CheckDetail_GetOne]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[CheckDetail_GetOne]
GO

/****** Object:  StoredProcedure [dbo].[CheckDetail_GetOne]    Script Date: 03/19/2012 20:17:44 ******/
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
     ,StartingNumber
     ,Approved
     ,LogoPath
     ,PreviewPath
     ,LogoHeight
     ,LogoWidth
     ,CheckOrderKey
     ,LogoLeftPosition
     ,LogoVerticalPosition
     ,AddressBlockLeftPosition
     ,AddressBlockVerticalPosition
     ,LogoLeftAdjustment
     ,LogoVerticalAdjustment
     ,AddressBlockLeftAdjustment
     ,AddressBlockVerticalAdjustment
     ,SuppressLine1
     ,LogoLocationKey
     ,SizedLogoName
     ,ColorLogo
from
     CheckDetail
where
     CheckDetailKey = @ID



GO


/****** Object:  StoredProcedure [dbo].[CheckDetail_Update]    Script Date: 03/19/2012 20:20:11 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CheckDetail_Update]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[CheckDetail_Update]
GO


/****** Object:  StoredProcedure [dbo].[CheckDetail_Update]    Script Date: 03/19/2012 20:20:11 ******/
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
, @StartingNumber varchar(35)
, @Approved bit
, @LogoPath varchar(200)
, @PreviewPath varchar(200)
, @LogoWidth int
, @LogoHeight int
, @CheckOrderKey int
, @LogoLeftPosition int
, @LogoVerticalPosition int
, @AddressBlockLeftPosition int
, @AddressBlockVerticalPosition int
, @LogoLeftAdjustment int
, @LogoVerticalAdjustment int
, @AddressBlockLeftAdjustment int
, @AddressBlockVerticalAdjustment int
, @SuppressLine1 int
, @LogoLocationKey int
, @SizedLogoName varchar(200)
, @ColorLogo bit
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
UseLogo = @UseLogo,
StartingNumber = @StartingNumber,
Approved = @Approved,
LogoPath = @LogoPath,
PreviewPath = @PreviewPath,
LogoWidth = @LogoWidth,
LogoHeight = @LogoHeight,
CheckOrderKey = @CheckOrderKey,
LogoLeftPosition = @LogoLeftPosition,
LogoVerticalPosition = @LogoVerticalPosition,
AddressBlockLeftPosition = @AddressBlockLeftPosition,
AddressBlockVerticalPosition = @AddressBlockVerticalPosition,
LogoLeftAdjustment = @LogoLeftAdjustment,
LogoVerticalAdjustment = @LogoVerticalAdjustment,
AddressBlockLeftAdjustment = @AddressBlockLeftAdjustment,
AddressBlockVerticalAdjustment = @AddressBlockVerticalAdjustment,
SuppressLine1 = @SuppressLine1,
LogoLocationKey = @LogoLocationKey,
SizedLogoName = @SizedLogoName,
ColorLogo = @ColorLogo
where
CheckDetailKey = @ID



GO


/****** Object:  StoredProcedure [dbo].[Invoice_Update]    Script Date: 03/21/2012 05:37:56 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Invoice_Update]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Invoice_Update]
GO


/****** Object:  StoredProcedure [dbo].[Invoice_Update]    Script Date: 03/21/2012 05:37:56 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE procedure [dbo].[Invoice_Update]
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
ComputerIP = @ComputerIP
where
InvoiceKey = @ID

GO


/****** Object:  View [dbo].[v_OrderInfo]    Script Date: 03/27/2012 20:07:13 ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[v_OrderInfo]'))
DROP VIEW [dbo].[v_OrderInfo]
GO


/****** Object:  View [dbo].[v_OrderInfo]    Script Date: 03/27/2012 20:07:14 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE VIEW [dbo].[v_OrderInfo]
AS
SELECT        
i.InvoiceKey, 
i.OrderDate, 
dbo.ProductType.Description AS ProductTypeDescription, 
v.Description AS InvoiceItemDescription, 
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
						 end AS RoutingNumber, 
						 case 
							when product.ProductTypeKey = 1 then d.AccountNumber
							when product.ProductTypeKey = 3 then ds.AccountNumber
							when Product.ProductTypeKey = 4 then cd.BankAccountNumber
						 end AS AccountNumber, 
						 case 
							when product.ProductTypeKey = 1 then d.Fraction
							when product.ProductTypeKey = 3 then null
							when Product.ProductTypeKey = 4 then cd.Fraction
						 end AS Fraction, 
                         case 
							when product.ProductTypeKey = 1 then d.BankInfoLine1
							when product.ProductTypeKey = 3 then ds.BankName
							when Product.ProductTypeKey = 4 then cd.BankInfoLine1
						 end AS BankInfoLine1, 
                         
                         case 
							when product.ProductTypeKey = 1 then d.BankInfoLine2
							when product.ProductTypeKey = 3 then null
							when Product.ProductTypeKey = 4 then cd.BankInfoLine2
						 end AS BankInfoLine2,
						 case 
							when product.ProductTypeKey = 1 then d.BankInfoLine3
							when product.ProductTypeKey = 3 then null
							when Product.ProductTypeKey = 4 then cd.BankInfoLine3
						 end AS BankInfoLine3,
						 case 
							when product.ProductTypeKey = 1 then d.Line1
							when product.ProductTypeKey = 3 then ds.Line1
							when Product.ProductTypeKey = 4 then cd.Line1
						 end AS Line1,
						 case 
							when product.ProductTypeKey = 1 then d.Line2
							when product.ProductTypeKey = 3 then null
							when Product.ProductTypeKey = 4 then cd.Line2
						 end AS Line2,
						 case 
							when product.ProductTypeKey = 1 then d.Line3
							when product.ProductTypeKey = 3 then null
							when Product.ProductTypeKey = 4 then cd.Line3
						 end AS Line3,
                         case 
							when product.ProductTypeKey = 1 then d.Line4
							when product.ProductTypeKey = 3 then null
							when Product.ProductTypeKey = 4 then cd.Line4
						 end AS Line4,
						 case 
							when product.ProductTypeKey = 1 then d.Line5
							when product.ProductTypeKey = 3 then null
							when Product.ProductTypeKey = 4 then cd.Line5
						 end AS Line5,
cd.StartingNumber as StartingCheckNumber,
ta.Description as CheckTextAlignment,	
tf.Description as CheckTypeFace,
fw.Description as Line1FontWeight,
fw1.Description as Line2FontWeight,					 
cc.Description as CheckColor,
case 
	when Product.ProductTypeKey = 4 then cc.PartNumber
	else null
end as PartNumber,
cd.PrintLines,
cd.SignatureLineCount,
cd.MessageAboveSignature,
cd.PrintPaymentRecordOnStub,
csl.Description as CheckStubLines,
case when cd.UseLogo = 1 then 'Yes' else 'No' end as UseLogo,
cd.LogoWidth,
cd.LogoHeight,
cd.LogoPath,
cd.PreviewPath,
co.description as checkorder,
i.BillCharges, 
i.DebitAccount, 
dbo.ExpediteType.Description AS ExpediteTypeDescription, 
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
cd.ColorLogo
FROM            dbo.Invoice AS i INNER JOIN
                         dbo.Customer AS c ON c.CustomerKey = i.CustomerKey INNER JOIN
                         dbo.InvoiceItem AS v ON v.InvoiceKey = i.InvoiceKey LEFT OUTER JOIN
                         dbo.DepositSlip AS d ON v.DepositSlipKey = d.DepositSlipKey 
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
                         dbo.DepositStamp ON c.CustomerKey = dbo.DepositStamp.CustomerKey AND v.DepositStampKey = dbo.DepositStamp.DepositStampKey LEFT OUTER JOIN
                         dbo.ExpediteType ON i.ExpediteTypeKey = dbo.ExpediteType.ExpediteTypeKey LEFT OUTER JOIN
                         dbo.CreditCard ON i.CreditCardKey = dbo.CreditCard.CreditCardKey AND c.CustomerKey = dbo.CreditCard.CustomerKey LEFT OUTER JOIN
                         dbo.CreditCardType ON dbo.CreditCard.CreditCardTypeKey = dbo.CreditCardType.CreditCardTypeKey
WHERE        (1 = 1) AND (a.AddressTypeKey = 1) AND (dbo.Address.AddressTypeKey = 2)

GO



/****** Object:  StoredProcedure [dbo].[Customer_GetOne]    Script Date: 04/01/2012 13:43:44 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Customer_GetOne]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Customer_GetOne]
GO

/****** Object:  StoredProcedure [dbo].[Customer_GetOne]    Script Date: 04/01/2012 13:43:44 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[Customer_GetOne]
(
@ID int
)
AS
SET NOCOUNT ON
select 
     CustomerKey
     ,FirstName
     ,LastName
     ,BusinessName
     ,EMailAddress
     ,AlternateEMailAddress
     ,DayPhone
     ,EveningPhone
     ,CellPhone
     ,FaxNumber
from
     Customer
where
     CustomerKey = @ID
GO



/****** Object:  StoredProcedure [dbo].[GetAddressesForCustomer]    Script Date: 04/01/2012 14:49:24 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GetAddressesForCustomer]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[GetAddressesForCustomer]
GO


/****** Object:  StoredProcedure [dbo].[GetAddressesForCustomer]    Script Date: 04/01/2012 14:49:24 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetAddressesForCustomer] 
	@CustomerKey int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT 
		AddressKey,
		AddressTypeKey,
		Line1,
		Line2,
		City,
		State,
		ZipCode
	From
		Address
	where
		CustomerKey = @CustomerKey
END

GO



/****** Object:  StoredProcedure [dbo].[GetInvoiceItems]    Script Date: 04/02/2012 19:44:21 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GetInvoiceItems]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[GetInvoiceItems]
GO



/****** Object:  StoredProcedure [dbo].[GetInvoiceItems]    Script Date: 04/02/2012 19:44:21 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[GetInvoiceItems]
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
     InvoiceKey = @ID

GO

alter table Product add ColorSurcharge numeric(18,2) null
go

update product set ColorSurcharge = .15 where producttypekey = 4
go



/****** Object:  StoredProcedure [dbo].[Product_Create]    Script Date: 04/06/2012 16:36:18 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Product_Create]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Product_Create]
GO



/****** Object:  StoredProcedure [dbo].[Product_Create]    Script Date: 04/06/2012 16:36:18 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


create procedure [dbo].[Product_Create]
(
@ProductTypeKey int ,
@Description varchar(100) ,
@Price numeric(18,2) ,
@ShippingRate numeric(18,2) ,
@Quantity numeric(18,2) ,
@ColorSurcharge numeric(18,2) ,
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
Quantity,
ColorSurcharge
)
Values
(
@ProductTypeKey,
@Description,
@Price,
@ShippingRate,
@Quantity,
@ColorSurcharge
)
SET @retval = (Select Scope_Identity())

GO




/****** Object:  StoredProcedure [dbo].[Product_GetOne]    Script Date: 04/06/2012 16:38:02 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Product_GetOne]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Product_GetOne]
GO

/****** Object:  StoredProcedure [dbo].[Product_GetOne]    Script Date: 04/06/2012 16:38:02 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
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
     ,ColorSurcharge
from
     Product
where
     ProductKey = @ID

GO




/****** Object:  StoredProcedure [dbo].[Product_Update]    Script Date: 04/06/2012 16:38:46 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Product_Update]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Product_Update]
GO


/****** Object:  StoredProcedure [dbo].[Product_Update]    Script Date: 04/06/2012 16:38:46 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[Product_Update]
(
@ID int
, @ProductTypeKey int 
, @Description varchar(100) 
, @Price numeric(18,2) 
, @ShippingRate numeric(18,2) 
, @Quantity numeric(18,2) 
, @ColorSurcharge numeric(18,2) 
)
AS
SET NOCOUNT ON
Update Product Set 
ProductTypeKey = @ProductTypeKey,
Description = @Description,
Price = @Price,
ShippingRate = @ShippingRate,
Quantity = @Quantity,
ColorSurcharge = @ColorSurcharge
where
ProductKey = @ID

GO





