using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using Trinity.OpenStack;

namespace KeystoneWebsite.Tenants
{
    public partial class ViewTenants : System.Web.UI.Page
    {
        Token t;

        protected void Page_Load(object sender, EventArgs e)
        {
            t = Token.Request_WithTenantID("http://saturn.cs.trinity.edu:5000/", "admin", "trinitytu", "student");
        }

        protected void btnTest1_Click(object sender, EventArgs e)
        {
            List<Tenant> TenantList1 = Tenant.List("http://saturn.cs.trinity.edu:35357/", t.token_id);
            string firstBox = string.Empty;
            for (int x = 0; x < TenantList1.Count; x++)
                firstBox += Tenant.PrettyPrint(TenantList1[x]);
            txtTest1.Text = firstBox;
        }
    }
}