using System;
using System.Data;
using System.Data.SqlClient;
using AdvLaser.AdvLaserObjects;
using System.Collections;


namespace AdvLaser.AdvLaserDataAccess
{

     public static class CreditCardTypeDataAccess
     {
          public static int SaveCreditCardType(CreditCardType aCreditCardType)
          {
               if(aCreditCardType.CreditCardTypeKey == 0)
               {
                    return createNewCreditCardType(aCreditCardType);
               }
               else
               {
                    return updateCreditCardType(aCreditCardType);
               }
          }

          public static SqlCommand SaveCreditCardTypeCommand(CreditCardType aCreditCardType)
          {
               if(aCreditCardType.CreditCardTypeKey == 0)
               {
                    return createNewCreditCardTypeCommand(aCreditCardType);
               }
               else
               {
                    return createUpdateCreditCardTypeCommand(aCreditCardType);
               }
          }

          public static CreditCardType GetOne(int aCreditCardTypeKey)
          {
               SqlCommand sqlCmd = new SqlCommand();

               BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@Id", SqlDbType.Int, 0, ParameterDirection.Input, aCreditCardTypeKey);
               BaseDataAccess.SetCommandType( sqlCmd, CommandType.StoredProcedure, "CreditCardType_GetOne");
               BaseDataAccess.GenerateObjectFromReader sqlData = new BaseDataAccess.GenerateObjectFromReader (CreateCreditCardType);
               CreditCardType aCreditCardType = (CreditCardType) BaseDataAccess.ExecuteObjectReader(sqlCmd, sqlData);
               return aCreditCardType;
          }

          public static Object CreateCreditCardType (SqlDataReader returnData)
          {
               CreditCardType aCreditCardType = null;

               while (returnData.Read()) 
               {
                    aCreditCardType = new CreditCardType();
                    aCreditCardType.CreditCardTypeKey = (int)returnData["CreditCardTypeKey"];
                    aCreditCardType.Description = (string)returnData["Description"];
               }
               return aCreditCardType;
          }

          private static int createNewCreditCardType(CreditCardType aCreditCardType)
          {

               SqlCommand sqlCmd = createNewCreditCardTypeCommand(aCreditCardType);

               BaseDataAccess.ExecuteScalarCmd(sqlCmd);
               return ((int)sqlCmd.Parameters["@retval"].Value); 
          }

          private static SqlCommand createNewCreditCardTypeCommand(CreditCardType aCreditCardType)
          {

               SqlCommand sqlCmd = new SqlCommand();

               BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@Description", SqlDbType.VarChar, 100, ParameterDirection.Input, aCreditCardType.Description);
               BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@retval", SqlDbType.Int, 0, ParameterDirection.Output, null);
               BaseDataAccess.SetCommandType(sqlCmd,CommandType.StoredProcedure, "CreditCardType_Create");
               return sqlCmd;
          }

          private static SqlCommand createUpdateCreditCardTypeCommand(CreditCardType aCreditCardType)
          {

               SqlCommand sqlCmd = new SqlCommand();

               BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@ID", SqlDbType.Int, 0, ParameterDirection.Input, aCreditCardType.CreditCardTypeKey);
               BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@Description", SqlDbType.VarChar, 100, ParameterDirection.Input, aCreditCardType.Description);
               BaseDataAccess.SetCommandType(sqlCmd,CommandType.StoredProcedure, "CreditCardType_Update");
               return sqlCmd;
          }
          private static int updateCreditCardType(CreditCardType aCreditCardType)
          {

               SqlCommand sqlCmd = createUpdateCreditCardTypeCommand(aCreditCardType);

               BaseDataAccess.ExecuteScalarCmd(sqlCmd);
               return aCreditCardType.CreditCardTypeKey;
          }

          public static ArrayList GetCreditCardTypeList()
          {
              string aSQL = "select creditcardtypekey, description from creditcardtype order by description";
              ArrayList list = new ArrayList();
              SqlCommand sqlCmd = new SqlCommand();
              BaseDataAccess.SetCommandType(sqlCmd, CommandType.Text, aSQL);
              using (SqlConnection cn = new SqlConnection(BaseDataAccess.ConnectionString))
              {
                  sqlCmd.Connection = cn;
                  cn.Open();
                  SqlDataReader reader = sqlCmd.ExecuteReader();

                  CreditCardType aCreditCardType = null;

                  while (reader.Read())
                  {
                      aCreditCardType = new CreditCardType();
                      aCreditCardType.CreditCardTypeKey = (int)reader["CreditCardTypeKey"];
                      aCreditCardType.Description = (string)reader["Description"];
                      list.Add(aCreditCardType);
                  }


              }
              return list;
          }
     }
}
