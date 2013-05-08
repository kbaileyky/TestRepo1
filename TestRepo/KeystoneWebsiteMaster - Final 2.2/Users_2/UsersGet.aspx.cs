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
    public partial class UsersGet : System.Web.UI.Page
    {
        protected static User user;
        protected static TestGetUser userGetTest;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (sender != null && sender.GetType().Equals(this.GetType()))
            {
                if (((UsersGet)sender).CurrentTest != null)
                {
                    userGetTest = ((UsersGet)sender).CurrentTest;
                    user = ((UsersGet)sender).userTest;
                }
                else
                {
                    userGetTest = new TestGetUser();
                    user = new User();
                }
            }
            else
            {
                userGetTest = new TestGetUser();
                user = new User();
            }
        }

        protected void btnTest1_Click(object sender, EventArgs e)
        {
            user = new User();
            userGetTest = new TestGetUser();
            try
            {
                lblCreateUserPassFail.Visible = userGetTest.setUp(LoginSession.adminURL, LoginSession.userToken.token_id, "tstUserTen_1");
                lblCreateUserPassFail.Text = "PASS";

                lstbxUser.Items.Clear();
                user = userGetTest.user;

                lblRunTest1.Visible = userGetTest.run(LoginSession.adminURL, LoginSession.userToken.token_id, userGetTest.getTestUser.id);
                lblRunTest1.Text = "PASS";

                user = userGetTest.user;
                lstbxUser.Items.Add(user.name);

                try
                {
                    lblTearDown1.Visible = userGetTest.tearDown(LoginSession.adminURL, LoginSession.userToken.token_id);
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

        protected void lstbxUser_SelectedIndexChanged(object sender, EventArgs e)
        {
            lblName.Text = user.name;
            lblID.Text = user.id;
            lblEmail.Text = user.email;
            lblEnabled.Text = user.enabled;
            lblTenantID.Text = user.tenantid;
        }

        protected void btnTest2_Click(object sender, EventArgs e)
        {
            try
            {
                userGetTest.setUp(LoginSession.adminURL, LoginSession.userToken.token_id, "tstUserTen_1");
                userGetTest.run("http://baddddddURL.com:1138", LoginSession.userToken.token_id, userGetTest.getTestUser.id);
            }
            catch (Exception x)
            {
                userGetTest.tearDown(LoginSession.adminURL, LoginSession.userToken.token_id);
                TextBox1.Text = x.Message;
            }
        }

        protected void btnTest3_Click(object sender, EventArgs e)
        {
            try
            {
                userGetTest.setUp(LoginSession.adminURL, LoginSession.userToken.token_id, "tstUserTen_1");
                userGetTest.run(LoginSession.adminURL, "TokenTokenToke", userGetTest.getTestUser.id);
            }
            catch (Exception x)
            {
                userGetTest.tearDown(LoginSession.adminURL, LoginSession.userToken.token_id);
                TextBox2.Text = x.Message;
            }
        }

        protected void btnTest4_Click(object sender, EventArgs e)
        {
            try
            {
                userGetTest.setUp(LoginSession.adminURL, LoginSession.userToken.token_id, "tstUserTen_1");
                userGetTest.run(LoginSession.adminURL, LoginSession.userToken.token_id, "baaaaaaduserID");
            }
            catch (Exception x)
            {
                TextBox3.Text = x.Message;
            }
        }

        public TestGetUser CurrentTest
        {
            get
            {
                return userGetTest;
            }
        }

        public User userTest
        {
            get
            {
                return user;
            }
        }
    }
}