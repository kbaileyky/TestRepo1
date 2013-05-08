using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Trinity.OpenStack;

namespace KeystoneWebsite.Roles
{
    public partial class GetRoles : System.Web.UI.Page
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
            string roleid;
            Role getrole;
            try
            {
                roleid = Role.List(txtAdminUrl.Text, t.token_id)[0].id;
                try
                {
                    getrole = Role.Get(txtAdminUrl.Text, roleid, t.token_id);
                    txtTest1.Text = getrole.name + " " + getrole.id;
                }
                catch (Exception x)
                {
                    txtTest1.Text = x.Message;
                }
            }
            catch (Exception x)
            {
                
                txtTest1.Text = "Role.List error: " + x.Message;
            }
        }

        protected void btnTest2_Click(object sender, EventArgs e)
        {
            string roleid;
            Role getrole;
            try
            {
                roleid = Role.List(txtAdminUrl.Text, t.token_id)[0].id;
                try
                {
                    getrole = Role.Get("blahblah"+txtAdminUrl.Text, roleid, t.token_id);
                    txtTest2.Text = getrole.name + " " + getrole.id;
                }
                catch (Exception x)
                {
                    txtTest2.Text = x.Message;
                }
            }
            catch (Exception x)
            {

                txtTest2.Text = "Role.List error: " + x.Message;
            }
        }

        protected void btnTest3_Click(object sender, EventArgs e)
        {
            string roleid;
            Role getrole;
            try
            {
                roleid = Role.List(txtAdminUrl.Text, t.token_id)[0].id;
                try
                {
                    getrole = Role.Get(txtAdminUrl.Text, roleid + "12345", t.token_id);
                    txtTest3.Text = getrole.name + " " + getrole.id;
                }
                catch (Exception x)
                {
                    txtTest3.Text = x.Message;
                }
            }
            catch (Exception x)
            {

                txtTest3.Text = "Role.List error: " + x.Message;
            }
        }

        protected void btnTest4_Click(object sender, EventArgs e)
        {
            string roleid;
            Role getrole;
            try
            {
                roleid = Role.List(txtAdminUrl.Text, t.token_id)[0].id;
                try
                {
                    getrole = Role.Get(txtAdminUrl.Text, roleid, t.token_id + "12345");
                    txtTest4.Text = getrole.name + " " + getrole.id;
                }
                catch (Exception x)
                {
                    txtTest4.Text = x.Message;
                }
            }
            catch (Exception x)
            {

                txtTest4.Text = "Role.List error: " + x.Message;
            }
        }

    }
}