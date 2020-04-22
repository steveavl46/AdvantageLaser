using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using AdvLaser.AdvLaserObjects;
using System.Data.SqlClient;
using System.Data;
using System.Collections;

namespace AdvLaser.AdvLaserDataAccess
{
    public static class InvoiceItemCollectionDataAccess
    {
        

        public static InvoiceItemCollection GetInvoiceItemsForInvoice(int aInvoiceKey)
        {
            InvoiceItemCollection m_colInvoiceItems = new InvoiceItemCollection();
            SqlCommand sqlCmd = new SqlCommand();
            BaseDataAccess.AddParamToSQLCmd(sqlCmd, "@Id", SqlDbType.Int, 0, ParameterDirection.Input, aInvoiceKey);
            BaseDataAccess.SetCommandType(sqlCmd, CommandType.StoredProcedure, "GetInvoiceItems");

            BaseDataAccess.GenerateCollectionFromReader sqlData = new BaseDataAccess.GenerateCollectionFromReader (GenerateInvoiceItemCollectionFromReader);
            m_colInvoiceItems = (InvoiceItemCollection)BaseDataAccess.ExecuteCollectionReader(sqlCmd, sqlData);
            return m_colInvoiceItems;
        }

        private static CollectionBase GenerateInvoiceItemCollectionFromReader(SqlDataReader returnData)
        {
            InvoiceItemCollection _collection = new InvoiceItemCollection();
            while (returnData.Read())
            {
                InvoiceItem aInvoiceItem = new InvoiceItem();
                aInvoiceItem.InvoiceItemKey = (int)returnData["InvoiceItemKey"];
                aInvoiceItem.InvoiceKey = (int)returnData["InvoiceKey"];
                aInvoiceItem.ProductKey = (int)returnData["ProductKey"];
                aInvoiceItem.DepositSlipKey = BaseDataAccess.GetInt(returnData["DepositSlipKey"]);
                aInvoiceItem.Description = BaseDataAccess.GetString(returnData["Description"]);
                aInvoiceItem.Quantity = (int)returnData["Quantity"];
                aInvoiceItem.Price = BaseDataAccess.GetDecimal(returnData["Price"]);
                aInvoiceItem.ShippingRate = BaseDataAccess.GetDecimal(returnData["ShippingRate"]);
                aInvoiceItem.DepositStampKey = BaseDataAccess.GetInt(returnData["DepositStampKey"]);
                aInvoiceItem.CheckDetailKey = BaseDataAccess.GetInt(returnData["CheckDetailKey"]);
                aInvoiceItem.SoftwareName = BaseDataAccess.GetString(returnData["SoftwareName"]);
                aInvoiceItem.DepositBookKey = BaseDataAccess.GetInt(returnData["DepositBookKey"]);
                _collection.Add(aInvoiceItem);
            }
            return (_collection);
        } 
    }
}
