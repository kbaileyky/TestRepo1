using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using Trinity.OpenStack;

namespace KeystoneWebsite.Tenants
{

    public partial class TenantTestCreate : System.Web.UI.Page
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
           
            Tenant newtenant = Tenant.Create("http://saturn.cs.trinity.edu:35357/", t.token_id, "adminTestNew999", "admin test tenant");
            List<Tenant> TenantList2 = Tenant.List("http://saturn.cs.trinity.edu:35357/", t.token_id);
            string secondBox = string.Empty;
            for (int y = 0; y < TenantList2.Count; y++)
                secondBox += Tenant.PrettyPrint(TenantList2[y]);
            
            Tenant.Delete("http://saturn.cs.trinity.edu:35357/", t.token_id, newtenant.id);
            List<Tenant> TenantList3 = Tenant.List("http://saturn.cs.trinity.edu:35357/", t.token_id);
            string thirdBox = string.Empty;
            for (int z = 0; z < TenantList3.Count; z++)
                thirdBox += Tenant.PrettyPrint(TenantList3[z]);
            
            txtTest1.Text = firstBox;
            txtTest2.Text = secondBox;
            txtTest3.Text = thirdBox;
        }

        protected void btnTest2_Click(object sender, EventArgs e)
        {
            try
            {
                Tenant newtenant = Tenant.Create("http://saturn.cs.trinity.edu:35357/", "not an admin token ID", "adminTestNew999", "admin test tenant");
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
                Tenant newtenant = Tenant.Create("not a valid URL", t.token_id, "adminTestNew999", "admin test tenant");
            }
            catch (Exception x)
            {
                txtTest5.Text = x.ToString();
            }

        }
    }
}