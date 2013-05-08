using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Trinity.OpenStack;

namespace KeystoneWebsite.Services
{
    public partial class ServiceGet : System.Web.UI.Page
    {
        string AdminURL = "";
        string AdminToken = "";
        string ServiceID = "2cdf772f245140be893bcf4f16f2ba9f";  // service ID for Cinder

        protected void Page_Load(object sender, EventArgs e)
        {
            if (LoginSession.userToken != null)
                AdminToken = LoginSession.userToken.token_id;
            AdminURL = LoginSession.adminURL;
        }

        protected void Button1_Click(object sender, EventArgs e)
        {   // valid parameters
            Service serv = new Service();
            try
            {
                serv = Service.Get(AdminURL, ServiceID, AdminToken);
                Text1.Text = "ID: " + serv.id + ", Name: " + serv.name + ", Type: " + serv.type + ", Description: " + serv.description + Environment.NewLine;
            }
            catch (Exception x)
            {
                Text1.Text = x.Message;
            }            
        }

        protected void Button2_Click(object sender, EventArgs e)
        {   // invalid URL
            Service serv = new Service();
            try
            {
                serv = Service.Get("http://wrong.cs.trinity.edu", ServiceID, AdminToken);
                Text2.Text = "ID: " + serv.id + ", Name: " + serv.name + ", Type: " + serv.type + ", Description: " + serv.description + Environment.NewLine;
            }
            catch (Exception x)
            {
                Text2.Text = x.Message;
            }
        }

        protected void Button3_Click(object sender, EventArgs e)
        {   // invalid ServiceID
            Service serv = new Service();
            try
            {
                serv = Service.Get(AdminURL, "wrong_service_id", AdminToken);
                Text3.Text = "ID: " + serv.id + ", Name: " + serv.name + ", Type: " + serv.type + ", Description: " + serv.description + Environment.NewLine;
            }
            catch (Exception x)
            {
                Text3.Text = x.Message;
            }    
        }

        protected void Button4_Click(object sender, EventArgs e)
        {   // invalid Admin Token
            Service serv = new Service();
            try
            {
                serv = Service.Get(AdminURL, ServiceID, "wrong_admin_token");
                Text4.Text = "ID: " + serv.id + ", Name: " + serv.name + ", Type: " + serv.type + ", Description: " + serv.description + Environment.NewLine;
            }
            catch (Exception x)
            {
                Text4.Text = x.Message;
            }    
        }
        /*
        protected void btnTest1_Click(object sender, EventArgs e)
        {
            // correct URL, ServiceID, and AdminToken
            txtTest1.Text = "";
            Service serv = new Service();
            try
            {
                serv = Service.Create(AdminURL, "Test1Name", "Test1Type", "Test1Description", AdminToken);
            }
            catch (Exception x)
            {
                txtTest1.Text = x.Message;
            }
            txtTest1.Text += "ID: " + serv.id + ", Name: " + serv.name + ", Type: " + serv.type + ", Description: " + serv.description + Environment.NewLine;

        }*/
    }
}