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
        List<User> users;
        TestListUser userListTest;

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
                lblCreateUserPassFail.Visible = userListTest.setUp(txtbAdminURL.Text, LoginSession.userToken.token_id, "tstUserTen1138");
                lblCreateUserPassFail.Text = "PASS";

                Boolean ret = true;
                String output = String.Empty;

                try
                {

                    ret |= userListTest.run(txtbAdminURL.Text, LoginSession.userToken.token_id, 10, "TestUserTK427_", "password1", false, ref output);

                    lblRunTest1.Visible = ret;
                    lblRunTest1.Text = "PASS";

                    foreach (User u in userListTest.users)
                    {
                        users.Add(u);
                    }
                    foreach (User u in users)
                    {
                        lstbxUsers.Items.Add(u.name + " " + u.id);
                    }
                }
                catch (Exception x)
                {
                    lblUser.Text = x.Message;
                    lblCreateUserPassFail.Visible = true;
                    lblCreateUserPassFail.Text = "FAIL";
                    pnlUserInfo.Visible = true;
                }

                try
                {
                    lblTearDown1.Visible = userListTest.tearDown(txtbAdminURL.Text, LoginSession.userToken.token_id);
                    lblTearDown1.Text = "PASS";
                }
                catch (Exception x)
                {
                    lblUser.Text = x.Message;
                    lblCreateUserPassFail.Visible = true;
                    lblCreateUserPassFail.Text = "FAIL";
                }
            }
            catch (Exception x)
            {
                lblUser.Text = x.Message;
                lblCreateUserPassFail.Visible = true;
                lblCreateUserPassFail.Text = "FAIL";
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
                lblPassword.Text = u.password;
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
    }
}