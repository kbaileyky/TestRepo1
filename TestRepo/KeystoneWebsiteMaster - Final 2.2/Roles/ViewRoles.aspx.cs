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
        List<Role> rolelist = new List<Role>();
        Token t;

        protected void Page_Load(object sender, EventArgs e)
        {  
            if (LoginSession.userToken != null)
                t = LoginSession.userToken;
            else
                //Response.Redirect("~/Account/Login.aspx");
                t = Token.Request_WithTenantID("http://saturn.cs.trinity.edu:5000", "admin", "trinitytu", "student");

            try
            {
                rolelist = Role.List(txtbURL.Text, t.token_id);
            }
            catch (Exception x)
            {
                lstbxRoles.Items.Add(x.Message);
            }
            lstbxRoles.SelectedIndexChanged += new EventHandler(lstbxRoles_SelectedIndexChanged);
        }
        
        protected void btnListRoles_Click(object sender, EventArgs e)
        {
            try
            {
                lstbxRoles.Items.Clear();

                foreach (Role r in rolelist)
                {
                    lstbxRoles.Items.Add(r.name);
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
            if (rolelist != null)
            {

                Role r = rolelist[lstbxRoles.SelectedIndex];
                lblName.Text = r.name;
                lblID.Text = r.id;
            }
            else
            {
                lblRole.Text = "Error null Role List";
            }

        }        
    }
}