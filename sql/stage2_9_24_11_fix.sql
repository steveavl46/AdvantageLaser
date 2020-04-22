/****** Object:  StoredProcedure [dbo].[CheckDetail_Update]    Script Date: 09/24/2011 07:26:37 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CheckDetail_Update]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[CheckDetail_Update]
GO

/****** Object:  StoredProcedure [dbo].[CheckDetail_GetOne]    Script Date: 09/24/2011 07:26:17 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CheckDetail_GetOne]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[CheckDetail_GetOne]
GO

/****** Object:  StoredProcedure [dbo].[CheckDetail_Create]    Script Date: 09/24/2011 07:26:02 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CheckDetail_Create]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[CheckDetail_Create]
GO

alter table checkdetail drop column bankcsz
go
alter table checkdetail drop column bankphone
go
alter table checkdetail add StartingNumber varchar(35)
go


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
StartingNumber = @StartingNumber
where
CheckDetailKey = @ID


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
from
     CheckDetail
where
     CheckDetailKey = @ID


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
StartingNumber
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
@StartingNumber
)
SET @retval = (Select Scope_Identity())

GO

alter table Invoice add ComputerIP varchar(50) null
go



/****** Object:  StoredProcedure [dbo].[Invoice_GetOne]    Script Date: 09/26/2011 16:47:36 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Invoice_GetOne]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Invoice_GetOne]
GO



/****** Object:  StoredProcedure [dbo].[Invoice_GetOne]    Script Date: 09/26/2011 16:47:36 ******/
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
from
     Invoice
where
     InvoiceKey = @ID
GO


/****** Object:  StoredProcedure [dbo].[Invoice_Create]    Script Date: 09/26/2011 16:48:17 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Invoice_Create]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Invoice_Create]
GO


/****** Object:  StoredProcedure [dbo].[Invoice_Create]    Script Date: 09/26/2011 16:48:17 ******/
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
ComputerIP
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
@ComputerIP
)
SET @retval = (Select Scope_Identity())
GO


/****** Object:  StoredProcedure [dbo].[Invoice_Update]    Script Date: 09/26/2011 16:49:35 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Invoice_Update]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Invoice_Update]
GO


/****** Object:  StoredProcedure [dbo].[Invoice_Update]    Script Date: 09/26/2011 16:49:35 ******/
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

