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
    public partial class UsersDelete : System.Web.UI.Page
    {
        protected static List<User> beforeList;
        protected static List<User> afterList;
        protected static List<User> disposable;
        protected static TestDeleteUser userTest;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (sender != null && sender.GetType().Equals(this.GetType()))
            {
                if (((UsersDelete)sender).CurrentTest != null)
                {
                    userTest = ((UsersDelete)sender).CurrentTest;
                    beforeList = ((UsersDelete)sender).beforeTestList;
                    afterList = ((UsersDelete)sender).afterTestList;
                }
                else
                {
                    userTest = new TestDeleteUser();
                    beforeList = new List<User>();
                    afterList = new List<User>();
                }
            }
            else
            {
                userTest = new TestDeleteUser();
                beforeList = new List<User>();
                afterList = new List<User>();
            }
        }

        protected void btnTest1_Click(object sender, EventArgs e)
        {
            lstbxUsers.Items.Clear();
            userTest = new TestDeleteUser();
            try
            {
                lblCreateUserPassFail.Visible = userTest.setUp(LoginSession.adminURL, LoginSession.userToken.token_id, "testTenant1138");
                lblCreateUserPassFail.Text = "PASS";

                disposable = userTest.getDisposable();

                foreach (User u in userTest.users)
                {
                    beforeList.Add(u);
                }
                foreach (User u in beforeList)
                {
                    lstbxUsers.Items.Add(u.name);
                }

                Boolean ret = true;
                String output = String.Empty;

                //End Set Up

                while (disposable.Count > 0)
                {
                    ret |= userTest.run(LoginSession.adminURL, LoginSession.userToken.token_id, disposable[0].id);
                    disposable.RemoveAt(0);
                }
                lblRunTest1.Visible = ret;
                lblRunTest1.Text = "PASS";
                //userTest.em.List_Endpoints(txtbAdminURL.Text, LoginSession.userToken.token_id, LoginSession.userToken.token_id);

                lstbxAfter.Items.Clear();

                try
                {
                    lblTearDown1.Visible = userTest.tearDown(LoginSession.adminURL, LoginSession.userToken.token_id);
                    lblTearDown1.Text = "PASS";

                    foreach (User u in userTest.users)
                    {
                        afterList.Add(u);
                    }
                    foreach (User u in afterList)
                    {
                        lstbxAfter.Items.Add(u.name);
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
            pnlUserInfo.Visible = true;
            if (userTest.users != null)
            {
                User u = beforeList[lstbxUsers.SelectedIndex];
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

        public TestDeleteUser CurrentTest
        {
            get
            {
                return userTest;
            }
        }

        public List<User> beforeTestList
        {
            get
            {
                return beforeList;
            }
        }

        public List<User> afterTestList
        {
            get
            {
                return afterList;
            }
        }

        protected void ListBox1_SelectedIndexChanged(object sender, EventArgs e)
        {
            pnlAfterEpInfo.Visible = true;
            if (userTest.users != null)
            {
                User u = afterList[lstbxAfter.SelectedIndex];
                lblAfterName.Text = u.name;
                lblAfterID.Text = u.id;
                lblAfterEmail.Text = u.email;
                lblAfterEnabled.Text = u.enabled;
                lblAfterTenantID.Text = u.tenantid;
            }
            else
            {
                lblUser.Text = "Error null Endpoint List";
            }
        }

        protected void btnTest2_Click(object sender, EventArgs e)
        {
            try
            {
                userTest.setUp(LoginSession.adminURL, LoginSession.userToken.token_id, "tstUserTen_1");
                disposable = userTest.getDisposable();
                userTest.run("http://baddddddURL.com:1138", LoginSession.userToken.token_id, disposable[0].id);
            }
            catch (Exception x)
            {
                userTest.tearDown(LoginSession.adminURL, LoginSession.userToken.token_id);
                TextBox1.Text = x.Message;
            }
        }

        //bad admin token
        protected void btnTest3_Click(object sender, EventArgs e)
        {
            try
            {
                userTest.setUp(LoginSession.adminURL, LoginSession.userToken.token_id, "tstUserTen_1");
                disposable = userTest.getDisposable();
                userTest.run(LoginSession.adminURL, "TokenTokeToke", disposable[0].id);
            }
            catch (Exception x)
            {
                userTest.tearDown(LoginSession.adminURL, LoginSession.userToken.token_id);
                TextBox2.Text = x.Message;
            }
        }

        //nonexistent user
        protected void btnTest4_Click(object sender, EventArgs e)
        {
            try
            {
                userTest.setUp(LoginSession.adminURL, LoginSession.userToken.token_id, "tstUserTen_1");
                disposable = userTest.getDisposable();
                userTest.run(LoginSession.adminURL, LoginSession.userToken.token_id, "baaaaaaadID");
            }
            catch (Exception x)
            {
                TextBox3.Text = x.Message;
            }
        }
    }
}