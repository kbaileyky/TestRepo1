using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using Trinity.OpenStack;

namespace KeystoneWebsite.Users
{
    public partial class UsersAdd : System.Web.UI.Page
    {
        protected static List<User> beforeList;
        protected static List<User> afterList;
        protected static List<User> duringList;
        protected static TestAddUser userTest;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (sender != null && sender.GetType().Equals(this.GetType()))
            {
                if (((UsersAdd)sender).CurrentTest != null)
                {
                    userTest = ((UsersAdd)sender).CurrentTest;
                    beforeList = ((UsersAdd)sender).beforeTestList;
                    afterList = ((UsersAdd)sender).afterTestList;
                    duringList = ((UsersAdd)sender).duringTestList;
                }
                else
                {
                    userTest = new TestAddUser();
                    beforeList = new List<User>();
                    afterList = new List<User>();
                    duringList = new List<User>();
                }
            }
            else
            {
                userTest = new TestAddUser();
                beforeList = new List<User>();
                afterList = new List<User>();
                duringList = new List<User>();
            }
        }

        protected void btnTest1_Click(object sender, EventArgs e)
        {
            lstbxUsers.Items.Clear();
            userTest = new TestAddUser();
            try
            {
                lblProgress.Text = "before setup";
                lblCreateUserPassFail.Visible = userTest.Set_Up_Add_User_Test(LoginSession.adminURL, LoginSession.userToken.token_id, "tstUserTen121314");
                lblCreateUserPassFail.Text = "PASS";
                lblProgress.Text = "after setup";
                foreach (User u in userTest.users)
                {
                    beforeList.Add(u);
                }
                foreach (User u in beforeList)
                {
                    lstbxUsers.Items.Add(u.name + " " + u.id);
                }

                lstbxDuring.Items.Clear();
                Boolean ret = true;
                String output = String.Empty;

                //End Set Up
                try
                {
                    lblProgress.Text = "before run";                    
                    for (int i = 0; i < 7; i++)
                    {
                        lblProgress.Text = "before run " + i;                    
                        ret |= userTest.Run_Add_User_Test(LoginSession.adminURL, LoginSession.userToken.token_id, userTest.user_testTenantid, i, "TestUser_123" + i, "password" + i, false, ref output);
                    }
                    lblProgress.Text = "after run";

                    lblRunTest1.Visible = ret;
                    lblRunTest1.Text = "PASS";

                    foreach (User u in userTest.users)
                    {
                        duringList.Add(u);
                    }
                    foreach (User u in duringList)
                    {
                        lstbxDuring.Items.Add(u.name + " " + u.id);
                    }
                }
                catch (Exception x)
                {
                    lblUser.Text = x.Message + userTest.errorStep;
                    lblRunTest1.Visible = true;
                    lblRunTest1.Text = "FAIL";
                    pnlUserInfo.Visible = true;
                }

                //End Run Test

                lstbxAfter.Items.Clear();
                try
                {
                    lblTearDown1.Visible = userTest.Tear_Down_Add_User_Test(LoginSession.adminURL, LoginSession.userToken.token_id, userTest.user_testTenantid);
                    lblTearDown1.Text = "PASS";

                    foreach (User u in userTest.users)
                    {
                        afterList.Add(u);
                    }
                    foreach (User u in afterList)
                    {
                        lstbxAfter.Items.Add(u.name + " " + u.id);
                    }
                }
                catch (Exception x)
                {
                    lblUser.Text = x.Message + userTest.errorStep;
                    lblTearDown1.Visible = true;
                    lblTearDown1.Text = "FAIL";
                }
            }
            catch (Exception x)
            {
                lblUser.Text = x.Message + userTest.errorStep;
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

        public TestAddUser CurrentTest
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

        public List<User> duringTestList
        {
            get
            {
                return duringList;
            }
        }

        protected void lstbxDuring_SelectedIndexChanged(object sender, EventArgs e)
        {
            pnlDuringEpInfo.Visible = true;
            if (userTest.users != null)
            {
                User u = duringList[lstbxDuring.SelectedIndex];
                lblDuringName.Text = u.name;
                lblDuringID.Text = u.id;
                lblDuringPassword.Text = u.password;
                lblDuringEmail.Text = u.email;
                lblDuringEnabled.Text = u.enabled;
                lblDuringTenantID.Text = u.tenantid;
            }
            else
            {
                lblUser.Text = "Error null Endpoint List";
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
                lblAfterPassword.Text = u.password;
                lblAfterEmail.Text = u.email;
                lblAfterEnabled.Text = u.enabled;
                lblAfterTenantID.Text = u.tenantid;
            }
            else
            {
                lblUser.Text = "Error null Endpoint List";
            }
        }
    }
}