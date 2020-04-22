update ProductType set description = 'Elite Accounts Payable Check' where producttypekey = 9
go

insert into producttypecheckoptionxref (producttypekey, checkfeatureoptionkey,isavailable)
values (9,1,0) -- no print lines option
go
insert into producttypecheckoptionxref (producttypekey, checkfeatureoptionkey,isavailable)
values (9,2,0) -- no stub options
go
insert into producttypecheckoptionxref (producttypekey, checkfeatureoptionkey,isavailable)
values (9,3,0) -- no print payment record on stub option
go
insert into producttypecheckoptionxref (producttypekey, checkfeatureoptionkey,isavailable)
values (9,6,1) -- allow suppress line 1
go
insert into producttypecheckoptionxref (producttypekey, checkfeatureoptionkey,isavailable)
values (9,8,1) -- has font option
go
insert into producttypecheckoptionxref (producttypekey, checkfeatureoptionkey,isavailable)
values (9,9,1) -- has address line bold
go
insert into producttypecheckoptionxref (producttypekey, checkfeatureoptionkey,isavailable)
values (9,10,1) -- has logo option
go
insert into checkcolor(producttypekey, description,imagepath,fullcheckimagepath,partnumber)
values(9,'Blue','../images/checks/EliteAccountsPayable/Background-blue.jpg','../images/checks/EliteAccountsPayable/Elite-blue.jpg','CPCHK504BL')
go
insert into checkcolor(producttypekey, description,imagepath,fullcheckimagepath,partnumber)
values(9,'Blue Green','../images/checks/EliteAccountsPayable/Background-blue-green.jpg','../images/checks/EliteAccountsPayable/Elite-bluegreen.jpg','CPCHK504BG')
go

insert into product
(producttypekey,description, price,shippingrate,quantity,colorsurcharge)
 (select 9,description,price,shippingrate,quantity,colorsurcharge from product where producttypekey = 4)
go

alter table invoice add SalesPersonID varchar(100) null
go


/****** Object:  StoredProcedure [dbo].[Invoice_Create]    Script Date: 07/28/2014 18:23:02 ******/
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
SalesPersonID
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
@SalesPersonID
)
SET @retval = (Select Scope_Identity())
go

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
from
     Invoice
where
     InvoiceKey = @ID

go

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
SalesPersonID = @SalesPersonID
where
InvoiceKey = @ID

go

ALTER PROCEDURE [dbo].[usp_SelectProduct_PrePrintedCheckList] 
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
		producttypekey in (4,5,6,8,9) 
	order by productcategorykey, description
END

go


/****** Object:  View [dbo].[v_OrderInfo]    Script Date: 09/08/2014 20:08:36 ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[v_OrderInfo]'))
DROP VIEW [dbo].[v_OrderInfo]
GO


/****** Object:  View [dbo].[v_OrderInfo]    Script Date: 09/08/2014 20:08:36 ******/
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
							when Product.ProductTypeKey = 5 then cd.RoutingNumber
							when Product.ProductTypeKey = 6 then cd.RoutingNumber
							when Product.ProductTypeKey = 8 then cd.RoutingNumber
						 end AS RoutingNumber, 
						 case 
							when product.ProductTypeKey = 1 then d.AccountNumber
							when product.ProductTypeKey = 3 then ds.AccountNumber
							when Product.ProductTypeKey = 4 then cd.BankAccountNumber
							when Product.ProductTypeKey = 5 then cd.BankAccountNumber
							when Product.ProductTypeKey = 6 then cd.BankAccountNumber
							when Product.ProductTypeKey = 8 then cd.BankAccountNumber
						 end AS AccountNumber, 
						 case 
							when product.ProductTypeKey = 1 then d.Fraction
							when product.ProductTypeKey = 3 then null
							when Product.ProductTypeKey = 4 then cd.Fraction
							when Product.ProductTypeKey = 5 then cd.Fraction
							when Product.ProductTypeKey = 6 then cd.Fraction
							when Product.ProductTypeKey = 8 then cd.Fraction
						 end AS Fraction, 
                         case 
							when product.ProductTypeKey = 1 then d.BankInfoLine1
							when product.ProductTypeKey = 3 then ds.BankName
							when Product.ProductTypeKey = 4 then cd.BankInfoLine1
							when Product.ProductTypeKey = 5 then cd.BankInfoLine1
							when Product.ProductTypeKey = 6 then cd.BankInfoLine1
							when Product.ProductTypeKey = 8 then cd.BankInfoLine1
						 end AS BankInfoLine1, 
                         
                         case 
							when product.ProductTypeKey = 1 then d.BankInfoLine2
							when product.ProductTypeKey = 3 then null
							when Product.ProductTypeKey = 4 then cd.BankInfoLine2
							when Product.ProductTypeKey = 5 then cd.BankInfoLine2
							when Product.ProductTypeKey = 6 then cd.BankInfoLine2
							when Product.ProductTypeKey = 8 then cd.BankInfoLine2
						 end AS BankInfoLine2,
						 case 
							when product.ProductTypeKey = 1 then d.BankInfoLine3
							when product.ProductTypeKey = 3 then null
							when Product.ProductTypeKey = 4 then cd.BankInfoLine3
							when Product.ProductTypeKey = 5 then cd.BankInfoLine3
							when Product.ProductTypeKey = 6 then cd.BankInfoLine3
							when Product.ProductTypeKey = 8 then cd.BankInfoLine3
						 end AS BankInfoLine3,
						 case 
							when product.ProductTypeKey = 1 then d.Line1
							when product.ProductTypeKey = 3 then ds.Line1
							when Product.ProductTypeKey = 4 then cd.Line1
							when Product.ProductTypeKey = 5 then cd.Line1
							when Product.ProductTypeKey = 6 then cd.Line1
							when Product.ProductTypeKey = 8 then cd.Line1
						 end AS Line1,
						 case 
							when product.ProductTypeKey = 1 then d.Line2
							when product.ProductTypeKey = 3 then null
							when Product.ProductTypeKey = 4 then cd.Line2
							when Product.ProductTypeKey = 5 then cd.Line2
							when Product.ProductTypeKey = 6 then cd.Line2
							when Product.ProductTypeKey = 8 then cd.Line2
						 end AS Line2,
						 case 
							when product.ProductTypeKey = 1 then d.Line3
							when product.ProductTypeKey = 3 then null
							when Product.ProductTypeKey = 4 then cd.Line3
							when Product.ProductTypeKey = 5 then cd.Line3
							when Product.ProductTypeKey = 6 then cd.Line3
							when Product.ProductTypeKey = 8 then cd.Line3
						 end AS Line3,
                         case 
							when product.ProductTypeKey = 1 then d.Line4
							when product.ProductTypeKey = 3 then null
							when Product.ProductTypeKey = 4 then cd.Line4
							when Product.ProductTypeKey = 5 then cd.Line4
							when Product.ProductTypeKey = 6 then cd.Line4
							when Product.ProductTypeKey = 8 then cd.Line4
						 end AS Line4,
						 case 
							when product.ProductTypeKey = 1 then d.Line5
							when product.ProductTypeKey = 3 then null
							when Product.ProductTypeKey = 4 then cd.Line5
							when Product.ProductTypeKey = 5 then cd.Line5
							when Product.ProductTypeKey = 6 then cd.Line5
							when Product.ProductTypeKey = 8 then cd.Line5
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
                         dbo.DepositStamp ON c.CustomerKey = dbo.DepositStamp.CustomerKey AND v.DepositStampKey = dbo.DepositStamp.DepositStampKey LEFT OUTER JOIN
                         dbo.ExpediteType ON i.ExpediteTypeKey = dbo.ExpediteType.ExpediteTypeKey LEFT OUTER JOIN
                         dbo.CreditCard ON i.CreditCardKey = dbo.CreditCard.CreditCardKey AND c.CustomerKey = dbo.CreditCard.CustomerKey LEFT OUTER JOIN
                         dbo.CreditCardType ON dbo.CreditCard.CreditCardTypeKey = dbo.CreditCardType.CreditCardTypeKey
WHERE        (1 = 1) AND (a.AddressTypeKey = 1) AND (dbo.Address.AddressTypeKey = 2)

GO



