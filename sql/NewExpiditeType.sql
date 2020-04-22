

CREATE TABLE [dbo].[ExpediteSubType](
	[ExpediteSubTypeKey] [int] IDENTITY(1,1) NOT NULL,
	[ExpediteTypeKey] [int] NOT NULL,
	[Description] [varchar](100) NOT NULL,
	[DisplayOrder] [int] NOT NULL,
	[AdditionalCharge] [numeric](18, 2) NULL,
	[IsActive] [bit] NOT NULL,
	[BillAtActualCharges] [bit] NOT NULL,
	[ShortDescription] varchar(100) NOT NULL,
 CONSTRAINT [PK_ExpediteSubType] PRIMARY KEY CLUSTERED 
(
	[ExpediteSubTypeKey] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)

ALTER TABLE [dbo].[ExpediteSubType]  WITH CHECK ADD  CONSTRAINT [FK_ExpediteSubType_ExpediteType] FOREIGN KEY([ExpediteTypeKey])
REFERENCES [dbo].[ExpediteType] ([ExpediteTypeKey])
GO

ALTER TABLE [dbo].[ExpediteSubType] CHECK CONSTRAINT [FK_ExpediteSubType_ExpediteType]
GO




/****** Object:  StoredProcedure [dbo].[ExpediteSubType_GetOne]    Script Date: 01/26/2016 17:04:51 ******/
SET ANSI_NULLS ON
GO

Alter table Invoice Add ExpediteSubTypeKey int null


ALTER TABLE [dbo].[Invoice]  WITH CHECK ADD  CONSTRAINT [FK_Invoice_ExpediteSubType] FOREIGN KEY([ExpediteSubTypeKey])
REFERENCES [dbo].[ExpediteSubType] ([ExpediteSubTypeKey])
GO

ALTER TABLE [dbo].[Invoice] CHECK CONSTRAINT [FK_Invoice_ExpediteSubType]
GO


SET QUOTED_IDENTIFIER ON
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ExpediteSubType_GetOne]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[ExpediteSubType_GetOne]
GO

create procedure [dbo].[ExpediteSubType_GetOne]
(
@ID int
)
AS
SET NOCOUNT ON
select 
	ExpediteSubTypeKey,
     ExpediteTypeKey
     ,DisplayOrder
     ,Description
     ,IsActive
     ,AdditionalCharge
     ,BillAtActualCharges
     ,ShortDescription
from
     ExpediteSubType
where
     ExpediteSubTypeKey = @ID

GO

--select  * from ExpediteSubType

update ExpediteType set Description = 'RUSH 24 Hour Check Processing (Addtional $## Charge)' where ExpediteTypeKey = 1


--select * from ShippingType

--update ExpediteSubType set AdditionalCharge = 0 where AdditionalCharge is null

--update ShippingType set IsActive = 0 where ShippingTypeKey <> 1

insert into ExpediteSubType (ExpediteTypeKey, Description,DisplayOrder,AdditionalCharge,IsActive, BillAtActualCharges, ShortDescription)
values(1,'Ship first 100 checks overnight, and the remainder ground ($## + $@@ + Ground rate)',1,20,1,0,'Ship 100 Priority Overnight, Remainder Ground')

insert into ExpediteSubType (ExpediteTypeKey, Description,DisplayOrder,AdditionalCharge,IsActive, BillAtActualCharges, ShortDescription)
values(1,'Priority Overnight Shipping ($## plus actual FedEx Rates)',1,0,1,1,'Priority Overnight Shipping')

insert into ExpediteSubType (ExpediteTypeKey, Description,DisplayOrder,AdditionalCharge,IsActive, BillAtActualCharges, ShortDescription)
values(1,'2 Day Shipping ($## plus actual FedEx Rates)',1,0,1,1,'2 Day Shipping')

insert into ExpediteSubType (ExpediteTypeKey, Description,DisplayOrder,AdditionalCharge,IsActive, BillAtActualCharges, ShortDescription)
values(1,'3 Day Shipping ($## plus actual FedEx Rates)',1,0,1,1,'3 Day Shipping')


/***************** invoice stored procs ********************/


/****** Object:  StoredProcedure [dbo].[Invoice_Update]    Script Date: 02/13/2016 09:54:33 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Invoice_Update]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Invoice_Update]
GO



/****** Object:  StoredProcedure [dbo].[Invoice_Update]    Script Date: 02/13/2016 09:54:33 ******/
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
, @SalesPersonID varchar(100)
, @ExpediteSubTypeKey int
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
ExpediteSubTypeKey = @ExpediteSubTypeKey
where
InvoiceKey = @ID


GO




/****** Object:  StoredProcedure [dbo].[Invoice_GetOne]    Script Date: 02/13/2016 09:53:16 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Invoice_GetOne]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Invoice_GetOne]
GO



/****** Object:  StoredProcedure [dbo].[Invoice_GetOne]    Script Date: 02/13/2016 09:53:16 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[Invoice_GetOne]
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
from
     Invoice
where
     InvoiceKey = @ID


GO



/****** Object:  StoredProcedure [dbo].[Invoice_Create]    Script Date: 02/13/2016 09:52:02 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Invoice_Create]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Invoice_Create]
GO


/****** Object:  StoredProcedure [dbo].[Invoice_Create]    Script Date: 02/13/2016 09:52:02 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[Invoice_Create]
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
ExpediteSubTypeKey
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
@ExpediteSubTypeKey
)
SET @retval = (Select Scope_Identity())

GO



alter table expeditetype add ShortDescription varchar(100)
go
update expeditetype set ShortDescription = 'RUSH 24 Hour Check Processing' where expeditetypekey = 1
go



/****** Object:  View [dbo].[v_OrderInfo]    Script Date: 02/20/2016 08:57:00 ******/
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
						 end AS RoutingNumber, 
						 case 
							when product.ProductTypeKey = 1 then d.AccountNumber
							when product.ProductTypeKey = 3 then ds.AccountNumber
							when Product.ProductTypeKey = 4 then cd.BankAccountNumber
							when Product.ProductTypeKey = 5 then cd.BankAccountNumber
							when Product.ProductTypeKey = 6 then cd.BankAccountNumber
							when Product.ProductTypeKey = 8 then cd.BankAccountNumber
							when Product.ProductTypeKey = 9 then cd.BankAccountNumber
						 end AS AccountNumber, 
						 case 
							when product.ProductTypeKey = 1 then d.Fraction
							when product.ProductTypeKey = 3 then null
							when Product.ProductTypeKey = 4 then cd.Fraction
							when Product.ProductTypeKey = 5 then cd.Fraction
							when Product.ProductTypeKey = 6 then cd.Fraction
							when Product.ProductTypeKey = 8 then cd.Fraction
							when Product.ProductTypeKey = 9 then cd.Fraction
						 end AS Fraction, 
                         case 
							when product.ProductTypeKey = 1 then d.BankInfoLine1
							when product.ProductTypeKey = 3 then ds.BankName
							when Product.ProductTypeKey = 4 then cd.BankInfoLine1
							when Product.ProductTypeKey = 5 then cd.BankInfoLine1
							when Product.ProductTypeKey = 6 then cd.BankInfoLine1
							when Product.ProductTypeKey = 8 then cd.BankInfoLine1
							when Product.ProductTypeKey = 9 then cd.BankInfoLine1
						 end AS BankInfoLine1, 
                         
                         case 
							when product.ProductTypeKey = 1 then d.BankInfoLine2
							when product.ProductTypeKey = 3 then null
							when Product.ProductTypeKey = 4 then cd.BankInfoLine2
							when Product.ProductTypeKey = 5 then cd.BankInfoLine2
							when Product.ProductTypeKey = 6 then cd.BankInfoLine2
							when Product.ProductTypeKey = 8 then cd.BankInfoLine2
							when Product.ProductTypeKey = 9 then cd.BankInfoLine2
						 end AS BankInfoLine2,
						 case 
							when product.ProductTypeKey = 1 then d.BankInfoLine3
							when product.ProductTypeKey = 3 then null
							when Product.ProductTypeKey = 4 then cd.BankInfoLine3
							when Product.ProductTypeKey = 5 then cd.BankInfoLine3
							when Product.ProductTypeKey = 6 then cd.BankInfoLine3
							when Product.ProductTypeKey = 8 then cd.BankInfoLine3
							when Product.ProductTypeKey = 9 then cd.BankInfoLine3
						 end AS BankInfoLine3,
						 case 
							when product.ProductTypeKey = 1 then d.Line1
							when product.ProductTypeKey = 3 then ds.Line1
							when Product.ProductTypeKey = 4 then cd.Line1
							when Product.ProductTypeKey = 5 then cd.Line1
							when Product.ProductTypeKey = 6 then cd.Line1
							when Product.ProductTypeKey = 8 then cd.Line1
							when Product.ProductTypeKey = 9 then cd.Line1
						 end AS Line1,
						 case 
							when product.ProductTypeKey = 1 then d.Line2
							when product.ProductTypeKey = 3 then null
							when Product.ProductTypeKey = 4 then cd.Line2
							when Product.ProductTypeKey = 5 then cd.Line2
							when Product.ProductTypeKey = 6 then cd.Line2
							when Product.ProductTypeKey = 8 then cd.Line2
							when Product.ProductTypeKey = 9 then cd.Line2
						 end AS Line2,
						 case 
							when product.ProductTypeKey = 1 then d.Line3
							when product.ProductTypeKey = 3 then null
							when Product.ProductTypeKey = 4 then cd.Line3
							when Product.ProductTypeKey = 5 then cd.Line3
							when Product.ProductTypeKey = 6 then cd.Line3
							when Product.ProductTypeKey = 8 then cd.Line3
							when Product.ProductTypeKey = 9 then cd.Line3
						 end AS Line3,
                         case 
							when product.ProductTypeKey = 1 then d.Line4
							when product.ProductTypeKey = 3 then null
							when Product.ProductTypeKey = 4 then cd.Line4
							when Product.ProductTypeKey = 5 then cd.Line4
							when Product.ProductTypeKey = 6 then cd.Line4
							when Product.ProductTypeKey = 8 then cd.Line4
							when Product.ProductTypeKey = 9 then cd.Line4
						 end AS Line4,
						 case 
							when product.ProductTypeKey = 1 then d.Line5
							when product.ProductTypeKey = 3 then null
							when Product.ProductTypeKey = 4 then cd.Line5
							when Product.ProductTypeKey = 5 then cd.Line5
							when Product.ProductTypeKey = 6 then cd.Line5
							when Product.ProductTypeKey = 8 then cd.Line5
							when Product.ProductTypeKey = 9 then cd.Line5
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
i.SalesPersonID
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
                         dbo.DepositStamp ON c.CustomerKey = dbo.DepositStamp.CustomerKey AND v.DepositStampKey = dbo.DepositStamp.DepositStampKey 
                         LEFT OUTER JOIN dbo.ExpediteType ON i.ExpediteTypeKey = dbo.ExpediteType.ExpediteTypeKey 
                         LEFT OUTER JOIN dbo.ExpediteSubType ON i.ExpediteSubTypeKey = dbo.ExpediteSubType.ExpediteSubTypeKey 
                         LEFT OUTER JOIN dbo.CreditCard ON i.CreditCardKey = dbo.CreditCard.CreditCardKey AND c.CustomerKey = dbo.CreditCard.CustomerKey LEFT OUTER JOIN
                         dbo.CreditCardType ON dbo.CreditCard.CreditCardTypeKey = dbo.CreditCardType.CreditCardTypeKey
WHERE        (1 = 1) AND (a.AddressTypeKey = 1) AND (dbo.Address.AddressTypeKey = 2)

GO

insert into ShippingZone (description) values ('Zone 7')

insert into ShippingZoneRate (ShippingZoneKey, ShippingRateGroupKey, ShippingRateTypeKey, Quantity, Rate)
values (7,1,1,500,45)

insert into ShippingZoneRate (ShippingZoneKey, ShippingRateGroupKey, ShippingRateTypeKey, Quantity, Rate)
values (7,1,1,1000,60)

insert into ShippingZoneRate (ShippingZoneKey, ShippingRateGroupKey, ShippingRateTypeKey, Quantity, Rate)
values (7,1,1,2000,90)

insert into ShippingZoneRate (ShippingZoneKey, ShippingRateGroupKey, ShippingRateTypeKey, Quantity, Rate)
values (7,1,1,2500,105)

insert into ShippingZoneRate (ShippingZoneKey, ShippingRateGroupKey, ShippingRateTypeKey, Quantity, Rate)
values (7,1,2,12500,.0432)

insert into ShippingZoneRate (ShippingZoneKey, ShippingRateGroupKey, ShippingRateTypeKey, Quantity, Rate)
values (7,1,2,100000,.042)

update State set ShippingZoneKey = 7 where Abbreviation in ('AK','HI')

insert into State (Abbreviation,Name,ShippingZoneKey) values ('PR', 'Puerto Rico',7)


