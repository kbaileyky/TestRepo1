using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using Trinity.OpenStack;

namespace KeystoneWebsite.Users
{
    public partial class UsersDeleteRole : System.Web.UI.Page
    {
        protected static List<Role> beforeList;
        protected static List<Role> afterList;
        protected static TestDeleteUserRole userRoleTest;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (sender != null && sender.GetType().Equals(this.GetType()))
            {
                if (((UsersDeleteRole)sender).CurrentTest != null)
                {
                    userRoleTest = ((UsersDeleteRole)sender).CurrentTest;
                    beforeList = ((UsersDeleteRole)sender).beforeTestList;
                    afterList = ((UsersDeleteRole)sender).afterTestList;
                }
                else
                {
                    userRoleTest = new TestDeleteUserRole();
                    beforeList = new List<Role>();
                    afterList = new List<Role>();
                }
            }
            else
            {
                userRoleTest = new TestDeleteUserRole();
                beforeList = new List<Role>();
                afterList = new List<Role>();
            }
        }

        protected void btnTest1_Click(object sender, EventArgs e)
        {
            lstbxUsers.Items.Clear();
            userRoleTest = new TestDeleteUserRole();
            try
            {
                lblCreateUserPassFail.Visible = userRoleTest.setUp(txtbAdminURL.Text, LoginSession.userToken.token_id, "tstUserTen1138", 10);
                lblCreateUserPassFail.Text = "PASS";

                lstbxUsers.Items.Clear();
                Boolean ret = true;
                String output = String.Empty;

                for (int i = 0; i < 10; ++i)
                {
                    ret |= userRoleTest.run(txtbAdminURL.Text, LoginSession.userToken.token_id);
                }

                lblRunTest1.Visible = ret;
                lblRunTest1.Text = "PASS";

                foreach (Role r in userRoleTest.disposableRoles)
                {
                    beforeList.Add(r);
                }
                foreach (Role r in beforeList)
                {
                    lstbxUsers.Items.Add(r.name + " " + r.id);
                }

                try
                {
                    lblTearDown1.Visible = userRoleTest.run(txtbAdminURL.Text, LoginSession.userToken.token_id);
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

        public TestDeleteUserRole CurrentTest
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