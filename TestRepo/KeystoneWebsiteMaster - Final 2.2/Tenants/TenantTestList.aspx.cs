using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using Trinity.OpenStack;

namespace KeystoneWebsite.Tenants
{
    public partial class TenantTestList : System.Web.UI.Page
    {
        Token t;

        protected void Page_Load(object sender, EventArgs e)
        {
            t = Token.Request_WithTenantID("http://saturn.cs.trinity.edu:5000/", "admin", "trinitytu", "student");
        }

        protected void btnTest1_Click(object sender, EventArgs e)
        {
            List<Tenant> tenantList = Tenant.List("http://saturn.cs.trinity.edu:35357/", t.token_id);
            string prettyTenant = string.Empty;
            for (int x = 0; x < tenantList.Count; x++)
                prettyTenant += Tenant.PrettyPrint(tenantList[x]);

            txtTest1.Text = prettyTenant;
        }

        protected void btnTest2_Click(object sender, EventArgs e)
        {
            try
            {
                List<Tenant> tenantList = Tenant.List("http://saturn.cs.trinity.edu:35357/", "not an admin token id");
            }
            catch (Exception x)
            {
                txtTest2.Text = x.ToString();
            }
        }

        protected void btnTest3_Click(object sender, EventArgs e)
        {
            try
            {
                List<Tenant> tenantList = Tenant.List("this isn't even a URL???", t.token_id);
            }
            catch (Exception x)
            {
                txtTest3.Text = x.ToString();
            }
        }
    }
}