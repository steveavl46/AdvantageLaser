using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.SqlClient;
using AdvantageLaserData.AdvLaserObjects;
using System.Data;
using AdvLaser.AdvLaserObjects;
using System.Collections;

namespace AdvLaser.AdvLaserDataAccess
{
    public static class AddressCollectionDataAccess
    {
        public static AddressCollection GetAddressesForCustomer(int aCustomerKey)
        {
            AddressCollection m_colAddessList = new AddressCollection();
            SqlCommand sqlCmd = new SqlCommand();
            BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@CustomerKey", SqlDbType.Int, 0, ParameterDirection.Input, aCustomerKey);
            BaseDataAccess.SetCommandType(sqlCmd, CommandType.StoredProcedure, "GetAddressesForCustomer");

            BaseDataAccess.GenerateCollectionFromReader sqlData = new BaseDataAccess.GenerateCollectionFromReader (GenerateAddressCollectionFromReader);
            m_colAddessList = (AddressCollection)BaseDataAccess.ExecuteCollectionReader(sqlCmd, sqlData);
            return m_colAddessList;
        }

        private static CollectionBase GenerateAddressCollectionFromReader(SqlDataReader returnData)
        {
            AddressCollection _collection = new AddressCollection();
            while (returnData.Read())
            {
                Address aAddress = new Address();
                aAddress.AddressKey = (int)returnData["AddressKey"];
                aAddress.AddressTypeKey = (int)returnData["AddressTypeKey"];
                aAddress.Line1 = BaseDataAccess.GetString(returnData["Line1"]);
                aAddress.Line2 = BaseDataAccess.GetString(returnData["Line2"]);
                aAddress.City = BaseDataAccess.GetString(returnData["City"]);
                aAddress.State = BaseDataAccess.GetString(returnData["State"]);
                aAddress.ZipCode = BaseDataAccess.GetString(returnData["ZipCode"]);
                _collection.Add(aAddress);
            }
            return (_collection);
        }
    }
}
