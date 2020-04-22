using System;
using System.Data;
using System.Data.SqlClient;
using AdvLaser.AdvLaserObjects;
using System.Collections;
using AdvantageLaserData.Data.DataUtils;


namespace AdvLaser.AdvLaserDataAccess
{

     public static class ProductTypeDataAccess
     {
          public static int SaveProductType(ProductType aProductType)
          {
               if(aProductType.ProductTypeKey == 0)
               {
                    return createNewProductType(aProductType);
               }
               else
               {
                    return updateProductType(aProductType);
               }
          }

          public static SqlCommand SaveProductTypeCommand(ProductType aProductType)
          {
               if(aProductType.ProductTypeKey == 0)
               {
                    return createNewProductTypeCommand(aProductType);
               }
               else
               {
                    return createUpdateProductTypeCommand(aProductType);
               }
          }

          public static ProductType GetOne(int aProductTypeKey)
          {
               SqlCommand sqlCmd = new SqlCommand();

               BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@Id", SqlDbType.Int, 0, ParameterDirection.Input, aProductTypeKey);
               BaseDataAccess.SetCommandType( sqlCmd, CommandType.StoredProcedure, "ProductType_GetOne");
               BaseDataAccess.GenerateObjectFromReader sqlData = new BaseDataAccess.GenerateObjectFromReader (CreateProductType);
               ProductType aProductType = (ProductType) BaseDataAccess.ExecuteObjectReader(sqlCmd, sqlData);
               return aProductType;
          }

          public static Object CreateProductType (SqlDataReader returnData)
          {
               ProductType aProductType = null;

               while (returnData.Read()) 
               {
                    aProductType = new ProductType();
                    aProductType.ProductTypeKey = (int)returnData["ProductTypeKey"];
                    aProductType.ProductCategoryKey = (int)returnData["ProductCategoryKey"];
                    aProductType.Description = (string)returnData["Description"];
                    aProductType.ShippingRateGroupKey = DataUtils.GetIntValue(returnData["ShippingRateGroupKey"]);
                    aProductType.EnvelopeCompatibilityKey = DataUtils.GetIntValue(returnData["EnvelopeCompatibilityKey"]);
               }
               return aProductType;
          }

          private static int createNewProductType(ProductType aProductType)
          {

               SqlCommand sqlCmd = createNewProductTypeCommand(aProductType);

               BaseDataAccess.ExecuteScalarCmd(sqlCmd);
               return ((int)sqlCmd.Parameters["@retval"].Value); 
          }

          private static SqlCommand createNewProductTypeCommand(ProductType aProductType)
          {

               SqlCommand sqlCmd = new SqlCommand();

               BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@ProductCategoryKey", SqlDbType.Int, 0, ParameterDirection.Input, aProductType.ProductCategoryKey);
               BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@Description", SqlDbType.VarChar,100 , ParameterDirection.Input, aProductType.Description);
               BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@ShippingRateGroupKey", SqlDbType.Int, 0, ParameterDirection.Input, aProductType.ShippingRateGroupKey);
               BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@retval", SqlDbType.Int, 0, ParameterDirection.Output, null);
               BaseDataAccess.SetCommandType(sqlCmd,CommandType.StoredProcedure, "ProductType_Create");
               return sqlCmd;
          }

          private static SqlCommand createUpdateProductTypeCommand(ProductType aProductType)
          {

               SqlCommand sqlCmd = new SqlCommand();

               BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@ID", SqlDbType.Int, 0, ParameterDirection.Input, aProductType.ProductTypeKey);
               BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@ProductCategoryKey", SqlDbType.Int, 0, ParameterDirection.Input, aProductType.ProductCategoryKey);
               BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@Description", SqlDbType.VarChar,100 , ParameterDirection.Input, aProductType.Description);
               BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@ShippingRateGroupKey", SqlDbType.Int, 0, ParameterDirection.Input, aProductType.ShippingRateGroupKey);
               BaseDataAccess.SetCommandType(sqlCmd,CommandType.StoredProcedure, "ProductType_Update");
               return sqlCmd;
          }
          private static int updateProductType(ProductType aProductType)
          {

               SqlCommand sqlCmd = createUpdateProductTypeCommand(aProductType);

               BaseDataAccess.ExecuteScalarCmd(sqlCmd);
               return aProductType.ProductTypeKey;
          }

          public static ArrayList GetProductTypeList(string aSQL)
          {
              ArrayList list = new ArrayList();
              SqlCommand sqlCmd = new SqlCommand();
              BaseDataAccess.SetCommandType(sqlCmd, CommandType.Text, aSQL);
              using (SqlConnection cn = new SqlConnection(BaseDataAccess.ConnectionString))
              {
                  sqlCmd.Connection = cn;
                  cn.Open();
                  SqlDataReader reader = sqlCmd.ExecuteReader();

                  ProductType aProductType = null;

                  while (reader.Read())
                  {
                      aProductType = new ProductType();
                      aProductType.ProductTypeKey = (int)reader["ProductTypeKey"];
                      aProductType.ProductCategoryKey = (int)reader["ProductCategoryKey"];
                      aProductType.Description = (string)reader["Description"];
                      aProductType.ShippingRateGroupKey = (int)reader["ShippingRateGroupKey"];
                      aProductType.EnvelopeCompatibilityKey = DataUtils.GetIntValue(reader["EnvelopeCompatibilityKey"]);
                      list.Add(aProductType);
                  }
              }
              return list;
          }
     }
}
