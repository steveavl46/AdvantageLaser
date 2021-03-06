/****** Object:  ForeignKey [FK_Address_AddressType1]    Script Date: 11/15/2011 17:46:02 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Address_AddressType1]') AND parent_object_id = OBJECT_ID(N'[dbo].[Address]'))
ALTER TABLE [dbo].[Address] DROP CONSTRAINT [FK_Address_AddressType1]
GO
/****** Object:  ForeignKey [FK_Address_Customer]    Script Date: 11/15/2011 17:46:02 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Address_Customer]') AND parent_object_id = OBJECT_ID(N'[dbo].[Address]'))
ALTER TABLE [dbo].[Address] DROP CONSTRAINT [FK_Address_Customer]
GO
/****** Object:  ForeignKey [FK_CheckColor_ProductType]    Script Date: 11/15/2011 17:46:02 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CheckColor_ProductType]') AND parent_object_id = OBJECT_ID(N'[dbo].[CheckColor]'))
ALTER TABLE [dbo].[CheckColor] DROP CONSTRAINT [FK_CheckColor_ProductType]
GO
/****** Object:  ForeignKey [FK_CheckDetail_CheckColor]    Script Date: 11/15/2011 17:46:02 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CheckDetail_CheckColor]') AND parent_object_id = OBJECT_ID(N'[dbo].[CheckDetail]'))
ALTER TABLE [dbo].[CheckDetail] DROP CONSTRAINT [FK_CheckDetail_CheckColor]
GO
/****** Object:  ForeignKey [FK_CheckDetail_CheckDetail]    Script Date: 11/15/2011 17:46:02 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CheckDetail_CheckDetail]') AND parent_object_id = OBJECT_ID(N'[dbo].[CheckDetail]'))
ALTER TABLE [dbo].[CheckDetail] DROP CONSTRAINT [FK_CheckDetail_CheckDetail]
GO
/****** Object:  ForeignKey [FK_CheckDetail_CheckStubLine]    Script Date: 11/15/2011 17:46:02 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CheckDetail_CheckStubLine]') AND parent_object_id = OBJECT_ID(N'[dbo].[CheckDetail]'))
ALTER TABLE [dbo].[CheckDetail] DROP CONSTRAINT [FK_CheckDetail_CheckStubLine]
GO
/****** Object:  ForeignKey [FK_CheckDetail_FontWeight]    Script Date: 11/15/2011 17:46:02 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CheckDetail_FontWeight]') AND parent_object_id = OBJECT_ID(N'[dbo].[CheckDetail]'))
ALTER TABLE [dbo].[CheckDetail] DROP CONSTRAINT [FK_CheckDetail_FontWeight]
GO
/****** Object:  ForeignKey [FK_CheckDetail_FontWeight1]    Script Date: 11/15/2011 17:46:02 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CheckDetail_FontWeight1]') AND parent_object_id = OBJECT_ID(N'[dbo].[CheckDetail]'))
ALTER TABLE [dbo].[CheckDetail] DROP CONSTRAINT [FK_CheckDetail_FontWeight1]
GO
/****** Object:  ForeignKey [FK_CheckDetail_TextAlign]    Script Date: 11/15/2011 17:46:02 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CheckDetail_TextAlign]') AND parent_object_id = OBJECT_ID(N'[dbo].[CheckDetail]'))
ALTER TABLE [dbo].[CheckDetail] DROP CONSTRAINT [FK_CheckDetail_TextAlign]
GO
/****** Object:  ForeignKey [FK_CheckDetail_TypeFace]    Script Date: 11/15/2011 17:46:02 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CheckDetail_TypeFace]') AND parent_object_id = OBJECT_ID(N'[dbo].[CheckDetail]'))
ALTER TABLE [dbo].[CheckDetail] DROP CONSTRAINT [FK_CheckDetail_TypeFace]
GO
/****** Object:  ForeignKey [FK_CreditCard_CreditCardType]    Script Date: 11/15/2011 17:46:02 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CreditCard_CreditCardType]') AND parent_object_id = OBJECT_ID(N'[dbo].[CreditCard]'))
ALTER TABLE [dbo].[CreditCard] DROP CONSTRAINT [FK_CreditCard_CreditCardType]
GO
/****** Object:  ForeignKey [FK_CreditCard_Customer]    Script Date: 11/15/2011 17:46:02 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CreditCard_Customer]') AND parent_object_id = OBJECT_ID(N'[dbo].[CreditCard]'))
ALTER TABLE [dbo].[CreditCard] DROP CONSTRAINT [FK_CreditCard_Customer]
GO
/****** Object:  ForeignKey [FK_DepositSlip_Customer]    Script Date: 11/15/2011 17:46:02 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_DepositSlip_Customer]') AND parent_object_id = OBJECT_ID(N'[dbo].[DepositSlip]'))
ALTER TABLE [dbo].[DepositSlip] DROP CONSTRAINT [FK_DepositSlip_Customer]
GO
/****** Object:  ForeignKey [FK_DepositStamp_Customer]    Script Date: 11/15/2011 17:46:03 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_DepositStamp_Customer]') AND parent_object_id = OBJECT_ID(N'[dbo].[DepositStamp]'))
ALTER TABLE [dbo].[DepositStamp] DROP CONSTRAINT [FK_DepositStamp_Customer]
GO
/****** Object:  ForeignKey [FK_Invoice_CreditCard]    Script Date: 11/15/2011 17:46:03 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Invoice_CreditCard]') AND parent_object_id = OBJECT_ID(N'[dbo].[Invoice]'))
ALTER TABLE [dbo].[Invoice] DROP CONSTRAINT [FK_Invoice_CreditCard]
GO
/****** Object:  ForeignKey [FK_Invoice_Customer]    Script Date: 11/15/2011 17:46:03 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Invoice_Customer]') AND parent_object_id = OBJECT_ID(N'[dbo].[Invoice]'))
ALTER TABLE [dbo].[Invoice] DROP CONSTRAINT [FK_Invoice_Customer]
GO
/****** Object:  ForeignKey [FK_Invoice_ExpediteType]    Script Date: 11/15/2011 17:46:03 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Invoice_ExpediteType]') AND parent_object_id = OBJECT_ID(N'[dbo].[Invoice]'))
ALTER TABLE [dbo].[Invoice] DROP CONSTRAINT [FK_Invoice_ExpediteType]
GO
/****** Object:  ForeignKey [FK_Invoice_ShippingType]    Script Date: 11/15/2011 17:46:03 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Invoice_ShippingType]') AND parent_object_id = OBJECT_ID(N'[dbo].[Invoice]'))
ALTER TABLE [dbo].[Invoice] DROP CONSTRAINT [FK_Invoice_ShippingType]
GO
/****** Object:  ForeignKey [FK_InvoiceItem_CheckDetail]    Script Date: 11/15/2011 17:46:03 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_InvoiceItem_CheckDetail]') AND parent_object_id = OBJECT_ID(N'[dbo].[InvoiceItem]'))
ALTER TABLE [dbo].[InvoiceItem] DROP CONSTRAINT [FK_InvoiceItem_CheckDetail]
GO
/****** Object:  ForeignKey [FK_InvoiceItem_DepositSlip]    Script Date: 11/15/2011 17:46:03 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_InvoiceItem_DepositSlip]') AND parent_object_id = OBJECT_ID(N'[dbo].[InvoiceItem]'))
ALTER TABLE [dbo].[InvoiceItem] DROP CONSTRAINT [FK_InvoiceItem_DepositSlip]
GO
/****** Object:  ForeignKey [FK_InvoiceItem_DepositStamp]    Script Date: 11/15/2011 17:46:03 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_InvoiceItem_DepositStamp]') AND parent_object_id = OBJECT_ID(N'[dbo].[InvoiceItem]'))
ALTER TABLE [dbo].[InvoiceItem] DROP CONSTRAINT [FK_InvoiceItem_DepositStamp]
GO
/****** Object:  ForeignKey [FK_InvoiceItem_Invoice]    Script Date: 11/15/2011 17:46:03 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_InvoiceItem_Invoice]') AND parent_object_id = OBJECT_ID(N'[dbo].[InvoiceItem]'))
ALTER TABLE [dbo].[InvoiceItem] DROP CONSTRAINT [FK_InvoiceItem_Invoice]
GO
/****** Object:  ForeignKey [FK_InvoiceItem_Product]    Script Date: 11/15/2011 17:46:03 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_InvoiceItem_Product]') AND parent_object_id = OBJECT_ID(N'[dbo].[InvoiceItem]'))
ALTER TABLE [dbo].[InvoiceItem] DROP CONSTRAINT [FK_InvoiceItem_Product]
GO
/****** Object:  ForeignKey [FK_Product_ProductType]    Script Date: 11/15/2011 17:46:03 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Product_ProductType]') AND parent_object_id = OBJECT_ID(N'[dbo].[Product]'))
ALTER TABLE [dbo].[Product] DROP CONSTRAINT [FK_Product_ProductType]
GO
/****** Object:  ForeignKey [FK_ProductType_ProductCategory]    Script Date: 11/15/2011 17:46:03 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ProductType_ProductCategory]') AND parent_object_id = OBJECT_ID(N'[dbo].[ProductType]'))
ALTER TABLE [dbo].[ProductType] DROP CONSTRAINT [FK_ProductType_ProductCategory]
GO
/****** Object:  ForeignKey [FK_ProductType_ShippingRateGroup]    Script Date: 11/15/2011 17:46:03 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ProductType_ShippingRateGroup]') AND parent_object_id = OBJECT_ID(N'[dbo].[ProductType]'))
ALTER TABLE [dbo].[ProductType] DROP CONSTRAINT [FK_ProductType_ShippingRateGroup]
GO
/****** Object:  ForeignKey [FK_ProductTypeCheckOptionXRef_CheckFeatureOption]    Script Date: 11/15/2011 17:46:03 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ProductTypeCheckOptionXRef_CheckFeatureOption]') AND parent_object_id = OBJECT_ID(N'[dbo].[ProductTypeCheckOptionXRef]'))
ALTER TABLE [dbo].[ProductTypeCheckOptionXRef] DROP CONSTRAINT [FK_ProductTypeCheckOptionXRef_CheckFeatureOption]
GO
/****** Object:  ForeignKey [FK_ProductTypeCheckOptionXRef_ProductType]    Script Date: 11/15/2011 17:46:03 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ProductTypeCheckOptionXRef_ProductType]') AND parent_object_id = OBJECT_ID(N'[dbo].[ProductTypeCheckOptionXRef]'))
ALTER TABLE [dbo].[ProductTypeCheckOptionXRef] DROP CONSTRAINT [FK_ProductTypeCheckOptionXRef_ProductType]
GO
/****** Object:  ForeignKey [FK_ShippingZoneRate_ShippingRateGroup]    Script Date: 11/15/2011 17:46:03 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ShippingZoneRate_ShippingRateGroup]') AND parent_object_id = OBJECT_ID(N'[dbo].[ShippingZoneRate]'))
ALTER TABLE [dbo].[ShippingZoneRate] DROP CONSTRAINT [FK_ShippingZoneRate_ShippingRateGroup]
GO
/****** Object:  ForeignKey [FK_ShippingZoneRate_ShippingRateType]    Script Date: 11/15/2011 17:46:03 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ShippingZoneRate_ShippingRateType]') AND parent_object_id = OBJECT_ID(N'[dbo].[ShippingZoneRate]'))
ALTER TABLE [dbo].[ShippingZoneRate] DROP CONSTRAINT [FK_ShippingZoneRate_ShippingRateType]
GO
/****** Object:  ForeignKey [FK_ShippingZoneRate_ShippingZone]    Script Date: 11/15/2011 17:46:03 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ShippingZoneRate_ShippingZone]') AND parent_object_id = OBJECT_ID(N'[dbo].[ShippingZoneRate]'))
ALTER TABLE [dbo].[ShippingZoneRate] DROP CONSTRAINT [FK_ShippingZoneRate_ShippingZone]
GO
/****** Object:  ForeignKey [FK_State_ShippingZone]    Script Date: 11/15/2011 17:46:03 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_State_ShippingZone]') AND parent_object_id = OBJECT_ID(N'[dbo].[State]'))
ALTER TABLE [dbo].[State] DROP CONSTRAINT [FK_State_ShippingZone]
GO
/****** Object:  StoredProcedure [dbo].[GetInvoiceItems]    Script Date: 11/15/2011 17:46:03 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GetInvoiceItems]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[GetInvoiceItems]
GO
/****** Object:  StoredProcedure [dbo].[InvoiceItem_Create]    Script Date: 11/15/2011 17:46:03 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[InvoiceItem_Create]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[InvoiceItem_Create]
GO
/****** Object:  StoredProcedure [dbo].[InvoiceItem_GetOne]    Script Date: 11/15/2011 17:46:03 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[InvoiceItem_GetOne]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[InvoiceItem_GetOne]
GO
/****** Object:  StoredProcedure [dbo].[InvoiceItem_Update]    Script Date: 11/15/2011 17:46:03 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[InvoiceItem_Update]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[InvoiceItem_Update]
GO
/****** Object:  StoredProcedure [dbo].[usp_DeleteInvoice]    Script Date: 11/15/2011 17:46:03 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_DeleteInvoice]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_DeleteInvoice]
GO
/****** Object:  View [dbo].[v_OrderInfo]    Script Date: 11/15/2011 17:46:03 ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[v_OrderInfo]'))
DROP VIEW [dbo].[v_OrderInfo]
GO
/****** Object:  Table [dbo].[InvoiceItem]    Script Date: 11/15/2011 17:46:03 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[InvoiceItem]') AND type in (N'U'))
DROP TABLE [dbo].[InvoiceItem]
GO
/****** Object:  StoredProcedure [dbo].[CheckDetail_Create]    Script Date: 11/15/2011 17:46:03 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CheckDetail_Create]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[CheckDetail_Create]
GO
/****** Object:  StoredProcedure [dbo].[CheckDetail_GetOne]    Script Date: 11/15/2011 17:46:03 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CheckDetail_GetOne]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[CheckDetail_GetOne]
GO
/****** Object:  StoredProcedure [dbo].[CheckDetail_Update]    Script Date: 11/15/2011 17:46:03 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CheckDetail_Update]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[CheckDetail_Update]
GO
/****** Object:  StoredProcedure [dbo].[CheckColor_Create]    Script Date: 11/15/2011 17:46:03 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CheckColor_Create]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[CheckColor_Create]
GO
/****** Object:  StoredProcedure [dbo].[CheckColor_GetOne]    Script Date: 11/15/2011 17:46:03 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CheckColor_GetOne]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[CheckColor_GetOne]
GO
/****** Object:  StoredProcedure [dbo].[CheckColor_Update]    Script Date: 11/15/2011 17:46:03 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CheckColor_Update]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[CheckColor_Update]
GO
/****** Object:  Table [dbo].[CheckDetail]    Script Date: 11/15/2011 17:46:02 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CheckDetail]') AND type in (N'U'))
DROP TABLE [dbo].[CheckDetail]
GO
/****** Object:  StoredProcedure [dbo].[Invoice_Create]    Script Date: 11/15/2011 17:46:03 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Invoice_Create]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Invoice_Create]
GO
/****** Object:  StoredProcedure [dbo].[Invoice_GetOne]    Script Date: 11/15/2011 17:46:03 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Invoice_GetOne]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Invoice_GetOne]
GO
/****** Object:  StoredProcedure [dbo].[Invoice_Update]    Script Date: 11/15/2011 17:46:03 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Invoice_Update]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Invoice_Update]
GO
/****** Object:  StoredProcedure [dbo].[Product_Create]    Script Date: 11/15/2011 17:46:03 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Product_Create]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Product_Create]
GO
/****** Object:  StoredProcedure [dbo].[Product_GetOne]    Script Date: 11/15/2011 17:46:03 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Product_GetOne]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Product_GetOne]
GO
/****** Object:  StoredProcedure [dbo].[Product_Update]    Script Date: 11/15/2011 17:46:03 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Product_Update]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Product_Update]
GO
/****** Object:  StoredProcedure [dbo].[ProductType_Create]    Script Date: 11/15/2011 17:46:03 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ProductType_Create]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[ProductType_Create]
GO
/****** Object:  StoredProcedure [dbo].[ProductType_GetOne]    Script Date: 11/15/2011 17:46:03 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ProductType_GetOne]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[ProductType_GetOne]
GO
/****** Object:  StoredProcedure [dbo].[ProductType_Update]    Script Date: 11/15/2011 17:46:03 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ProductType_Update]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[ProductType_Update]
GO
/****** Object:  Table [dbo].[ProductTypeCheckOptionXRef]    Script Date: 11/15/2011 17:46:03 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ProductTypeCheckOptionXRef]') AND type in (N'U'))
DROP TABLE [dbo].[ProductTypeCheckOptionXRef]
GO
/****** Object:  StoredProcedure [dbo].[GetShippingZoneInfo]    Script Date: 11/15/2011 17:46:03 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GetShippingZoneInfo]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[GetShippingZoneInfo]
GO
/****** Object:  Table [dbo].[Invoice]    Script Date: 11/15/2011 17:46:03 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Invoice]') AND type in (N'U'))
DROP TABLE [dbo].[Invoice]
GO
/****** Object:  StoredProcedure [dbo].[DepositStamp_Create]    Script Date: 11/15/2011 17:46:03 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DepositStamp_Create]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[DepositStamp_Create]
GO
/****** Object:  StoredProcedure [dbo].[DepositStamp_GetOne]    Script Date: 11/15/2011 17:46:03 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DepositStamp_GetOne]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[DepositStamp_GetOne]
GO
/****** Object:  StoredProcedure [dbo].[DepositStamp_Update]    Script Date: 11/15/2011 17:46:03 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DepositStamp_Update]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[DepositStamp_Update]
GO
/****** Object:  StoredProcedure [dbo].[Address_Create]    Script Date: 11/15/2011 17:46:03 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Address_Create]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Address_Create]
GO
/****** Object:  StoredProcedure [dbo].[Address_GetOne]    Script Date: 11/15/2011 17:46:03 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Address_GetOne]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Address_GetOne]
GO
/****** Object:  StoredProcedure [dbo].[Address_Update]    Script Date: 11/15/2011 17:46:03 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Address_Update]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Address_Update]
GO
/****** Object:  Table [dbo].[CheckColor]    Script Date: 11/15/2011 17:46:02 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CheckColor]') AND type in (N'U'))
DROP TABLE [dbo].[CheckColor]
GO
/****** Object:  StoredProcedure [dbo].[CreditCard_Create]    Script Date: 11/15/2011 17:46:03 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CreditCard_Create]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[CreditCard_Create]
GO
/****** Object:  StoredProcedure [dbo].[CreditCard_GetOne]    Script Date: 11/15/2011 17:46:03 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CreditCard_GetOne]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[CreditCard_GetOne]
GO
/****** Object:  StoredProcedure [dbo].[CreditCard_Update]    Script Date: 11/15/2011 17:46:03 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CreditCard_Update]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[CreditCard_Update]
GO
/****** Object:  StoredProcedure [dbo].[DepositSlip_Create]    Script Date: 11/15/2011 17:46:03 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DepositSlip_Create]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[DepositSlip_Create]
GO
/****** Object:  StoredProcedure [dbo].[DepositSlip_GetOne]    Script Date: 11/15/2011 17:46:03 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DepositSlip_GetOne]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[DepositSlip_GetOne]
GO
/****** Object:  StoredProcedure [dbo].[DepositSlip_Update]    Script Date: 11/15/2011 17:46:03 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DepositSlip_Update]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[DepositSlip_Update]
GO
/****** Object:  View [dbo].[v_ZoneShippingRates]    Script Date: 11/15/2011 17:46:03 ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[v_ZoneShippingRates]'))
DROP VIEW [dbo].[v_ZoneShippingRates]
GO
/****** Object:  StoredProcedure [dbo].[usp_SelectProduct_DepositSlipList]    Script Date: 11/15/2011 17:46:03 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_SelectProduct_DepositSlipList]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_SelectProduct_DepositSlipList]
GO
/****** Object:  StoredProcedure [dbo].[usp_SelectProduct_PrePrintedCheckList]    Script Date: 11/15/2011 17:46:03 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_SelectProduct_PrePrintedCheckList]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_SelectProduct_PrePrintedCheckList]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 11/15/2011 17:46:03 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Product]') AND type in (N'U'))
DROP TABLE [dbo].[Product]
GO
/****** Object:  StoredProcedure [dbo].[State_Create]    Script Date: 11/15/2011 17:46:03 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[State_Create]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[State_Create]
GO
/****** Object:  StoredProcedure [dbo].[State_GetOne]    Script Date: 11/15/2011 17:46:03 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[State_GetOne]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[State_GetOne]
GO
/****** Object:  StoredProcedure [dbo].[State_Update]    Script Date: 11/15/2011 17:46:03 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[State_Update]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[State_Update]
GO
/****** Object:  StoredProcedure [dbo].[ShippingZoneRate_Create]    Script Date: 11/15/2011 17:46:03 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ShippingZoneRate_Create]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[ShippingZoneRate_Create]
GO
/****** Object:  StoredProcedure [dbo].[ShippingZoneRate_GetOne]    Script Date: 11/15/2011 17:46:03 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ShippingZoneRate_GetOne]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[ShippingZoneRate_GetOne]
GO
/****** Object:  StoredProcedure [dbo].[ShippingZoneRate_Update]    Script Date: 11/15/2011 17:46:03 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ShippingZoneRate_Update]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[ShippingZoneRate_Update]
GO
/****** Object:  Table [dbo].[State]    Script Date: 11/15/2011 17:46:03 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[State]') AND type in (N'U'))
DROP TABLE [dbo].[State]
GO
/****** Object:  StoredProcedure [dbo].[ShippingZone_Create]    Script Date: 11/15/2011 17:46:03 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ShippingZone_Create]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[ShippingZone_Create]
GO
/****** Object:  StoredProcedure [dbo].[ShippingZone_GetOne]    Script Date: 11/15/2011 17:46:03 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ShippingZone_GetOne]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[ShippingZone_GetOne]
GO
/****** Object:  StoredProcedure [dbo].[ShippingZone_Update]    Script Date: 11/15/2011 17:46:03 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ShippingZone_Update]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[ShippingZone_Update]
GO
/****** Object:  Table [dbo].[ShippingZoneRate]    Script Date: 11/15/2011 17:46:03 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ShippingZoneRate]') AND type in (N'U'))
DROP TABLE [dbo].[ShippingZoneRate]
GO
/****** Object:  StoredProcedure [dbo].[ShippingRateType_Create]    Script Date: 11/15/2011 17:46:03 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ShippingRateType_Create]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[ShippingRateType_Create]
GO
/****** Object:  StoredProcedure [dbo].[ShippingRateType_GetOne]    Script Date: 11/15/2011 17:46:03 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ShippingRateType_GetOne]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[ShippingRateType_GetOne]
GO
/****** Object:  StoredProcedure [dbo].[ShippingRateType_Update]    Script Date: 11/15/2011 17:46:03 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ShippingRateType_Update]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[ShippingRateType_Update]
GO
/****** Object:  StoredProcedure [dbo].[ShippingType_Create]    Script Date: 11/15/2011 17:46:03 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ShippingType_Create]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[ShippingType_Create]
GO
/****** Object:  StoredProcedure [dbo].[ShippingType_GetOne]    Script Date: 11/15/2011 17:46:03 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ShippingType_GetOne]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[ShippingType_GetOne]
GO
/****** Object:  StoredProcedure [dbo].[ShippingType_Update]    Script Date: 11/15/2011 17:46:03 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ShippingType_Update]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[ShippingType_Update]
GO
/****** Object:  StoredProcedure [dbo].[TypeFace_Create]    Script Date: 11/15/2011 17:46:03 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TypeFace_Create]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[TypeFace_Create]
GO
/****** Object:  StoredProcedure [dbo].[TypeFace_GetOne]    Script Date: 11/15/2011 17:46:03 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TypeFace_GetOne]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[TypeFace_GetOne]
GO
/****** Object:  StoredProcedure [dbo].[TypeFace_Update]    Script Date: 11/15/2011 17:46:03 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TypeFace_Update]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[TypeFace_Update]
GO
/****** Object:  Table [dbo].[DepositStamp]    Script Date: 11/15/2011 17:46:03 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DepositStamp]') AND type in (N'U'))
DROP TABLE [dbo].[DepositStamp]
GO
/****** Object:  StoredProcedure [dbo].[Customer_Create]    Script Date: 11/15/2011 17:46:03 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Customer_Create]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Customer_Create]
GO
/****** Object:  StoredProcedure [dbo].[Customer_GetOne]    Script Date: 11/15/2011 17:46:03 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Customer_GetOne]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Customer_GetOne]
GO
/****** Object:  StoredProcedure [dbo].[Customer_Update]    Script Date: 11/15/2011 17:46:03 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Customer_Update]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Customer_Update]
GO
/****** Object:  Table [dbo].[DepositSlip]    Script Date: 11/15/2011 17:46:02 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DepositSlip]') AND type in (N'U'))
DROP TABLE [dbo].[DepositSlip]
GO
/****** Object:  StoredProcedure [dbo].[CreditCardType_Create]    Script Date: 11/15/2011 17:46:03 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CreditCardType_Create]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[CreditCardType_Create]
GO
/****** Object:  StoredProcedure [dbo].[CreditCardType_GetOne]    Script Date: 11/15/2011 17:46:03 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CreditCardType_GetOne]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[CreditCardType_GetOne]
GO
/****** Object:  StoredProcedure [dbo].[CreditCardType_Update]    Script Date: 11/15/2011 17:46:03 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CreditCardType_Update]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[CreditCardType_Update]
GO
/****** Object:  Table [dbo].[Address]    Script Date: 11/15/2011 17:46:02 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Address]') AND type in (N'U'))
DROP TABLE [dbo].[Address]
GO
/****** Object:  Table [dbo].[CreditCard]    Script Date: 11/15/2011 17:46:02 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CreditCard]') AND type in (N'U'))
DROP TABLE [dbo].[CreditCard]
GO
/****** Object:  StoredProcedure [dbo].[AddressType_Create]    Script Date: 11/15/2011 17:46:03 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AddressType_Create]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[AddressType_Create]
GO
/****** Object:  StoredProcedure [dbo].[AddressType_GetOne]    Script Date: 11/15/2011 17:46:03 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AddressType_GetOne]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[AddressType_GetOne]
GO
/****** Object:  StoredProcedure [dbo].[AddressType_Update]    Script Date: 11/15/2011 17:46:03 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AddressType_Update]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[AddressType_Update]
GO
/****** Object:  StoredProcedure [dbo].[ExpediteType_Create]    Script Date: 11/15/2011 17:46:03 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ExpediteType_Create]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[ExpediteType_Create]
GO
/****** Object:  StoredProcedure [dbo].[ExpediteType_GetOne]    Script Date: 11/15/2011 17:46:03 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ExpediteType_GetOne]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[ExpediteType_GetOne]
GO
/****** Object:  StoredProcedure [dbo].[ExpediteType_Update]    Script Date: 11/15/2011 17:46:03 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ExpediteType_Update]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[ExpediteType_Update]
GO
/****** Object:  StoredProcedure [dbo].[ShippingRateGroup_Create]    Script Date: 11/15/2011 17:46:03 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ShippingRateGroup_Create]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[ShippingRateGroup_Create]
GO
/****** Object:  StoredProcedure [dbo].[ShippingRateGroup_GetOne]    Script Date: 11/15/2011 17:46:03 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ShippingRateGroup_GetOne]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[ShippingRateGroup_GetOne]
GO
/****** Object:  StoredProcedure [dbo].[ShippingRateGroup_Update]    Script Date: 11/15/2011 17:46:03 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ShippingRateGroup_Update]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[ShippingRateGroup_Update]
GO
/****** Object:  StoredProcedure [dbo].[ProductCategory_Create]    Script Date: 11/15/2011 17:46:03 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ProductCategory_Create]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[ProductCategory_Create]
GO
/****** Object:  StoredProcedure [dbo].[ProductCategory_GetOne]    Script Date: 11/15/2011 17:46:03 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ProductCategory_GetOne]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[ProductCategory_GetOne]
GO
/****** Object:  StoredProcedure [dbo].[ProductCategory_Update]    Script Date: 11/15/2011 17:46:03 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ProductCategory_Update]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[ProductCategory_Update]
GO
/****** Object:  Table [dbo].[ProductType]    Script Date: 11/15/2011 17:46:03 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ProductType]') AND type in (N'U'))
DROP TABLE [dbo].[ProductType]
GO
/****** Object:  Table [dbo].[ProductCategory]    Script Date: 11/15/2011 17:46:03 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ProductCategory]') AND type in (N'U'))
DROP TABLE [dbo].[ProductCategory]
GO
/****** Object:  Table [dbo].[ShippingRateType]    Script Date: 11/15/2011 17:46:03 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ShippingRateType]') AND type in (N'U'))
DROP TABLE [dbo].[ShippingRateType]
GO
/****** Object:  Table [dbo].[ShippingRateGroup]    Script Date: 11/15/2011 17:46:03 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ShippingRateGroup]') AND type in (N'U'))
DROP TABLE [dbo].[ShippingRateGroup]
GO
/****** Object:  Table [dbo].[FontWeight]    Script Date: 11/15/2011 17:46:03 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[FontWeight]') AND type in (N'U'))
DROP TABLE [dbo].[FontWeight]
GO
/****** Object:  Table [dbo].[ExpediteType]    Script Date: 11/15/2011 17:46:03 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ExpediteType]') AND type in (N'U'))
DROP TABLE [dbo].[ExpediteType]
GO
/****** Object:  Table [dbo].[CheckFeatureOption]    Script Date: 11/15/2011 17:46:02 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CheckFeatureOption]') AND type in (N'U'))
DROP TABLE [dbo].[CheckFeatureOption]
GO
/****** Object:  Table [dbo].[CheckStubLine]    Script Date: 11/15/2011 17:46:02 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CheckStubLine]') AND type in (N'U'))
DROP TABLE [dbo].[CheckStubLine]
GO
/****** Object:  Table [dbo].[AddressType]    Script Date: 11/15/2011 17:46:02 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AddressType]') AND type in (N'U'))
DROP TABLE [dbo].[AddressType]
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 11/15/2011 17:46:02 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Customer]') AND type in (N'U'))
DROP TABLE [dbo].[Customer]
GO
/****** Object:  Table [dbo].[CreditCardType]    Script Date: 11/15/2011 17:46:02 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CreditCardType]') AND type in (N'U'))
DROP TABLE [dbo].[CreditCardType]
GO
/****** Object:  Table [dbo].[TextAlign]    Script Date: 11/15/2011 17:46:03 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TextAlign]') AND type in (N'U'))
DROP TABLE [dbo].[TextAlign]
GO
/****** Object:  Table [dbo].[TypeFace]    Script Date: 11/15/2011 17:46:03 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TypeFace]') AND type in (N'U'))
DROP TABLE [dbo].[TypeFace]
GO
/****** Object:  Table [dbo].[ShippingZone]    Script Date: 11/15/2011 17:46:03 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ShippingZone]') AND type in (N'U'))
DROP TABLE [dbo].[ShippingZone]
GO
/****** Object:  Table [dbo].[ShippingType]    Script Date: 11/15/2011 17:46:03 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ShippingType]') AND type in (N'U'))
DROP TABLE [dbo].[ShippingType]
GO
/****** Object:  Default [DF__CheckDeta__UseLo__367C1819]    Script Date: 11/15/2011 17:46:02 ******/
IF  EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF__CheckDeta__UseLo__367C1819]') AND parent_object_id = OBJECT_ID(N'[dbo].[CheckDetail]'))
Begin
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__CheckDeta__UseLo__367C1819]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[CheckDetail] DROP CONSTRAINT [DF__CheckDeta__UseLo__367C1819]
END


End
GO
/****** Object:  Default [DF_InvoiceItem_ShippingRate]    Script Date: 11/15/2011 17:46:03 ******/
IF  EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_InvoiceItem_ShippingRate]') AND parent_object_id = OBJECT_ID(N'[dbo].[InvoiceItem]'))
Begin
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_InvoiceItem_ShippingRate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[InvoiceItem] DROP CONSTRAINT [DF_InvoiceItem_ShippingRate]
END


End
GO
/****** Object:  Default [DF_Product_ShippingUnits]    Script Date: 11/15/2011 17:46:03 ******/
IF  EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Product_ShippingUnits]') AND parent_object_id = OBJECT_ID(N'[dbo].[Product]'))
Begin
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Product_ShippingUnits]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Product] DROP CONSTRAINT [DF_Product_ShippingUnits]
END


End
GO
/****** Object:  Role [##MS_PolicyEventProcessingLogin##]    Script Date: 11/15/2011 17:46:03 ******/
DECLARE @RoleName sysname
set @RoleName = N'##MS_PolicyEventProcessingLogin##'
IF  EXISTS (SELECT * FROM sys.database_principals WHERE name = @RoleName AND type = 'R')
Begin
	DECLARE @RoleMemberName sysname
	DECLARE Member_Cursor CURSOR FOR
	select [name]
	from sys.database_principals 
	where principal_id in ( 
		select member_principal_id 
		from sys.database_role_members 
		where role_principal_id in (
			select principal_id
			FROM sys.database_principals where [name] = @RoleName  AND type = 'R' ))

	OPEN Member_Cursor;

	FETCH NEXT FROM Member_Cursor
	into @RoleMemberName

	WHILE @@FETCH_STATUS = 0
	BEGIN

		exec sp_droprolemember @rolename=@RoleName, @membername= @RoleMemberName

		FETCH NEXT FROM Member_Cursor
		into @RoleMemberName
	END;

	CLOSE Member_Cursor;
	DEALLOCATE Member_Cursor;
End
GO
IF  EXISTS (SELECT * FROM sys.database_principals WHERE name = N'##MS_PolicyEventProcessingLogin##' AND type = 'R')
DROP ROLE [##MS_PolicyEventProcessingLogin##]
GO
/****** Object:  Role [steve]    Script Date: 11/15/2011 17:46:03 ******/
IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = N'steve')
BEGIN
IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = N'steve' AND type = 'R')
CREATE ROLE [steve]

END
GO
/****** Object:  Role [##MS_PolicyEventProcessingLogin##]    Script Date: 11/15/2011 17:46:03 ******/
IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = N'##MS_PolicyEventProcessingLogin##')
BEGIN
IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = N'##MS_PolicyEventProcessingLogin##' AND type = 'R')
CREATE ROLE [##MS_PolicyEventProcessingLogin##] AUTHORIZATION [dbo]

END
GO
/****** Object:  Table [dbo].[ShippingType]    Script Date: 11/15/2011 17:46:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ShippingType]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ShippingType](
	[ShippingTypeKey] [int] IDENTITY(1,1) NOT NULL,
	[Description] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[DisplayOrder] [int] NOT NULL,
	[AdditionalCharge] [numeric](18, 2) NULL,
	[IsActive] [bit] NOT NULL,
	[BillAtActualCharges] [bit] NOT NULL,
 CONSTRAINT [PK_ShippingType] PRIMARY KEY CLUSTERED 
(
	[ShippingTypeKey] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)
END
GO
SET IDENTITY_INSERT [dbo].[ShippingType] ON
INSERT [dbo].[ShippingType] ([ShippingTypeKey], [Description], [DisplayOrder], [AdditionalCharge], [IsActive], [BillAtActualCharges]) VALUES (1, N'FedEx Ground Shipping', 1, CAST(0.00 AS Numeric(18, 2)), 1, 0)
INSERT [dbo].[ShippingType] ([ShippingTypeKey], [Description], [DisplayOrder], [AdditionalCharge], [IsActive], [BillAtActualCharges]) VALUES (2, N'RUSH Shipping - 100 checks Next Day Air, remainder Fed Ex ground Standard Rate plus', 2, CAST(20.00 AS Numeric(18, 2)), 1, 0)
INSERT [dbo].[ShippingType] ([ShippingTypeKey], [Description], [DisplayOrder], [AdditionalCharge], [IsActive], [BillAtActualCharges]) VALUES (3, N'Fed Ex 1 Day Air Billed at actual Fed Ex Charges', 3, CAST(0.00 AS Numeric(18, 2)), 1, 1)
INSERT [dbo].[ShippingType] ([ShippingTypeKey], [Description], [DisplayOrder], [AdditionalCharge], [IsActive], [BillAtActualCharges]) VALUES (4, N'Fed Ex 2 Day Air Billed at actual Fed Ex Charges', 4, CAST(0.00 AS Numeric(18, 2)), 1, 1)
INSERT [dbo].[ShippingType] ([ShippingTypeKey], [Description], [DisplayOrder], [AdditionalCharge], [IsActive], [BillAtActualCharges]) VALUES (5, N'Fed Ex 3 Day Select Billed at actual Fed Ex Charges', 5, CAST(0.00 AS Numeric(18, 2)), 1, 1)
SET IDENTITY_INSERT [dbo].[ShippingType] OFF
/****** Object:  Table [dbo].[ShippingZone]    Script Date: 11/15/2011 17:46:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ShippingZone]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ShippingZone](
	[ShippingZoneKey] [int] IDENTITY(1,1) NOT NULL,
	[Description] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
 CONSTRAINT [PK_ShippingZone] PRIMARY KEY CLUSTERED 
(
	[ShippingZoneKey] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)
END
GO
SET IDENTITY_INSERT [dbo].[ShippingZone] ON
INSERT [dbo].[ShippingZone] ([ShippingZoneKey], [Description]) VALUES (1, N'Zone 1')
INSERT [dbo].[ShippingZone] ([ShippingZoneKey], [Description]) VALUES (2, N'Zone 2')
INSERT [dbo].[ShippingZone] ([ShippingZoneKey], [Description]) VALUES (3, N'Zone 3')
INSERT [dbo].[ShippingZone] ([ShippingZoneKey], [Description]) VALUES (4, N'Zone 4')
INSERT [dbo].[ShippingZone] ([ShippingZoneKey], [Description]) VALUES (5, N'Zone 5')
INSERT [dbo].[ShippingZone] ([ShippingZoneKey], [Description]) VALUES (6, N'Zone 6')
SET IDENTITY_INSERT [dbo].[ShippingZone] OFF
/****** Object:  Table [dbo].[TypeFace]    Script Date: 11/15/2011 17:46:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TypeFace]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[TypeFace](
	[TypeFaceKey] [int] IDENTITY(1,1) NOT NULL,
	[Description] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
 CONSTRAINT [PK_TypeFace] PRIMARY KEY CLUSTERED 
(
	[TypeFaceKey] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)
END
GO
SET IDENTITY_INSERT [dbo].[TypeFace] ON
INSERT [dbo].[TypeFace] ([TypeFaceKey], [Description]) VALUES (1, N'Arial')
INSERT [dbo].[TypeFace] ([TypeFaceKey], [Description]) VALUES (2, N'Times New Roman')
SET IDENTITY_INSERT [dbo].[TypeFace] OFF
/****** Object:  Table [dbo].[TextAlign]    Script Date: 11/15/2011 17:46:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TextAlign]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[TextAlign](
	[TextAlignKey] [int] IDENTITY(1,1) NOT NULL,
	[Description] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
 CONSTRAINT [PK_TextAlign] PRIMARY KEY CLUSTERED 
(
	[TextAlignKey] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)
END
GO
SET IDENTITY_INSERT [dbo].[TextAlign] ON
INSERT [dbo].[TextAlign] ([TextAlignKey], [Description]) VALUES (1, N'Left')
INSERT [dbo].[TextAlign] ([TextAlignKey], [Description]) VALUES (2, N'Center')
SET IDENTITY_INSERT [dbo].[TextAlign] OFF
/****** Object:  Table [dbo].[CreditCardType]    Script Date: 11/15/2011 17:46:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CreditCardType]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[CreditCardType](
	[CreditCardTypeKey] [int] IDENTITY(1,1) NOT NULL,
	[Description] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
 CONSTRAINT [PK_CreditCardType] PRIMARY KEY CLUSTERED 
(
	[CreditCardTypeKey] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)
END
GO
SET IDENTITY_INSERT [dbo].[CreditCardType] ON
INSERT [dbo].[CreditCardType] ([CreditCardTypeKey], [Description]) VALUES (1, N'Mastercard')
INSERT [dbo].[CreditCardType] ([CreditCardTypeKey], [Description]) VALUES (2, N'Visa')
INSERT [dbo].[CreditCardType] ([CreditCardTypeKey], [Description]) VALUES (3, N'American Express')
INSERT [dbo].[CreditCardType] ([CreditCardTypeKey], [Description]) VALUES (4, N'Discover')
SET IDENTITY_INSERT [dbo].[CreditCardType] OFF
/****** Object:  Table [dbo].[Customer]    Script Date: 11/15/2011 17:46:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Customer]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Customer](
	[CustomerKey] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[LastName] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[BusinessName] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[EMailAddress] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[AlternateEMailAddress] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[DayPhone] [varchar](30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[EveningPhone] [varchar](30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CellPhone] [varchar](30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[FaxNumber] [varchar](30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
 CONSTRAINT [PK_Customer] PRIMARY KEY CLUSTERED 
(
	[CustomerKey] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)
END
GO

/****** Object:  Table [dbo].[AddressType]    Script Date: 11/15/2011 17:46:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AddressType]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[AddressType](
	[AddressTypeKey] [int] IDENTITY(1,1) NOT NULL,
	[Description] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
 CONSTRAINT [PK_AddressType] PRIMARY KEY CLUSTERED 
(
	[AddressTypeKey] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)
END
GO
SET IDENTITY_INSERT [dbo].[AddressType] ON
INSERT [dbo].[AddressType] ([AddressTypeKey], [Description]) VALUES (1, N'Shipping')
INSERT [dbo].[AddressType] ([AddressTypeKey], [Description]) VALUES (2, N'Billing')
SET IDENTITY_INSERT [dbo].[AddressType] OFF
/****** Object:  Table [dbo].[CheckStubLine]    Script Date: 11/15/2011 17:46:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CheckStubLine]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[CheckStubLine](
	[CheckStubLineKey] [int] IDENTITY(1,1) NOT NULL,
	[Description] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
 CONSTRAINT [PK_CheckStubLine] PRIMARY KEY CLUSTERED 
(
	[CheckStubLineKey] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)
END
GO
SET IDENTITY_INSERT [dbo].[CheckStubLine] ON
INSERT [dbo].[CheckStubLine] ([CheckStubLineKey], [Description]) VALUES (1, N'Print Line 1 On Stub')
INSERT [dbo].[CheckStubLine] ([CheckStubLineKey], [Description]) VALUES (2, N'Print Line 1 and 2 On Stub')
SET IDENTITY_INSERT [dbo].[CheckStubLine] OFF
/****** Object:  Table [dbo].[CheckFeatureOption]    Script Date: 11/15/2011 17:46:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CheckFeatureOption]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[CheckFeatureOption](
	[CheckFeatureOptionKey] [int] IDENTITY(1,1) NOT NULL,
	[Description] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
 CONSTRAINT [PK_CheckFeatureOption] PRIMARY KEY CLUSTERED 
(
	[CheckFeatureOptionKey] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)
END
GO
SET IDENTITY_INSERT [dbo].[CheckFeatureOption] ON
INSERT [dbo].[CheckFeatureOption] ([CheckFeatureOptionKey], [Description]) VALUES (1, N'Has Print Lines Option')
INSERT [dbo].[CheckFeatureOption] ([CheckFeatureOptionKey], [Description]) VALUES (2, N'Has Stub Options')
SET IDENTITY_INSERT [dbo].[CheckFeatureOption] OFF
/****** Object:  Table [dbo].[ExpediteType]    Script Date: 11/15/2011 17:46:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ExpediteType]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ExpediteType](
	[ExpediteTypeKey] [int] IDENTITY(1,1) NOT NULL,
	[Description] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[DisplayOrder] [int] NOT NULL,
	[AdditionalCharge] [numeric](18, 2) NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_ExpediteType] PRIMARY KEY CLUSTERED 
(
	[ExpediteTypeKey] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)
END
GO
SET IDENTITY_INSERT [dbo].[ExpediteType] ON
INSERT [dbo].[ExpediteType] ([ExpediteTypeKey], [Description], [DisplayOrder], [AdditionalCharge], [IsActive]) VALUES (1, N'24 Hour Check Processing', 1, CAST(40.00 AS Numeric(18, 2)), 1)
SET IDENTITY_INSERT [dbo].[ExpediteType] OFF
/****** Object:  Table [dbo].[FontWeight]    Script Date: 11/15/2011 17:46:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[FontWeight]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[FontWeight](
	[FontWeightKey] [int] IDENTITY(1,1) NOT NULL,
	[Description] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
 CONSTRAINT [PK_FontWeight] PRIMARY KEY CLUSTERED 
(
	[FontWeightKey] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)
END
GO
SET IDENTITY_INSERT [dbo].[FontWeight] ON
INSERT [dbo].[FontWeight] ([FontWeightKey], [Description]) VALUES (1, N'Normal')
INSERT [dbo].[FontWeight] ([FontWeightKey], [Description]) VALUES (2, N'Bold')
SET IDENTITY_INSERT [dbo].[FontWeight] OFF
/****** Object:  Table [dbo].[ShippingRateGroup]    Script Date: 11/15/2011 17:46:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ShippingRateGroup]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ShippingRateGroup](
	[ShippingRateGroupKey] [int] IDENTITY(1,1) NOT NULL,
	[Description] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
 CONSTRAINT [PK_ShippingRateGroup] PRIMARY KEY CLUSTERED 
(
	[ShippingRateGroupKey] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)
END
GO
SET IDENTITY_INSERT [dbo].[ShippingRateGroup] ON
INSERT [dbo].[ShippingRateGroup] ([ShippingRateGroupKey], [Description]) VALUES (1, N'Printable Materials')
SET IDENTITY_INSERT [dbo].[ShippingRateGroup] OFF
/****** Object:  Table [dbo].[ShippingRateType]    Script Date: 11/15/2011 17:46:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ShippingRateType]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ShippingRateType](
	[ShippingRateTypeKey] [int] IDENTITY(1,1) NOT NULL,
	[Description] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
 CONSTRAINT [PK_ShippingRateType] PRIMARY KEY CLUSTERED 
(
	[ShippingRateTypeKey] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)
END
GO
SET IDENTITY_INSERT [dbo].[ShippingRateType] ON
INSERT [dbo].[ShippingRateType] ([ShippingRateTypeKey], [Description]) VALUES (1, N'Up To')
INSERT [dbo].[ShippingRateType] ([ShippingRateTypeKey], [Description]) VALUES (2, N'Per Unit')
SET IDENTITY_INSERT [dbo].[ShippingRateType] OFF
/****** Object:  Table [dbo].[ProductCategory]    Script Date: 11/15/2011 17:46:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ProductCategory]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ProductCategory](
	[ProductCategoryKey] [int] IDENTITY(1,1) NOT NULL,
	[Description] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
 CONSTRAINT [PK_ProductCategory] PRIMARY KEY CLUSTERED 
(
	[ProductCategoryKey] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)
END
GO
SET IDENTITY_INSERT [dbo].[ProductCategory] ON
INSERT [dbo].[ProductCategory] ([ProductCategoryKey], [Description]) VALUES (1, N'Deposit Slip')
INSERT [dbo].[ProductCategory] ([ProductCategoryKey], [Description]) VALUES (2, N'Self-Inking Deposit Stamp')
INSERT [dbo].[ProductCategory] ([ProductCategoryKey], [Description]) VALUES (3, N'Preprinted Check')
SET IDENTITY_INSERT [dbo].[ProductCategory] OFF
/****** Object:  Table [dbo].[ProductType]    Script Date: 11/15/2011 17:46:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ProductType]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ProductType](
	[ProductTypeKey] [int] IDENTITY(1,1) NOT NULL,
	[ProductCategoryKey] [int] NOT NULL,
	[Description] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[ShippingRateGroupKey] [int] NULL,
 CONSTRAINT [PK_ProductType] PRIMARY KEY CLUSTERED 
(
	[ProductTypeKey] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)
END
GO
SET IDENTITY_INSERT [dbo].[ProductType] ON
INSERT [dbo].[ProductType] ([ProductTypeKey], [ProductCategoryKey], [Description], [ShippingRateGroupKey]) VALUES (1, 1, N'QuickBooks Printable Deposit Slip', 1)
INSERT [dbo].[ProductType] ([ProductTypeKey], [ProductCategoryKey], [Description], [ShippingRateGroupKey]) VALUES (3, 2, N'Standard Self-Inking Deposit Stamp', NULL)
INSERT [dbo].[ProductType] ([ProductTypeKey], [ProductCategoryKey], [Description], [ShippingRateGroupKey]) VALUES (4, 3, N'QuickBooks Voucher Check', 1)
INSERT [dbo].[ProductType] ([ProductTypeKey], [ProductCategoryKey], [Description], [ShippingRateGroupKey]) VALUES (5, 3, N'Peachtree Accounting Check', 1)
INSERT [dbo].[ProductType] ([ProductTypeKey], [ProductCategoryKey], [Description], [ShippingRateGroupKey]) VALUES (6, 3, N'Quicken Standard Check', 1)
INSERT [dbo].[ProductType] ([ProductTypeKey], [ProductCategoryKey], [Description], [ShippingRateGroupKey]) VALUES (7, 3, N'Blackbaud Check', 1)
SET IDENTITY_INSERT [dbo].[ProductType] OFF
/****** Object:  StoredProcedure [dbo].[ProductCategory_Update]    Script Date: 11/15/2011 17:46:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ProductCategory_Update]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'create procedure [dbo].[ProductCategory_Update]
(
@ID int
, @Description varchar(100) 
)
AS
SET NOCOUNT ON
Update ProductCategory Set 
Description = @Description
where
ProductCategoryKey = @ID' 
END
GO
/****** Object:  StoredProcedure [dbo].[ProductCategory_GetOne]    Script Date: 11/15/2011 17:46:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ProductCategory_GetOne]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'create procedure [dbo].[ProductCategory_GetOne]
(
@ID int
)
AS
SET NOCOUNT ON
select 
     ProductCategoryKey
     ,Description
from
     ProductCategory
where
     ProductCategoryKey = @ID' 
END
GO
/****** Object:  StoredProcedure [dbo].[ProductCategory_Create]    Script Date: 11/15/2011 17:46:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ProductCategory_Create]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'create procedure [dbo].[ProductCategory_Create]
(
@Description varchar(100) ,
@retval int OUTPUT

)
AS
SET NOCOUNT ON

Insert into ProductCategory
(
Description
)
Values
(
@Description
)
SET @retval = (Select Scope_Identity())' 
END
GO
/****** Object:  StoredProcedure [dbo].[ShippingRateGroup_Update]    Script Date: 11/15/2011 17:46:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ShippingRateGroup_Update]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'create procedure [dbo].[ShippingRateGroup_Update]
(
@ID int
, @Description varchar(50) 
)
AS
SET NOCOUNT ON
Update ShippingRateGroup Set 
Description = @Description
where
ShippingRateGroupKey = @ID
' 
END
GO
/****** Object:  StoredProcedure [dbo].[ShippingRateGroup_GetOne]    Script Date: 11/15/2011 17:46:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ShippingRateGroup_GetOne]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
create procedure [dbo].[ShippingRateGroup_GetOne]
(
@ID int
)
AS
SET NOCOUNT ON
select 
     ShippingRateGroupKey
     ,Description
from
     ShippingRateGroup
where
     ShippingRateGroupKey = @ID
' 
END
GO
/****** Object:  StoredProcedure [dbo].[ShippingRateGroup_Create]    Script Date: 11/15/2011 17:46:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ShippingRateGroup_Create]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
create procedure [dbo].[ShippingRateGroup_Create]
(
@Description varchar(50) ,
@retval int OUTPUT

)
AS
SET NOCOUNT ON

Insert into ShippingRateGroup
(
Description
)
Values
(
@Description
)
SET @retval = (Select Scope_Identity())
' 
END
GO
/****** Object:  StoredProcedure [dbo].[ExpediteType_Update]    Script Date: 11/15/2011 17:46:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ExpediteType_Update]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'create procedure [dbo].[ExpediteType_Update]
(
@ID int
, @DisplayOrder int 
, @Description varchar(100) 
, @IsActive bit 
, @AdditionalCharge numeric(18,2) 
)
AS
SET NOCOUNT ON
Update ExpediteType Set 
DisplayOrder = @DisplayOrder,
Description = @Description,
IsActive = @IsActive,
AdditionalCharge = @AdditionalCharge
where
ExpediteTypeKey = @ID' 
END
GO
/****** Object:  StoredProcedure [dbo].[ExpediteType_GetOne]    Script Date: 11/15/2011 17:46:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ExpediteType_GetOne]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'create procedure [dbo].[ExpediteType_GetOne]
(
@ID int
)
AS
SET NOCOUNT ON
select 
     ExpediteTypeKey
     ,DisplayOrder
     ,Description
     ,IsActive
     ,AdditionalCharge
from
     ExpediteType
where
     ExpediteTypeKey = @ID' 
END
GO
/****** Object:  StoredProcedure [dbo].[ExpediteType_Create]    Script Date: 11/15/2011 17:46:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ExpediteType_Create]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'create procedure [dbo].[ExpediteType_Create]
(
@DisplayOrder int ,
@Description varchar(100) ,
@IsActive bit ,
@AdditionalCharge numeric(18,2) ,
@retval int OUTPUT

)
AS
SET NOCOUNT ON

Insert into ExpediteType
(
DisplayOrder,
Description,
IsActive,
AdditionalCharge
)
Values
(
@DisplayOrder,
@Description,
@IsActive,
@AdditionalCharge
)
SET @retval = (Select Scope_Identity())' 
END
GO
/****** Object:  StoredProcedure [dbo].[AddressType_Update]    Script Date: 11/15/2011 17:46:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AddressType_Update]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'create procedure [dbo].[AddressType_Update]
(
@ID int
, @Description varchar(100) 
)
AS
SET NOCOUNT ON
Update AddressType Set 
Description = @Description
where
AddressTypeKey = @ID' 
END
GO
/****** Object:  StoredProcedure [dbo].[AddressType_GetOne]    Script Date: 11/15/2011 17:46:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AddressType_GetOne]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'create procedure [dbo].[AddressType_GetOne]
(
@ID int
)
AS
SET NOCOUNT ON
select 
     AddressTypeKey
     ,Description
from
     AddressType
where
     AddressTypeKey = @ID' 
END
GO
/****** Object:  StoredProcedure [dbo].[AddressType_Create]    Script Date: 11/15/2011 17:46:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AddressType_Create]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'create procedure [dbo].[AddressType_Create]
(
@Description varchar(100) ,
@retval int OUTPUT

)
AS
SET NOCOUNT ON

Insert into AddressType
(
Description
)
Values
(
@Description
)
SET @retval = (Select Scope_Identity())' 
END
GO
/****** Object:  Table [dbo].[CreditCard]    Script Date: 11/15/2011 17:46:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CreditCard]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[CreditCard](
	[CreditCardKey] [int] IDENTITY(1,1) NOT NULL,
	[CustomerKey] [int] NOT NULL,
	[CreditCardTypeKey] [int] NOT NULL,
	[Number] [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[ExpirationMonth] [int] NOT NULL,
	[ExpirationYear] [int] NOT NULL,
	[CCV] [varchar](4) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
 CONSTRAINT [PK_CreditCard] PRIMARY KEY CLUSTERED 
(
	[CreditCardKey] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)
END
GO
/****** Object:  Table [dbo].[Address]    Script Date: 11/15/2011 17:46:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Address]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Address](
	[AddressKey] [int] IDENTITY(1,1) NOT NULL,
	[CustomerKey] [int] NOT NULL,
	[AddressTypeKey] [int] NOT NULL,
	[Line1] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[Line2] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[City] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[State] [varchar](2) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ZipCode] [varchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
 CONSTRAINT [PK_Address] PRIMARY KEY CLUSTERED 
(
	[AddressKey] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)
END
GO

/****** Object:  StoredProcedure [dbo].[CreditCardType_Update]    Script Date: 11/15/2011 17:46:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CreditCardType_Update]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'create procedure [dbo].[CreditCardType_Update]
(
@ID int
, @Description varchar(100) 
)
AS
SET NOCOUNT ON
Update CreditCardType Set 
Description = @Description
where
CreditCardTypeKey = @ID' 
END
GO
/****** Object:  StoredProcedure [dbo].[CreditCardType_GetOne]    Script Date: 11/15/2011 17:46:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CreditCardType_GetOne]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
create procedure [dbo].[CreditCardType_GetOne]
(
@ID int
)
AS
SET NOCOUNT ON
select 
     CreditCardTypeKey
     ,Description
from
     CreditCardType
where
     CreditCardTypeKey = @ID' 
END
GO
/****** Object:  StoredProcedure [dbo].[CreditCardType_Create]    Script Date: 11/15/2011 17:46:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CreditCardType_Create]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
create procedure [dbo].[CreditCardType_Create]
(
@Description varchar(100) ,
@retval int OUTPUT

)
AS
SET NOCOUNT ON

Insert into CreditCardType
(
Description
)
Values
(
@Description
)
SET @retval = (Select Scope_Identity())' 
END
GO
/****** Object:  Table [dbo].[DepositSlip]    Script Date: 11/15/2011 17:46:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DepositSlip]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[DepositSlip](
	[DepositSlipKey] [int] IDENTITY(1,1) NOT NULL,
	[CustomerKey] [int] NOT NULL,
	[BankInfoLine1] [varchar](35) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[RoutingNumber] [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[AccountNumber] [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[Fraction] [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[BankInfoLine2] [varchar](35) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[BankInfoLine3] [varchar](35) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Line1] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[Line2] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Line3] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Line4] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Line5] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
 CONSTRAINT [PK_DepositSlip] PRIMARY KEY CLUSTERED 
(
	[DepositSlipKey] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)
END
GO

/****** Object:  StoredProcedure [dbo].[Customer_Update]    Script Date: 11/15/2011 17:46:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Customer_Update]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE procedure [dbo].[Customer_Update]
(
@ID int
, @FirstName varchar(100) 
, @LastName varchar(100) 
, @BusinessName varchar(100) 
, @EMailAddress varchar(100) 
, @AlternateEMailAddress varchar(100) 
, @DayPhone varchar(30) 
, @EveningPhone varchar(30) 
, @CellPhone varchar(30) 
, @FaxNumber varchar(30)
)
AS
SET NOCOUNT ON
Update Customer Set 
FirstName = @FirstName,
LastName = @LastName,
BusinessName = @BusinessName,
EMailAddress = @EMailAddress,
AlternateEMailAddress = @AlternateEMailAddress,
DayPhone = @DayPhone,
EveningPhone = @EveningPhone,
CellPhone = @CellPhone,
FaxNumber = @FaxNumber
where
CustomerKey = @ID' 
END
GO
/****** Object:  StoredProcedure [dbo].[Customer_GetOne]    Script Date: 11/15/2011 17:46:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Customer_GetOne]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'create procedure [dbo].[Customer_GetOne]
(
@ID int
)
AS
SET NOCOUNT ON
select 
     CustomerKey
     ,FirstName
     ,LastName
     ,BusinessName
     ,EMailAddress
     ,AlternateEMailAddress
     ,DayPhone
     ,EveningPhone
     ,CellPhone
from
     Customer
where
     CustomerKey = @ID' 
END
GO
/****** Object:  StoredProcedure [dbo].[Customer_Create]    Script Date: 11/15/2011 17:46:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Customer_Create]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE procedure [dbo].[Customer_Create]
(
@FirstName varchar(100) ,
@LastName varchar(100) ,
@BusinessName varchar(100) ,
@EMailAddress varchar(100) ,
@AlternateEMailAddress varchar(100) ,
@DayPhone varchar(30) ,
@EveningPhone varchar(30) ,
@CellPhone varchar(30) ,
@FaxNumber varchar(30) ,
@retval int OUTPUT

)
AS
SET NOCOUNT ON

Insert into Customer
(
FirstName,
LastName,
BusinessName,
EMailAddress,
AlternateEMailAddress,
DayPhone,
EveningPhone,
CellPhone,
FaxNumber
)
Values
(
@FirstName,
@LastName,
@BusinessName,
@EMailAddress,
@AlternateEMailAddress,
@DayPhone,
@EveningPhone,
@CellPhone,
@FaxNumber
)
SET @retval = (Select Scope_Identity())' 
END
GO
/****** Object:  Table [dbo].[DepositStamp]    Script Date: 11/15/2011 17:46:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DepositStamp]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[DepositStamp](
	[DepositStampKey] [int] IDENTITY(1,1) NOT NULL,
	[CustomerKey] [int] NOT NULL,
	[AccountNumber] [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[BankName] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[Line1] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
 CONSTRAINT [PK_DepositStamp] PRIMARY KEY CLUSTERED 
(
	[DepositStampKey] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)
END
GO

/****** Object:  StoredProcedure [dbo].[TypeFace_Update]    Script Date: 11/15/2011 17:46:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TypeFace_Update]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'create procedure [dbo].[TypeFace_Update]
(
@ID int
, @Description varchar(50) 
)
AS
SET NOCOUNT ON
Update TypeFace Set 
Description = @Description
where
TypeFaceKey = @ID
' 
END
GO
/****** Object:  StoredProcedure [dbo].[TypeFace_GetOne]    Script Date: 11/15/2011 17:46:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TypeFace_GetOne]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
create procedure [dbo].[TypeFace_GetOne]
(
@ID int
)
AS
SET NOCOUNT ON
select 
     TypeFaceKey
     ,Description
from
     TypeFace
where
     TypeFaceKey = @ID
' 
END
GO
/****** Object:  StoredProcedure [dbo].[TypeFace_Create]    Script Date: 11/15/2011 17:46:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TypeFace_Create]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
create procedure [dbo].[TypeFace_Create]
(
@Description varchar(50) ,
@retval int OUTPUT

)
AS
SET NOCOUNT ON

Insert into TypeFace
(
Description
)
Values
(
@Description
)
SET @retval = (Select Scope_Identity())
' 
END
GO
/****** Object:  StoredProcedure [dbo].[ShippingType_Update]    Script Date: 11/15/2011 17:46:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ShippingType_Update]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'create procedure [dbo].[ShippingType_Update]
(
@ID int
, @DisplayOrder int 
, @Description varchar(100) 
, @IsActive bit 
, @AdditionalCharge numeric(18,2) 
)
AS
SET NOCOUNT ON
Update ShippingType Set 
DisplayOrder = @DisplayOrder,
Description = @Description,
IsActive = @IsActive,
AdditionalCharge = @AdditionalCharge
where
ShippingTypeKey = @ID' 
END
GO
/****** Object:  StoredProcedure [dbo].[ShippingType_GetOne]    Script Date: 11/15/2011 17:46:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ShippingType_GetOne]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE procedure [dbo].[ShippingType_GetOne]
(
@ID int
)
AS
SET NOCOUNT ON
select 
     ShippingTypeKey
     ,DisplayOrder
     ,Description
     ,IsActive
     ,AdditionalCharge
     ,BillAtActualCharges
from
     ShippingType
where
     ShippingTypeKey = @ID' 
END
GO
/****** Object:  StoredProcedure [dbo].[ShippingType_Create]    Script Date: 11/15/2011 17:46:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ShippingType_Create]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'





create procedure [dbo].[ShippingType_Create]
(
@DisplayOrder int ,
@Description varchar(100) ,
@IsActive bit ,
@AdditionalCharge numeric(18,2) ,
@retval int OUTPUT

)
AS
SET NOCOUNT ON

Insert into ShippingType
(
DisplayOrder,
Description,
IsActive,
AdditionalCharge
)
Values
(
@DisplayOrder,
@Description,
@IsActive,
@AdditionalCharge
)
SET @retval = (Select Scope_Identity())

' 
END
GO
/****** Object:  StoredProcedure [dbo].[ShippingRateType_Update]    Script Date: 11/15/2011 17:46:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ShippingRateType_Update]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'create procedure [dbo].[ShippingRateType_Update]
(
@ID int
, @Description varchar(50) 
)
AS
SET NOCOUNT ON
Update ShippingRateType Set 
Description = @Description
where
ShippingRateTypeKey = @ID
' 
END
GO
/****** Object:  StoredProcedure [dbo].[ShippingRateType_GetOne]    Script Date: 11/15/2011 17:46:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ShippingRateType_GetOne]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
create procedure [dbo].[ShippingRateType_GetOne]
(
@ID int
)
AS
SET NOCOUNT ON
select 
     ShippingRateTypeKey
     ,Description
from
     ShippingRateType
where
     ShippingRateTypeKey = @ID
' 
END
GO
/****** Object:  StoredProcedure [dbo].[ShippingRateType_Create]    Script Date: 11/15/2011 17:46:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ShippingRateType_Create]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
create procedure [dbo].[ShippingRateType_Create]
(
@Description varchar(50) ,
@retval int OUTPUT

)
AS
SET NOCOUNT ON

Insert into ShippingRateType
(
Description
)
Values
(
@Description
)
SET @retval = (Select Scope_Identity())
' 
END
GO
/****** Object:  Table [dbo].[ShippingZoneRate]    Script Date: 11/15/2011 17:46:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ShippingZoneRate]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ShippingZoneRate](
	[ShippingZoneRateKey] [int] IDENTITY(1,1) NOT NULL,
	[ShippingZoneKey] [int] NOT NULL,
	[ShippingRateGroupKey] [int] NOT NULL,
	[ShippingRateTypeKey] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
	[Rate] [numeric](18, 6) NOT NULL,
 CONSTRAINT [PK_ShippingZoneRate] PRIMARY KEY CLUSTERED 
(
	[ShippingZoneRateKey] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)
END
GO
SET IDENTITY_INSERT [dbo].[ShippingZoneRate] ON
INSERT [dbo].[ShippingZoneRate] ([ShippingZoneRateKey], [ShippingZoneKey], [ShippingRateGroupKey], [ShippingRateTypeKey], [Quantity], [Rate]) VALUES (1, 1, 1, 1, 500, CAST(6.640000 AS Numeric(18, 6)))
INSERT [dbo].[ShippingZoneRate] ([ShippingZoneRateKey], [ShippingZoneKey], [ShippingRateGroupKey], [ShippingRateTypeKey], [Quantity], [Rate]) VALUES (2, 1, 1, 1, 1000, CAST(7.910000 AS Numeric(18, 6)))
INSERT [dbo].[ShippingZoneRate] ([ShippingZoneRateKey], [ShippingZoneKey], [ShippingRateGroupKey], [ShippingRateTypeKey], [Quantity], [Rate]) VALUES (3, 1, 1, 1, 2000, CAST(10.130000 AS Numeric(18, 6)))
INSERT [dbo].[ShippingZoneRate] ([ShippingZoneRateKey], [ShippingZoneKey], [ShippingRateGroupKey], [ShippingRateTypeKey], [Quantity], [Rate]) VALUES (4, 1, 1, 1, 2500, CAST(11.330000 AS Numeric(18, 6)))
INSERT [dbo].[ShippingZoneRate] ([ShippingZoneRateKey], [ShippingZoneKey], [ShippingRateGroupKey], [ShippingRateTypeKey], [Quantity], [Rate]) VALUES (5, 1, 1, 2, 12500, CAST(0.004532 AS Numeric(18, 6)))
INSERT [dbo].[ShippingZoneRate] ([ShippingZoneRateKey], [ShippingZoneKey], [ShippingRateGroupKey], [ShippingRateTypeKey], [Quantity], [Rate]) VALUES (6, 1, 1, 2, 1000000, CAST(0.003696 AS Numeric(18, 6)))
INSERT [dbo].[ShippingZoneRate] ([ShippingZoneRateKey], [ShippingZoneKey], [ShippingRateGroupKey], [ShippingRateTypeKey], [Quantity], [Rate]) VALUES (7, 2, 1, 1, 500, CAST(7.850000 AS Numeric(18, 6)))
INSERT [dbo].[ShippingZoneRate] ([ShippingZoneRateKey], [ShippingZoneKey], [ShippingRateGroupKey], [ShippingRateTypeKey], [Quantity], [Rate]) VALUES (8, 2, 1, 1, 1000, CAST(8.680000 AS Numeric(18, 6)))
INSERT [dbo].[ShippingZoneRate] ([ShippingZoneRateKey], [ShippingZoneKey], [ShippingRateGroupKey], [ShippingRateTypeKey], [Quantity], [Rate]) VALUES (9, 2, 1, 1, 2000, CAST(12.580000 AS Numeric(18, 6)))
INSERT [dbo].[ShippingZoneRate] ([ShippingZoneRateKey], [ShippingZoneKey], [ShippingRateGroupKey], [ShippingRateTypeKey], [Quantity], [Rate]) VALUES (10, 2, 1, 1, 2500, CAST(14.820000 AS Numeric(18, 6)))
INSERT [dbo].[ShippingZoneRate] ([ShippingZoneRateKey], [ShippingZoneKey], [ShippingRateGroupKey], [ShippingRateTypeKey], [Quantity], [Rate]) VALUES (11, 2, 1, 2, 12500, CAST(0.005982 AS Numeric(18, 6)))
INSERT [dbo].[ShippingZoneRate] ([ShippingZoneRateKey], [ShippingZoneKey], [ShippingRateGroupKey], [ShippingRateTypeKey], [Quantity], [Rate]) VALUES (12, 2, 1, 2, 1000000, CAST(0.005216 AS Numeric(18, 6)))
INSERT [dbo].[ShippingZoneRate] ([ShippingZoneRateKey], [ShippingZoneKey], [ShippingRateGroupKey], [ShippingRateTypeKey], [Quantity], [Rate]) VALUES (13, 3, 1, 1, 500, CAST(8.320000 AS Numeric(18, 6)))
INSERT [dbo].[ShippingZoneRate] ([ShippingZoneRateKey], [ShippingZoneKey], [ShippingRateGroupKey], [ShippingRateTypeKey], [Quantity], [Rate]) VALUES (14, 3, 1, 1, 1000, CAST(9.390000 AS Numeric(18, 6)))
INSERT [dbo].[ShippingZoneRate] ([ShippingZoneRateKey], [ShippingZoneKey], [ShippingRateGroupKey], [ShippingRateTypeKey], [Quantity], [Rate]) VALUES (15, 3, 1, 1, 2000, CAST(14.780000 AS Numeric(18, 6)))
INSERT [dbo].[ShippingZoneRate] ([ShippingZoneRateKey], [ShippingZoneKey], [ShippingRateGroupKey], [ShippingRateTypeKey], [Quantity], [Rate]) VALUES (16, 3, 1, 1, 2500, CAST(17.480000 AS Numeric(18, 6)))
INSERT [dbo].[ShippingZoneRate] ([ShippingZoneRateKey], [ShippingZoneKey], [ShippingRateGroupKey], [ShippingRateTypeKey], [Quantity], [Rate]) VALUES (17, 3, 1, 2, 12500, CAST(0.006992 AS Numeric(18, 6)))
INSERT [dbo].[ShippingZoneRate] ([ShippingZoneRateKey], [ShippingZoneKey], [ShippingRateGroupKey], [ShippingRateTypeKey], [Quantity], [Rate]) VALUES (18, 3, 1, 2, 1000000, CAST(0.006064 AS Numeric(18, 6)))
INSERT [dbo].[ShippingZoneRate] ([ShippingZoneRateKey], [ShippingZoneKey], [ShippingRateGroupKey], [ShippingRateTypeKey], [Quantity], [Rate]) VALUES (19, 4, 1, 1, 500, CAST(8.690000 AS Numeric(18, 6)))
INSERT [dbo].[ShippingZoneRate] ([ShippingZoneRateKey], [ShippingZoneKey], [ShippingRateGroupKey], [ShippingRateTypeKey], [Quantity], [Rate]) VALUES (20, 4, 1, 1, 1000, CAST(10.730000 AS Numeric(18, 6)))
INSERT [dbo].[ShippingZoneRate] ([ShippingZoneRateKey], [ShippingZoneKey], [ShippingRateGroupKey], [ShippingRateTypeKey], [Quantity], [Rate]) VALUES (21, 4, 1, 1, 2000, CAST(18.690000 AS Numeric(18, 6)))
INSERT [dbo].[ShippingZoneRate] ([ShippingZoneRateKey], [ShippingZoneKey], [ShippingRateGroupKey], [ShippingRateTypeKey], [Quantity], [Rate]) VALUES (22, 4, 1, 1, 2500, CAST(22.380000 AS Numeric(18, 6)))
INSERT [dbo].[ShippingZoneRate] ([ShippingZoneRateKey], [ShippingZoneKey], [ShippingRateGroupKey], [ShippingRateTypeKey], [Quantity], [Rate]) VALUES (23, 4, 1, 2, 12500, CAST(0.008952 AS Numeric(18, 6)))
INSERT [dbo].[ShippingZoneRate] ([ShippingZoneRateKey], [ShippingZoneKey], [ShippingRateGroupKey], [ShippingRateTypeKey], [Quantity], [Rate]) VALUES (24, 4, 1, 2, 1000000, CAST(0.007608 AS Numeric(18, 6)))
INSERT [dbo].[ShippingZoneRate] ([ShippingZoneRateKey], [ShippingZoneKey], [ShippingRateGroupKey], [ShippingRateTypeKey], [Quantity], [Rate]) VALUES (25, 5, 1, 1, 500, CAST(9.180000 AS Numeric(18, 6)))
INSERT [dbo].[ShippingZoneRate] ([ShippingZoneRateKey], [ShippingZoneKey], [ShippingRateGroupKey], [ShippingRateTypeKey], [Quantity], [Rate]) VALUES (26, 5, 1, 1, 1000, CAST(12.830000 AS Numeric(18, 6)))
INSERT [dbo].[ShippingZoneRate] ([ShippingZoneRateKey], [ShippingZoneKey], [ShippingRateGroupKey], [ShippingRateTypeKey], [Quantity], [Rate]) VALUES (27, 5, 1, 1, 2000, CAST(21.820000 AS Numeric(18, 6)))
INSERT [dbo].[ShippingZoneRate] ([ShippingZoneRateKey], [ShippingZoneKey], [ShippingRateGroupKey], [ShippingRateTypeKey], [Quantity], [Rate]) VALUES (28, 5, 1, 1, 2500, CAST(25.890000 AS Numeric(18, 6)))
INSERT [dbo].[ShippingZoneRate] ([ShippingZoneRateKey], [ShippingZoneKey], [ShippingRateGroupKey], [ShippingRateTypeKey], [Quantity], [Rate]) VALUES (29, 5, 1, 2, 12500, CAST(0.010356 AS Numeric(18, 6)))
INSERT [dbo].[ShippingZoneRate] ([ShippingZoneRateKey], [ShippingZoneKey], [ShippingRateGroupKey], [ShippingRateTypeKey], [Quantity], [Rate]) VALUES (30, 5, 1, 2, 1000000, CAST(0.008716 AS Numeric(18, 6)))
INSERT [dbo].[ShippingZoneRate] ([ShippingZoneRateKey], [ShippingZoneKey], [ShippingRateGroupKey], [ShippingRateTypeKey], [Quantity], [Rate]) VALUES (31, 6, 1, 1, 500, CAST(9.960000 AS Numeric(18, 6)))
INSERT [dbo].[ShippingZoneRate] ([ShippingZoneRateKey], [ShippingZoneKey], [ShippingRateGroupKey], [ShippingRateTypeKey], [Quantity], [Rate]) VALUES (32, 6, 1, 1, 1000, CAST(14.370000 AS Numeric(18, 6)))
INSERT [dbo].[ShippingZoneRate] ([ShippingZoneRateKey], [ShippingZoneKey], [ShippingRateGroupKey], [ShippingRateTypeKey], [Quantity], [Rate]) VALUES (33, 6, 1, 1, 2000, CAST(25.580000 AS Numeric(18, 6)))
INSERT [dbo].[ShippingZoneRate] ([ShippingZoneRateKey], [ShippingZoneKey], [ShippingRateGroupKey], [ShippingRateTypeKey], [Quantity], [Rate]) VALUES (34, 6, 1, 1, 2500, CAST(30.800000 AS Numeric(18, 6)))
INSERT [dbo].[ShippingZoneRate] ([ShippingZoneRateKey], [ShippingZoneKey], [ShippingRateGroupKey], [ShippingRateTypeKey], [Quantity], [Rate]) VALUES (35, 6, 1, 2, 12500, CAST(0.012320 AS Numeric(18, 6)))
INSERT [dbo].[ShippingZoneRate] ([ShippingZoneRateKey], [ShippingZoneKey], [ShippingRateGroupKey], [ShippingRateTypeKey], [Quantity], [Rate]) VALUES (36, 6, 1, 2, 1000000, CAST(0.010084 AS Numeric(18, 6)))
SET IDENTITY_INSERT [dbo].[ShippingZoneRate] OFF
/****** Object:  StoredProcedure [dbo].[ShippingZone_Update]    Script Date: 11/15/2011 17:46:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ShippingZone_Update]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'create procedure [dbo].[ShippingZone_Update]
(
@ID int
, @Description varchar(50) 
)
AS
SET NOCOUNT ON
Update ShippingZone Set 
Description = @Description
where
ShippingZoneKey = @ID
' 
END
GO
/****** Object:  StoredProcedure [dbo].[ShippingZone_GetOne]    Script Date: 11/15/2011 17:46:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ShippingZone_GetOne]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
create procedure [dbo].[ShippingZone_GetOne]
(
@ID int
)
AS
SET NOCOUNT ON
select 
     ShippingZoneKey
     ,Description
from
     ShippingZone
where
     ShippingZoneKey = @ID
' 
END
GO
/****** Object:  StoredProcedure [dbo].[ShippingZone_Create]    Script Date: 11/15/2011 17:46:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ShippingZone_Create]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
create procedure [dbo].[ShippingZone_Create]
(
@Description varchar(50) ,
@retval int OUTPUT

)
AS
SET NOCOUNT ON

Insert into ShippingZone
(
Description
)
Values
(
@Description
)
SET @retval = (Select Scope_Identity())
' 
END
GO
/****** Object:  Table [dbo].[State]    Script Date: 11/15/2011 17:46:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[State]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[State](
	[StateKey] [int] IDENTITY(1,1) NOT NULL,
	[Abbreviation] [varchar](2) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[Name] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[ShippingZoneKey] [int] NULL
)
END
GO
SET IDENTITY_INSERT [dbo].[State] ON
INSERT [dbo].[State] ([StateKey], [Abbreviation], [Name], [ShippingZoneKey]) VALUES (1, N'AK', N'Alaska', NULL)
INSERT [dbo].[State] ([StateKey], [Abbreviation], [Name], [ShippingZoneKey]) VALUES (2, N'AL', N'Alabama', 2)
INSERT [dbo].[State] ([StateKey], [Abbreviation], [Name], [ShippingZoneKey]) VALUES (3, N'AR', N'Arkansas', 2)
INSERT [dbo].[State] ([StateKey], [Abbreviation], [Name], [ShippingZoneKey]) VALUES (4, N'AZ', N'Arizona', 5)
INSERT [dbo].[State] ([StateKey], [Abbreviation], [Name], [ShippingZoneKey]) VALUES (5, N'CA', N'California', 6)
INSERT [dbo].[State] ([StateKey], [Abbreviation], [Name], [ShippingZoneKey]) VALUES (6, N'CO', N'Colorado', 4)
INSERT [dbo].[State] ([StateKey], [Abbreviation], [Name], [ShippingZoneKey]) VALUES (7, N'CT', N'Connecticut', 3)
INSERT [dbo].[State] ([StateKey], [Abbreviation], [Name], [ShippingZoneKey]) VALUES (8, N'DC', N'District Of Columbia', 2)
INSERT [dbo].[State] ([StateKey], [Abbreviation], [Name], [ShippingZoneKey]) VALUES (9, N'DE', N'Delaware', 3)
INSERT [dbo].[State] ([StateKey], [Abbreviation], [Name], [ShippingZoneKey]) VALUES (10, N'FL', N'Florida', 2)
INSERT [dbo].[State] ([StateKey], [Abbreviation], [Name], [ShippingZoneKey]) VALUES (11, N'GA', N'Georgia', 1)
INSERT [dbo].[State] ([StateKey], [Abbreviation], [Name], [ShippingZoneKey]) VALUES (12, N'HI', N'Hawaii', NULL)
INSERT [dbo].[State] ([StateKey], [Abbreviation], [Name], [ShippingZoneKey]) VALUES (13, N'IA', N'Iowa', 3)
INSERT [dbo].[State] ([StateKey], [Abbreviation], [Name], [ShippingZoneKey]) VALUES (14, N'ID', N'Idaho', 6)
INSERT [dbo].[State] ([StateKey], [Abbreviation], [Name], [ShippingZoneKey]) VALUES (15, N'IL', N'Illinois', 2)
INSERT [dbo].[State] ([StateKey], [Abbreviation], [Name], [ShippingZoneKey]) VALUES (16, N'IN', N'Indiana', 2)
INSERT [dbo].[State] ([StateKey], [Abbreviation], [Name], [ShippingZoneKey]) VALUES (17, N'KS', N'Kansas', 3)
INSERT [dbo].[State] ([StateKey], [Abbreviation], [Name], [ShippingZoneKey]) VALUES (18, N'KY', N'Kentucky', 2)
INSERT [dbo].[State] ([StateKey], [Abbreviation], [Name], [ShippingZoneKey]) VALUES (19, N'LA', N'Louisiana', 2)
INSERT [dbo].[State] ([StateKey], [Abbreviation], [Name], [ShippingZoneKey]) VALUES (20, N'MA', N'Massachusetts', 3)
INSERT [dbo].[State] ([StateKey], [Abbreviation], [Name], [ShippingZoneKey]) VALUES (21, N'MD', N'Maryland', 2)
INSERT [dbo].[State] ([StateKey], [Abbreviation], [Name], [ShippingZoneKey]) VALUES (22, N'ME', N'Maine', 4)
INSERT [dbo].[State] ([StateKey], [Abbreviation], [Name], [ShippingZoneKey]) VALUES (23, N'MI', N'Michigan', 3)
INSERT [dbo].[State] ([StateKey], [Abbreviation], [Name], [ShippingZoneKey]) VALUES (24, N'MN', N'Minnesota', 3)
INSERT [dbo].[State] ([StateKey], [Abbreviation], [Name], [ShippingZoneKey]) VALUES (25, N'MO', N'Missouri', 3)
INSERT [dbo].[State] ([StateKey], [Abbreviation], [Name], [ShippingZoneKey]) VALUES (26, N'MS', N'Mississippi', 2)
INSERT [dbo].[State] ([StateKey], [Abbreviation], [Name], [ShippingZoneKey]) VALUES (27, N'MT', N'Montana', 5)
INSERT [dbo].[State] ([StateKey], [Abbreviation], [Name], [ShippingZoneKey]) VALUES (28, N'NC', N'North Carolina', 2)
INSERT [dbo].[State] ([StateKey], [Abbreviation], [Name], [ShippingZoneKey]) VALUES (29, N'ND', N'North Dakota', 4)
INSERT [dbo].[State] ([StateKey], [Abbreviation], [Name], [ShippingZoneKey]) VALUES (30, N'NE', N'Nebraska', 3)
INSERT [dbo].[State] ([StateKey], [Abbreviation], [Name], [ShippingZoneKey]) VALUES (31, N'NH', N'New Hampshire', 4)
INSERT [dbo].[State] ([StateKey], [Abbreviation], [Name], [ShippingZoneKey]) VALUES (32, N'NJ', N'New Jersey', 3)
INSERT [dbo].[State] ([StateKey], [Abbreviation], [Name], [ShippingZoneKey]) VALUES (33, N'NM', N'New Mexico', 4)
INSERT [dbo].[State] ([StateKey], [Abbreviation], [Name], [ShippingZoneKey]) VALUES (34, N'NV', N'Nevada', 5)
INSERT [dbo].[State] ([StateKey], [Abbreviation], [Name], [ShippingZoneKey]) VALUES (35, N'NY', N'New York', 3)
INSERT [dbo].[State] ([StateKey], [Abbreviation], [Name], [ShippingZoneKey]) VALUES (36, N'OH', N'Ohio', 3)
INSERT [dbo].[State] ([StateKey], [Abbreviation], [Name], [ShippingZoneKey]) VALUES (37, N'OK', N'Oklahoma', 3)
INSERT [dbo].[State] ([StateKey], [Abbreviation], [Name], [ShippingZoneKey]) VALUES (38, N'OR', N'Oregon', 6)
INSERT [dbo].[State] ([StateKey], [Abbreviation], [Name], [ShippingZoneKey]) VALUES (39, N'PA', N'Pennsylvania', 3)
INSERT [dbo].[State] ([StateKey], [Abbreviation], [Name], [ShippingZoneKey]) VALUES (40, N'RI', N'Rhode Island', 3)
INSERT [dbo].[State] ([StateKey], [Abbreviation], [Name], [ShippingZoneKey]) VALUES (41, N'SC', N'South Carolina', 2)
INSERT [dbo].[State] ([StateKey], [Abbreviation], [Name], [ShippingZoneKey]) VALUES (42, N'SD', N'South Dakota', 4)
INSERT [dbo].[State] ([StateKey], [Abbreviation], [Name], [ShippingZoneKey]) VALUES (43, N'TN', N'Tennessee', 2)
INSERT [dbo].[State] ([StateKey], [Abbreviation], [Name], [ShippingZoneKey]) VALUES (44, N'TX', N'Texas', 3)
INSERT [dbo].[State] ([StateKey], [Abbreviation], [Name], [ShippingZoneKey]) VALUES (45, N'UT', N'Utah', 5)
INSERT [dbo].[State] ([StateKey], [Abbreviation], [Name], [ShippingZoneKey]) VALUES (46, N'VA', N'Virginia', 2)
INSERT [dbo].[State] ([StateKey], [Abbreviation], [Name], [ShippingZoneKey]) VALUES (47, N'VT', N'Vermont', 3)
INSERT [dbo].[State] ([StateKey], [Abbreviation], [Name], [ShippingZoneKey]) VALUES (48, N'WA', N'Washington', 6)
INSERT [dbo].[State] ([StateKey], [Abbreviation], [Name], [ShippingZoneKey]) VALUES (49, N'WI', N'Wisconsin', 3)
INSERT [dbo].[State] ([StateKey], [Abbreviation], [Name], [ShippingZoneKey]) VALUES (50, N'WV', N'West Virginia', 2)
INSERT [dbo].[State] ([StateKey], [Abbreviation], [Name], [ShippingZoneKey]) VALUES (51, N'WY', N'Wyoming', 4)
SET IDENTITY_INSERT [dbo].[State] OFF
/****** Object:  StoredProcedure [dbo].[ShippingZoneRate_Update]    Script Date: 11/15/2011 17:46:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ShippingZoneRate_Update]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'create procedure [dbo].[ShippingZoneRate_Update]
(
@ID int
, @ShippingZoneKey int 
, @ShippingRateGroupKey int 
, @ShippingRateTypeKey int 
, @Quantity int 
, @Rate numeric(18,6) 
)
AS
SET NOCOUNT ON
Update ShippingZoneRate Set 
ShippingZoneKey = @ShippingZoneKey,
ShippingRateGroupKey = @ShippingRateGroupKey,
ShippingRateTypeKey = @ShippingRateTypeKey,
Quantity = @Quantity,
Rate = @Rate
where
ShippingZoneRateKey = @ID
' 
END
GO
/****** Object:  StoredProcedure [dbo].[ShippingZoneRate_GetOne]    Script Date: 11/15/2011 17:46:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ShippingZoneRate_GetOne]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
create procedure [dbo].[ShippingZoneRate_GetOne]
(
@ID int
)
AS
SET NOCOUNT ON
select 
     ShippingZoneRateKey
     ,ShippingZoneKey
     ,ShippingRateGroupKey
     ,ShippingRateTypeKey
     ,Quantity
     ,Rate
from
     ShippingZoneRate
where
     ShippingZoneRateKey = @ID
' 
END
GO
/****** Object:  StoredProcedure [dbo].[ShippingZoneRate_Create]    Script Date: 11/15/2011 17:46:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ShippingZoneRate_Create]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
create procedure [dbo].[ShippingZoneRate_Create]
(
@ShippingZoneKey int ,
@ShippingRateGroupKey int ,
@ShippingRateTypeKey int ,
@Quantity int ,
@Rate numeric(18,6) ,
@retval int OUTPUT

)
AS
SET NOCOUNT ON

Insert into ShippingZoneRate
(
ShippingZoneKey,
ShippingRateGroupKey,
ShippingRateTypeKey,
Quantity,
Rate
)
Values
(
@ShippingZoneKey,
@ShippingRateGroupKey,
@ShippingRateTypeKey,
@Quantity,
@Rate
)
SET @retval = (Select Scope_Identity())
' 
END
GO
/****** Object:  StoredProcedure [dbo].[State_Update]    Script Date: 11/15/2011 17:46:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[State_Update]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'create procedure [dbo].[State_Update]
(
@ID int
, @Abbreviation varchar(2) 
, @Name varchar(50) 
, @ShippingZoneKey int 
)
AS
SET NOCOUNT ON
Update State Set 
Abbreviation = @Abbreviation,
Name = @Name,
ShippingZoneKey = @ShippingZoneKey
where
StateKey = @ID
' 
END
GO
/****** Object:  StoredProcedure [dbo].[State_GetOne]    Script Date: 11/15/2011 17:46:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[State_GetOne]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
create procedure [dbo].[State_GetOne]
(
@ID int
)
AS
SET NOCOUNT ON
select 
     StateKey
     ,Abbreviation
     ,Name
     ,ShippingZoneKey
from
     State
where
     StateKey = @ID
' 
END
GO
/****** Object:  StoredProcedure [dbo].[State_Create]    Script Date: 11/15/2011 17:46:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[State_Create]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
create procedure [dbo].[State_Create]
(
@Abbreviation varchar(2) ,
@Name varchar(50) ,
@ShippingZoneKey int ,
@retval int OUTPUT

)
AS
SET NOCOUNT ON

Insert into State
(
Abbreviation,
Name,
ShippingZoneKey
)
Values
(
@Abbreviation,
@Name,
@ShippingZoneKey
)
SET @retval = (Select Scope_Identity())
' 
END
GO
/****** Object:  Table [dbo].[Product]    Script Date: 11/15/2011 17:46:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Product]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Product](
	[ProductKey] [int] IDENTITY(1,1) NOT NULL,
	[ProductTypeKey] [int] NOT NULL,
	[Description] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[Price] [numeric](18, 2) NOT NULL,
	[ShippingRate] [numeric](18, 2) NULL,
	[Quantity] [int] NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[ProductKey] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)
END
GO
SET IDENTITY_INSERT [dbo].[Product] ON
INSERT [dbo].[Product] ([ProductKey], [ProductTypeKey], [Description], [Price], [ShippingRate], [Quantity]) VALUES (1, 1, N'250 Deposit Slips', CAST(0.10 AS Numeric(18, 2)), NULL, 250)
INSERT [dbo].[Product] ([ProductKey], [ProductTypeKey], [Description], [Price], [ShippingRate], [Quantity]) VALUES (2, 1, N'500 Deposit Slips', CAST(0.08 AS Numeric(18, 2)), NULL, 500)
INSERT [dbo].[Product] ([ProductKey], [ProductTypeKey], [Description], [Price], [ShippingRate], [Quantity]) VALUES (3, 1, N'1000 Deposit Slips', CAST(0.07 AS Numeric(18, 2)), NULL, 1000)
INSERT [dbo].[Product] ([ProductKey], [ProductTypeKey], [Description], [Price], [ShippingRate], [Quantity]) VALUES (4, 1, N'2000 Deposit Slips', CAST(0.06 AS Numeric(18, 2)), NULL, 2000)
INSERT [dbo].[Product] ([ProductKey], [ProductTypeKey], [Description], [Price], [ShippingRate], [Quantity]) VALUES (5, 1, N'3000 Deposit Slips', CAST(0.06 AS Numeric(18, 2)), NULL, 3000)
INSERT [dbo].[Product] ([ProductKey], [ProductTypeKey], [Description], [Price], [ShippingRate], [Quantity]) VALUES (6, 1, N'5000 Deposit Slips', CAST(0.06 AS Numeric(18, 2)), NULL, 5000)
INSERT [dbo].[Product] ([ProductKey], [ProductTypeKey], [Description], [Price], [ShippingRate], [Quantity]) VALUES (7, 3, N'Self-Inking Deposit Stamp', CAST(19.00 AS Numeric(18, 2)), CAST(5.00 AS Numeric(18, 2)), 1)
INSERT [dbo].[Product] ([ProductKey], [ProductTypeKey], [Description], [Price], [ShippingRate], [Quantity]) VALUES (8, 4, N'250 Preprinted Checks', CAST(0.16 AS Numeric(18, 2)), NULL, 250)
INSERT [dbo].[Product] ([ProductKey], [ProductTypeKey], [Description], [Price], [ShippingRate], [Quantity]) VALUES (9, 4, N'500 Preprinted Checks', CAST(0.12 AS Numeric(18, 2)), NULL, 500)
INSERT [dbo].[Product] ([ProductKey], [ProductTypeKey], [Description], [Price], [ShippingRate], [Quantity]) VALUES (10, 4, N'1000 Preprinted Checks', CAST(0.08 AS Numeric(18, 2)), NULL, 1000)
INSERT [dbo].[Product] ([ProductKey], [ProductTypeKey], [Description], [Price], [ShippingRate], [Quantity]) VALUES (11, 4, N'2000 Preprinted Checks', CAST(0.07 AS Numeric(18, 2)), NULL, 2000)
INSERT [dbo].[Product] ([ProductKey], [ProductTypeKey], [Description], [Price], [ShippingRate], [Quantity]) VALUES (12, 4, N'3000 Preprinted Checks', CAST(0.07 AS Numeric(18, 2)), NULL, 3000)
INSERT [dbo].[Product] ([ProductKey], [ProductTypeKey], [Description], [Price], [ShippingRate], [Quantity]) VALUES (13, 4, N'5000 Preprinted Checks', CAST(0.07 AS Numeric(18, 2)), NULL, 5000)
INSERT [dbo].[Product] ([ProductKey], [ProductTypeKey], [Description], [Price], [ShippingRate], [Quantity]) VALUES (14, 5, N'250 Preprinted Checks', CAST(0.16 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)), 250)
INSERT [dbo].[Product] ([ProductKey], [ProductTypeKey], [Description], [Price], [ShippingRate], [Quantity]) VALUES (15, 5, N'500 Preprinted Checks', CAST(0.12 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)), 500)
INSERT [dbo].[Product] ([ProductKey], [ProductTypeKey], [Description], [Price], [ShippingRate], [Quantity]) VALUES (16, 5, N'1000 Preprinted Checks', CAST(0.08 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)), 1000)
INSERT [dbo].[Product] ([ProductKey], [ProductTypeKey], [Description], [Price], [ShippingRate], [Quantity]) VALUES (17, 5, N'2000 Preprinted Checks', CAST(0.07 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)), 2000)
INSERT [dbo].[Product] ([ProductKey], [ProductTypeKey], [Description], [Price], [ShippingRate], [Quantity]) VALUES (18, 5, N'3000 Preprinted Checks', CAST(0.07 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)), 3000)
INSERT [dbo].[Product] ([ProductKey], [ProductTypeKey], [Description], [Price], [ShippingRate], [Quantity]) VALUES (19, 5, N'5000 Preprinted Checks', CAST(0.07 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)), 5000)
INSERT [dbo].[Product] ([ProductKey], [ProductTypeKey], [Description], [Price], [ShippingRate], [Quantity]) VALUES (20, 6, N'250 Preprinted Checks', CAST(0.16 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)), 250)
INSERT [dbo].[Product] ([ProductKey], [ProductTypeKey], [Description], [Price], [ShippingRate], [Quantity]) VALUES (21, 6, N'500 Preprinted Checks', CAST(0.12 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)), 500)
INSERT [dbo].[Product] ([ProductKey], [ProductTypeKey], [Description], [Price], [ShippingRate], [Quantity]) VALUES (22, 6, N'1000 Preprinted Checks', CAST(0.08 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)), 1000)
INSERT [dbo].[Product] ([ProductKey], [ProductTypeKey], [Description], [Price], [ShippingRate], [Quantity]) VALUES (23, 6, N'2000 Preprinted Checks', CAST(0.07 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)), 2000)
INSERT [dbo].[Product] ([ProductKey], [ProductTypeKey], [Description], [Price], [ShippingRate], [Quantity]) VALUES (24, 6, N'3000 Preprinted Checks', CAST(0.07 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)), 3000)
INSERT [dbo].[Product] ([ProductKey], [ProductTypeKey], [Description], [Price], [ShippingRate], [Quantity]) VALUES (25, 6, N'5000 Preprinted Checks', CAST(0.07 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)), 5000)
INSERT [dbo].[Product] ([ProductKey], [ProductTypeKey], [Description], [Price], [ShippingRate], [Quantity]) VALUES (26, 7, N'250 Preprinted Checks', CAST(0.16 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)), 250)
INSERT [dbo].[Product] ([ProductKey], [ProductTypeKey], [Description], [Price], [ShippingRate], [Quantity]) VALUES (27, 7, N'500 Preprinted Checks', CAST(0.12 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)), 500)
INSERT [dbo].[Product] ([ProductKey], [ProductTypeKey], [Description], [Price], [ShippingRate], [Quantity]) VALUES (28, 7, N'1000 Preprinted Checks', CAST(0.08 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)), 1000)
INSERT [dbo].[Product] ([ProductKey], [ProductTypeKey], [Description], [Price], [ShippingRate], [Quantity]) VALUES (29, 7, N'2000 Preprinted Checks', CAST(0.07 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)), 2000)
INSERT [dbo].[Product] ([ProductKey], [ProductTypeKey], [Description], [Price], [ShippingRate], [Quantity]) VALUES (30, 7, N'3000 Preprinted Checks', CAST(0.07 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)), 3000)
INSERT [dbo].[Product] ([ProductKey], [ProductTypeKey], [Description], [Price], [ShippingRate], [Quantity]) VALUES (31, 7, N'5000 Preprinted Checks', CAST(0.07 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)), 5000)
SET IDENTITY_INSERT [dbo].[Product] OFF
/****** Object:  StoredProcedure [dbo].[usp_SelectProduct_PrePrintedCheckList]    Script Date: 11/15/2011 17:46:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_SelectProduct_PrePrintedCheckList]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- =============================================
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
		producttypekey in (4) 
	order by productcategorykey, description
END
' 
END
GO
/****** Object:  StoredProcedure [dbo].[usp_SelectProduct_DepositSlipList]    Script Date: 11/15/2011 17:46:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_SelectProduct_DepositSlipList]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_SelectProduct_DepositSlipList] 
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
		producttypekey in (1) 
	order by productcategorykey, description
END
' 
END
GO
/****** Object:  View [dbo].[v_ZoneShippingRates]    Script Date: 11/15/2011 17:46:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[v_ZoneShippingRates]'))
EXEC dbo.sp_executesql @statement = N'
CREATE VIEW [dbo].[v_ZoneShippingRates]
AS

select 
	z.Description as ZoneDescription, 
	g.Description as GroupDescription, 
	t.Description as RateTypeDescription,
	szr.Quantity,
	szr.Rate,
	case 
		when szr.ShippingRateTypeKey = 1 then rate
		when szr.ShippingRateTypeKey = 2 then rate * 1000
		else 0
	end as ShippingRate,
	szr.ShippingZoneRateKey,
	szr.ShippingZoneKey,
	szr.ShippingRateGroupKey,
	szr.ShippingRateTypeKey
from 
	ShippingZoneRate szr
	join ShippingZone z on szr.ShippingZoneKey = z.ShippingZoneKey
	join ShippingRateGroup g on g.ShippingRateGroupKey = szr.ShippingRateGroupKey
	join ShippingRateType t on t.ShippingRateTypeKey = szr.ShippingRateTypeKey

'
GO
/****** Object:  StoredProcedure [dbo].[DepositSlip_Update]    Script Date: 11/15/2011 17:46:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DepositSlip_Update]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
create procedure [dbo].[DepositSlip_Update]
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
Update DepositSlip Set 
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
DepositSlipKey = @ID
' 
END
GO
/****** Object:  StoredProcedure [dbo].[DepositSlip_GetOne]    Script Date: 11/15/2011 17:46:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DepositSlip_GetOne]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
create procedure [dbo].[DepositSlip_GetOne]
(
@ID int
)
AS
SET NOCOUNT ON
select 
     DepositSlipKey
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
     DepositSlip
where
     DepositSlipKey = @ID
' 
END
GO
/****** Object:  StoredProcedure [dbo].[DepositSlip_Create]    Script Date: 11/15/2011 17:46:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DepositSlip_Create]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
create procedure [dbo].[DepositSlip_Create]
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

Insert into DepositSlip
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
' 
END
GO
/****** Object:  StoredProcedure [dbo].[CreditCard_Update]    Script Date: 11/15/2011 17:46:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CreditCard_Update]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'create procedure [dbo].[CreditCard_Update]
(
@ID int
, @CustomerKey int 
, @CreditCardTypeKey int 
, @Number varchar(20) 
, @ExpirationMonth int 
, @ExpirationYear int 
, @CCV varchar(4) 
)
AS
SET NOCOUNT ON
Update CreditCard Set 
CustomerKey = @CustomerKey,
CreditCardTypeKey = @CreditCardTypeKey,
Number = @Number,
ExpirationMonth = @ExpirationMonth,
ExpirationYear = @ExpirationYear,
CCV = @CCV
where
CreditCardKey = @ID' 
END
GO
/****** Object:  StoredProcedure [dbo].[CreditCard_GetOne]    Script Date: 11/15/2011 17:46:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CreditCard_GetOne]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
create procedure [dbo].[CreditCard_GetOne]
(
@ID int
)
AS
SET NOCOUNT ON
select 
     CreditCardKey
     ,CustomerKey
     ,CreditCardTypeKey
     ,Number
     ,ExpirationMonth
     ,ExpirationYear
     ,CCV
from
     CreditCard
where
     CreditCardKey = @ID' 
END
GO
/****** Object:  StoredProcedure [dbo].[CreditCard_Create]    Script Date: 11/15/2011 17:46:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CreditCard_Create]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
create procedure [dbo].[CreditCard_Create]
(
@CustomerKey int ,
@CreditCardTypeKey int ,
@Number varchar(20) ,
@ExpirationMonth int ,
@ExpirationYear int ,
@CCV varchar(4) ,
@retval int OUTPUT

)
AS
SET NOCOUNT ON

Insert into CreditCard
(
CustomerKey,
CreditCardTypeKey,
Number,
ExpirationMonth,
ExpirationYear,
CCV
)
Values
(
@CustomerKey,
@CreditCardTypeKey,
@Number,
@ExpirationMonth,
@ExpirationYear,
@CCV
)
SET @retval = (Select Scope_Identity())' 
END
GO
/****** Object:  Table [dbo].[CheckColor]    Script Date: 11/15/2011 17:46:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CheckColor]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[CheckColor](
	[CheckColorKey] [int] IDENTITY(1,1) NOT NULL,
	[ProductTypeKey] [int] NOT NULL,
	[Description] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[ImagePath] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[FullCheckImagePath] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
 CONSTRAINT [PK_CheckColor] PRIMARY KEY CLUSTERED 
(
	[CheckColorKey] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)
END
GO
SET IDENTITY_INSERT [dbo].[CheckColor] ON
INSERT [dbo].[CheckColor] ([CheckColorKey], [ProductTypeKey], [Description], [ImagePath], [FullCheckImagePath]) VALUES (1, 4, N'Blue', N'../images/checks/QBVoucher/Background-blue.jpg', N'../images/checks/QBVoucher/Blue-Full.jpg')
INSERT [dbo].[CheckColor] ([CheckColorKey], [ProductTypeKey], [Description], [ImagePath], [FullCheckImagePath]) VALUES (2, 4, N'Green', N'../images/checks/QBVoucher/Background-green.jpg', N'../images/checks/QBVoucher/Green-Full.jpg')
INSERT [dbo].[CheckColor] ([CheckColorKey], [ProductTypeKey], [Description], [ImagePath], [FullCheckImagePath]) VALUES (3, 5, N'Blue', N'../images/checks/QBVoucher/Background-blue.jpg', NULL)
INSERT [dbo].[CheckColor] ([CheckColorKey], [ProductTypeKey], [Description], [ImagePath], [FullCheckImagePath]) VALUES (4, 5, N'Green', N'../images/checks/QBVoucher/Background-green.jpg', NULL)
INSERT [dbo].[CheckColor] ([CheckColorKey], [ProductTypeKey], [Description], [ImagePath], [FullCheckImagePath]) VALUES (5, 6, N'Blue', N'../images/checks/QBVoucher/Background-blue.jpg', NULL)
INSERT [dbo].[CheckColor] ([CheckColorKey], [ProductTypeKey], [Description], [ImagePath], [FullCheckImagePath]) VALUES (6, 6, N'Green', N'../images/checks/QBVoucher/Background-green.jpg', NULL)
INSERT [dbo].[CheckColor] ([CheckColorKey], [ProductTypeKey], [Description], [ImagePath], [FullCheckImagePath]) VALUES (7, 7, N'Blue', N'../images/checks/QBVoucher/Background-blue.jpg', NULL)
INSERT [dbo].[CheckColor] ([CheckColorKey], [ProductTypeKey], [Description], [ImagePath], [FullCheckImagePath]) VALUES (8, 7, N'Green', N'../images/checks/QBVoucher/Background-green.jpg', NULL)
INSERT [dbo].[CheckColor] ([CheckColorKey], [ProductTypeKey], [Description], [ImagePath], [FullCheckImagePath]) VALUES (12, 4, N'Burgandy', N'../images/checks/QBVoucher/Background-Burgundy.jpg', N'../images/checks/QBVoucher/Burgundy-Full.jpg')
INSERT [dbo].[CheckColor] ([CheckColorKey], [ProductTypeKey], [Description], [ImagePath], [FullCheckImagePath]) VALUES (13, 4, N'Tan', N'../images/checks/QBVoucher/Background-Tan.jpg', N'../images/checks/QBVoucher/Tan-Full.jpg')
INSERT [dbo].[CheckColor] ([CheckColorKey], [ProductTypeKey], [Description], [ImagePath], [FullCheckImagePath]) VALUES (15, 4, N'Blue Burgandy', N'../images/checks/QBVoucher/Background-blue-burgundy.jpg', N'../images/checks/QBVoucher/Blue-Burgundy-Full.jpg')
INSERT [dbo].[CheckColor] ([CheckColorKey], [ProductTypeKey], [Description], [ImagePath], [FullCheckImagePath]) VALUES (16, 4, N'Blue Green', N'../images/checks/QBVoucher/Background-blue-green.jpg', N'../images/checks/QBVoucher/Blue-Green-Full.jpg')
INSERT [dbo].[CheckColor] ([CheckColorKey], [ProductTypeKey], [Description], [ImagePath], [FullCheckImagePath]) VALUES (17, 4, N'Blue Burgandy Green', N'../images/checks/QBVoucher/Background-blue-burgundy-gr.jpg', N'../images/checks/QBVoucher/Blue-Burgundy-Green-Full.jpg')
INSERT [dbo].[CheckColor] ([CheckColorKey], [ProductTypeKey], [Description], [ImagePath], [FullCheckImagePath]) VALUES (18, 4, N'Burgandy Tan', N'../images/checks/QBVoucher/Background-burgundy-tan.jpg', N'../images/checks/QBVoucher/Burgundy-Tan-Full.jpg')
SET IDENTITY_INSERT [dbo].[CheckColor] OFF
/****** Object:  StoredProcedure [dbo].[Address_Update]    Script Date: 11/15/2011 17:46:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Address_Update]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE procedure [dbo].[Address_Update]
(
@ID int
, @CustomerKey int 
, @AddressTypeKey int 
, @Line1 varchar(100) 
, @Line2 varchar(100) 
, @City varchar(100) 
, @State varchar(2) 
, @ZipCode varchar(10) 
)
AS
SET NOCOUNT ON
Update Address Set 
CustomerKey = @CustomerKey,
AddressTypeKey = @AddressTypeKey,
Line1 = @Line1,
Line2 = @Line2,
City = @City,
State = @State,
ZipCode = @ZipCode
where
AddressKey = @ID' 
END
GO
/****** Object:  StoredProcedure [dbo].[Address_GetOne]    Script Date: 11/15/2011 17:46:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Address_GetOne]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE procedure [dbo].[Address_GetOne]
(
@ID int
)
AS
SET NOCOUNT ON
select 
     AddressKey
     ,CustomerKey
     ,AddressTypeKey
     ,Line1
     ,Line2
     ,City
     ,State
     ,ZipCode
from
     Address
where
     AddressKey = @ID' 
END
GO
/****** Object:  StoredProcedure [dbo].[Address_Create]    Script Date: 11/15/2011 17:46:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Address_Create]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE procedure [dbo].[Address_Create]
(
@CustomerKey int ,
@AddressTypeKey int ,
@Line1 varchar(100) ,
@Line2 varchar(100) ,
@City varchar(100) ,
@State varchar(2) ,
@ZipCode varchar(10) ,
@retval int OUTPUT

)
AS
SET NOCOUNT ON

Insert into Address
(
CustomerKey,
AddressTypeKey,
Line1,
Line2,
City,
State,
ZipCode
)
Values
(
@CustomerKey,
@AddressTypeKey,
@Line1,
@Line2,
@City,
@State,
@ZipCode
)
SET @retval = (Select Scope_Identity())
' 
END
GO
/****** Object:  StoredProcedure [dbo].[DepositStamp_Update]    Script Date: 11/15/2011 17:46:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DepositStamp_Update]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE procedure [dbo].[DepositStamp_Update]
(
@ID int
, @CustomerKey int 
, @AccountNumber varchar(20) 
, @BankName varchar(50)
, @Line1 varchar(50)
)
AS
SET NOCOUNT ON
Update DepositStamp Set 
CustomerKey = @CustomerKey,
AccountNumber = @AccountNumber,
BankName = @BankName,
Line1 = @Line1
where
DepositStampKey = @ID' 
END
GO
/****** Object:  StoredProcedure [dbo].[DepositStamp_GetOne]    Script Date: 11/15/2011 17:46:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DepositStamp_GetOne]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE procedure [dbo].[DepositStamp_GetOne]
(
@ID int
)
AS
SET NOCOUNT ON
select 
     DepositStampKey
     ,CustomerKey
     ,AccountNumber
     ,BankName
     ,Line1
from
     DepositStamp
where
     DepositStampKey = @ID' 
END
GO
/****** Object:  StoredProcedure [dbo].[DepositStamp_Create]    Script Date: 11/15/2011 17:46:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DepositStamp_Create]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE procedure [dbo].[DepositStamp_Create]
(
@CustomerKey int ,
@AccountNumber varchar(20) ,
@BankName varchar(50),
@Line1 varchar(50),
@retval int OUTPUT

)
AS
SET NOCOUNT ON

Insert into DepositStamp
(
CustomerKey,
AccountNumber,
BankName,
Line1
)
Values
(
@CustomerKey,
@AccountNumber,
@BankName,
@Line1
)
SET @retval = (Select Scope_Identity())' 
END
GO
/****** Object:  Table [dbo].[Invoice]    Script Date: 11/15/2011 17:46:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Invoice]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Invoice](
	[InvoiceKey] [int] IDENTITY(10000,1) NOT NULL,
	[CustomerKey] [int] NOT NULL,
	[OrderDate] [datetime] NOT NULL,
	[ShippingDate] [datetime] NULL,
	[Comment] [varchar](200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ShippingTotal] [numeric](18, 2) NULL,
	[CreditCardKey] [int] NULL,
	[ShippingTypeKey] [int] NULL,
	[ExpediteTypeKey] [int] NULL,
	[DebitAccount] [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[BillCharges] [bit] NULL,
	[ExpediteAmount] [decimal](18, 0) NULL,
	[ComputerIP] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
 CONSTRAINT [PK_Invoice] PRIMARY KEY CLUSTERED 
(
	[InvoiceKey] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)
END
GO

/****** Object:  StoredProcedure [dbo].[GetShippingZoneInfo]    Script Date: 11/15/2011 17:46:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GetShippingZoneInfo]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetShippingZoneInfo] 

-- exec GetShippingZoneInfo

AS
BEGIN

declare @ShippingZoneKey int
declare @description varchar(200)
declare @abbreviation varchar(2)

declare @current_description varchar(50)

set @current_description = ''''

create table #ShippingZoneStates
(
ShippingZoneKey int,
ShippingZoneDescription varchar(50),
StateList varchar(200)
)


declare shipping_zone_cursor cursor for

select z.ShippingZoneKey, z.description, s.abbreviation
from 
State s 
join ShippingZone z on s.ShippingZoneKey = z.ShippingZoneKey
order by Description,Abbreviation

open shipping_zone_cursor
fetch next from shipping_zone_cursor into @shippingzonekey, @description, @abbreviation
while @@FETCH_STATUS = 0

BEGIN
	if @description <> @current_description
		BEGIN
			set @current_description = @description
			insert into #ShippingZoneStates (ShippingZoneKey, ShippingZoneDescription,StateList) values (@ShippingZoneKey,@description,@abbreviation)
		END
	else
		BEGIN
			update #ShippingZoneStates set StateList = StateList + '', '' + @abbreviation where ShippingZoneKey = @ShippingZoneKey
		END
	fetch next from shipping_zone_cursor into @shippingzonekey, @description, @abbreviation
END

close shipping_zone_cursor
deallocate shipping_zone_cursor

select * from #ShippingZoneStates
drop table #ShippingZoneStates

END
' 
END
GO
/****** Object:  Table [dbo].[ProductTypeCheckOptionXRef]    Script Date: 11/15/2011 17:46:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ProductTypeCheckOptionXRef]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ProductTypeCheckOptionXRef](
	[ProductTypeCheckOptionXRefKey] [int] IDENTITY(1,1) NOT NULL,
	[ProductTypeKey] [int] NOT NULL,
	[CheckFeatureOptionKey] [int] NOT NULL,
	[IsAvailable] [bit] NOT NULL,
 CONSTRAINT [PK_ProductTypeCheckOptionXRef] PRIMARY KEY CLUSTERED 
(
	[ProductTypeCheckOptionXRefKey] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)
END
GO
SET IDENTITY_INSERT [dbo].[ProductTypeCheckOptionXRef] ON
INSERT [dbo].[ProductTypeCheckOptionXRef] ([ProductTypeCheckOptionXRefKey], [ProductTypeKey], [CheckFeatureOptionKey], [IsAvailable]) VALUES (5, 4, 1, 1)
INSERT [dbo].[ProductTypeCheckOptionXRef] ([ProductTypeCheckOptionXRefKey], [ProductTypeKey], [CheckFeatureOptionKey], [IsAvailable]) VALUES (6, 4, 2, 1)
INSERT [dbo].[ProductTypeCheckOptionXRef] ([ProductTypeCheckOptionXRefKey], [ProductTypeKey], [CheckFeatureOptionKey], [IsAvailable]) VALUES (7, 5, 2, 1)
INSERT [dbo].[ProductTypeCheckOptionXRef] ([ProductTypeCheckOptionXRefKey], [ProductTypeKey], [CheckFeatureOptionKey], [IsAvailable]) VALUES (8, 6, 1, 1)
SET IDENTITY_INSERT [dbo].[ProductTypeCheckOptionXRef] OFF
/****** Object:  StoredProcedure [dbo].[ProductType_Update]    Script Date: 11/15/2011 17:46:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ProductType_Update]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'create procedure [dbo].[ProductType_Update]
(
@ID int
, @ProductCategoryKey int 
, @Description varchar(100) 
, @ShippingRateGroupKey int 
)
AS
SET NOCOUNT ON
Update ProductType Set 
ProductCategoryKey = @ProductCategoryKey,
Description = @Description,
ShippingRateGroupKey = @ShippingRateGroupKey
where
ProductTypeKey = @ID
' 
END
GO
/****** Object:  StoredProcedure [dbo].[ProductType_GetOne]    Script Date: 11/15/2011 17:46:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ProductType_GetOne]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
create procedure [dbo].[ProductType_GetOne]
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
from
     ProductType
where
     ProductTypeKey = @ID
' 
END
GO
/****** Object:  StoredProcedure [dbo].[ProductType_Create]    Script Date: 11/15/2011 17:46:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ProductType_Create]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
create procedure [dbo].[ProductType_Create]
(
@ProductCategoryKey int ,
@Description varchar(100) ,
@ShippingRateGroupKey int ,
@retval int OUTPUT

)
AS
SET NOCOUNT ON

Insert into ProductType
(
ProductCategoryKey,
Description,
ShippingRateGroupKey
)
Values
(
@ProductCategoryKey,
@Description,
@ShippingRateGroupKey
)
SET @retval = (Select Scope_Identity())
' 
END
GO
/****** Object:  StoredProcedure [dbo].[Product_Update]    Script Date: 11/15/2011 17:46:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Product_Update]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'create procedure [dbo].[Product_Update]
(
@ID int
, @ProductTypeKey int 
, @Description varchar(100) 
, @Price numeric(18,2) 
, @ShippingRate numeric(18,2) 
, @Quantity numeric(18,2) 
)
AS
SET NOCOUNT ON
Update Product Set 
ProductTypeKey = @ProductTypeKey,
Description = @Description,
Price = @Price,
ShippingRate = @ShippingRate,
Quantity = @Quantity
where
ProductKey = @ID
' 
END
GO
/****** Object:  StoredProcedure [dbo].[Product_GetOne]    Script Date: 11/15/2011 17:46:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Product_GetOne]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
create procedure [dbo].[Product_GetOne]
(
@ID int
)
AS
SET NOCOUNT ON
select 
     ProductKey
     ,ProductTypeKey
     ,Description
     ,Price
     ,ShippingRate
     ,Quantity
from
     Product
where
     ProductKey = @ID
' 
END
GO
/****** Object:  StoredProcedure [dbo].[Product_Create]    Script Date: 11/15/2011 17:46:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Product_Create]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
create procedure [dbo].[Product_Create]
(
@ProductTypeKey int ,
@Description varchar(100) ,
@Price numeric(18,2) ,
@ShippingRate numeric(18,2) ,
@Quantity numeric(18,2) ,
@retval int OUTPUT

)
AS
SET NOCOUNT ON

Insert into Product
(
ProductTypeKey,
Description,
Price,
ShippingRate,
Quantity
)
Values
(
@ProductTypeKey,
@Description,
@Price,
@ShippingRate,
@Quantity
)
SET @retval = (Select Scope_Identity())
' 
END
GO
/****** Object:  StoredProcedure [dbo].[Invoice_Update]    Script Date: 11/15/2011 17:46:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Invoice_Update]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
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
' 
END
GO
/****** Object:  StoredProcedure [dbo].[Invoice_GetOne]    Script Date: 11/15/2011 17:46:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Invoice_GetOne]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
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
' 
END
GO
/****** Object:  StoredProcedure [dbo].[Invoice_Create]    Script Date: 11/15/2011 17:46:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Invoice_Create]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
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
' 
END
GO
/****** Object:  Table [dbo].[CheckDetail]    Script Date: 11/15/2011 17:46:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CheckDetail]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[CheckDetail](
	[CheckDetailKey] [int] IDENTITY(1,1) NOT NULL,
	[CustomerKey] [int] NOT NULL,
	[Line1] [varchar](35) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[Line2] [varchar](35) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Line3] [varchar](35) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Line4] [varchar](35) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Line5] [varchar](35) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[BankAccountNumber] [varchar](35) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[RoutingNumber] [varchar](35) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[CheckColorKey] [int] NOT NULL,
	[PrintLines] [bit] NOT NULL,
	[SignatureLineCount] [int] NOT NULL,
	[MessageAboveSignature] [varchar](35) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[PrintPaymentRecordOnStub] [bit] NOT NULL,
	[CheckStubLineKey] [int] NULL,
	[Line1FontWeightKey] [int] NULL,
	[Line2FontWeightKey] [int] NULL,
	[TextAlignKey] [int] NULL,
	[TypeFaceKey] [int] NULL,
	[Fraction] [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[UseLogo] [bit] NOT NULL,
	[BankInfoLine1] [varchar](35) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[BankInfoLine2] [varchar](35) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[BankInfoLine3] [varchar](35) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[StartingNumber] [varchar](35) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
 CONSTRAINT [PK_CheckDetail] PRIMARY KEY CLUSTERED 
(
	[CheckDetailKey] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)
END
GO

/****** Object:  StoredProcedure [dbo].[CheckColor_Update]    Script Date: 11/15/2011 17:46:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CheckColor_Update]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
create procedure [dbo].[CheckColor_Update]
(
@ID int
, @ProductTypeKey int 
, @Description varchar(50) 
, @ImagePath varchar(50) 
, @FullCheckImagePath varchar(50)
)
AS
SET NOCOUNT ON
Update CheckColor Set 
ProductTypeKey = @ProductTypeKey,
Description = @Description,
ImagePath = @ImagePath,
FullCheckImagePath = @FullCheckImagePath
where
CheckColorKey = @ID

' 
END
GO
/****** Object:  StoredProcedure [dbo].[CheckColor_GetOne]    Script Date: 11/15/2011 17:46:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CheckColor_GetOne]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'

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
from
     CheckColor
where
     CheckColorKey = @ID

' 
END
GO
/****** Object:  StoredProcedure [dbo].[CheckColor_Create]    Script Date: 11/15/2011 17:46:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CheckColor_Create]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'

create procedure [dbo].[CheckColor_Create]
(
@ProductTypeKey int ,
@Description varchar(50) ,
@ImagePath varchar(50) ,
@FullCheckImagePath varchar(50),
@retval int OUTPUT

)
AS
SET NOCOUNT ON

Insert into CheckColor
(
ProductTypeKey,
Description,
ImagePath,
FullCheckImagePath
)
Values
(
@ProductTypeKey,
@Description,
@ImagePath,
@FullCheckImagePath
)
SET @retval = (Select Scope_Identity())

' 
END
GO
/****** Object:  StoredProcedure [dbo].[CheckDetail_Update]    Script Date: 11/15/2011 17:46:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CheckDetail_Update]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'

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


' 
END
GO
/****** Object:  StoredProcedure [dbo].[CheckDetail_GetOne]    Script Date: 11/15/2011 17:46:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CheckDetail_GetOne]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'

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


' 
END
GO
/****** Object:  StoredProcedure [dbo].[CheckDetail_Create]    Script Date: 11/15/2011 17:46:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CheckDetail_Create]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'

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

' 
END
GO
/****** Object:  Table [dbo].[InvoiceItem]    Script Date: 11/15/2011 17:46:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[InvoiceItem]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[InvoiceItem](
	[InvoiceItemKey] [int] IDENTITY(1,1) NOT NULL,
	[InvoiceKey] [int] NOT NULL,
	[ProductKey] [int] NOT NULL,
	[Description] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[Quantity] [int] NOT NULL,
	[Price] [numeric](18, 2) NOT NULL,
	[DepositSlipKey] [int] NULL,
	[ShippingRate] [numeric](18, 2) NULL,
	[DepositStampKey] [int] NULL,
	[CheckDetailKey] [int] NULL,
 CONSTRAINT [PK_InvoiceItem] PRIMARY KEY CLUSTERED 
(
	[InvoiceItemKey] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)
END
GO

/****** Object:  View [dbo].[v_OrderInfo]    Script Date: 11/15/2011 17:46:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[v_OrderInfo]'))
EXEC dbo.sp_executesql @statement = N'

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
i.BillCharges, 
i.DebitAccount, 
dbo.ExpediteType.Description AS ExpediteTypeDescription, 
i.ExpediteAmount, 
dbo.CreditCard.Number AS CreditCardNumber, 
dbo.CreditCard.ExpirationMonth, 
dbo.CreditCard.ExpirationYear, 
dbo.CreditCard.CCV, 
dbo.CreditCardType.Description AS CreditCardTypeDescription, 
CASE WHEN a.State = ''GA'' THEN ''yes'' ELSE ''no'' END AS taxable, 
dbo.Address.Line1 AS BillingAddressLine1, 
dbo.Address.Line2 AS BillingAddressLine2, 
dbo.Address.City AS BillingAddressCity, 
dbo.Address.State AS BillingAddressState, 
dbo.Address.ZipCode AS BillingAddressZipCode,
i.ComputerIP
FROM            dbo.Invoice AS i INNER JOIN
                         dbo.Customer AS c ON c.CustomerKey = i.CustomerKey INNER JOIN
                         dbo.InvoiceItem AS v ON v.InvoiceKey = i.InvoiceKey LEFT OUTER JOIN
                         dbo.DepositSlip AS d ON v.DepositSlipKey = d.DepositSlipKey 
                         LEFT join CheckDetail cd on cd.CheckDetailKey = v.CheckDetailKey
                         LEFT join DepositStamp ds on ds.DepositStampKey = v.DepositStampKey
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


'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_DiagramPane1' , N'SCHEMA',N'dbo', N'VIEW',N'v_OrderInfo', NULL,NULL))
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[54] 4[4] 2[25] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "d"
            Begin Extent = 
               Top = 6
               Left = 638
               Bottom = 114
               Right = 795
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "CreditCardType"
            Begin Extent = 
               Top = 222
               Left = 38
               Bottom = 300
               Right = 209
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "CreditCard"
            Begin Extent = 
               Top = 114
               Left = 437
               Bottom = 222
               Right = 608
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "ExpediteType"
            Begin Extent = 
               Top = 114
               Left = 236
               Bottom = 222
               Right = 399
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "c"
            Begin Extent = 
               Top = 182
               Left = 435
               Bottom = 290
               Right = 621
            End
            DisplayFlags = 280
            TopColumn = 6
         End
         Begin Table = "i"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 114
               Right = 185
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "v"
            Begin Extent = 
               Top = 6
               Left = 447
               Bottom = 114
               Right = 600
            End
            DisplayFlags = 280
          ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_OrderInfo'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_DiagramPane2' , N'SCHEMA',N'dbo', N'VIEW',N'v_OrderInfo', NULL,NULL))
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'  TopColumn = 5
         End
         Begin Table = "a"
            Begin Extent = 
               Top = 144
               Left = 667
               Bottom = 252
               Right = 827
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Address"
            Begin Extent = 
               Top = 258
               Left = 752
               Bottom = 366
               Right = 912
            End
            DisplayFlags = 280
            TopColumn = 4
         End
         Begin Table = "Product"
            Begin Extent = 
               Top = 6
               Left = 223
               Bottom = 114
               Right = 382
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "ProductType"
            Begin Extent = 
               Top = 114
               Left = 38
               Bottom = 207
               Right = 215
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "DepositStamp"
            Begin Extent = 
               Top = 205
               Left = 277
               Bottom = 313
               Right = 441
            End
            DisplayFlags = 280
            TopColumn = 1
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 35
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_OrderInfo'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_DiagramPaneCount' , N'SCHEMA',N'dbo', N'VIEW',N'v_OrderInfo', NULL,NULL))
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_OrderInfo'
GO
/****** Object:  StoredProcedure [dbo].[usp_DeleteInvoice]    Script Date: 11/15/2011 17:46:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_DeleteInvoice]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[usp_DeleteInvoice]
	@InvoiceKey int
	
AS
	/* SET NOCOUNT ON */
	
Declare @CustomerKey int

Set @CustomerKey = (Select CustomerKey from Invoice Where InvoiceKey = @InvoiceKey)	
	
	
DELETE FROM InvoiceItem WHERE InvoiceKey = @InvoiceKey	

DELETE FROM Address Where CustomerKey = @CustomerKey


DELETE FROM DepositSlip Where CustomerKey = @CustomerKey

DELETE FROM CheckDetail where CustomerKey = @CustomerKey



DELETE FROM DepositStamp Where CustomerKey = @CustomerKey






DELETE FROM Invoice Where CustomerKey = @CustomerKey


DELETE FROM CreditCard Where CustomerKey = @CustomerKey

DELETE FROM Customer Where CustomerKey = @CustomerKey


' 
END
GO
/****** Object:  StoredProcedure [dbo].[InvoiceItem_Update]    Script Date: 11/15/2011 17:46:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[InvoiceItem_Update]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE procedure [dbo].[InvoiceItem_Update]
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
DepositStampKey = @DepositStampKey
where
InvoiceItemKey = @ID' 
END
GO
/****** Object:  StoredProcedure [dbo].[InvoiceItem_GetOne]    Script Date: 11/15/2011 17:46:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[InvoiceItem_GetOne]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE procedure [dbo].[InvoiceItem_GetOne]
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
from
     InvoiceItem
where
     InvoiceItemKey = @ID
' 
END
GO
/****** Object:  StoredProcedure [dbo].[InvoiceItem_Create]    Script Date: 11/15/2011 17:46:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[InvoiceItem_Create]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE procedure [dbo].[InvoiceItem_Create]
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
CheckDetailKey
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
@CheckDetailKey
)
SET @retval = (Select Scope_Identity())
' 
END
GO
/****** Object:  StoredProcedure [dbo].[GetInvoiceItems]    Script Date: 11/15/2011 17:46:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GetInvoiceItems]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[GetInvoiceItems]
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
from
     InvoiceItem
where
     InvoiceKey = @ID
' 
END
GO
/****** Object:  Default [DF__CheckDeta__UseLo__367C1819]    Script Date: 11/15/2011 17:46:02 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF__CheckDeta__UseLo__367C1819]') AND parent_object_id = OBJECT_ID(N'[dbo].[CheckDetail]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__CheckDeta__UseLo__367C1819]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[CheckDetail] ADD  CONSTRAINT [DF__CheckDeta__UseLo__367C1819]  DEFAULT ((0)) FOR [UseLogo]
END


End
GO
/****** Object:  Default [DF_InvoiceItem_ShippingRate]    Script Date: 11/15/2011 17:46:03 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_InvoiceItem_ShippingRate]') AND parent_object_id = OBJECT_ID(N'[dbo].[InvoiceItem]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_InvoiceItem_ShippingRate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[InvoiceItem] ADD  CONSTRAINT [DF_InvoiceItem_ShippingRate]  DEFAULT ((0)) FOR [ShippingRate]
END


End
GO
/****** Object:  Default [DF_Product_ShippingUnits]    Script Date: 11/15/2011 17:46:03 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Product_ShippingUnits]') AND parent_object_id = OBJECT_ID(N'[dbo].[Product]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Product_ShippingUnits]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Product] ADD  CONSTRAINT [DF_Product_ShippingUnits]  DEFAULT ((0)) FOR [ShippingRate]
END


End
GO
/****** Object:  ForeignKey [FK_Address_AddressType1]    Script Date: 11/15/2011 17:46:02 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Address_AddressType1]') AND parent_object_id = OBJECT_ID(N'[dbo].[Address]'))
ALTER TABLE [dbo].[Address]  WITH CHECK ADD  CONSTRAINT [FK_Address_AddressType1] FOREIGN KEY([AddressTypeKey])
REFERENCES [dbo].[AddressType] ([AddressTypeKey])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Address_AddressType1]') AND parent_object_id = OBJECT_ID(N'[dbo].[Address]'))
ALTER TABLE [dbo].[Address] CHECK CONSTRAINT [FK_Address_AddressType1]
GO
/****** Object:  ForeignKey [FK_Address_Customer]    Script Date: 11/15/2011 17:46:02 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Address_Customer]') AND parent_object_id = OBJECT_ID(N'[dbo].[Address]'))
ALTER TABLE [dbo].[Address]  WITH CHECK ADD  CONSTRAINT [FK_Address_Customer] FOREIGN KEY([CustomerKey])
REFERENCES [dbo].[Customer] ([CustomerKey])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Address_Customer]') AND parent_object_id = OBJECT_ID(N'[dbo].[Address]'))
ALTER TABLE [dbo].[Address] CHECK CONSTRAINT [FK_Address_Customer]
GO
/****** Object:  ForeignKey [FK_CheckColor_ProductType]    Script Date: 11/15/2011 17:46:02 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CheckColor_ProductType]') AND parent_object_id = OBJECT_ID(N'[dbo].[CheckColor]'))
ALTER TABLE [dbo].[CheckColor]  WITH CHECK ADD  CONSTRAINT [FK_CheckColor_ProductType] FOREIGN KEY([ProductTypeKey])
REFERENCES [dbo].[ProductType] ([ProductTypeKey])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CheckColor_ProductType]') AND parent_object_id = OBJECT_ID(N'[dbo].[CheckColor]'))
ALTER TABLE [dbo].[CheckColor] CHECK CONSTRAINT [FK_CheckColor_ProductType]
GO
/****** Object:  ForeignKey [FK_CheckDetail_CheckColor]    Script Date: 11/15/2011 17:46:02 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CheckDetail_CheckColor]') AND parent_object_id = OBJECT_ID(N'[dbo].[CheckDetail]'))
ALTER TABLE [dbo].[CheckDetail]  WITH CHECK ADD  CONSTRAINT [FK_CheckDetail_CheckColor] FOREIGN KEY([CheckColorKey])
REFERENCES [dbo].[CheckColor] ([CheckColorKey])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CheckDetail_CheckColor]') AND parent_object_id = OBJECT_ID(N'[dbo].[CheckDetail]'))
ALTER TABLE [dbo].[CheckDetail] CHECK CONSTRAINT [FK_CheckDetail_CheckColor]
GO
/****** Object:  ForeignKey [FK_CheckDetail_CheckDetail]    Script Date: 11/15/2011 17:46:02 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CheckDetail_CheckDetail]') AND parent_object_id = OBJECT_ID(N'[dbo].[CheckDetail]'))
ALTER TABLE [dbo].[CheckDetail]  WITH CHECK ADD  CONSTRAINT [FK_CheckDetail_CheckDetail] FOREIGN KEY([CheckDetailKey])
REFERENCES [dbo].[CheckDetail] ([CheckDetailKey])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CheckDetail_CheckDetail]') AND parent_object_id = OBJECT_ID(N'[dbo].[CheckDetail]'))
ALTER TABLE [dbo].[CheckDetail] CHECK CONSTRAINT [FK_CheckDetail_CheckDetail]
GO
/****** Object:  ForeignKey [FK_CheckDetail_CheckStubLine]    Script Date: 11/15/2011 17:46:02 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CheckDetail_CheckStubLine]') AND parent_object_id = OBJECT_ID(N'[dbo].[CheckDetail]'))
ALTER TABLE [dbo].[CheckDetail]  WITH CHECK ADD  CONSTRAINT [FK_CheckDetail_CheckStubLine] FOREIGN KEY([CheckStubLineKey])
REFERENCES [dbo].[CheckStubLine] ([CheckStubLineKey])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CheckDetail_CheckStubLine]') AND parent_object_id = OBJECT_ID(N'[dbo].[CheckDetail]'))
ALTER TABLE [dbo].[CheckDetail] CHECK CONSTRAINT [FK_CheckDetail_CheckStubLine]
GO
/****** Object:  ForeignKey [FK_CheckDetail_FontWeight]    Script Date: 11/15/2011 17:46:02 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CheckDetail_FontWeight]') AND parent_object_id = OBJECT_ID(N'[dbo].[CheckDetail]'))
ALTER TABLE [dbo].[CheckDetail]  WITH CHECK ADD  CONSTRAINT [FK_CheckDetail_FontWeight] FOREIGN KEY([Line1FontWeightKey])
REFERENCES [dbo].[FontWeight] ([FontWeightKey])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CheckDetail_FontWeight]') AND parent_object_id = OBJECT_ID(N'[dbo].[CheckDetail]'))
ALTER TABLE [dbo].[CheckDetail] CHECK CONSTRAINT [FK_CheckDetail_FontWeight]
GO
/****** Object:  ForeignKey [FK_CheckDetail_FontWeight1]    Script Date: 11/15/2011 17:46:02 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CheckDetail_FontWeight1]') AND parent_object_id = OBJECT_ID(N'[dbo].[CheckDetail]'))
ALTER TABLE [dbo].[CheckDetail]  WITH CHECK ADD  CONSTRAINT [FK_CheckDetail_FontWeight1] FOREIGN KEY([Line2FontWeightKey])
REFERENCES [dbo].[FontWeight] ([FontWeightKey])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CheckDetail_FontWeight1]') AND parent_object_id = OBJECT_ID(N'[dbo].[CheckDetail]'))
ALTER TABLE [dbo].[CheckDetail] CHECK CONSTRAINT [FK_CheckDetail_FontWeight1]
GO
/****** Object:  ForeignKey [FK_CheckDetail_TextAlign]    Script Date: 11/15/2011 17:46:02 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CheckDetail_TextAlign]') AND parent_object_id = OBJECT_ID(N'[dbo].[CheckDetail]'))
ALTER TABLE [dbo].[CheckDetail]  WITH CHECK ADD  CONSTRAINT [FK_CheckDetail_TextAlign] FOREIGN KEY([TextAlignKey])
REFERENCES [dbo].[TextAlign] ([TextAlignKey])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CheckDetail_TextAlign]') AND parent_object_id = OBJECT_ID(N'[dbo].[CheckDetail]'))
ALTER TABLE [dbo].[CheckDetail] CHECK CONSTRAINT [FK_CheckDetail_TextAlign]
GO
/****** Object:  ForeignKey [FK_CheckDetail_TypeFace]    Script Date: 11/15/2011 17:46:02 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CheckDetail_TypeFace]') AND parent_object_id = OBJECT_ID(N'[dbo].[CheckDetail]'))
ALTER TABLE [dbo].[CheckDetail]  WITH CHECK ADD  CONSTRAINT [FK_CheckDetail_TypeFace] FOREIGN KEY([TypeFaceKey])
REFERENCES [dbo].[TypeFace] ([TypeFaceKey])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CheckDetail_TypeFace]') AND parent_object_id = OBJECT_ID(N'[dbo].[CheckDetail]'))
ALTER TABLE [dbo].[CheckDetail] CHECK CONSTRAINT [FK_CheckDetail_TypeFace]
GO
/****** Object:  ForeignKey [FK_CreditCard_CreditCardType]    Script Date: 11/15/2011 17:46:02 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CreditCard_CreditCardType]') AND parent_object_id = OBJECT_ID(N'[dbo].[CreditCard]'))
ALTER TABLE [dbo].[CreditCard]  WITH CHECK ADD  CONSTRAINT [FK_CreditCard_CreditCardType] FOREIGN KEY([CreditCardTypeKey])
REFERENCES [dbo].[CreditCardType] ([CreditCardTypeKey])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CreditCard_CreditCardType]') AND parent_object_id = OBJECT_ID(N'[dbo].[CreditCard]'))
ALTER TABLE [dbo].[CreditCard] CHECK CONSTRAINT [FK_CreditCard_CreditCardType]
GO
/****** Object:  ForeignKey [FK_CreditCard_Customer]    Script Date: 11/15/2011 17:46:02 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CreditCard_Customer]') AND parent_object_id = OBJECT_ID(N'[dbo].[CreditCard]'))
ALTER TABLE [dbo].[CreditCard]  WITH CHECK ADD  CONSTRAINT [FK_CreditCard_Customer] FOREIGN KEY([CustomerKey])
REFERENCES [dbo].[Customer] ([CustomerKey])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CreditCard_Customer]') AND parent_object_id = OBJECT_ID(N'[dbo].[CreditCard]'))
ALTER TABLE [dbo].[CreditCard] CHECK CONSTRAINT [FK_CreditCard_Customer]
GO
/****** Object:  ForeignKey [FK_DepositSlip_Customer]    Script Date: 11/15/2011 17:46:02 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_DepositSlip_Customer]') AND parent_object_id = OBJECT_ID(N'[dbo].[DepositSlip]'))
ALTER TABLE [dbo].[DepositSlip]  WITH CHECK ADD  CONSTRAINT [FK_DepositSlip_Customer] FOREIGN KEY([CustomerKey])
REFERENCES [dbo].[Customer] ([CustomerKey])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_DepositSlip_Customer]') AND parent_object_id = OBJECT_ID(N'[dbo].[DepositSlip]'))
ALTER TABLE [dbo].[DepositSlip] CHECK CONSTRAINT [FK_DepositSlip_Customer]
GO
/****** Object:  ForeignKey [FK_DepositStamp_Customer]    Script Date: 11/15/2011 17:46:03 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_DepositStamp_Customer]') AND parent_object_id = OBJECT_ID(N'[dbo].[DepositStamp]'))
ALTER TABLE [dbo].[DepositStamp]  WITH CHECK ADD  CONSTRAINT [FK_DepositStamp_Customer] FOREIGN KEY([CustomerKey])
REFERENCES [dbo].[Customer] ([CustomerKey])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_DepositStamp_Customer]') AND parent_object_id = OBJECT_ID(N'[dbo].[DepositStamp]'))
ALTER TABLE [dbo].[DepositStamp] CHECK CONSTRAINT [FK_DepositStamp_Customer]
GO
/****** Object:  ForeignKey [FK_Invoice_CreditCard]    Script Date: 11/15/2011 17:46:03 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Invoice_CreditCard]') AND parent_object_id = OBJECT_ID(N'[dbo].[Invoice]'))
ALTER TABLE [dbo].[Invoice]  WITH CHECK ADD  CONSTRAINT [FK_Invoice_CreditCard] FOREIGN KEY([CreditCardKey])
REFERENCES [dbo].[CreditCard] ([CreditCardKey])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Invoice_CreditCard]') AND parent_object_id = OBJECT_ID(N'[dbo].[Invoice]'))
ALTER TABLE [dbo].[Invoice] CHECK CONSTRAINT [FK_Invoice_CreditCard]
GO
/****** Object:  ForeignKey [FK_Invoice_Customer]    Script Date: 11/15/2011 17:46:03 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Invoice_Customer]') AND parent_object_id = OBJECT_ID(N'[dbo].[Invoice]'))
ALTER TABLE [dbo].[Invoice]  WITH CHECK ADD  CONSTRAINT [FK_Invoice_Customer] FOREIGN KEY([CustomerKey])
REFERENCES [dbo].[Customer] ([CustomerKey])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Invoice_Customer]') AND parent_object_id = OBJECT_ID(N'[dbo].[Invoice]'))
ALTER TABLE [dbo].[Invoice] CHECK CONSTRAINT [FK_Invoice_Customer]
GO
/****** Object:  ForeignKey [FK_Invoice_ExpediteType]    Script Date: 11/15/2011 17:46:03 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Invoice_ExpediteType]') AND parent_object_id = OBJECT_ID(N'[dbo].[Invoice]'))
ALTER TABLE [dbo].[Invoice]  WITH CHECK ADD  CONSTRAINT [FK_Invoice_ExpediteType] FOREIGN KEY([ExpediteTypeKey])
REFERENCES [dbo].[ExpediteType] ([ExpediteTypeKey])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Invoice_ExpediteType]') AND parent_object_id = OBJECT_ID(N'[dbo].[Invoice]'))
ALTER TABLE [dbo].[Invoice] CHECK CONSTRAINT [FK_Invoice_ExpediteType]
GO
/****** Object:  ForeignKey [FK_Invoice_ShippingType]    Script Date: 11/15/2011 17:46:03 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Invoice_ShippingType]') AND parent_object_id = OBJECT_ID(N'[dbo].[Invoice]'))
ALTER TABLE [dbo].[Invoice]  WITH CHECK ADD  CONSTRAINT [FK_Invoice_ShippingType] FOREIGN KEY([ShippingTypeKey])
REFERENCES [dbo].[ShippingType] ([ShippingTypeKey])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Invoice_ShippingType]') AND parent_object_id = OBJECT_ID(N'[dbo].[Invoice]'))
ALTER TABLE [dbo].[Invoice] CHECK CONSTRAINT [FK_Invoice_ShippingType]
GO
/****** Object:  ForeignKey [FK_InvoiceItem_CheckDetail]    Script Date: 11/15/2011 17:46:03 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_InvoiceItem_CheckDetail]') AND parent_object_id = OBJECT_ID(N'[dbo].[InvoiceItem]'))
ALTER TABLE [dbo].[InvoiceItem]  WITH CHECK ADD  CONSTRAINT [FK_InvoiceItem_CheckDetail] FOREIGN KEY([CheckDetailKey])
REFERENCES [dbo].[CheckDetail] ([CheckDetailKey])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_InvoiceItem_CheckDetail]') AND parent_object_id = OBJECT_ID(N'[dbo].[InvoiceItem]'))
ALTER TABLE [dbo].[InvoiceItem] CHECK CONSTRAINT [FK_InvoiceItem_CheckDetail]
GO
/****** Object:  ForeignKey [FK_InvoiceItem_DepositSlip]    Script Date: 11/15/2011 17:46:03 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_InvoiceItem_DepositSlip]') AND parent_object_id = OBJECT_ID(N'[dbo].[InvoiceItem]'))
ALTER TABLE [dbo].[InvoiceItem]  WITH CHECK ADD  CONSTRAINT [FK_InvoiceItem_DepositSlip] FOREIGN KEY([DepositSlipKey])
REFERENCES [dbo].[DepositSlip] ([DepositSlipKey])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_InvoiceItem_DepositSlip]') AND parent_object_id = OBJECT_ID(N'[dbo].[InvoiceItem]'))
ALTER TABLE [dbo].[InvoiceItem] CHECK CONSTRAINT [FK_InvoiceItem_DepositSlip]
GO
/****** Object:  ForeignKey [FK_InvoiceItem_DepositStamp]    Script Date: 11/15/2011 17:46:03 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_InvoiceItem_DepositStamp]') AND parent_object_id = OBJECT_ID(N'[dbo].[InvoiceItem]'))
ALTER TABLE [dbo].[InvoiceItem]  WITH CHECK ADD  CONSTRAINT [FK_InvoiceItem_DepositStamp] FOREIGN KEY([DepositStampKey])
REFERENCES [dbo].[DepositStamp] ([DepositStampKey])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_InvoiceItem_DepositStamp]') AND parent_object_id = OBJECT_ID(N'[dbo].[InvoiceItem]'))
ALTER TABLE [dbo].[InvoiceItem] CHECK CONSTRAINT [FK_InvoiceItem_DepositStamp]
GO
/****** Object:  ForeignKey [FK_InvoiceItem_Invoice]    Script Date: 11/15/2011 17:46:03 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_InvoiceItem_Invoice]') AND parent_object_id = OBJECT_ID(N'[dbo].[InvoiceItem]'))
ALTER TABLE [dbo].[InvoiceItem]  WITH CHECK ADD  CONSTRAINT [FK_InvoiceItem_Invoice] FOREIGN KEY([InvoiceKey])
REFERENCES [dbo].[Invoice] ([InvoiceKey])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_InvoiceItem_Invoice]') AND parent_object_id = OBJECT_ID(N'[dbo].[InvoiceItem]'))
ALTER TABLE [dbo].[InvoiceItem] CHECK CONSTRAINT [FK_InvoiceItem_Invoice]
GO
/****** Object:  ForeignKey [FK_InvoiceItem_Product]    Script Date: 11/15/2011 17:46:03 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_InvoiceItem_Product]') AND parent_object_id = OBJECT_ID(N'[dbo].[InvoiceItem]'))
ALTER TABLE [dbo].[InvoiceItem]  WITH CHECK ADD  CONSTRAINT [FK_InvoiceItem_Product] FOREIGN KEY([ProductKey])
REFERENCES [dbo].[Product] ([ProductKey])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_InvoiceItem_Product]') AND parent_object_id = OBJECT_ID(N'[dbo].[InvoiceItem]'))
ALTER TABLE [dbo].[InvoiceItem] CHECK CONSTRAINT [FK_InvoiceItem_Product]
GO
/****** Object:  ForeignKey [FK_Product_ProductType]    Script Date: 11/15/2011 17:46:03 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Product_ProductType]') AND parent_object_id = OBJECT_ID(N'[dbo].[Product]'))
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_ProductType] FOREIGN KEY([ProductTypeKey])
REFERENCES [dbo].[ProductType] ([ProductTypeKey])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Product_ProductType]') AND parent_object_id = OBJECT_ID(N'[dbo].[Product]'))
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_ProductType]
GO
/****** Object:  ForeignKey [FK_ProductType_ProductCategory]    Script Date: 11/15/2011 17:46:03 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ProductType_ProductCategory]') AND parent_object_id = OBJECT_ID(N'[dbo].[ProductType]'))
ALTER TABLE [dbo].[ProductType]  WITH CHECK ADD  CONSTRAINT [FK_ProductType_ProductCategory] FOREIGN KEY([ProductCategoryKey])
REFERENCES [dbo].[ProductCategory] ([ProductCategoryKey])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ProductType_ProductCategory]') AND parent_object_id = OBJECT_ID(N'[dbo].[ProductType]'))
ALTER TABLE [dbo].[ProductType] CHECK CONSTRAINT [FK_ProductType_ProductCategory]
GO
/****** Object:  ForeignKey [FK_ProductType_ShippingRateGroup]    Script Date: 11/15/2011 17:46:03 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ProductType_ShippingRateGroup]') AND parent_object_id = OBJECT_ID(N'[dbo].[ProductType]'))
ALTER TABLE [dbo].[ProductType]  WITH CHECK ADD  CONSTRAINT [FK_ProductType_ShippingRateGroup] FOREIGN KEY([ShippingRateGroupKey])
REFERENCES [dbo].[ShippingRateGroup] ([ShippingRateGroupKey])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ProductType_ShippingRateGroup]') AND parent_object_id = OBJECT_ID(N'[dbo].[ProductType]'))
ALTER TABLE [dbo].[ProductType] CHECK CONSTRAINT [FK_ProductType_ShippingRateGroup]
GO
/****** Object:  ForeignKey [FK_ProductTypeCheckOptionXRef_CheckFeatureOption]    Script Date: 11/15/2011 17:46:03 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ProductTypeCheckOptionXRef_CheckFeatureOption]') AND parent_object_id = OBJECT_ID(N'[dbo].[ProductTypeCheckOptionXRef]'))
ALTER TABLE [dbo].[ProductTypeCheckOptionXRef]  WITH CHECK ADD  CONSTRAINT [FK_ProductTypeCheckOptionXRef_CheckFeatureOption] FOREIGN KEY([CheckFeatureOptionKey])
REFERENCES [dbo].[CheckFeatureOption] ([CheckFeatureOptionKey])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ProductTypeCheckOptionXRef_CheckFeatureOption]') AND parent_object_id = OBJECT_ID(N'[dbo].[ProductTypeCheckOptionXRef]'))
ALTER TABLE [dbo].[ProductTypeCheckOptionXRef] CHECK CONSTRAINT [FK_ProductTypeCheckOptionXRef_CheckFeatureOption]
GO
/****** Object:  ForeignKey [FK_ProductTypeCheckOptionXRef_ProductType]    Script Date: 11/15/2011 17:46:03 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ProductTypeCheckOptionXRef_ProductType]') AND parent_object_id = OBJECT_ID(N'[dbo].[ProductTypeCheckOptionXRef]'))
ALTER TABLE [dbo].[ProductTypeCheckOptionXRef]  WITH CHECK ADD  CONSTRAINT [FK_ProductTypeCheckOptionXRef_ProductType] FOREIGN KEY([ProductTypeKey])
REFERENCES [dbo].[ProductType] ([ProductTypeKey])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ProductTypeCheckOptionXRef_ProductType]') AND parent_object_id = OBJECT_ID(N'[dbo].[ProductTypeCheckOptionXRef]'))
ALTER TABLE [dbo].[ProductTypeCheckOptionXRef] CHECK CONSTRAINT [FK_ProductTypeCheckOptionXRef_ProductType]
GO
/****** Object:  ForeignKey [FK_ShippingZoneRate_ShippingRateGroup]    Script Date: 11/15/2011 17:46:03 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ShippingZoneRate_ShippingRateGroup]') AND parent_object_id = OBJECT_ID(N'[dbo].[ShippingZoneRate]'))
ALTER TABLE [dbo].[ShippingZoneRate]  WITH CHECK ADD  CONSTRAINT [FK_ShippingZoneRate_ShippingRateGroup] FOREIGN KEY([ShippingRateGroupKey])
REFERENCES [dbo].[ShippingRateGroup] ([ShippingRateGroupKey])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ShippingZoneRate_ShippingRateGroup]') AND parent_object_id = OBJECT_ID(N'[dbo].[ShippingZoneRate]'))
ALTER TABLE [dbo].[ShippingZoneRate] CHECK CONSTRAINT [FK_ShippingZoneRate_ShippingRateGroup]
GO
/****** Object:  ForeignKey [FK_ShippingZoneRate_ShippingRateType]    Script Date: 11/15/2011 17:46:03 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ShippingZoneRate_ShippingRateType]') AND parent_object_id = OBJECT_ID(N'[dbo].[ShippingZoneRate]'))
ALTER TABLE [dbo].[ShippingZoneRate]  WITH CHECK ADD  CONSTRAINT [FK_ShippingZoneRate_ShippingRateType] FOREIGN KEY([ShippingRateTypeKey])
REFERENCES [dbo].[ShippingRateType] ([ShippingRateTypeKey])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ShippingZoneRate_ShippingRateType]') AND parent_object_id = OBJECT_ID(N'[dbo].[ShippingZoneRate]'))
ALTER TABLE [dbo].[ShippingZoneRate] CHECK CONSTRAINT [FK_ShippingZoneRate_ShippingRateType]
GO
/****** Object:  ForeignKey [FK_ShippingZoneRate_ShippingZone]    Script Date: 11/15/2011 17:46:03 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ShippingZoneRate_ShippingZone]') AND parent_object_id = OBJECT_ID(N'[dbo].[ShippingZoneRate]'))
ALTER TABLE [dbo].[ShippingZoneRate]  WITH CHECK ADD  CONSTRAINT [FK_ShippingZoneRate_ShippingZone] FOREIGN KEY([ShippingZoneKey])
REFERENCES [dbo].[ShippingZone] ([ShippingZoneKey])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ShippingZoneRate_ShippingZone]') AND parent_object_id = OBJECT_ID(N'[dbo].[ShippingZoneRate]'))
ALTER TABLE [dbo].[ShippingZoneRate] CHECK CONSTRAINT [FK_ShippingZoneRate_ShippingZone]
GO
/****** Object:  ForeignKey [FK_State_ShippingZone]    Script Date: 11/15/2011 17:46:03 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_State_ShippingZone]') AND parent_object_id = OBJECT_ID(N'[dbo].[State]'))
ALTER TABLE [dbo].[State]  WITH CHECK ADD  CONSTRAINT [FK_State_ShippingZone] FOREIGN KEY([ShippingZoneKey])
REFERENCES [dbo].[ShippingZone] ([ShippingZoneKey])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_State_ShippingZone]') AND parent_object_id = OBJECT_ID(N'[dbo].[State]'))
ALTER TABLE [dbo].[State] CHECK CONSTRAINT [FK_State_ShippingZone]
GO
