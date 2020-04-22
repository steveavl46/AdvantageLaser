SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[EnvelopeCompatibility](
	[EnvelopeCompatibilityKey] [int] IDENTITY(1,1) NOT NULL,
	[Description] [varchar](35) NOT NULL,
 CONSTRAINT [PK_EnvelopeCompatability] PRIMARY KEY CLUSTERED 
(
	[EnvelopeCompatibilityKey] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

insert into EnvelopeCompatibility (Description) values ('ADP Envelopes')
go
insert into EnvelopeCompatibility (Description) values ('Generic Envelopes')
go

alter table ProductType add EnvelopeCompatibilityKey int null
go

ALTER TABLE [dbo].[ProductType]  WITH CHECK ADD  CONSTRAINT [FK_ProductType_EnvelopeCompatibility] FOREIGN KEY([EnvelopeCompatibilityKey])
REFERENCES [dbo].[EnvelopeCompatibility] ([EnvelopeCompatibilityKey])
GO

ALTER TABLE [dbo].[ProductType] CHECK CONSTRAINT [FK_ProductType_EnvelopeCompatibility]
GO



update ProductType set EnvelopeCompatibilityKey = 1 where ProductTypeKey = 6 -- adp check
go
update ProductType set EnvelopeCompatibilityKey = 2 where ProductTypeKey in (4, 5, 8, 9)
go -- 

insert into ProductType (ProductCategoryKey, Description,ShippingRateGroupKey, EnvelopeCompatibilityKey)
values (4, 'ADP Double Window Envelopes #10 - 4 1/8 x 9 1/2', 1, 1)

update ProductType set EnvelopeCompatibilityKey = 2 where ProductTypeKey in (10,11)
go

insert into Product (ProductTypeKey, Description, Price,Quantity, ShippingRate)
values (13, '1,000 Self-Seal Envelopes  CP31-99602S', 70,1, null)
go
insert into Product (ProductTypeKey, Description, Price,Quantity, ShippingRate)
values (13, '1,000 Standard Envelopes  CP31-99602', 56,1, null)
go



/****** Object:  StoredProcedure [dbo].[ProductType_GetOne]    Script Date: 07/10/2017 20:31:44 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER procedure [dbo].[ProductType_GetOne]
(
@ID int
)
AS
SET NOCOUNT ON
select 
     ProductTypeKey
     ,ProductCategoryKey
     ,Description
     ,ShippingRateGroupKey
     ,EnvelopeCompatibilityKey
from
     ProductType
where
     ProductTypeKey = @ID

GO



/****** Object:  StoredProcedure [dbo].[usp_SelectProduct_DepositSlipList]    Script Date: 07/10/2017 20:35:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[usp_SelectProduct_DepositSlipList] 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
	select 
		producttypekey, 
		productcategorykey, 
		description, 
		shippingrategroupkey,
		0 as EnvelopeCompatibilityKey 
	from 
		producttype 
	where 
		producttypekey in (1) 
	order by productcategorykey, description
END



/****** Object:  StoredProcedure [dbo].[usp_SelectProduct_DoubleWindowEnvelopes]    Script Date: 07/10/2017 20:36:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[usp_SelectProduct_DoubleWindowEnvelopes]
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	select 
		producttypekey, 
		productcategorykey, 
		description, 
		shippingrategroupkey,
		EnvelopeCompatibilityKey 
	from 
		producttype 
	where 
		productcategorykey in (4) 
	order by  description
END

go


/****** Object:  StoredProcedure [dbo].[usp_SelectProduct_PrePrintedCheckList]    Script Date: 07/10/2017 20:36:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
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
		shippingrategroupkey,
		envelopecompatibilitykey 
	from 
		producttype 
	where 
		producttypekey in (4,5,6,8,9) 
	order by productcategorykey, description
END

go


/****** Object:  StoredProcedure [dbo].[usp_GetProductsForProductType]    Script Date: 07/10/2017 20:39:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[usp_GetProductsForProductType]
@ProductTypeKey int
AS

BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	select 
		p.productkey, 
		p.ProductTypeKey,
		p.description, 
		p.Price,
		p.ShippingRate,
		p.Quantity,
		p.ColorSurcharge, 
		pt.EnvelopeCompatibilityKey
	from 
		product p
		join ProductType pt on p.ProductTypeKey = pt.ProductTypeKey
	where 
		p.producttypekey = @ProductTypeKey
	order by  description
END

go