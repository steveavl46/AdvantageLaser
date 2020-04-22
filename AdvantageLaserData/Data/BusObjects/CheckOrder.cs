using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace AdvLaser.AdvLaserObjects
{
    public class CheckOrder
    {
        #region member variables
        private int m_intCheckOrderKey;
        private string m_strDescription;
        #endregion

        #region public properties
        public int CheckOrderKey
        {
            get { return m_intCheckOrderKey; }
            set { m_intCheckOrderKey = value; }
        }
        public string Description
        {
            get { return m_strDescription; }
            set { m_strDescription = value; }
        }
        #endregion
    }
}
