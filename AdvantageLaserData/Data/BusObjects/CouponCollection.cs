using AdvLaser.AdvLaserObjects;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace AdvantageLaserData.Data.BusObjects
{
    public class CouponCollection : CollectionBase
    {
        public CouponDisplay this[int index]
        {
            get { return ((CouponDisplay)List[index]); }
            set { List[index] = value; }
        }

        public int Add(CouponDisplay aCoupon)
        {
            return (List.Add(aCoupon));
        }

        public void Remove(CouponDisplay aCoupon)
        {
            List.Remove(aCoupon);
        }
    }
}
