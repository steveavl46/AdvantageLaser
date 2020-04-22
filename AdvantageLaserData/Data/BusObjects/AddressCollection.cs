using System;
using System.Collections;
using System.Linq;
using System.Text;
using AdvLaser.AdvLaserObjects;

namespace AdvantageLaserData.AdvLaserObjects
{
    public class AddressCollection : CollectionBase
    {
        public int Add(Address aAddress)
        {
            return (List.Add(aAddress));
        }

        public void Remove(Address aAddress)
        {
            List.Remove(aAddress);
        }
    }
}
