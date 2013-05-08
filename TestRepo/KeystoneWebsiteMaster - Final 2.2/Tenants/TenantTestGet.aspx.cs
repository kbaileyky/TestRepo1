using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Trinity.OpenStack;

namespace KeystoneWebsite.Tenants
{
    public partial class TenantTestGet : System.Web.UI.Page
    {
        Token t;

        protected void Page_Load(object sender, EventArgs e)
        {
            t = Token.Request_WithTenantID("http://saturn.cs.trinity.edu:5000/", "admin", "trinitytu", "student");
        }

        protected void btnTest1_Click(object sender, EventArgs e)
        {
            Tenant newtenant = Tenant.Create("http://saturn.cs.trinity.edu:35357/", t.token_id, "adminTestNew999", "admin test tenant");
            List<Tenant> TenantList1 = Tenant.List("http://saturn.cs.trinity.edu:35357/", t.token_id);
            string firstBox = string.Empty;
            for (int y = 0; y < TenantList1.Count; y++)
                firstBox += Tenant.PrettyPrint(TenantList1[y]);

            Tenant getTen = Tenant.Get("http://saturn.cs.trinity.edu:35357/", t.token_id, newtenant.id);
            txtTest2.Text = Tenant.PrettyPrint(getTen);

            Tenant.Delete("http://saturn.cs.trinity.edu:35357/", t.token_id, newtenant.id);
            List<Tenant> TenantList2 = Tenant.List("http://saturn.cs.trinity.edu:35357/", t.token_id);
            string thirdBox = string.Empty;
            for (int z = 0; z < TenantList2.Count; z++)
                thirdBox += Tenant.PrettyPrint(TenantList2[z]);

            txtTest1.Text = firstBox;
            txtTest3.Text = thirdBox;
        }

        protected void btnTest2_Click(object sender, EventArgs e)
        {
            Tenant newtenant = Tenant.Create("http://saturn.cs.trinity.edu:35357/", t.token_id, "adminTestNew999", "admin test tenant");
            List<Tenant> TenantList1 = Tenant.List("http://saturn.cs.trinity.edu:35357/", t.token_id);
            string firstBox = string.Empty;
            for (int y = 0; y < TenantList1.Count; y++)
                firstBox += Tenant.PrettyPrint(TenantList1[y]);

            try
            {
                Tenant getTen = Tenant.Get("http://saturn.cs.trinity.edu:35357/", "this is completely wrong", newtenant.id);
            }
            catch (Exception x)
            {
                txtTest5.Text = x.ToString();
            }

            Tenant.Delete("http://saturn.cs.trinity.edu:35357/", t.token_id, newtenant.id);
            List<Tenant> TenantList2 = Tenant.List("http://saturn.cs.trinity.edu:35357/", t.token_id);
            string thirdBox = string.Empty;
            for (int z = 0; z < TenantList2.Count; z++)
                thirdBox += Tenant.PrettyPrint(TenantList2[z]);

            txtTest4.Text = firstBox;
            txtTest6.Text = thirdBox;
        }

        protected void btnTest3_Click(object sender, EventArgs e)
        {
            Tenant newtenant = Tenant.Create("http://saturn.cs.trinity.edu:35357/", t.token_id, "adminTestNew999", "admin test tenant");
            List<Tenant> TenantList1 = Tenant.List("http://saturn.cs.trinity.edu:35357/", t.token_id);
            string firstBox = string.Empty;
            for (int y = 0; y < TenantList1.Count; y++)
                firstBox += Tenant.PrettyPrint(TenantList1[y]);

            try
            {
                Tenant getTen = Tenant.Get("this isn't even a URL???", t.token_id, newtenant.id);
            }
            catch (Exception x)
            {
                txtTest8.Text = x.ToString();
            }

            Tenant.Delete("http://saturn.cs.trinity.edu:35357/", t.token_id, newtenant.id);
            List<Tenant> TenantList2 = Tenant.List("http://saturn.cs.trinity.edu:35357/", t.token_id);
            string thirdBox = string.Empty;
            for (int z = 0; z < TenantList2.Count; z++)
                thirdBox += Tenant.PrettyPrint(TenantList2[z]);

            txtTest7.Text = firstBox;
            txtTest9.Text = thirdBox;
        }

        protected void btnTest4_Click(object sender, EventArgs e)
        {
            Tenant newtenant = Tenant.Create("http://saturn.cs.trinity.edu:35357/", t.token_id, "adminTestNew999", "admin test tenant");
            List<Tenant> TenantList1 = Tenant.List("http://saturn.cs.trinity.edu:35357/", t.token_id);
            string firstBox = string.Empty;
            for (int y = 0; y < TenantList1.Count; y++)
                firstBox += Tenant.PrettyPrint(TenantList1[y]);

            try
            {
                Tenant getTen = Tenant.Get("http://saturn.cs.trinity.edu:35357/", t.token_id, ".NET is better than Ruby");
            }
            catch (Exception x)
            {
                txtTest11.Text = x.ToString();
            }

            Tenant.Delete("http://saturn.cs.trinity.edu:35357/", t.token_id, newtenant.id);
            List<Tenant> TenantList2 = Tenant.List("http://saturn.cs.trinity.edu:35357/", t.token_id);
            string thirdBox = string.Empty;
            for (int z = 0; z < TenantList2.Count; z++)
                thirdBox += Tenant.PrettyPrint(TenantList2[z]);

            txtTest10.Text = firstBox;
            txtTest12.Text = thirdBox;
        }
    }
}