using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using Trinity.OpenStack;

namespace KeystoneWebsite.Roles
{
    public partial class ViewRoles : System.Web.UI.Page
    {
        protected static RoleManager rm;


        protected void Page_Load(object sender, EventArgs e)
        {

            if (sender != null && sender.GetType().Equals(this.GetType()))
            {
                if (((ViewRoles)sender).CurrentManager != null)
                    rm = ((ViewRoles)sender).CurrentManager;
                else
                    rm = new RoleManager();

            }
            else
            {
                rm = new RoleManager();
            }
            lstbxRoles.SelectedIndexChanged += new EventHandler(lstbxRoles_SelectedIndexChanged);
        }

        protected void btnListRoles_Click(object sender, EventArgs e)
        {
            try
            {

                rm = new RoleManager();
                lstbxRoles.Items.Clear();
                rm.List_Roles(txtbURL.Text, txtbToken.Text, txtbToken.Text);

                foreach (Role r in rm.role_list)
                {
                    lstbxRoles.Items.Add(r.name + " " + r.id);

                }

                if (rm.role_list.Count != 0)
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
                lblRole.Text = x.Message;
            }
        }


        protected void lstbxRoles_SelectedIndexChanged(object sender, EventArgs e)
        {
            pnlRoleInfo.Visible = true;
            if (rm.role_list != null)
            {

                Role r = rm.role_list[lstbxRoles.SelectedIndex];
                lblName.Text = r.name;
                lblID.Text = r.id;
            }
            else
            {
                lblRole.Text = "Error null Role List";
            }

        }

        public RoleManager CurrentManager
        {
            get
            {
                return rm;
            }
        }
    }


}