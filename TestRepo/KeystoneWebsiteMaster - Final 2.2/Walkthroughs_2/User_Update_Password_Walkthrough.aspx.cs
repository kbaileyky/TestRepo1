using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Trinity.OpenStack;

namespace KeystoneWebsite.Users
{
    public partial class User_Update_Password_Walkthrough : System.Web.UI.Page
    {
        int counter;

        Trinity.OpenStack.Token retrieved_token;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                txtToken.Text = Session["token_value"].ToString();
                txtURL.Text = Session["stack_url"].ToString();
            }
        }

        protected void btnNext1_Click(object sender, EventArgs e)
        {
            Panel2.Visible = true; ;
        }

        protected void btnNext2_Click(object sender, EventArgs e)
        {
            Panel3.Visible = true;
            string listusers_url = Session["stack_url"].ToString() + ":35357";
            int counter;
            List<Trinity.OpenStack.User> User_List = Trinity.OpenStack.User.List(listusers_url, Session["token_value"].ToString());
            txtResult.Text = "";
            for (counter = 0; counter < User_List.Count(); counter++)
            {
                txtResult.Text += "   Name: " + User_List[counter].name;
                txtResult.Text += Environment.NewLine;
                txtResult.Text += ("   Enabled: " + User_List[counter].enabled);
                txtResult.Text += Environment.NewLine;
                txtResult.Text += ("   Email: " + User_List[counter].email);
                txtResult.Text += Environment.NewLine;
                txtResult.Text += ("   UserId: " + User_List[counter].id);
                txtResult.Text += Environment.NewLine;
                txtResult.Text += ("   TenantId: " + User_List[counter].tenantid);
                txtResult.Text += Environment.NewLine;
                txtResult.Text += ("======================================");
                txtResult.Text += Environment.NewLine;
                txtResult.Text += Environment.NewLine;
            }
        }

        protected void btnNext3_Click(object sender, EventArgs e)
        {
            Panel4.Visible = true;
            Trinity.OpenStack.User returned_user = new Trinity.OpenStack.User();
            try
            {
                string password_url = Session["stack_url"].ToString() + ":35357";
                returned_user = Trinity.OpenStack.User.Update_Password(password_url, txtToken.Text, txtUserId.Text, txtName.Text, txtPassword.Text);
                txtUpdatePasswordResult.Text += Environment.NewLine;
                txtUpdatePasswordResult.Text += "Password Updated";
            }
            catch (Exception x)
            {
                txtUpdatePasswordResult.Text = x.Message.ToString();
            }
        }
    }
}