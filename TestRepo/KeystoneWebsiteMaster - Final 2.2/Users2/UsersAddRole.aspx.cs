using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using Trinity.OpenStack;

namespace KeystoneWebsite.Users
{
    public partial class UsersAddRole : System.Web.UI.Page
    {
        protected static List<Role> beforeList;
        protected static List<Role> afterList;
        protected static List<Role> duringList;
        protected static TestAddUserRole userRoleTest;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (sender != null && sender.GetType().Equals(this.GetType()))
            {
                if (((UsersAddRole)sender).CurrentTest != null)
                {
                    userRoleTest = ((UsersAddRole)sender).CurrentTest;
                    beforeList = ((UsersAddRole)sender).beforeTestList;
                    afterList = ((UsersAddRole)sender).afterTestList;
                    duringList = ((UsersAddRole)sender).duringTestList;
                }
                else
                {
                    userRoleTest = new TestAddUserRole();
                    beforeList = new List<Role>();
                    afterList = new List<Role>();
                    duringList = new List<Role>();
                }
            }
            else
            {
                userRoleTest = new TestAddUserRole();
                beforeList = new List<Role>();
                afterList = new List<Role>();
                duringList = new List<Role>();
            }
        }

        protected void btnTest1_Click(object sender, EventArgs e)
        {
            lstbxUsers.Items.Clear();
            userRoleTest = new TestAddUserRole();
            try
            {
                lblCreateUserPassFail.Visible = userRoleTest.setUp(txtbAdminURL.Text, LoginSession.userToken.token_id, "tstUserTen121314");
                lblCreateUserPassFail.Text = "PASS";

                foreach (Role r in userRoleTest.disposableRoles)
                {
                    beforeList.Add(r);
                }
                foreach (Role r in beforeList)
                {
                    lstbxUsers.Items.Add(r.name + " " + r.id);
                }

                lstbxDuring.Items.Clear();
                Boolean ret = true;
                String output = String.Empty;

                //End Set Up
                try
                {
                    for (int i = 0; i < 10; i++)
                    {
                        ret |= userRoleTest.run(txtbAdminURL.Text, LoginSession.userToken.token_id, i, false, ref output);
                    }

                    lblRunTest1.Visible = ret;
                    lblRunTest1.Text = "PASS";

                    foreach (Role r in userRoleTest.disposableRoles)
                    {
                        duringList.Add(r);
                    }
                    foreach (Role r in duringList)
                    {
                        lstbxDuring.Items.Add(r.name + " " + r.id);
                    }
                }
                catch (Exception x)
                {
                    lblUser.Text = x.Message;
                    lblCreateUserPassFail.Visible = true;
                    lblCreateUserPassFail.Text = "FAIL";
                    pnlUserInfo.Visible = true;
                }

                //End Run Test

                lstbxAfter.Items.Clear();
                try
                {
                    lblTearDown1.Visible = userRoleTest.tearDown(txtbAdminURL.Text, LoginSession.userToken.token_id);
                    lblTearDown1.Text = "PASS";

                    foreach (Role r in userRoleTest.disposableRoles)
                    {
                        afterList.Add(r);
                    }
                    foreach (Role r in afterList)
                    {
                        lstbxAfter.Items.Add(r.name + " " + r.id);
                    }
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
            if (userRoleTest.disposableRoles != null)
            {
                Role r = beforeList[lstbxUsers.SelectedIndex];
                lblName.Text = r.name;
                lblID.Text = r.id;
            }
            else
            {
                lblUser.Text = "Error null Endpoint List";
            }
        }

        public TestAddUserRole CurrentTest
        {
            get
            {
                return userRoleTest;
            }
        }

        public List<Role> beforeTestList
        {
            get
            {
                return beforeList;
            }
        }

        public List<Role> afterTestList
        {
            get
            {
                return afterList;
            }
        }

        public List<Role> duringTestList
        {
            get
            {
                return duringList;
            }
        }

        protected void lstbxDuring_SelectedIndexChanged(object sender, EventArgs e)
        {
            pnlDuringEpInfo.Visible = true;
            if (userRoleTest.disposableRoles != null)
            {
                Role r = duringList[lstbxDuring.SelectedIndex];
                lblDuringName.Text = r.name;
                lblDuringID.Text = r.id;
            }
            else
            {
                lblUser.Text = "Error null Endpoint List";
            }
        }

        protected void ListBox1_SelectedIndexChanged(object sender, EventArgs e)
        {
            pnlAfterEpInfo.Visible = true;
            if (userRoleTest.disposableRoles != null)
            {
                Role r = afterList[lstbxAfter.SelectedIndex];
                lblAfterName.Text = r.name;
                lblAfterID.Text = r.id;
            }
            else
            {
                lblUser.Text = "Error null Endpoint List";
            }
        }
    }
}