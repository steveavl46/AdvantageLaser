using System;
using AdvLaser.AdvLaserDataAccess;
using System.Collections;

namespace AdvLaser.AdvLaserObjects
{


    public class CheckDetail
    {
        #region member variables
        private int m_intCheckDetailKey;
        private int m_intCustomerKey;
        private string m_strLine1;
        private string m_strLine2;
        private string m_strLine3;
        private string m_strLine4;
        private string m_strLine5;
        private string m_strBankAccountNumber;
        private string m_strRoutingNumber;
        private string m_strBankInfoLine1;
        private string m_strBankInfoLine2;
        private string m_strBankInfoLine3;
        private int m_intCheckColorKey;
        private bool m_blnPrintLines;
        private int m_intSignatureLineCount;
        private string m_strMessageAboveSignature;
        private bool m_blnPrintPaymentRecordOnStub;
        private int? m_intCheckStubLineKey;
        private int m_intLine1FontWeightKey;
        private int m_intLine2FontWeightKey;
        private int m_intTextAlignKey;
        private int m_intTypeFaceKey;
        private string m_strFraction;
        private bool m_blnUseLogo;
        private string m_strStartingNumber;
        private bool m_blnApproved;
        private string m_strLogoPath;
        private string m_strPreviewPath;
        private int m_intLogoWidth;
        private int m_intLogoHeight;
        private int m_intCheckOrderKey;
        private int m_intLogoLeftPosition;
        private int m_intLogoVerticalPosition;
        private int m_intAddressBlockLeftPosition;
        private int m_intAddressBlockVerticalPosition;
        private int m_intLogoLeftAdjustment;
        private int m_intLogoVerticalAdjustment;
        private int m_intAddressBlockLeftAdjustment;
        private int m_intAddressBlockVerticalAdjustment;
        private bool m_blnSuppressLine1;
        private int? m_intLogoLocationKey;
        private string m_strSizedLogoName;
        private bool m_blnColorLogo;
        private bool m_blnShowCheckNo;
        private byte[] m_acctNumber;
        private byte[] m_rNumber;
        private byte[] m_Preview;
        private byte[] m_Logo;
        #endregion

        #region public properties
        public int CheckDetailKey
          {
               get { return m_intCheckDetailKey; }
               set { m_intCheckDetailKey = value; }
          }
          public int CustomerKey
          {
               get { return m_intCustomerKey; }
               set { m_intCustomerKey = value; }
          }
          public string Line1
          {
               get { return m_strLine1; }
               set { m_strLine1 = value; }
          }
          public string Line2
          {
               get { return m_strLine2; }
               set { m_strLine2 = value; }
          }
          public string Line3
          {
               get { return m_strLine3; }
               set { m_strLine3 = value; }
          }
          public string Line4
          {
               get { return m_strLine4; }
               set { m_strLine4 = value; }
          }
          public string Line5
          {
               get { return m_strLine5; }
               set { m_strLine5 = value; }
          }
          public string BankAccountNumber
          {
               get { return m_strBankAccountNumber; }
               set { m_strBankAccountNumber = value; }
          }
          public string RoutingNumber
          {
               get { return m_strRoutingNumber; }
               set { m_strRoutingNumber = value; }
          }
          public string BankInfoLine1
          {
               get { return m_strBankInfoLine1; }
               set { m_strBankInfoLine1 = value; }
          }
          public string BankInfoLine2
          {
               get { return m_strBankInfoLine2; }
               set { m_strBankInfoLine2 = value; }
          }
          public string BankInfoLine3
          {
              get { return m_strBankInfoLine3; }
              set { m_strBankInfoLine3 = value; }
          }
          public int CheckColorKey
          {
               get { return m_intCheckColorKey; }
               set { m_intCheckColorKey = value; }
          }
          public bool PrintLines
          {
               get { return m_blnPrintLines; }
               set { m_blnPrintLines = value; }
          }
          public int SignatureLineCount
          {
               get { return m_intSignatureLineCount; }
               set { m_intSignatureLineCount = value; }
          }
          public string MessageAboveSignature
          {
               get { return m_strMessageAboveSignature; }
               set { m_strMessageAboveSignature = value; }
          }
          public bool PrintPaymentRecordOnStub
          {
               get { return m_blnPrintPaymentRecordOnStub; }
               set { m_blnPrintPaymentRecordOnStub = value; }
          }
          public string StartingNumber
          {
              get { return m_strStartingNumber; }
              set { m_strStartingNumber = value; }
          }
          public int? CheckStubLineKey
          {
               get { return m_intCheckStubLineKey; }
               set 
               {
                   if (value.HasValue)
                   {
                       m_intCheckStubLineKey = (int)value;
                   }
                   else
                   {
                       m_intCheckStubLineKey = null;
                   }
               }
          }
          public int Line1FontWeightKey
          {
               get { return m_intLine1FontWeightKey; }
               set { m_intLine1FontWeightKey = value; }
          }
          public int Line2FontWeightKey
          {
               get { return m_intLine2FontWeightKey; }
               set { m_intLine2FontWeightKey = value; }
          }
          public int TextAlignKey
          {
               get { return m_intTextAlignKey; }
               set { m_intTextAlignKey = value; }
          }
          public int TypeFaceKey
          {
               get { return m_intTypeFaceKey; }
               set { m_intTypeFaceKey = value; }
          }
          public string Fraction
          {
              get { return m_strFraction; }
              set { m_strFraction = value; }
          }
          public bool UseLogo
          {
              get { return m_blnUseLogo; }
              set { m_blnUseLogo = value; }
          }
          public bool Approved
          {
              get { return m_blnApproved; }
              set { m_blnApproved = value; }
          }
          public string LogoPath
          {
              get { return m_strLogoPath; }
              set { m_strLogoPath = value; }
          }
          public string PreviewPath
          {
              get { return m_strPreviewPath; }
              set { m_strPreviewPath = value; }
          }
          public int LogoWidth
          {
              get { return m_intLogoWidth; }
              set { m_intLogoWidth = value; }
          }

          public int LogoHeight
          {
              get { return m_intLogoHeight; }
              set { m_intLogoHeight = value; }
          }

          public int CheckOrderKey
          {
              get { return m_intCheckOrderKey; }
              set { m_intCheckOrderKey = value; }
          }

          public int LogoLeftPosition
          {
              get { return m_intLogoLeftPosition; }
              set { m_intLogoLeftPosition = value; }
          }
          public int LogoVerticalPosition
          {
              get { return m_intLogoVerticalPosition; }
              set { m_intLogoVerticalPosition = value; }
          }
          public int AddressBlockLeftPosition
          {
              get { return m_intAddressBlockLeftPosition; }
              set { m_intAddressBlockLeftPosition = value; }
          }
          public int AddressBlockVerticalPosition
          {
              get { return m_intAddressBlockVerticalPosition; }
              set { m_intAddressBlockVerticalPosition = value; }
          }

          public int LogoLeftAdjustment
          {
              get { return m_intLogoLeftAdjustment; }
              set { m_intLogoLeftAdjustment = value; }
          }
          public int LogoVerticalAdjustment
          {
              get { return m_intLogoVerticalAdjustment; }
              set { m_intLogoVerticalAdjustment = value; }
          }
          public int AddressBlockLeftAdjustment
          {
              get { return m_intAddressBlockLeftAdjustment; }
              set { m_intAddressBlockLeftAdjustment = value; }
          }
          public int AddressBlockVerticalAdjustment
          {
              get { return m_intAddressBlockVerticalAdjustment; }
              set { m_intAddressBlockVerticalAdjustment = value; }
          }
          public bool SuppressLine1
          {
              get { return m_blnSuppressLine1; }
              set { m_blnSuppressLine1 = value; }
          }
          public int? LogoLocationKey
          {
              get { return m_intLogoLocationKey; }
              set
              {
                  if (value.HasValue)
                  {
                      m_intLogoLocationKey = (int)value;
                  }
                  else
                  {
                      m_intLogoLocationKey = null;
                  }
              }
          }

          public string SizedLogoName
          {
              get { return m_strSizedLogoName; }
              set { m_strSizedLogoName = value; }
          }
          public bool ColorLogo
          {
              get { return m_blnColorLogo; }
              set { m_blnColorLogo = value; }
          }

          public bool ShowCheckNo
          {
              get { return m_blnShowCheckNo; }
              set { m_blnShowCheckNo = value; }
          }

        public byte[] AcctNumber
        {
            get { return m_acctNumber; }
            set { m_acctNumber = value; }
        }

        public byte[] RNumber
        {
            get { return m_rNumber; }
            set { m_rNumber = value; }
        }

        public byte[] Preview
        {
            get { return m_Preview; }
            set { m_Preview = value; }
        }

        public byte[] Logo
        {
            get { return m_Logo; }
            set { m_Logo = value; }
        }
        #endregion

        #region data access methods
        public int Save()
          {
               return CheckDetailDataAccess.SaveCheckDetail(this);
          }
          #endregion
     }
}
