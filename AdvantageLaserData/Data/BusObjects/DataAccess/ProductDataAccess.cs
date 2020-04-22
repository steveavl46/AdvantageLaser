using System;
using System.Data;
using System.Collections;
using System.Data.SqlClient;
using AdvLaser.AdvLaserObjects;
using AdvantageLaserData.Data.DataUtils;


namespace AdvLaser.AdvLaserDataAccess  
{

    public static class ProductDataAccess 
     {
        private class ProductList : CollectionBase
        {

        }

          public static int SaveProduct(Product aProduct)
          {
               if(aProduct.ProductKey == 0)
               {
                    return createNewProduct(aProduct);
               }
               else
               {
                    return updateProduct(aProduct);
               }
          }

          public static SqlCommand SaveProductCommand(Product aProduct)
          {
               if(aProduct.ProductKey == 0)
               {
                    return createNewProductCommand(aProduct);
               }
               else
               {
                    return createUpdateProductCommand(aProduct);
               }
          }

          public static Product GetOne(int aProductKey)
          {
               SqlCommand sqlCmd = new SqlCommand();

               BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@Id", SqlDbType.Int, 0, ParameterDirection.Input, aProductKey);
               BaseDataAccess.SetCommandType( sqlCmd, CommandType.StoredProcedure, "Product_GetOne");
               BaseDataAccess.GenerateObjectFromReader sqlData = new BaseDataAccess.GenerateObjectFromReader (CreateProduct);
               Product aProduct = (Product) BaseDataAccess.ExecuteObjectReader(sqlCmd, sqlData);
               return aProduct;
          }

          public static ArrayList GetProductList(string aSQL)
          {
              ArrayList list = new ArrayList();
              SqlCommand sqlCmd = new SqlCommand();
              BaseDataAccess.SetCommandType(sqlCmd, CommandType.Text, aSQL);
              using (SqlConnection cn = new SqlConnection(BaseDataAccess.ConnectionString))
              {
                  sqlCmd.Connection = cn;
                  cn.Open();
                  SqlDataReader reader = sqlCmd.ExecuteReader();

                      Product aProduct = null;

                      while (reader.Read())
                      {
                          aProduct = new Product();
                          aProduct.ProductKey = (int)reader["ProductKey"];
                          aProduct.ProductTypeKey = (int)reader["ProductTypeKey"];
                          aProduct.Description = (string)reader["Description"];
                          aProduct.Price = (decimal)reader["Price"];
                          aProduct.ShippingRate = DataUtils.GetDecimalValue(reader["ShippingRate"]);
                          aProduct.ColorSurcharge = DataUtils.GetDecimalValue(reader["ColorSurcharge"]);
                          aProduct.Quantity = (int)reader["Quantity"];
                          list.Add(aProduct);
                      }


              }
              return list;
          }

          public static Object CreateProduct (SqlDataReader returnData)
          {
               Product aProduct = null;

               while (returnData.Read()) 
               {
                    aProduct = new Product();
                    aProduct.ProductKey = (int)returnData["ProductKey"];
                    aProduct.ProductTypeKey = (int)returnData["ProductTypeKey"];
                    aProduct.Description = (string)returnData["Description"];
                    aProduct.Price = (decimal)returnData["Price"];
                    aProduct.ShippingRate = DataUtils.GetDecimalValue(returnData["ShippingRate"]);
                    aProduct.ColorSurcharge = DataUtils.GetDecimalValue(returnData["ColorSurcharge"]);
                    aProduct.Quantity = (int)returnData["Quantity"];
               }
               return aProduct;
          }


          private static int createNewProduct(Product aProduct)
          {

               SqlCommand sqlCmd = createNewProductCommand(aProduct);

               BaseDataAccess.ExecuteScalarCmd(sqlCmd);
               return ((int)sqlCmd.Parameters["@retval"].Value); 
          }

          private static SqlCommand createNewProductCommand(Product aProduct)
          {

               SqlCommand sqlCmd = new SqlCommand();

               BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@ProductTypeKey", SqlDbType.Int, 0, ParameterDirection.Input, aProduct.ProductTypeKey);
               BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@Description", SqlDbType.VarChar, 100, ParameterDirection.Input, aProduct.Description);
               BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@Price",SqlDbType.Float,18, ParameterDirection.Input, aProduct.Price);
               BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@ShippingRate", SqlDbType.Float, 18, ParameterDirection.Input, aProduct.ShippingRate);
               BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@Quantity",SqlDbType.Int,0, ParameterDirection.Input, aProduct.Quantity);
               BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@ColorSurcharge", SqlDbType.Float, 18, ParameterDirection.Input, aProduct.ColorSurcharge);
               BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@retval", SqlDbType.Int, 0, ParameterDirection.Output, null);
               BaseDataAccess.SetCommandType(sqlCmd,CommandType.StoredProcedure, "Product_Create");
               return sqlCmd;
          }

          private static SqlCommand createUpdateProductCommand(Product aProduct)
          {

               SqlCommand sqlCmd = new SqlCommand();

               BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@ID", SqlDbType.Int, 0, ParameterDirection.Input, aProduct.ProductKey);
               BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@ProductTypeKey", SqlDbType.Int, 0, ParameterDirection.Input, aProduct.ProductTypeKey);
               BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@Description", SqlDbType.VarChar,100 , ParameterDirection.Input, aProduct.Description);
               BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@Price", SqlDbType.Float, 18, ParameterDirection.Input, aProduct.Price);
               BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@ShippingRate", SqlDbType.Float, 18, ParameterDirection.Input, aProduct.ShippingRate);
               BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@Quantity", SqlDbType.Int, 0, ParameterDirection.Input, aProduct.Quantity);
               BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@ColorSurcharge", SqlDbType.Float, 18, ParameterDirection.Input, aProduct.ColorSurcharge);
               BaseDataAccess.SetCommandType(sqlCmd,CommandType.StoredProcedure, "Product_Update");
               return sqlCmd;
          }
          private static int updateProduct(Product aProduct)
          {

               SqlCommand sqlCmd = createUpdateProductCommand(aProduct);

               BaseDataAccess.ExecuteScalarCmd(sqlCmd);
               return aProduct.ProductKey;
          }
     }
}
