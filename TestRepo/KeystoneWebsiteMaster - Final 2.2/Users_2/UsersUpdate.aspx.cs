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
    public partial class UsersUpdate : System.Web.UI.Page
    {
        protected static User before;
        protected static List<User> updatesList;
        protected static TestUpdateUser userUpdateTest;

        protected void Page_Load(object sender, EventArgs e)
        {
            TextBox1.Enabled = false;
            TextBox2.Enabled = false;
            TextBox3.Enabled = false;
            if (sender != null && sender.GetType().Equals(this.GetType()))
            {
                if (((UsersUpdate)sender).CurrentTest != null)
                {
                    userUpdateTest = ((UsersUpdate)sender).CurrentTest;
                    before = ((UsersUpdate)sender).beforeTest;
                    updatesList = ((UsersUpdate)sender).updatesTestList;
                }
                else
                {
                    userUpdateTest = new TestUpdateUser();
                    before = new User();
                    updatesList = new List<User>();
                }
            }
            else
            {
                userUpdateTest = new TestUpdateUser();
                before = new User();
                updatesList = new List<User>();
            }
        }

        protected void btnTest1_Click(object sender, EventArgs e)
        {
            updatesList = new List<User>();
            try
            {
                lblCreateUserPassFail.Visible = userUpdateTest.setUp(LoginSession.adminURL, LoginSession.userToken.token_id, "tstUserTen_1", "tstUserTen_2");
                lblCreateUserPassFail.Text = "PASS";

                lstbxUsers.Items.Clear();
                Boolean ret = true;
                String output = String.Empty;
                before = userUpdateTest.getTestUser();

                //End Set Up
                ret |= userUpdateTest.run(LoginSession.adminURL, LoginSession.userToken.token_id, userUpdateTest.updateTestUser.id, "updatedUsername1", "null", "true", userUpdateTest.testTenantId);
                updatesList.Add(userUpdateTest.getTestUser());

                ret |= userUpdateTest.run(LoginSession.adminURL, LoginSession.userToken.token_id, userUpdateTest.updateTestUser.id, "updatedUsername1", "updatedEmail1@email.com", "true", userUpdateTest.testTenantId);
                updatesList.Add(userUpdateTest.getTestUser());

                ret |= userUpdateTest.run(LoginSession.adminURL, LoginSession.userToken.token_id, userUpdateTest.updateTestUser.id, "updatedUsername1", "updatedEmail1@email.com", "true", userUpdateTest.testTenantId2);
                updatesList.Add(userUpdateTest.getTestUser());

                ret |= userUpdateTest.run(LoginSession.adminURL, LoginSession.userToken.token_id, userUpdateTest.updateTestUser.id, "updatedUsername2", "updatedEmail2@email.com", "true", userUpdateTest.testTenantId2);
                updatesList.Add(userUpdateTest.getTestUser());

                lblRunTest1.Visible = ret;
                lblRunTest1.Text = "PASS";

                lstbxUsers.Items.Add(before.name + " " + before.id);
                lstbxAfter.Items.Clear();

                try
                {
                    lblTearDown1.Visible = userUpdateTest.tearDown(LoginSession.adminURL, LoginSession.userToken.token_id);
                    lblTearDown1.Text = "PASS";

                    foreach (User u in updatesList)
                    {
                        lstbxAfter.Items.Add(u.name + "         " + u.id);
                    }
                }
                catch (Exception x)
                {
                    lblUser.Text = x.Message;
                    lblCreateUserPassFail.Visible = true;
                    lblCreateUserPassFail.Text = "FAIL";
                }
            }  //End Run Test          
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
            lblName.Text = before.name;
            lblID.Text = before.id;
            lblEmail.Text = before.email;
            lblEnabled.Text = before.enabled;
            lblTenantID.Text = before.tenantid; 
        }

        public TestUpdateUser CurrentTest
        {
            get
            {
                return userUpdateTest;
            }
        }

        public User beforeTest
        {
            get
            {
                return before;
            }
        }

        public List<User> updatesTestList
        {
            get
            {
                return updatesList;
            }
        }

        protected void lstbxAfter_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (updatesList.Count() > 0)
            {
                //lstbxAfter.Items.Add("" + updatesList.Count() + " " + lstbxAfter.SelectedIndex);
                User u = updatesList[lstbxAfter.SelectedIndex];
                lblAfterName.Text = u.name;
                lblAfterID.Text = u.id;
                lblAfterEmail.Text = u.email;
                lblAfterEnabled.Text = u.enabled;
                lblAfterTenantID.Text = u.tenantid;
            }
        }

        //bad admin url
        protected void btnTest2_Click(object sender, EventArgs e)
        {
            try
            {
                userUpdateTest.setUp(LoginSession.adminURL, LoginSession.userToken.token_id, "tstUserTen_1", "tstUserTen_2");
                userUpdateTest.run("http://baddddddURL.com:1138", LoginSession.userToken.token_id, userUpdateTest.updateTestUser.id, "updatedUsername1", "null", "true", userUpdateTest.testTenantId);
            }
            catch (Exception x)
            {
                userUpdateTest.tearDown(LoginSession.adminURL, LoginSession.userToken.token_id);
                TextBox1.Text = x.Message;
            }
        }

        //bad admin token
        protected void btnTest3_Click(object sender, EventArgs e)
        {
            try
            {
                userUpdateTest.setUp(LoginSession.adminURL, LoginSession.userToken.token_id, "tstUserTen_1", "tstUserTen_2");
                userUpdateTest.run(LoginSession.adminURL, "TokenTokenToke", userUpdateTest.updateTestUser.id, "updatedUsername1", "null", "true", userUpdateTest.testTenantId);
            }
            catch (Exception x)
            {
                userUpdateTest.tearDown(LoginSession.adminURL, LoginSession.userToken.token_id);
                TextBox2.Text = x.Message;
            }
        }

        //nonexistent user
        protected void btnTest4_Click(object sender, EventArgs e)
        {
            try
            {
                userUpdateTest.setUp(LoginSession.adminURL, LoginSession.userToken.token_id, "tstUserTen_1", "tstUserTen_2");
                userUpdateTest.run(LoginSession.adminURL, LoginSession.userToken.token_id, "baaaaaaduserID", "updatedUsername1", "null", "true", userUpdateTest.testTenantId);
            }
            catch (Exception x)
            {
                TextBox3.Text = x.Message;
            }
        }
    }
}