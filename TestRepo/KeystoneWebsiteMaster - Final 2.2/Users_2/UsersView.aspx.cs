using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using Trinity.OpenStack;

namespace KeystoneWebsite.Users
{
    public partial class UsersView : System.Web.UI.Page
    {
        Token t;

        protected void Page_Load(object sender, EventArgs e)
        {
            t = Token.Request_WithTenantID("http://saturn.cs.trinity.edu:5000/", "admin", "trinitytu", "student");
        }

        protected void btnTest1_Click(object sender, EventArgs e)
        {
            List<User> userList = Trinity.OpenStack.User.List("http://saturn.cs.trinity.edu:35357/", t.token_id);
            string firstBox = string.Empty;
            for (int x = 0; x < userList.Count; x++)
                firstBox += PrettyPrint(userList[x]);
            txtTest1.Text = firstBox;     
        }

        public static string PrettyPrint(User u)
        {
            string ret = string.Empty;

            ret = "{" + '\n' + "Name: " + u.name + '\n' + "Id: " + u.id + '\n' + 
                "Email: " + u.email + '\n' + "Enabled: " + u.enabled + '\n' + 
                "Tenant ID: " + u.tenantid + '\n' + "}" + "\n\n";

            return ret;
        }
    }
}