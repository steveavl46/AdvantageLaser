using System;
using System.Data;
using System.Data.SqlClient;
using AdvLaser.AdvLaserObjects;
using System.Collections;

namespace AdvLaser.AdvLaserDataAccess
{
    public static class CheckOrderDataAccess 
    {
        public static CheckOrder GetOne(int aCheckColorKey)
        {
            SqlCommand sqlCmd = new SqlCommand();

            BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@Id", SqlDbType.Int, 0, ParameterDirection.Input, aCheckColorKey);
            BaseDataAccess.SetCommandType(sqlCmd, CommandType.StoredProcedure, "CheckColor_GetOne");
            BaseDataAccess.GenerateObjectFromReader sqlData = new BaseDataAccess.GenerateObjectFromReader(CreateCheckOrder);
            CheckOrder aCheckOrder = (CheckOrder)BaseDataAccess.ExecuteObjectReader(sqlCmd, sqlData);
            return aCheckOrder;
        }

        public static Object CreateCheckOrder(SqlDataReader returnData)
        {
            CheckOrder aCheckOrder = null;

            while (returnData.Read())
            {
                aCheckOrder = new CheckOrder();
                aCheckOrder.CheckOrderKey = (int)returnData["CheckOrderKey"];
                aCheckOrder.Description = (string)returnData["Description"];
            }
            return aCheckOrder;
        }

        public static ArrayList GetList(string aSQL)
        {
            ArrayList list = new ArrayList();
            SqlCommand sqlCmd = new SqlCommand();
            BaseDataAccess.SetCommandType(sqlCmd, CommandType.Text, aSQL);
            using (SqlConnection cn = new SqlConnection(BaseDataAccess.ConnectionString))
            {
                sqlCmd.Connection = cn;
                cn.Open();
                SqlDataReader reader = sqlCmd.ExecuteReader();
                CheckOrder aCheckOrder = null;
                while (reader.Read())
                {
                    aCheckOrder = new CheckOrder();
                    aCheckOrder.CheckOrderKey = (int)reader["CheckOrderKey"];
                    aCheckOrder.Description = (string)reader["Description"];
                    list.Add(aCheckOrder);
                }
            }
            return list;
        }
    }
}
