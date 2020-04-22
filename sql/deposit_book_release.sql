

/****** Object:  Table [dbo].[DepositBook]    Script Date: 02/25/2017 07:15:39 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[DepositBook](
	[DepositBookKey] [int] IDENTITY(1,1) NOT NULL,
	[CustomerKey] [int] NOT NULL,
	[BankInfoLine1] [varchar](35) NULL,
	[RoutingNumber] [varchar](20) NOT NULL,
	[AccountNumber] [varchar](20) NOT NULL,
	[Fraction] [varchar](20) NOT NULL,
	[BankInfoLine2] [varchar](35) NULL,
	[BankInfoLine3] [varchar](35) NULL,
	[Line1] [varchar](100) NOT NULL,
	[Line2] [varchar](100) NULL,
	[Line3] [varchar](100) NULL,
	[Line4] [varchar](100) NULL,
	[Line5] [varchar](100) NULL,
 CONSTRAINT [PK_DepositBook] PRIMARY KEY CLUSTERED 
(
	[DepositBookKey] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

ALTER TABLE [dbo].[DepositBook]  WITH CHECK ADD  CONSTRAINT [FK_DepositBook_Customer] FOREIGN KEY([CustomerKey])
REFERENCES [dbo].[Customer] ([CustomerKey])
GO

ALTER TABLE [dbo].[DepositBook] CHECK CONSTRAINT [FK_DepositBook_Customer]
GO




/****** Object:  StoredProcedure [dbo].[DepositBook_Create]    Script Date: 02/25/2017 08:40:20 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DepositBook_Create]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[DepositBook_Create]
GO

/****** Object:  StoredProcedure [dbo].[DepositBook_Create]    Script Date: 02/25/2017 08:40:20 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[DepositBook_Create]
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

Insert into DepositBook
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



/****** Object:  StoredProcedure [dbo].[DepositBook_GetOne]    Script Date: 02/25/2017 08:42:41 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DepositBook_GetOne]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[DepositBook_GetOne]
GO


/****** Object:  StoredProcedure [dbo].[DepositBook_GetOne]    Script Date: 02/25/2017 08:42:41 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[DepositBook_GetOne]
(
@ID int
)
AS
SET NOCOUNT ON
select 
     DepositBookKey
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
     DepositBook
where
     DepositBookKey = @ID

GO




/****** Object:  StoredProcedure [dbo].[DepositBook_Update]    Script Date: 02/25/2017 08:43:56 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DepositBook_Update]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[DepositBook_Update]
GO



/****** Object:  StoredProcedure [dbo].[DepositBook_Update]    Script Date: 02/25/2017 08:43:56 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[DepositBook_Update]
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
Update DepositBook Set 
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
DepositBookKey = @ID

GO


insert into ProductCategory(Description) values ('Deposit Book')
go

insert into ProductType(ProductCategoryKey, Description, ShippingRateGroupKey)
values(5,'Deposit Slip Book',1)
go

insert into Product (ProductTypeKey,Description,Price,Quantity)
values (12,'4 Books (50 slips per book)',48,1)

insert into Product (ProductTypeKey,Description,Price,Quantity)
values (12,'8 Books (50 slips per book)',60,1)

insert into Product (ProductTypeKey,Description,Price,Quantity)
values (12,'12 Books (50 slips per book)',72,1)

insert into Product (ProductTypeKey,Description,Price,Quantity)
values (12,'16 Books (50 slips per book)',85,1)
go

alter table InvoiceItem add DepositBookKey int null
go

ALTER TABLE [dbo].[InvoiceItem]  WITH CHECK ADD  CONSTRAINT [FK_InvoiceItem_DepositBook] FOREIGN KEY([DepositBookKey])
REFERENCES [dbo].[DepositBook] ([DepositBookKey])
GO

ALTER TABLE [dbo].[InvoiceItem] CHECK CONSTRAINT [FK_InvoiceItem_DepositBook]
GO

/****** Object:  StoredProcedure [dbo].[GetInvoiceItems]    Script Date: 03/26/2017 09:04:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[GetInvoiceItems]
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
     ,SoftwareName
     ,DepositBookKey
from
     InvoiceItem
where
     InvoiceKey = @ID

go


/****** Object:  StoredProcedure [dbo].[InvoiceItem_GetOne]    Script Date: 03/26/2017 09:19:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER procedure [dbo].[InvoiceItem_GetOne]
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
     ,SoftwareName
     ,DepositBookKey
from
     InvoiceItem
where
     InvoiceItemKey = @ID

go


/****** Object:  StoredProcedure [dbo].[InvoiceItem_Create]    Script Date: 03/26/2017 09:20:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER procedure [dbo].[InvoiceItem_Create]
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
@SoftwareName varchar(50),
@DepositBookKey int,
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
CheckDetailKey,
SoftwareName,
DepositBookKey
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
@CheckDetailKey,
@SoftwareName,
@DepositBookKey
)
SET @retval = (Select Scope_Identity())

go


/****** Object:  StoredProcedure [dbo].[InvoiceItem_Update]    Script Date: 03/26/2017 09:26:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER procedure [dbo].[InvoiceItem_Update]
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
, @SoftwareName varchar(50)
, @DepositBookKey int
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
SoftwareName = @SoftwareName,
DepositBookKey = @DepositBookKey
where
InvoiceItemKey = @ID

go



/****** Object:  View [dbo].[v_OrderInfo]    Script Date: 03/26/2017 13:02:05 ******/
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
i.SalesPersonID
FROM            dbo.Invoice AS i INNER JOIN
                         dbo.Customer AS c ON c.CustomerKey = i.CustomerKey INNER JOIN
                         dbo.InvoiceItem AS v ON v.InvoiceKey = i.InvoiceKey LEFT OUTER JOIN
                         dbo.DepositSlip AS d ON v.DepositSlipKey = d.DepositSlipKey 
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


