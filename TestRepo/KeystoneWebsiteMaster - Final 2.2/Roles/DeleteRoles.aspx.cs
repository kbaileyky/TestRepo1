using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Trinity.OpenStack;
namespace KeystoneWebsite.Roles
{
    public partial class DeleteRoles : System.Web.UI.Page
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
            txtTest1.Text = TestDelete(txtAdminUrl.Text, t.token_id);
        }

        protected void btnTest2_Click(object sender, EventArgs e)
        {
            txtTest2.Text = TestDelete("http://invalid:5000", t.token_id);
        }

        protected void btnTest3_Click(object sender, EventArgs e)
        {
            txtTest3.Text = TestDelete2(txtAdminUrl.Text, t.token_id);
        }

        protected void btnTest4_Click(object sender, EventArgs e)
        {
            txtTest4.Text = TestDelete(txtAdminUrl.Text, "12345");
        }

        protected void btnTest5_Click(object sender, EventArgs e)
        {
      //      txtTest5.Text = TestDelete(txtAdminUrl.Text, t.token_id);
            txtTest5.Text = "Not implemented yet.";
        }

        private string TestDelete(string adminUrl, string token_id)
        {
            List<Role> rolelist = new List<Role>();
            Role testrole = new Role();
            string ret = String.Empty;

            try
            {
                testrole = Role.Add(adminUrl, "TestRole1", token_id);
                try
                {
                    rolelist = Role.List(adminUrl, token_id);
                    ret += "List of roles before Delete:" + Environment.NewLine;
                    foreach (Role r in rolelist)
                        ret += r.name + " " + r.id + Environment.NewLine;
                    ret += Environment.NewLine + "Attempting to delete TestRole1..." + Environment.NewLine + Environment.NewLine;
                    try
                    {
                        Role.Delete(adminUrl, testrole.id, token_id);
                        try
                        {
                            rolelist = Role.List(adminUrl, token_id);
                            ret += "List of roles after Delete: " + Environment.NewLine;
                            foreach (Role r in rolelist)
                                ret += r.name + " " + r.id + Environment.NewLine;
                        }
                        catch (Exception x)
                        {
                            return "After List failed: " + x.Message;
                        }
                    }
                    catch (Exception x)
                    {
                        return x.Message;
                    }
                }
                catch (Exception x)
                {
                    return "Before List failed: " + x.Message;
                }
            }
            catch (Exception x)
            {
                return x.Message;
            }
            return ret;
        }
        private string TestDelete2(string adminUrl, string token_id)
        {
            List<Role> rolelist = new List<Role>();
            Role testrole = new Role();
            string ret = String.Empty;

            try
            {
                testrole = Role.Add(adminUrl, "TestRole1", token_id);
                try
                {
                    rolelist = Role.List(adminUrl, token_id);
                    ret += "List of roles before Delete:" + Environment.NewLine;
                    foreach (Role r in rolelist)
                        ret += r.name + " " + r.id + Environment.NewLine;
                    ret += Environment.NewLine + "Attempting to delete TestRole1..." + Environment.NewLine + Environment.NewLine;
                    try
                    {
                        Role.Delete(adminUrl, "12345", token_id);
                        try
                        {
                            rolelist = Role.List(adminUrl, token_id);
                            ret += "List of roles after Delete: " + Environment.NewLine;
                            foreach (Role r in rolelist)
                                ret += r.name + " " + r.id + Environment.NewLine;
                        }
                        catch (Exception x)
                        {
                            return "After List failed: " + x.Message;
                        }
                    }
                    catch (Exception x)
                    {
                        Role.Delete(adminUrl, testrole.id, token_id);
                        return x.Message;
                    }
                }
                catch (Exception x)
                {
                    return "Before List failed: " + x.Message;
                }
            }
            catch (Exception x)
            {
                return x.Message;
            }
            return ret;
        }
        private string TestDelete3(string adminUrl, string token_id)
        {
            List<Role> rolelist = new List<Role>();
            Role testrole = new Role();
            string ret = String.Empty;

            try
            {
                testrole = Role.Add(adminUrl, "TestRole1", token_id);
                try
                {
                    rolelist = Role.List(adminUrl, token_id);
                    ret += "List of roles before Delete:" + Environment.NewLine;
                    foreach (Role r in rolelist)
                        ret += r.name + " " + r.id + Environment.NewLine;
                    ret += Environment.NewLine + "Attempting to delete TestRole1..." + Environment.NewLine + Environment.NewLine;
                    try
                    {
                        Role.Delete(adminUrl, testrole.id, token_id);
                        Role.Delete(adminUrl, testrole.id, token_id);
                        try
                        {
                            rolelist = Role.List(adminUrl, token_id);
                            ret += "List of roles after Delete: " + Environment.NewLine;
                            foreach (Role r in rolelist)
                                ret += r.name + " " + r.id + Environment.NewLine;
                        }
                        catch (Exception x)
                        {
                            return "After List failed: " + x.Message;
                        }
                    }
                    catch (Exception x)
                    {
                        return x.Message;
                    }
                }
                catch (Exception x)
                {
                    return "Before List failed: " + x.Message;
                }
            }
            catch (Exception x)
            {
                return x.Message;
            }
            return ret;
        }
    }
}