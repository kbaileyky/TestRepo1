using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using Trinity.OpenStack;

namespace KeystoneWebsite.Users
{
    public partial class UsersDelete : System.Web.UI.Page
    {
        protected static List<User> beforeList;
        protected static List<User> afterList;
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
                lblCreateUserPassFail.Visible = userTest.Set_Up_Delete_User_Test(txtbAdminURL.Text, LoginSession.userToken.token_id, "tstUserTen1138");
                lblCreateUserPassFail.Text = "PASS";

                lstbxUsers.Items.Clear();
                Boolean ret = true;
                String output = String.Empty;

                //End Set Up
                for (int i = 0; i < 10; i++)
                {
                    ret |= userTest.Run_Test_Delete_User(txtbAdminURL.Text, LoginSession.userToken.token_id, i);
                }

                lblRunTest1.Visible = ret;
                lblRunTest1.Text = "PASS";
                //userTest.em.List_Endpoints(txtbAdminURL.Text, LoginSession.userToken.token_id, LoginSession.userToken.token_id);

                foreach (User u in userTest.users)
                {
                    beforeList.Add(u);
                }
                foreach (User u in beforeList)
                {
                    lstbxUsers.Items.Add(u.name + " " + u.id);
                }

                lstbxAfter.Items.Clear();

                try
                {
                    lblTearDown1.Visible = userTest.Tear_Down_Delete_User_Test(txtbAdminURL.Text, LoginSession.userToken.token_id, userTest.user_testTenantid);
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