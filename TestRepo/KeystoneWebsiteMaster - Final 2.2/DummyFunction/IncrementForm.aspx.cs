using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using DummyDll2;

namespace KeystoneWebsite
{
    public partial class IncrementForm : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnInc_Click(object sender, EventArgs e)
        {
            lblReturnNum.Text = Inc.Increment(txtbInputNum.Text);
        }
    }
}