using System;
using AdvLaser.AdvLaserDataAccess;

namespace AdvLaser.AdvLaserObjects
{


     public class State
     {
          #region member variables
          private int m_intStateKey;
          private string m_strAbbreviation;
          private string m_strName;
          private int m_intShippingZoneKey;
          #endregion

          #region public properties
          public int StateKey
          {
               get { return m_intStateKey; }
               set { m_intStateKey = value; }
          }
          public string Abbreviation
          {
               get { return m_strAbbreviation; }
               set { m_strAbbreviation = value; }
          }
          public string Name
          {
               get { return m_strName; }
               set { m_strName = value; }
          }
          public int ShippingZoneKey
          {
               get { return m_intShippingZoneKey; }
               set { m_intShippingZoneKey = value; }
          }
          #endregion

          #region data access methods
          public int Save()
          {
               return StateDataAccess.SaveState(this);
          }
          #endregion
     }
}
