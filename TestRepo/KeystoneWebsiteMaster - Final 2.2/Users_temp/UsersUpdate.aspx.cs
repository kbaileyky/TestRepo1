using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Trinity.OpenStack;

namespace KeystoneWebsite.Users
{
    public partial class UsersUpdate : System.Web.UI.Page
    {
        Token t;
        Trinity.OpenStack.User u;

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnTest_Click(object sender, EventArgs e)
        {
            string returnValue;
            t = Token.Request_WithTenantID("http://198.61.199.47:35357/", "admin", "password", "tenant1");

            //Create User
            u = Trinity.OpenStack.User.Add("http://198.61.199.47:35357", "Bill", "Bob", "True", "123", "b@c.com", t.token_id);
            lblAddUsername.Text = "Username: " + u.name;
            lblAddEmail.Text = "Email: " + u.email;
            lblAddEnabled.Text = "Enabled: " + u.enabled;
            //Successful Update
            Trinity.OpenStack.User.Update(t.token_id, u.id, "Billy", "bob@c.com", "False", u.tenantid, "http://198.61.199.47:35357");
            lblUpdateUsername.Text = "Username: Billy";
            lblUpdateEmail.Text = "Email: bob@c.com";
            lblUpdateEnabled.Text = "Enabled: False";
            //Invalid Admin Token
            returnValue = Trinity.OpenStack.User.Update("123", u.id, "Billy", "bob@c.com", "False", u.tenantid, "http://198.61.199.47:35357");
            lblAdminToken.Text = returnValue;
            //Invalid User ID
            returnValue = Trinity.OpenStack.User.Update(t.token_id, "321", "Billy", "bob@c.com", "False", u.tenantid, "http://198.61.199.47:35357");
            lblUserID.Text = returnValue;
            //Invalid TenantID
            returnValue = Trinity.OpenStack.User.Update(t.token_id, u.id, "Billy", "bob@c.com", "False", "451", "http://198.61.199.47:35357");
            lblTenantID.Text = returnValue;
            //Invalid URL
            returnValue = Trinity.OpenStack.User.Update(t.token_id, u.id, "Billy", "bob@c.com", "False", u.tenantid, "http://198.61.199.48:35357");
            lblURL.Text = returnValue;
            //Delete User
            string deleteRet = Trinity.OpenStack.User.Delete("http://198.61.199.47:35357", u.id, t.token_id);
            lblDeleteUser.Text = deleteRet;
            
        }
    }
}