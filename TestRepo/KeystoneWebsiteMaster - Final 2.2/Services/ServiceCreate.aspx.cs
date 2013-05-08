using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Trinity.OpenStack;

namespace KeystoneWebsite.Services
{
    public partial class ServiceCreate : System.Web.UI.Page
    {
        string AdminURL = "";
        string AdminToken = "";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (LoginSession.userToken != null)
                AdminToken = LoginSession.userToken.token_id;
            AdminURL = LoginSession.adminURL;
        }

        protected void btnServiceTest_Click(object sender, EventArgs e)
        {
            string value = RadioButtonList1.SelectedValue;

            if (value == "1")
            {
                //valid adminToken and URL
                TestCase1(sender, e);
                return;
            }
            else if (value == "2")
            {
                //invalid adminToken
                //TestCase2(sender, e);
                return;
            }
            else if (value == "3")
            {
                // invalid url
                //TestCase3(sender, e);
                return;
            }
        }

        protected void TestCase1(object sender, EventArgs e)
        {
            // correct URL and AdminToken
            txtTest1.Text = "";
            Service serv = new Service();
            try
            {
                serv = Service.Create(AdminURL, "Test1_Name", "Test1_Type", "Test1_Description", AdminToken);
            }
            catch (Exception x)
            {
                txtTest1.Text = x.Message;
            }
            txtTest1.Text += "ID: " + serv.id + ", Name: " + serv.name + ", Type: " + serv.type + ", Description: " + serv.description + Environment.NewLine;

        }
    }
}