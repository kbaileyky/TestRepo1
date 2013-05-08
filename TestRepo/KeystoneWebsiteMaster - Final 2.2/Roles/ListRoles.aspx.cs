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
            if (LoginSession.userToken != null)
                t = LoginSession.userToken;
            else
                //Response.Redirect("~/Account/Login.aspx");
                t = Token.Request_WithTenantID("http://saturn.cs.trinity.edu:5000", "admin", "trinitytu", "student");
        }

        protected void btnTest1_Click(object sender, EventArgs e)
        {
            txtTest1.Text = "";
            List<Role> rolelist = new List<Role>();
            try
            {
                 rolelist = Role.List(txtAdminUrl.Text, t.token_id);
            }
            catch (Exception x)
            {
                txtTest1.Text = x.Message;
            }
            foreach (Role r in rolelist)
                txtTest1.Text += r.name + " " + r.id + Environment.NewLine;
        }

        protected void btnTest2_Click(object sender, EventArgs e)
        {
            txtTest2.Text = "";
            List<Role> rolelist = new List<Role>();
            try
            {
                rolelist = Role.List("http://invalid:5000", t.token_id);

            }
            catch (Exception x)
            {
                txtTest2.Text = x.Message;
            }
            foreach (Role r in rolelist)
                txtTest2.Text += r.name + " " + r.id + Environment.NewLine;
        }

        protected void btnTest3_Click(object sender, EventArgs e)
        {
            txtTest3.Text = "";
            List<Role> rolelist = new List<Role>();
            try
            {
                rolelist = Role.List(txtAdminUrl.Text, "12345");
            }
            catch (Exception x)
            {
                txtTest3.Text = x.Message;
            }
            foreach (Role r in rolelist)
                txtTest3.Text += r.name + " " + r.id + Environment.NewLine;
        }
    }
}