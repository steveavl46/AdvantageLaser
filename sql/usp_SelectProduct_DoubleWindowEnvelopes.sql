IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_SelectProduct_DoubleWindowEnvelopes]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_SelectProduct_DoubleWindowEnvelopes]
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
CREATE PROCEDURE usp_SelectProduct_DoubleWindowEnvelopes
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
		shippingrategroupkey 
	from 
		producttype 
	where 
		productcategorykey in (4) 
	order by  description
END
GO


