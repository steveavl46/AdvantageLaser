using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CheckProject.controls
{
    public partial class CharactersRemaining : System.Web.UI.UserControl
    {
        private string id;
        private string maxlength;

        public string ID
        {
            set { id = value; }
            get { return id; }
        }

        public string MaxLength
        {
            set { maxlength = value; }
            get { return maxlength; }
        }

        public string Text
        {
            get
            {
                return"(" + maxlength + " char)";
            }
        }
    }
}