using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Trinity.OpenStack;
using Trinity.OpenStack.Tests;

namespace KeystoneWebsite.Users
{
    public partial class UsersList : System.Web.UI.Page
    {
        protected static List<User> users;
        protected static TestListUser userListTest;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (sender != null && sender.GetType().Equals(this.GetType()))
            {
                if (((UsersList)sender).CurrentTest != null)
                {
                    userListTest = ((UsersList)sender).CurrentTest;
                    users = ((UsersList)sender).testList;
                }
                else
                {
                    userListTest = new TestListUser();
                    users = new List<User>();
                }
            }
            else
            {
                userListTest = new TestListUser();
                users = new List<User>();
            }           
        }

        protected void btnTest1_Click(object sender, EventArgs e)
        {
            users = new List<User>();
            lstbxUsers.Items.Clear();
            userListTest = new TestListUser();
            try
            {
                lblRunTest1.Visible = userListTest.run(LoginSession.adminURL, LoginSession.userToken.token_id);
                lblRunTest1.Text = "PASS";

                foreach (User u in userListTest.users)
                {
                    users.Add(u);
                }
                foreach (User u in users)
                {
                    lstbxUsers.Items.Add(u.name);
                }
            }
            catch (Exception x)
            {
                lblUser.Text = x.Message;
                lblRunTest1.Visible = true;
                lblRunTest1.Text = "FAIL";
                pnlUserInfo.Visible = true;
            }
        }

        protected void lstbxUsers_SelectedIndexChanged(object sender, EventArgs e)
        {
            pnlUserInfo.Visible = true;
            if (users != null)
            {
                User u = users[lstbxUsers.SelectedIndex];
                lblName.Text = u.name;
                lblID.Text = u.id;
                lblEmail.Text = u.email;
                lblEnabled.Text = u.enabled;
                lblTenantID.Text = u.tenantid;
            }
            else
            {
                lblUser.Text = "Error null Endpoint List";
            }
        }

        public TestListUser CurrentTest
        {
            get
            {
                return userListTest;
            }
        }

        public List<User> testList
        {
            get
            {
                return users;
            }
        }

        protected void btnTest2_Click(object sender, EventArgs e)
        {
            try
            {
                userListTest.run("http://baddddddURL.com:1138", LoginSession.userToken.token_id);
            }
            catch (Exception x)
            {
                TextBox1.Text = x.Message;
            }
        }

        protected void btnTest3_Click(object sender, EventArgs e)
        {
            try
            {
                userListTest.run(LoginSession.adminURL, "TokenTokenToke");
            }
            catch (Exception x)
            {
                TextBox2.Text = x.Message;
            }
        }
    }
}