using AdvLaser.AdvLaserObjects;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace AdvantageLaserData.Data.BusObjects
{
    public class CouponProductCategoryCollection : CollectionBase
    {
        public ProductCategory this[int index]
        {
            get { return ((ProductCategory)List[index]); }
            set { List[index] = value; }
        }

        public int Add(ProductCategory aCoupon)
        {
            return (List.Add(aCoupon));
        }

        public void Remove(ProductCategory aCoupon)
        {
            List.Remove(aCoupon);
        }
    }
}
