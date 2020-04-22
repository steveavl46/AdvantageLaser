IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_GetProductsForProductType]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_GetProductsForProductType]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE usp_GetProductsForProductType
@ProductTypeKey int
AS

BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	select 
		productkey, 
		ProductTypeKey,
		description, 
		Price,
		ShippingRate,
		Quantity,
		ColorSurcharge 
	from 
		product
	where 
		producttypekey = @ProductTypeKey
	order by  description
END
GO



