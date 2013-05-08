using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using Trinity.OpenStack;

namespace KeystoneWebsite.Tenants
{
    public partial class TenantTestUpdate : System.Web.UI.Page
    {
        Token t;

        protected void Page_Load(object sender, EventArgs e)
        {
            t = Token.Request_WithTenantID("http://saturn.cs.trinity.edu:5000/", "admin", "trinitytu", "student");
        }

        protected void btnTest1_Click(object sender, EventArgs e)
        {
            Tenant newTen = Tenant.Create("http://saturn.cs.trinity.edu:35357/", t.token_id, "adminTestNew999", "another test tenant");
            List<Tenant> TenantList1 = Tenant.List("http://saturn.cs.trinity.edu:35357/", t.token_id);
            string firstBox = string.Empty;
            for (int x = 0; x < TenantList1.Count; x++)
                firstBox += Tenant.PrettyPrint(TenantList1[x]);
            txtTest1.Text = firstBox;

            Tenant updateTenant = Tenant.Update("http://saturn.cs.trinity.edu:35357/", t.token_id, newTen.id, "this tenant description has been updated");
            txtTest2.Text = Tenant.PrettyPrint(updateTenant);

            Tenant.Delete("http://saturn.cs.trinity.edu:35357/", t.token_id, newTen.id);
            List<Tenant> TenantList2 = Tenant.List("http://saturn.cs.trinity.edu:35357/", t.token_id);
            string secondBox = string.Empty;
            for (int x = 0; x < TenantList2.Count; x++)
                secondBox += Tenant.PrettyPrint(TenantList2[x]);
            txtTest3.Text = secondBox;
        }

        protected void btnTest2_Click(object sender, EventArgs e)
        {
            try
            {
                Tenant.Update("http://saturn.cs.trinity.edu:35357/", "not a token id", "cannot clean up new ten", "new tenant description");
            }
            catch (Exception x)
            {
                txtTest4.Text = x.ToString();
            }
        }

        protected void btnTest3_Click(object sender, EventArgs e)
        {
            try
            {
                Tenant.Update("not a valid URL", t.token_id, "cannot clean up new ten", "new tenant description");
            }
            catch (Exception x)
            {
                txtTest5.Text = x.ToString();
            }
        }

        protected void btnTest4_Click(object sender, EventArgs e)
        {
            try
            {
                Tenant.Update("http://saturn.cs.trinity.edu:35357/", t.token_id, "not a tenant id", "new tenant description");
            }
            catch (Exception x)
            {
                txtTest6.Text = x.ToString();
            }
        }
    }
}