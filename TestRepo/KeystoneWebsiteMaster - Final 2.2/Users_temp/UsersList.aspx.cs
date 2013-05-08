using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Trinity.OpenStack;

namespace KeystoneWebsite.Users
{
    public partial class UsersList : System.Web.UI.Page
    {
        Token t;
        Trinity.OpenStack.User u;

        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void btnTest_Click(object sender, EventArgs e)
        {
            string url = "http://198.61.199.47:35357/";
            t = Token.Request_WithTenantID(url, "admin", "password", "tenant1");
            //List Users
            lblFirstListCall.Text = Trinity.OpenStack.User.List(url, t.token_id);
            //Add Quincy1
            u = Trinity.OpenStack.User.Add(url, "Quincy1", "password", true.ToString(), "78f0f0f79cd241a2b6ade773f9ad5cf1", "a@b.com", t.token_id);
            lblAddQuincy.Text = u.name + " added.";
            //List Users again with Quincy1 this time
            lblSecondListCall.Text = Trinity.OpenStack.User.List(url, t.token_id);
            //Delete Quincy1
            lblDeleteQuincy.Text = Trinity.OpenStack.User.Delete(url, u.id, t.token_id);
            //List Users again without Quincy1 this time
            lblThirdListCall.Text = Trinity.OpenStack.User.List(url, t.token_id);
            //Try to call list with an invalid URL
            lblURL.Text = Trinity.OpenStack.User.List("http://198.61.199.48:35357/", t.token_id);
            //Try to call list with an invalid admin_token
            lblAdminToken.Text = Trinity.OpenStack.User.List(url, "1234");
        }
    }
}