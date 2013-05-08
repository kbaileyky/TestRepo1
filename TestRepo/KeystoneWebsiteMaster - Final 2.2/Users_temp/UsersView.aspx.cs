using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using Trinity.OpenStack;

namespace KeystoneWebsite.Users
{
    public partial class UsersView : System.Web.UI.Page
    {

        protected static Trinity.OpenStack.UserManager um;


        protected void Page_Load(object sender, EventArgs e)
        {

            if (sender != null && sender.GetType().Equals(this.GetType()))
            {
                if (((UsersView)sender).CurrentManager != null)
                    um = ((UsersView)sender).CurrentManager;
                else
                    um = new UserManager();

            }
            else
            {
                um = new UserManager();
            }
            lstbxUsers.SelectedIndexChanged += new EventHandler(lstbxUsers_SelectedIndexChanged);
        }

        protected void btnListRoles_Click(object sender, EventArgs e)
        {
            try
            {

                um = new UserManager();
                lstbxUsers.Items.Clear();
                um.List_User(txtbURL.Text, txtbToken.Text, txtbToken.Text);

                foreach (User u in um.user_list)
                {
                    lstbxUsers.Items.Add(u.name + " " + u.id);

                }

                if (um.user_list.Count != 0)
                {
                    lnkbtnPrintFV.Visible = true;
                }
                else
                {
                    lnkbtnPrintFV.Visible = false;
                }


            }
            catch (Exception x)
            {
                lblUser.Text = x.Message;
            }
        }


        protected void lstbxUsers_SelectedIndexChanged(object sender, EventArgs e)
        {
            pnlUsersInfo.Visible = true;
            if (um.user_list != null)
            {

                User u = um.user_list[lstbxUsers.SelectedIndex];
                lblName.Text = u.name;
                lblID.Text = u.id;
            }
            else
            {
                lblUser.Text = "Error null User List";
            }

        }

        public UserManager CurrentManager
        {
            get
            {
                return um;
            }
        }
        
    }
}