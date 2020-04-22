using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace AdvantageLaserData.Data.DataUtils
{
    public class DataUtils
    {
        static DataUtils()
        {
        }

        public static decimal GetDecimalValue(object o)
        {
            if (o.GetType() == typeof(System.DBNull))
            {
                return decimal.MinValue;
            }
            else
            {
                return Convert.ToDecimal(o);
            }
        }

        public static int GetIntValue(object o)
        {
            if (o.GetType() == typeof(System.DBNull))
            {
                return Int32.MinValue;
            }
            else
            {
                return Convert.ToInt32(o);
            }
        }

        public static string GetStringValue(object o)
        {
            if (o.GetType() == typeof(System.DBNull))
            {
                return String.Empty;
            }
            else
            {
                return Convert.ToString(o);
            }
        }
    }
}
