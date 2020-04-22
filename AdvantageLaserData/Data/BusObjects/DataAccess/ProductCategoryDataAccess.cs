using System;
using System.Data;
using System.Data.SqlClient;
using AdvLaser.AdvLaserObjects;


namespace AdvLaser.AdvLaserDataAccess
{

     public static class ProductCategoryDataAccess
     {
          public static int SaveProductCategory(ProductCategory aProductCategory)
          {
               if(aProductCategory.ProductCategoryKey == 0)
               {
                    return createNewProductCategory(aProductCategory);
               }
               else
               {
                    return updateProductCategory(aProductCategory);
               }
          }

          public static SqlCommand SaveProductCategoryCommand(ProductCategory aProductCategory)
          {
               if(aProductCategory.ProductCategoryKey == 0)
               {
                    return createNewProductCategoryCommand(aProductCategory);
               }
               else
               {
                    return createUpdateProductCategoryCommand(aProductCategory);
               }
          }

          public static ProductCategory GetOne(int aProductCategoryKey)
          {
               SqlCommand sqlCmd = new SqlCommand();

               BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@Id", SqlDbType.Int, 0, ParameterDirection.Input, aProductCategoryKey);
               BaseDataAccess.SetCommandType( sqlCmd, CommandType.StoredProcedure, "ProductCategory_GetOne");
               BaseDataAccess.GenerateObjectFromReader sqlData = new BaseDataAccess.GenerateObjectFromReader (CreateProductCategory);
               ProductCategory aProductCategory = (ProductCategory) BaseDataAccess.ExecuteObjectReader(sqlCmd, sqlData);
               return aProductCategory;
          }

          public static Object CreateProductCategory (SqlDataReader returnData)
          {
               ProductCategory aProductCategory = null;

               while (returnData.Read()) 
               {
                    aProductCategory = new ProductCategory();
                    aProductCategory.ProductCategoryKey = (int)returnData["ProductCategoryKey"];
                    aProductCategory.Description = (string)returnData["Description"];
               }
               return aProductCategory;
          }

          private static int createNewProductCategory(ProductCategory aProductCategory)
          {

               SqlCommand sqlCmd = createNewProductCategoryCommand(aProductCategory);

               BaseDataAccess.ExecuteScalarCmd(sqlCmd);
               return ((int)sqlCmd.Parameters["@retval"].Value); 
          }

          private static SqlCommand createNewProductCategoryCommand(ProductCategory aProductCategory)
          {

               SqlCommand sqlCmd = new SqlCommand();

               BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@Description", SqlDbType.VarChar,100 , ParameterDirection.Input, aProductCategory.Description);
               BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@retval", SqlDbType.Int, 0, ParameterDirection.Output, null);
               BaseDataAccess.SetCommandType(sqlCmd,CommandType.StoredProcedure, "ProductCategory_Create");
               return sqlCmd;
          }

          private static SqlCommand createUpdateProductCategoryCommand(ProductCategory aProductCategory)
          {

               SqlCommand sqlCmd = new SqlCommand();

               BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@ID", SqlDbType.Int, 0, ParameterDirection.Input, aProductCategory.ProductCategoryKey);
               BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@Description", SqlDbType.VarChar,100 , ParameterDirection.Input, aProductCategory.Description);
               BaseDataAccess.SetCommandType(sqlCmd,CommandType.StoredProcedure, "ProductCategory_Update");
               return sqlCmd;
          }
          private static int updateProductCategory(ProductCategory aProductCategory)
          {

               SqlCommand sqlCmd = createUpdateProductCategoryCommand(aProductCategory);

               BaseDataAccess.ExecuteScalarCmd(sqlCmd);
               return aProductCategory.ProductCategoryKey;
          }
     }
}
