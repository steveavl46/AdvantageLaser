
/****** Object:  StoredProcedure [dbo].[usp_SelectProduct_PrePrintedCheckList]    Script Date: 05/14/2012 18:06:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
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
		producttypekey in (4,5) 
	order by productcategorykey, description
END
Go

update producttype set shippingrategroupkey = 1 where producttypekey = 5
go

update checkcolor set imagepath = '../images/checks/Peachtree/Background-blue.jpg', fullcheckimagepath = '../images/checks/Peachtree/509-bl.jpg' where checkcolorkey = 3
go
update checkcolor set imagepath = '../images/checks/Peachtree/Background-Green.jpg', fullcheckimagepath = '../images/checks/Peachtree/509-gr.jpg' where checkcolorkey = 4
go

-- remove this when real values are known
update checkcolor set partnumber = 'test' where partnumber is null
go

insert into checkcolor (producttypekey,description,imagepath,fullcheckimagepath,partnumber)
values (5,'Tan','../images/checks/Peachtree/Background-Tan.jpg','../images/checks/Peachtree/509-ta.jpg','test')
go

insert into checkcolor (producttypekey,description,imagepath,fullcheckimagepath,partnumber)
values (5,'Burgundy','../images/checks/Peachtree/Background-Burgundy.jpg','../images/checks/Peachtree/509-bu.jpg','test')
go

insert into checkcolor (producttypekey,description,imagepath,fullcheckimagepath,partnumber)
values (5,'Blue Burgundy Green','../images/checks/Peachtree/Background-blue-burgundy-gr.jpg','../images/checks/Peachtree/609-BRG.jpg','test')
go

insert into checkcolor (producttypekey,description,imagepath,fullcheckimagepath,partnumber)
values (5,'Blue Green','../images/checks/Peachtree/Background-blue-green.jpg','../images/checks/Peachtree/609-bg.jpg','test')
go

insert into checkcolor (producttypekey,description,imagepath,fullcheckimagepath,partnumber)
values (5,'Burgundy Tan','../images/checks/Peachtree/Background-burgundy-tan.jpg','../images/checks/Peachtree/609-PT.jpg','test')
go

insert into checkcolor (producttypekey,description,imagepath,fullcheckimagepath,partnumber)
values (5,'Blue Burgundy','../images/checks/Peachtree/Background-blue-burgundy.jpg','../images/checks/Peachtree/609-BP.jpg','test')
go

insert into checkfeatureoption (description) values ('Has Print Payment Record on Stub Options')
go
insert into producttypecheckoptionxref (producttypekey,checkfeatureoptionkey,isavailable)
values(4,3,1)
go

insert into checkfeatureoption (description) values ('Show Check No')
go
insert into producttypecheckoptionxref (producttypekey,checkfeatureoptionkey,isavailable)
values(5,5,1)
go

alter table CheckDetail add ShowCheckNo bit not null default 0
go



/****** Object:  StoredProcedure [dbo].[CheckDetail_Create]    Script Date: 05/17/2012 06:15:47 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CheckDetail_Create]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[CheckDetail_Create]
GO


/****** Object:  StoredProcedure [dbo].[CheckDetail_Create]    Script Date: 05/17/2012 06:15:47 ******/
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
@ShowCheckNo bit,
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
ColorLogo,
ShowCheckNo
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
@ColorLogo,
@ShowCheckNo
)
SET @retval = (Select Scope_Identity())



GO



/****** Object:  StoredProcedure [dbo].[CheckDetail_GetOne]    Script Date: 05/17/2012 06:17:12 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CheckDetail_GetOne]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[CheckDetail_GetOne]
GO

/****** Object:  StoredProcedure [dbo].[CheckDetail_GetOne]    Script Date: 05/17/2012 06:17:12 ******/
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
     ,ShowCheckNo
from
     CheckDetail
where
     CheckDetailKey = @ID




GO




/****** Object:  StoredProcedure [dbo].[CheckDetail_Update]    Script Date: 05/17/2012 06:17:57 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CheckDetail_Update]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[CheckDetail_Update]
GO



/****** Object:  StoredProcedure [dbo].[CheckDetail_Update]    Script Date: 05/17/2012 06:17:57 ******/
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
, @ShowCheckNo bit
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
ColorLogo = @ColorLogo,
ShowCheckNo = @ShowCheckNo
where
CheckDetailKey = @ID




GO



/****** Object:  View [dbo].[v_OrderInfo]    Script Date: 05/18/2012 05:41:58 ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[v_OrderInfo]'))
DROP VIEW [dbo].[v_OrderInfo]
GO


/****** Object:  View [dbo].[v_OrderInfo]    Script Date: 05/18/2012 05:41:58 ******/
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

/* part number for peachtree checks */

update checkcolor set partnumber = 'CPCHK509BL' where checkcolorkey = 3
go
update checkcolor set partnumber = 'CPCHK509GR' where checkcolorkey = 4
go
update checkcolor set partnumber = 'CPCHK509TA' where checkcolorkey = 19
go
update checkcolor set partnumber = 'CPCHK509BU' where checkcolorkey = 20
go
update checkcolor set partnumber = 'CPCHK609BPG' where checkcolorkey = 21
go
update checkcolor set partnumber = 'CPCHK609BG' where checkcolorkey = 22
go
update checkcolor set partnumber = 'CPCHK609PT' where checkcolorkey = 23
go
update checkcolor set partnumber = 'CPCHK609BP' where checkcolorkey = 24
go

/* color surcharge for peachtree checks */
update product set colorsurcharge = .15 where producttypekey = 5
go

/* change producttype description for peachtree checks */
update producttype set description = 'Peachtree Accounting Checks' where producttypekey = 5
go