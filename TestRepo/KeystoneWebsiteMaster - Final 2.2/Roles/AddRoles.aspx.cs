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
            if (LoginSession.userToken != null)
                t = LoginSession.userToken;
            else
                //Response.Redirect("~/Account/Login.aspx");
                t = Token.Request_WithTenantID("http://saturn.cs.trinity.edu:5000", "admin", "trinitytu", "student");
        }

        protected void btnTest1_Click(object sender, EventArgs e)
        {
            txtTest1.Text = TestAdd(txtAdminUrl.Text, "TestRole1", t.token_id);
        }

        protected void btnTest2_Click(object sender, EventArgs e)
        {
            txtTest2.Text = TestAdd("http://invalid:5000", "TestRole1", t.token_id);
        }

        protected void btnTest3_Click(object sender, EventArgs e)
        {
            txtTest3.Text = TestAdd(txtAdminUrl.Text, "", t.token_id);
        }

        protected void btnTest4_Click(object sender, EventArgs e)
        {
            txtTest4.Text = TestAdd(txtAdminUrl.Text, "TestRole1", "12345");
        }

        protected void btnTest5_Click(object sender, EventArgs e)
        {
            txtTest5.Text = TestAdd2(txtAdminUrl.Text, "TestRole1", t.token_id);
        }

        private string TestAdd(string adminUrl, string rolename, string token_id)
        {
            List<Role> rolelist = new List<Role>();
            Role newrole = new Role();
            string ret = String.Empty;

            try
            {
                rolelist = Role.List(adminUrl, token_id);
                ret += "List of roles before Add:" + Environment.NewLine;
                foreach (Role r in rolelist)
                    ret += r.name + " " + r.id + Environment.NewLine;
                try
                {
                    newrole = Role.Add(adminUrl, rolename, token_id);
                    ret += Environment.NewLine + "Added role: TestRole1" + Environment.NewLine + Environment.NewLine;
                    try
                    {
                        rolelist = Role.List(adminUrl, token_id);
                        ret += "List of roles after Add:" + Environment.NewLine;
                        foreach (Role r in rolelist)
                            ret += r.name + " " + r.id + Environment.NewLine;
                        try
                        {
                            Role.Delete(adminUrl, newrole.id, token_id);
                        }
                        catch (Exception x)
                        {
                            return "Post delete failed: " + x.Message;
                        }
                    }
                    catch (Exception x)
                    {
                        return x.Message;
                    }

                }
                catch (Exception x)
                {
                    try
                    {
                        if (rolename == "")
                            return x.Message;
                        else
                            Role.Delete(adminUrl, newrole.id, token_id);
                    }
                    catch (Exception x2)
                    {
                        return "Catch delete failed: " + x2.Message;
                    }
                    return x.Message;
                }
            }
            catch (Exception x)
            {
               return x.Message;
            }
            return ret;
        }
        private string TestAdd2(string adminUrl, string rolename, string token_id)
        {
            List<Role> rolelist = new List<Role>();
            Role newrole = new Role();
            string ret = String.Empty;

            try
            {
                rolelist = Role.List(adminUrl, token_id);
                ret += "List of roles before Add:" + Environment.NewLine;
                foreach (Role r in rolelist)
                    ret += r.name + " " + r.id + Environment.NewLine;
                try
                {
                    newrole = Role.Add(adminUrl, rolename, token_id);
                    newrole = Role.Add(adminUrl, rolename, token_id);
                    ret += Environment.NewLine + "Added role: TestRole1" + Environment.NewLine + Environment.NewLine;
                    try
                    {
                        rolelist = Role.List(adminUrl, token_id);
                        ret += "List of roles after Add:" + Environment.NewLine;
                        foreach (Role r in rolelist)
                            ret += r.name + " " + r.id + Environment.NewLine;
                        try
                        {
                            Role.Delete(adminUrl, newrole.id, token_id);
                        }
                        catch (Exception x)
                        {
                            return "Post delete failed: " + x.Message;
                        }
                    }
                    catch (Exception x)
                    {
                        return x.Message;
                    }

                }
                catch (Exception x)
                {
                    try
                    {
                        Role.Delete(adminUrl, newrole.id, token_id);
                    }
                    catch (Exception x2)
                    {
                        return "Catch delete failed: " + x2.Message;
                    }
                    return x.Message;
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