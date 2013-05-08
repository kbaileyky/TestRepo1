using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using Trinity.OpenStack;

namespace KeystoneWebsite.Account
{
    public partial class Login : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {


            var returnUrl = HttpUtility.UrlEncode(Request.QueryString["ReturnUrl"]);

        }

        protected void btnLogIn_Click(object sender, EventArgs e)
        {
            try
            {
                if (txtbTenant.Text.Equals(String.Empty))
                {
                    LoginSession.userToken = Token.Request_NoTenant(txtbURL.Text, txtbUserName.Text, txtbPassword.Text);
                }
                else
                {
                    LoginSession.userToken = Token.Request_WithTenantID(txtbURL.Text, txtbUserName.Text, txtbPassword.Text, txtbTenant.Text);
                }


                if (LoginSession.userToken.token_error.Equals(String.Empty))
                {
                    lblLoginRet.Text = LoginSession.userToken.token_id + "\n" + LoginSession.userToken.token_expiration;
                    LoginSession.adminURL = txtbAdminURL.Text;
                    Server.Transfer("LoginUser.aspx");

                }
                else
                    lblLoginRet.Text = LoginSession.userToken.token_error;
            }
            catch (Exception ex)
            {
                lblLoginRet.Text = ex.ToString();
            }

        }

    }
}