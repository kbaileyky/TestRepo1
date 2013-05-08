using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace KeystoneWebsite.Account
{
    public partial class LoginUser : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (LoginSession.userToken != null)
            {
                lblUserName.Text = LoginSession.userToken.user_name;
                lblUserID.Text = LoginSession.userToken.user_id;
                lblTokenID.Text = LoginSession.userToken.token_id;
                txtUserRoles.Text = LoginSession.userToken.user_roles;               
            }

        }
    }
}