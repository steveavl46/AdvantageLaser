using AdvLaser.AdvLaserDataAccess;
using AdvLaser.AdvLaserObjects;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;

namespace AdvLaser.AdvLaserDataAccess
{
    public static class ExpediteSubTypeDataAccess
    {
        public static ExpediteSubType GetOne(int aExpediteSubTypeKey)
        {
            SqlCommand sqlCmd = new SqlCommand();

            BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@Id", SqlDbType.Int, 0, ParameterDirection.Input, aExpediteSubTypeKey);
            BaseDataAccess.SetCommandType(sqlCmd, CommandType.StoredProcedure, "ExpediteSubType_GetOne");
            BaseDataAccess.GenerateObjectFromReader sqlData = new BaseDataAccess.GenerateObjectFromReader(CreateExpediteSubType);
            ExpediteSubType aExpediteSubType = (ExpediteSubType)BaseDataAccess.ExecuteObjectReader(sqlCmd, sqlData);
            return aExpediteSubType;
        }

        public static Object CreateExpediteSubType(SqlDataReader returnData)
        {
            ExpediteSubType aExpediteSubType = null;

            while (returnData.Read())
            {
                aExpediteSubType = new ExpediteSubType();
                aExpediteSubType.ExpediteSubTypeKey = (int)returnData["ExpediteSubTypeKey"];
                aExpediteSubType.ExpediteTypeKey = (int)returnData["ExpediteTypeKey"];
                aExpediteSubType.DisplayOrder = (int)returnData["DisplayOrder"];
                aExpediteSubType.Description = (string)returnData["Description"];
                aExpediteSubType.IsActive = (bool)returnData["IsActive"];
                aExpediteSubType.AdditionalCharge = (decimal)returnData["AdditionalCharge"];
                aExpediteSubType.BillAtActualCharges = (bool)returnData["BillAtActualCharges"];
                aExpediteSubType.ShortDescription = (string)returnData["ShortDescription"];
            }
            return aExpediteSubType;
        }

        public static ArrayList GetExpediteSubTypeList(string aSQL)
        {
            ArrayList list = new ArrayList();
            SqlCommand sqlCmd = new SqlCommand();
            BaseDataAccess.SetCommandType(sqlCmd, CommandType.Text, aSQL);
            using (SqlConnection cn = new SqlConnection(BaseDataAccess.ConnectionString))
            {
                sqlCmd.Connection = cn;
                cn.Open();
                SqlDataReader reader = sqlCmd.ExecuteReader();

                ExpediteSubType aExpediteSubType = null;

                while (reader.Read())
                {
                    aExpediteSubType = new ExpediteSubType();
                    aExpediteSubType.ExpediteSubTypeKey = (int)reader["ExpediteSubTypeKey"];
                    aExpediteSubType.ExpediteTypeKey = (int)reader["ExpediteTypeKey"];
                    aExpediteSubType.Description = (string)reader["Description"];
                    aExpediteSubType.AdditionalCharge = (decimal)reader["AdditionalCharge"];
                    aExpediteSubType.IsActive = (bool)reader["IsActive"];
                    aExpediteSubType.BillAtActualCharges = (bool)reader["BillAtActualCharges"];
                    aExpediteSubType.ShortDescription = (string)reader["ShortDescription"];
                    list.Add(aExpediteSubType);
                }


            }
            return list;
        }
    }
}
