﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Trinity.OpenStack;

namespace KeystoneWebsite.Users
{
    public partial class User_Delete_Walkthrough : System.Web.UI.Page
    {
        Trinity.OpenStack.Token retrieved_token;
        string listusers_url;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                retrieved_token = Trinity.OpenStack.Token.Request_WithTenantID("http://198.61.199.47:5000", "admin", "password", "tenant1");
                Session["token_value"] = retrieved_token.token_id.ToString();
                Session["stack_url"] = "http://198.61.199.47";
                Session["tenant_id"] = "78f0f0f79cd241a2b6ade773f9ad5cf1";

                txtToken.Text = Session["token_value"].ToString();
                txtURL.Text = Session["stack_url"].ToString();
                txtTenantId.Text = Session["tenant_id"].ToString();

                Panel2.Visible = false;
                Panel3.Visible = false;
                Panel4.Visible = false;
            }
        }

        protected void btnNext1_Click(object sender, EventArgs e)
        {
            Panel2.Visible = true;
        }

        protected void btnNext2_Click(object sender, EventArgs e)
        {
            Panel3.Visible = true;

            listusers_url = Session["stack_url"].ToString() + ":35357";
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
                txtResult.Text += ("=================================================");
                txtResult.Text += Environment.NewLine;
                txtResult.Text += Environment.NewLine;
            }
        }

        protected void btnNext3_Click(object sender, EventArgs e)
        {
            Panel4.Visible = true;

            string deleteuser_url = Session["stack_url"].ToString() + ":35357";
            try
            {
                string server_return = Trinity.OpenStack.User.Delete(deleteuser_url, txtUserId.Text, txtToken.Text);
                txtDeleteResult.Text += server_return;
            }
            catch (Exception x)
            {
                txtDeleteResult.Text = x.Message.ToString();
            }

        }

        protected void btnRenew_Click(object sender, EventArgs e)
        {
            string listusers_url = Session["stack_url"].ToString() + ":35357";
            int counter;

            List<Trinity.OpenStack.User> User_List = Trinity.OpenStack.User.List(listusers_url, Session["token_value"].ToString());
            for (counter = 0; counter < User_List.Count(); counter++)
            {
                txtResult.Text = "   Name: " + User_List[counter].name;
                txtResult.Text += Environment.NewLine;
                txtResult.Text += ("   Enabled: " + User_List[counter].enabled);
                txtResult.Text += Environment.NewLine;
                txtResult.Text += ("   Email: " + User_List[counter].email);
                txtResult.Text += Environment.NewLine;
                txtResult.Text += ("   UserId: " + User_List[counter].id);
                txtResult.Text += Environment.NewLine;
                txtResult.Text += ("   TenantId: " + User_List[counter].tenantid);
                txtResult.Text += Environment.NewLine;
                txtResult.Text += ("=================================================");
                txtResult.Text += Environment.NewLine;
                txtResult.Text += Environment.NewLine;
            }
        }
    }
}