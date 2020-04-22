insert into producttype(productcategoryeky, description,shippingrategroupkey)
values (3,'QuickBooks Standard Check',1)

insert into CheckFeatureOption (description) values ('Allow Suppress Line 1')

insert into producttype (productcategorykey, description,shippingrategroupkey)
values (3,'QuickBooks Standard Check',1)

insert into producttypecheckoptionxref (producttypekey,checkfeatureoptionkey,isavailable)
values (4,6,1)

insert into producttypecheckoptionxref (producttypekey,checkfeatureoptionkey,isavailable)
values (5,6,1)

insert into CheckFeatureOption (description) values ('Allow Check Order Selection')

update producttypecheckoptionxref set isavailable = 0 where producttypekey = 8 and checkfeatureoptionkey = 1

insert into checkcolor (producttypekey,description, imagepath, fullimagepath, partnumber)
  values (8, 'Blue Burgundy','../images/checks/QBStandard/Background-blue-burgundy.jpg','../images/checks/QBStandard/QB-Standard-Blue-Purple.jpg','CPCHK616BP')
  
  insert into checkcolor (producttypekey,description, imagepath, fullimagepath, partnumber)
  values (8, 'Blue Green','../images/checks/QBStandard/Background-blue-green.jpg','../images/checks/QBStandard/QB-Standard-Blue-Green.jpg','CPCHK616BG')
  
insert into product (producttypekey, description,price, shippingrate, quantity, colorsurcharge)
values (8,'250 Preprinted Checks',.11,0,250,.15)  

insert into product (producttypekey, description,price, shippingrate, quantity, colorsurcharge)
values (8,'500 Preprinted Checks',.08,0,500,.15) 

insert into product (producttypekey, description,price, shippingrate, quantity, colorsurcharge)
values (8,'1000 Preprinted Checks',.06,0,1000,.15)

insert into product (producttypekey, description,price, shippingrate, quantity, colorsurcharge)
values (8,'2000 Preprinted Checks',.04,0,2000,.15) 

insert into product (producttypekey, description,price, shippingrate, quantity, colorsurcharge)
values (8,'3000 Preprinted Checks',.03,0,3000,.15)  

insert into product (producttypekey, description,price, shippingrate, quantity, colorsurcharge)
values (8,'5000 Preprinted Checks',.03,0,5000,.15)      


/****** Object:  StoredProcedure [dbo].[usp_SelectProduct_PrePrintedCheckList]    Script Date: 09/23/2012 20:40:46 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_SelectProduct_PrePrintedCheckList]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_SelectProduct_PrePrintedCheckList]
GO


/****** Object:  StoredProcedure [dbo].[usp_SelectProduct_PrePrintedCheckList]    Script Date: 09/23/2012 20:40:46 ******/
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
		producttypekey in (4,5,8) 
	order by productcategorykey, description
END

GO


/****** Object:  View [dbo].[v_OrderInfo]    Script Date: 01/12/2013 15:07:34 ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[v_OrderInfo]'))
DROP VIEW [dbo].[v_OrderInfo]
GO


/****** Object:  View [dbo].[v_OrderInfo]    Script Date: 01/12/2013 15:07:34 ******/
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
							when Product.ProductTypeKey = 5 then cd.RoutingNumber
							when Product.ProductTypeKey = 8 then cd.RoutingNumber
						 end AS RoutingNumber, 
						 case 
							when product.ProductTypeKey = 1 then d.AccountNumber
							when product.ProductTypeKey = 3 then ds.AccountNumber
							when Product.ProductTypeKey = 5 then cd.BankAccountNumber
							when Product.ProductTypeKey = 8 then cd.BankAccountNumber
						 end AS AccountNumber, 
						 case 
							when product.ProductTypeKey = 1 then d.Fraction
							when product.ProductTypeKey = 3 then null
							when Product.ProductTypeKey = 5 then cd.Fraction
							when Product.ProductTypeKey = 8 then cd.Fraction
						 end AS Fraction, 
                         case 
							when product.ProductTypeKey = 1 then d.BankInfoLine1
							when product.ProductTypeKey = 3 then ds.BankName
							when Product.ProductTypeKey = 5 then cd.BankInfoLine1
							when Product.ProductTypeKey = 5 then cd.BankInfoLine1
						 end AS BankInfoLine1, 
                         
                         case 
							when product.ProductTypeKey = 1 then d.BankInfoLine2
							when product.ProductTypeKey = 3 then null
							when Product.ProductTypeKey = 5 then cd.BankInfoLine2
							when Product.ProductTypeKey = 8 then cd.BankInfoLine2
						 end AS BankInfoLine2,
						 case 
							when product.ProductTypeKey = 1 then d.BankInfoLine3
							when product.ProductTypeKey = 3 then null
							when Product.ProductTypeKey = 5 then cd.BankInfoLine3
							when Product.ProductTypeKey = 8 then cd.BankInfoLine3
						 end AS BankInfoLine3,
						 case 
							when product.ProductTypeKey = 1 then d.Line1
							when product.ProductTypeKey = 3 then ds.Line1
							when Product.ProductTypeKey = 5 then cd.Line1
							when Product.ProductTypeKey = 8 then cd.Line1
						 end AS Line1,
						 case 
							when product.ProductTypeKey = 1 then d.Line2
							when product.ProductTypeKey = 3 then null
							when Product.ProductTypeKey = 5 then cd.Line2
							when Product.ProductTypeKey = 8 then cd.Line2
						 end AS Line2,
						 case 
							when product.ProductTypeKey = 1 then d.Line3
							when product.ProductTypeKey = 3 then null
							when Product.ProductTypeKey = 5 then cd.Line3
							when Product.ProductTypeKey = 8 then cd.Line3
						 end AS Line3,
                         case 
							when product.ProductTypeKey = 1 then d.Line4
							when product.ProductTypeKey = 3 then null
							when Product.ProductTypeKey = 5 then cd.Line4
							when Product.ProductTypeKey = 8 then cd.Line4
						 end AS Line4,
						 case 
							when product.ProductTypeKey = 1 then d.Line5
							when product.ProductTypeKey = 3 then null
							when Product.ProductTypeKey = 5 then cd.Line5
							when Product.ProductTypeKey = 8 then cd.Line5
						 end AS Line5,
cd.StartingNumber as StartingCheckNumber,
ta.Description as CheckTextAlignment,	
tf.Description as CheckTypeFace,
fw.Description as Line1FontWeight,
fw1.Description as Line2FontWeight,					 
cc.Description as CheckColor,
case 
	when Product.ProductTypeKey = 5 then cc.PartNumber
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





