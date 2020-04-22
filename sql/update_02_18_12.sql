alter table checkcolor add PartNumber varchar(50) null

update CheckColor set PartNumber = 'CPCHK515BL' where CheckColorKey = 1
update CheckColor set PartNumber = 'CPCHK515GR' where CheckColorKey = 2
update CheckColor set PartNumber = 'CPCHK515BU' where CheckColorKey = 12
update CheckColor set PartNumber = 'CPCHK515TA' where CheckColorKey = 13

update CheckColor set PartNumber = 'CPCHK615BP' where CheckColorKey = 15
update CheckColor set PartNumber = 'CPCHK615BG' where CheckColorKey = 16
update CheckColor set PartNumber = 'CPCHK615BPG' where CheckColorKey = 17
update CheckColor set PartNumber = 'CPCHK615PT' where CheckColorKey = 18



/****** Object:  StoredProcedure [dbo].[CheckColor_Update]    Script Date: 02/18/2012 05:49:42 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CheckColor_Update]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[CheckColor_Update]
GO


/****** Object:  StoredProcedure [dbo].[CheckColor_Update]    Script Date: 02/18/2012 05:49:42 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


create procedure [dbo].[CheckColor_Update]
(
@ID int
, @ProductTypeKey int 
, @Description varchar(50) 
, @ImagePath varchar(50) 
, @FullCheckImagePath varchar(50)
, @PartNumber varchar(50)
)
AS
SET NOCOUNT ON
Update CheckColor Set 
ProductTypeKey = @ProductTypeKey,
Description = @Description,
ImagePath = @ImagePath,
FullCheckImagePath = @FullCheckImagePath,
PartNumber = @PartNumber
where
CheckColorKey = @ID


GO


----------------------------------------------------------

/****** Object:  StoredProcedure [dbo].[CheckColor_GetOne]    Script Date: 02/18/2012 05:49:14 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CheckColor_GetOne]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[CheckColor_GetOne]
GO


/****** Object:  StoredProcedure [dbo].[CheckColor_GetOne]    Script Date: 02/18/2012 05:49:14 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



create procedure [dbo].[CheckColor_GetOne]
(
@ID int
)
AS
SET NOCOUNT ON
select 
     CheckColorKey
     ,ProductTypeKey
     ,Description
     ,ImagePath
     ,FullCheckImagePath
     ,PartNumber
from
     CheckColor
where
     CheckColorKey = @ID


GO


---------------------------------------------------


/****** Object:  StoredProcedure [dbo].[CheckColor_Create]    Script Date: 02/18/2012 05:48:03 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CheckColor_Create]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[CheckColor_Create]
GO


/****** Object:  StoredProcedure [dbo].[CheckColor_Create]    Script Date: 02/18/2012 05:48:03 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



create procedure [dbo].[CheckColor_Create]
(
@ProductTypeKey int ,
@Description varchar(50) ,
@ImagePath varchar(50) ,
@FullCheckImagePath varchar(50),
@PartNumber varchar(50),
@retval int OUTPUT

)
AS
SET NOCOUNT ON

Insert into CheckColor
(
ProductTypeKey,
Description,
ImagePath,
FullCheckImagePath,
PartNumber
)
Values
(
@ProductTypeKey,
@Description,
@ImagePath,
@FullCheckImagePath,
@PartNumber
)
SET @retval = (Select Scope_Identity())


GO


