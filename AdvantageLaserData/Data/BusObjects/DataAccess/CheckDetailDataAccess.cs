using System;
using System.Data;
using System.Data.SqlClient;
using AdvLaser.AdvLaserObjects;


namespace AdvLaser.AdvLaserDataAccess
{

     public static class CheckDetailDataAccess
     {
          public static int SaveCheckDetail(CheckDetail aCheckDetail)
          {
               if(aCheckDetail.CheckDetailKey == 0)
               {
                    return createNewCheckDetail(aCheckDetail);
               }
               else
               {
                    return updateCheckDetail(aCheckDetail);
               }
          }

          public static SqlCommand SaveCheckDetailCommand(CheckDetail aCheckDetail)
          {
               if(aCheckDetail.CheckDetailKey == 0)
               {
                    return createNewCheckDetailCommand(aCheckDetail);
               }
               else
               {
                    return createUpdateCheckDetailCommand(aCheckDetail);
               }
          }

          public static CheckDetail GetOne(int aCheckDetailKey)
          {
               SqlCommand sqlCmd = new SqlCommand();

               BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@Id", SqlDbType.Int, 0, ParameterDirection.Input, aCheckDetailKey);
               BaseDataAccess.SetCommandType( sqlCmd, CommandType.StoredProcedure, "CheckDetail_GetOne");
               BaseDataAccess.GenerateObjectFromReader sqlData = new BaseDataAccess.GenerateObjectFromReader (CreateCheckDetail);
               CheckDetail aCheckDetail = (CheckDetail) BaseDataAccess.ExecuteObjectReader(sqlCmd, sqlData);
               return aCheckDetail;
          }

          public static Object CreateCheckDetail (SqlDataReader returnData)
          {
               CheckDetail aCheckDetail = null;

               while (returnData.Read()) 
               {
                    aCheckDetail = new CheckDetail();
                    aCheckDetail.CheckDetailKey = BaseDataAccess.GetInt(returnData["CheckDetailKey"]);
                    aCheckDetail.CustomerKey = BaseDataAccess.GetInt(returnData["CustomerKey"]);
                    aCheckDetail.Line1 = BaseDataAccess.GetString(returnData["Line1"]);
                    aCheckDetail.Line2 = BaseDataAccess.GetString(returnData["Line2"]);
                    aCheckDetail.Line3 = BaseDataAccess.GetString(returnData["Line3"]);
                    aCheckDetail.Line4 = BaseDataAccess.GetString(returnData["Line4"]);
                    aCheckDetail.Line5 = BaseDataAccess.GetString(returnData["Line5"]);
                    aCheckDetail.BankAccountNumber = BaseDataAccess.GetString(returnData["BankAccountNumber"]);
                    aCheckDetail.RoutingNumber = BaseDataAccess.GetString(returnData["RoutingNumber"]);
                    aCheckDetail.BankInfoLine1 = BaseDataAccess.GetString(returnData["BankInfoLine1"]);
                    aCheckDetail.BankInfoLine2 = BaseDataAccess.GetString(returnData["BankInfoLine2"]);
                    aCheckDetail.BankInfoLine3 = BaseDataAccess.GetString(returnData["BankInfoLine3"]);
                    aCheckDetail.CheckColorKey = BaseDataAccess.GetInt(returnData["CheckColorKey"]);
                    aCheckDetail.PrintLines = (bool)returnData["PrintLines"];
                    aCheckDetail.SignatureLineCount = BaseDataAccess.GetInt(returnData["SignatureLineCount"]);
                    aCheckDetail.MessageAboveSignature = BaseDataAccess.GetString(returnData["MessageAboveSignature"]);
                    aCheckDetail.PrintPaymentRecordOnStub = (bool)returnData["PrintPaymentRecordOnStub"];
                    aCheckDetail.CheckStubLineKey = BaseDataAccess.GetInt(returnData["CheckStubLineKey"]);
                    aCheckDetail.Line1FontWeightKey = BaseDataAccess.GetInt(returnData["Line1FontWeightKey"]);
                    aCheckDetail.Line2FontWeightKey = BaseDataAccess.GetInt(returnData["Line2FontWeightKey"]);
                    aCheckDetail.TextAlignKey = BaseDataAccess.GetInt(returnData["TextAlignKey"]);
                    aCheckDetail.TypeFaceKey = BaseDataAccess.GetInt(returnData["TypeFaceKey"]);
                    aCheckDetail.Fraction = BaseDataAccess.GetString(returnData["Fraction"]);
                    aCheckDetail.UseLogo = (bool)returnData["UseLogo"];
                    aCheckDetail.StartingNumber = BaseDataAccess.GetString(returnData["StartingNumber"]);
                    aCheckDetail.Approved = (bool)returnData["Approved"];
                    aCheckDetail.LogoPath = BaseDataAccess.GetString(returnData["LogoPath"]);
                    aCheckDetail.PreviewPath = BaseDataAccess.GetString(returnData["PreviewPath"]);
                    aCheckDetail.LogoWidth = BaseDataAccess.GetInt(returnData["LogoWidth"]);
                    aCheckDetail.LogoHeight = BaseDataAccess.GetInt(returnData["LogoHeight"]);
                    aCheckDetail.CheckOrderKey = BaseDataAccess.GetInt(returnData["CheckOrderKey"]);
                    aCheckDetail.LogoLeftPosition = BaseDataAccess.GetInt(returnData["LogoLeftPosition"]);
                    aCheckDetail.LogoVerticalPosition = BaseDataAccess.GetInt(returnData["LogoVerticalPosition"]);
                    aCheckDetail.AddressBlockLeftPosition = BaseDataAccess.GetInt(returnData["AddressBlockLeftPosition"]);
                    aCheckDetail.AddressBlockVerticalPosition = BaseDataAccess.GetInt(returnData["AddressBlockVerticalPosition"]);
                    aCheckDetail.LogoLeftAdjustment = BaseDataAccess.GetInt(returnData["LogoLeftAdjustment"]);
                    aCheckDetail.LogoVerticalAdjustment = BaseDataAccess.GetInt(returnData["LogoVerticalAdjustment"]);
                    aCheckDetail.AddressBlockLeftAdjustment = BaseDataAccess.GetInt(returnData["AddressBlockLeftAdjustment"]);
                    aCheckDetail.AddressBlockVerticalAdjustment = BaseDataAccess.GetInt(returnData["AddressBlockVerticalAdjustment"]);
                    aCheckDetail.SuppressLine1 = (bool)returnData["SuppressLine1"];
                    aCheckDetail.LogoLocationKey = BaseDataAccess.GetInt(returnData["LogoLocationKey"]);
                    aCheckDetail.SizedLogoName = BaseDataAccess.GetString(returnData["SizedLogoName"]);
                    aCheckDetail.ColorLogo = (bool)returnData["ColorLogo"];
                    aCheckDetail.ShowCheckNo = (bool)returnData["ShowCheckNo"];
                    aCheckDetail.AcctNumber = (byte[])returnData["AcctNumber"];
                    aCheckDetail.RNumber = (byte[])returnData["RNumber"];
                    aCheckDetail.Preview = (byte[])returnData["Preview"];
                //aCheckDetail.Logo = (byte[])returnData["Logo"];
            }
               return aCheckDetail;
          }

          private static int createNewCheckDetail(CheckDetail aCheckDetail)
          {

               SqlCommand sqlCmd = createNewCheckDetailCommand(aCheckDetail);

               BaseDataAccess.ExecuteScalarCmd(sqlCmd);
               return ((int)sqlCmd.Parameters["@retval"].Value); 
          }

          private static SqlCommand createNewCheckDetailCommand(CheckDetail aCheckDetail)
          {

               SqlCommand sqlCmd = new SqlCommand();

               BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@CustomerKey", SqlDbType.Int, 0, ParameterDirection.Input, aCheckDetail.CustomerKey);
               BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@Line1", SqlDbType.VarChar, 35, ParameterDirection.Input, aCheckDetail.Line1);
               BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@Line2", SqlDbType.VarChar, 35, ParameterDirection.Input, aCheckDetail.Line2);
               BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@Line3", SqlDbType.VarChar, 35, ParameterDirection.Input, aCheckDetail.Line3);
               BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@Line4", SqlDbType.VarChar, 35, ParameterDirection.Input, aCheckDetail.Line4);
               BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@Line5", SqlDbType.VarChar, 35, ParameterDirection.Input, aCheckDetail.Line5);
               BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@BankAccountNumber", SqlDbType.VarChar, 35, ParameterDirection.Input, String.Empty);
               BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@RoutingNumber", SqlDbType.VarChar, 35, ParameterDirection.Input, String.Empty);
               BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@BankInfoLine1", SqlDbType.VarChar, 35, ParameterDirection.Input, aCheckDetail.BankInfoLine1);
               BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@BankInfoLine2", SqlDbType.VarChar, 35, ParameterDirection.Input, aCheckDetail.BankInfoLine2);
               BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@BankInfoLine3", SqlDbType.VarChar, 35, ParameterDirection.Input, aCheckDetail.BankInfoLine3);               
               BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@CheckColorKey", SqlDbType.Int, 0, ParameterDirection.Input, aCheckDetail.CheckColorKey);
               BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@PrintLines", SqlDbType.Bit, 0, ParameterDirection.Input, aCheckDetail.PrintLines);
               BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@SignatureLineCount", SqlDbType.Int, 0, ParameterDirection.Input, aCheckDetail.SignatureLineCount);
               BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@MessageAboveSignature", SqlDbType.VarChar, 35, ParameterDirection.Input, aCheckDetail.MessageAboveSignature);
               BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@PrintPaymentRecordOnStub", SqlDbType.Bit, 0, ParameterDirection.Input, aCheckDetail.PrintPaymentRecordOnStub);
               BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@CheckStubLineKey", SqlDbType.Int, 0, ParameterDirection.Input, aCheckDetail.CheckStubLineKey);
               BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@Line1FontWeightKey", SqlDbType.Int, 0, ParameterDirection.Input, aCheckDetail.Line1FontWeightKey);
               BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@Line2FontWeightKey", SqlDbType.Int, 0, ParameterDirection.Input, aCheckDetail.Line2FontWeightKey);
               BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@TextAlignKey", SqlDbType.Int, 0, ParameterDirection.Input, aCheckDetail.TextAlignKey);
               BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@TypeFaceKey", SqlDbType.Int, 0, ParameterDirection.Input, aCheckDetail.TypeFaceKey);
               BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@Fraction", SqlDbType.VarChar, 20, ParameterDirection.Input, aCheckDetail.Fraction);
               BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@UseLogo", SqlDbType.Bit, 0, ParameterDirection.Input, aCheckDetail.UseLogo);
               BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@StartingNumber", SqlDbType.VarChar, 35, ParameterDirection.Input, aCheckDetail.StartingNumber);               
               BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@Approved", SqlDbType.Bit, 0, ParameterDirection.Input, aCheckDetail.Approved);
               BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@LogoPath", SqlDbType.VarChar, 200, ParameterDirection.Input, aCheckDetail.LogoPath);
               BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@PreviewPath", SqlDbType.VarChar, 200, ParameterDirection.Input, String.Empty);
               BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@LogoWidth", SqlDbType.Int, 0, ParameterDirection.Input, aCheckDetail.LogoWidth);
               BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@LogoHeight", SqlDbType.Int, 0, ParameterDirection.Input, aCheckDetail.LogoHeight);
               BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@CheckOrderKey", SqlDbType.Int, 0, ParameterDirection.Input, aCheckDetail.CheckOrderKey);
               BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@LogoLeftPosition", SqlDbType.Int, 0, ParameterDirection.Input, aCheckDetail.LogoLeftPosition);
               BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@LogoVerticalPosition", SqlDbType.Int, 0, ParameterDirection.Input, aCheckDetail.LogoVerticalPosition);
               BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@AddressBlockLeftPosition", SqlDbType.Int, 0, ParameterDirection.Input, aCheckDetail.AddressBlockLeftPosition);
               BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@AddressBlockVerticalPosition", SqlDbType.Int, 0, ParameterDirection.Input, aCheckDetail.AddressBlockVerticalPosition);
               BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@LogoLeftAdjustment", SqlDbType.Int, 0, ParameterDirection.Input, aCheckDetail.LogoLeftAdjustment);
               BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@LogoVerticalAdjustment", SqlDbType.Int, 0, ParameterDirection.Input, aCheckDetail.LogoVerticalAdjustment);
               BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@AddressBlockLeftAdjustment", SqlDbType.Int, 0, ParameterDirection.Input, aCheckDetail.AddressBlockLeftAdjustment);
               BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@AddressBlockVerticalAdjustment", SqlDbType.Int, 0, ParameterDirection.Input, aCheckDetail.AddressBlockVerticalAdjustment);
               BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@SuppressLine1", SqlDbType.Bit, 0, ParameterDirection.Input, aCheckDetail.SuppressLine1);
               BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@LogoLocationKey", SqlDbType.Int, 0, ParameterDirection.Input, aCheckDetail.LogoLocationKey);
               BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@retval", SqlDbType.Int, 0, ParameterDirection.Output, null);
               BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@SizedLogoName", SqlDbType.VarChar, 200, ParameterDirection.Input, aCheckDetail.SizedLogoName);
               BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@ColorLogo", SqlDbType.Bit, 0, ParameterDirection.Input, aCheckDetail.ColorLogo);
               BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@ShowCheckNo", SqlDbType.Bit, 0, ParameterDirection.Input, aCheckDetail.ShowCheckNo);
            BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@AccountNumber", SqlDbType.VarBinary, 128, ParameterDirection.Input, aCheckDetail.AcctNumber);
            BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@RNumber", SqlDbType.VarBinary, 128, ParameterDirection.Input, aCheckDetail.RNumber);
            BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@Preview", SqlDbType.VarBinary, 2000, ParameterDirection.Input, aCheckDetail.Preview);
            //BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@Logo", SqlDbType.VarBinary, 2000, ParameterDirection.Input, aCheckDetail.Logo);
            BaseDataAccess.SetCommandType(sqlCmd, CommandType.StoredProcedure, "CheckDetail_Create");
               return sqlCmd;
          }

          private static SqlCommand createUpdateCheckDetailCommand(CheckDetail aCheckDetail)
          {

               SqlCommand sqlCmd = new SqlCommand();

               BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@ID", SqlDbType.Int, 0, ParameterDirection.Input, aCheckDetail.CheckDetailKey);
               BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@CustomerKey", SqlDbType.Int, 0, ParameterDirection.Input, aCheckDetail.CustomerKey);
               BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@Line1", SqlDbType.VarChar, 35, ParameterDirection.Input, aCheckDetail.Line1);
               BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@Line2", SqlDbType.VarChar, 35, ParameterDirection.Input, aCheckDetail.Line2);
               BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@Line3", SqlDbType.VarChar, 35, ParameterDirection.Input, aCheckDetail.Line3);
               BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@Line4", SqlDbType.VarChar, 35, ParameterDirection.Input, aCheckDetail.Line4);
               BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@Line5", SqlDbType.VarChar, 35, ParameterDirection.Input, aCheckDetail.Line5);
               BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@BankAccountNumber", SqlDbType.VarChar, 35, ParameterDirection.Input, aCheckDetail.BankAccountNumber);
               BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@RoutingNumber", SqlDbType.VarChar, 35, ParameterDirection.Input, aCheckDetail.RoutingNumber);
               BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@BankInfoLine1", SqlDbType.VarChar, 35, ParameterDirection.Input, aCheckDetail.BankInfoLine1);
               BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@BankInfoLine2", SqlDbType.VarChar, 35, ParameterDirection.Input, aCheckDetail.BankInfoLine2);
               BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@BankInfoLine3", SqlDbType.VarChar, 35, ParameterDirection.Input, aCheckDetail.BankInfoLine3);
               BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@CheckColorKey", SqlDbType.Int, 0, ParameterDirection.Input, aCheckDetail.CheckColorKey);
               BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@PrintLines", SqlDbType.Bit, 0, ParameterDirection.Input, aCheckDetail.PrintLines);
               BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@SignatureLineCount", SqlDbType.Int, 0, ParameterDirection.Input, aCheckDetail.SignatureLineCount);
               BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@MessageAboveSignature", SqlDbType.VarChar, 35, ParameterDirection.Input, aCheckDetail.MessageAboveSignature);
               BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@PrintPaymentRecordOnStub", SqlDbType.Bit, 0, ParameterDirection.Input, aCheckDetail.PrintPaymentRecordOnStub);
               BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@CheckStubLineKey", SqlDbType.Int, 0, ParameterDirection.Input, aCheckDetail.CheckStubLineKey);
               BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@Line1FontWeightKey", SqlDbType.Int, 0, ParameterDirection.Input, aCheckDetail.Line1FontWeightKey);
               BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@Line2FontWeightKey", SqlDbType.Int, 0, ParameterDirection.Input, aCheckDetail.Line2FontWeightKey);
               BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@TextAlignKey", SqlDbType.Int, 0, ParameterDirection.Input, aCheckDetail.TextAlignKey);
               BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@TypeFaceKey", SqlDbType.Int, 0, ParameterDirection.Input, aCheckDetail.TypeFaceKey);
               BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@Fraction", SqlDbType.VarChar, 20, ParameterDirection.Input, aCheckDetail.Fraction);
               BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@UseLogo", SqlDbType.Bit, 0, ParameterDirection.Input, aCheckDetail.UseLogo);
               BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@StartingNumber", SqlDbType.VarChar, 35, ParameterDirection.Input, aCheckDetail.StartingNumber);
               BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@Approved", SqlDbType.Bit, 0, ParameterDirection.Input, aCheckDetail.Approved);
               BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@LogoPath", SqlDbType.VarChar, 200, ParameterDirection.Input, aCheckDetail.LogoPath);
               BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@PreviewPath", SqlDbType.VarChar, 200, ParameterDirection.Input, aCheckDetail.PreviewPath);
               BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@LogoWidth", SqlDbType.Int, 0, ParameterDirection.Input, aCheckDetail.LogoWidth);
               BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@LogoHeight", SqlDbType.Int, 0, ParameterDirection.Input, aCheckDetail.LogoHeight);
               BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@CheckOrderKey", SqlDbType.Int, 0, ParameterDirection.Input, aCheckDetail.CheckOrderKey);
               BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@LogoLeftPosition", SqlDbType.Int, 0, ParameterDirection.Input, aCheckDetail.LogoLeftPosition);
               BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@LogoVerticalPosition", SqlDbType.Int, 0, ParameterDirection.Input, aCheckDetail.LogoVerticalPosition);
               BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@AddressBlockLeftPosition", SqlDbType.Int, 0, ParameterDirection.Input, aCheckDetail.AddressBlockLeftPosition);
               BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@AddressBlockVerticalPosition", SqlDbType.Int, 0, ParameterDirection.Input, aCheckDetail.AddressBlockVerticalPosition);
               BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@LogoLeftAdjustment", SqlDbType.Int, 0, ParameterDirection.Input, aCheckDetail.LogoLeftAdjustment);
               BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@LogoVerticalAdjustment", SqlDbType.Int, 0, ParameterDirection.Input, aCheckDetail.LogoVerticalAdjustment);
               BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@AddressBlockLeftAdjustment", SqlDbType.Int, 0, ParameterDirection.Input, aCheckDetail.AddressBlockLeftAdjustment);
               BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@AddressBlockVerticalAdjustment", SqlDbType.Int, 0, ParameterDirection.Input, aCheckDetail.AddressBlockVerticalAdjustment);
               BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@SuppressLine1", SqlDbType.Bit, 0, ParameterDirection.Input, aCheckDetail.SuppressLine1);
               BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@LogoLocationKey", SqlDbType.Int, 0, ParameterDirection.Input, aCheckDetail.LogoLocationKey);
               BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@SizedLogoName", SqlDbType.VarChar, 200, ParameterDirection.Input, aCheckDetail.SizedLogoName);
               BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@ColorLogo", SqlDbType.Bit, 0, ParameterDirection.Input, aCheckDetail.ColorLogo);
               BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@ShowCheckNo", SqlDbType.Bit, 0, ParameterDirection.Input, aCheckDetail.ShowCheckNo);
               BaseDataAccess.SetCommandType(sqlCmd, CommandType.StoredProcedure, "CheckDetail_Update");
               return sqlCmd;
          }
          private static int updateCheckDetail(CheckDetail aCheckDetail)
          {

               SqlCommand sqlCmd = createUpdateCheckDetailCommand(aCheckDetail);

               BaseDataAccess.ExecuteScalarCmd(sqlCmd);
               return aCheckDetail.CheckDetailKey;
          }
     }
}
