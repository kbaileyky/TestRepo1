using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using Trinity.OpenStack;

namespace KeystoneWebsite
{
    public partial class ListRoles : Page
    {
        Token t;

        protected void Page_Load(object sender, EventArgs e)
        {
            t = Token.Request_WithTenantID("http://198.61.199.47:5000/", "admin", "password", "tenant1");
        }

        protected void btnTest1_Click(object sender, EventArgs e)
        {             
            txtTest1.Text = Role.List("http://198.61.199.47:35357", t.token_id);
        }

        protected void btnTest2_Click(object sender, EventArgs e)
        {
            txtTest2.Text = Role.List("http://198.61.199.48:35357", t.token_id);
        }

        protected void btnTest3_Click(object sender, EventArgs e)
        {
            txtTest3.Text = Role.List("http://198.61.199.48:35357", "12345");
        }
    }
}