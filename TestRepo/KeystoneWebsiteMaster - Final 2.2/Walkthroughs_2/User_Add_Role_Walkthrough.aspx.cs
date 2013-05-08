using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Trinity.OpenStack;
using Newtonsoft.Json;
using Newtonsoft.Json.Linq;

namespace KeystoneWebsite
{
    public partial class User_Add_Role_Walkthrough : System.Web.UI.Page
    {
        
        List<Role> role_list;
        int counter;

        Trinity.OpenStack.Token retrieved_token;

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

            string listusers_url = Session["stack_url"].ToString() + ":35357";

            try
            {
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
                    txtResult.Text += ("=====================================");
                    txtResult.Text += Environment.NewLine;
                    txtResult.Text += Environment.NewLine;
                }
            }
                catch (Exception x)
            {
                txtResult.Text = x.Message.ToString();
            }

                try
                {
                    role_list = Role.List(listusers_url, Session["token_value"].ToString());
                    try
                    {
                        //JObject oServerReturn = JObject.Parse(role_list);
                        //JArray Role_Array = (JArray)oServerReturn["roles"];
                        for (counter = 0; counter < role_list.Count(); counter++)
                        {
                            txtRoles.Text += role_list[counter].name;
                            txtRoles.Text += Environment.NewLine;
                            txtRoles.Text += role_list[counter].id.ToString();
                            txtRoles.Text += Environment.NewLine;
                            txtRoles.Text += "---------------------------------";
                            txtRoles.Text += Environment.NewLine;
                        }
                    }
                    catch (Exception x)
                    {
                        txtRoles.Text = "Argument error, JSON string could not be parsed.";
                    }
                }
                catch (Exception x)
                {
                    txtRoles.Text = x.Message.ToString();
                }
            }
            
        

        protected void btnNext3_Click(object sender, EventArgs e)
        {
            Panel4.Visible = true;

            Role user_role;
            string addrole_url = txtURL.Text + ":35357";

            try
            {
                user_role = Trinity.OpenStack.User.AddRoleToUser(addrole_url, txtUserID.Text, txtTenantId.Text, txtRoleID.Text, txtToken.Text);

                txtAddResult.Text = "Role Added -> Name: " + user_role.name.ToString() + ", ID = " + user_role.id.ToString() + ".";
                txtAddResult.Text += Environment.NewLine;

            }

            catch (Exception x)
            {
                txtAddResult.Text = x.Message.ToString();
            }

        } 
    }
}