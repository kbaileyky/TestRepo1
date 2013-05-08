using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using Trinity.OpenStack;
namespace KeystoneWebsite.Roles
{
    public partial class CreateRoles : System.Web.UI.Page
    {
        Token t;

        protected void Page_Load(object sender, EventArgs e)
        {
            t = Token.Request_WithTenantID("http://198.61.199.47:5000/", "admin", "password", "tenant1");
        }

        protected void btnTest1_Click(object sender, EventArgs e)
        {
            //txtTest1.Text = Role.Add("http://cloud.cs.trinity.edu:35357/", "Test1", t.token_id).id;
        }

        protected void btnTest2_Click(object sender, EventArgs e)
        {
            //txtTest2.Text = Role.Add("http://cloud.cs.trinity.edu:35357/", "Test2", t.token_id).error;
        }

        protected void btnTest3_Click(object sender, EventArgs e)
        {
           // txtTest3.Text = Role.Add("http://cloud.cs.trinity.edu:35357/", "Test3", t.token_id).error;
        }

        protected void btnTest4_Click(object sender, EventArgs e)
        {
            //txtTest4.Text = Role.Add("http://cloud.cs.trinity.edu:35357/", "Test4", t.token_id).error;
        }

        protected void btnTest5_Click(object sender, EventArgs e)
        {
            //txtTest5.Text = Role.Add("http://cloud.cs.trinity.edu:35357/", "Test5", t.token_id).error;
        }

    
    }
}