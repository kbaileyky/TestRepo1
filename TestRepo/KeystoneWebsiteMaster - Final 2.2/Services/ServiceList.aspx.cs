using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Trinity.OpenStack;

namespace KeystoneWebsite
{
    public partial class ServiceList : System.Web.UI.Page
    {
        string AdminURL = "";
        string AdminToken = "";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (LoginSession.userToken != null)
                AdminToken = LoginSession.userToken.token_id;
            AdminURL = LoginSession.adminURL;
        }

        protected void btnServiceListTest_Click(object sender, EventArgs e)
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
                TestCase2(sender, e);
                return;
            }
            else if (value == "3")
            {
                // invalid url
                TestCase3(sender, e);
                return;
            }
        }

        protected void TestCase1(object sender, EventArgs e)
        {
            // correct URL and AdminToken
            txtTest1.Text = "";
            List<Service> serviceList = new List<Service>();
            try
            {
                serviceList = Service.List(AdminURL, AdminToken);
            }
            catch (Exception x)
            {
                txtTest1.Text = x.Message;
            }
            foreach (Service serv in serviceList)
            {
                txtTest1.Text += "ID: " + serv.id + ", Name: " + serv.name + ", Type: " + serv.type + ", Description: " + serv.description + Environment.NewLine;
            }
        }

        protected void TestCase2(object sender, EventArgs e)
        {
            // invalid adminToken
            txtTest1.Text = "";
            List<Service> serviceList = new List<Service>();
            try
            {
                serviceList = Service.List(AdminURL, "WrongToken");
            }
            catch (Exception x)
            {
                txtTest1.Text = x.Message;
            }
            foreach (Service serv in serviceList)
            {
                txtTest1.Text += "ID: " + serv.id + ", Name: " + serv.name + ", Type: " + serv.type + ", Description: " + serv.description + Environment.NewLine;
            }
        }

        protected void TestCase3(object sender, EventArgs e)
        {
            // invalid URL
            txtTest1.Text = "";
            List<Service> serviceList = new List<Service>();
            try
            {
                serviceList = Service.List("http://invalid:5000", AdminToken);
            }
            catch (Exception x)
            {
                txtTest1.Text = x.Message;
            }
            foreach (Service serv in serviceList)
            {
                txtTest1.Text += "ID: " + serv.id + ", Name: " + serv.name + ", Type: " + serv.type + ", Description: " + serv.description + Environment.NewLine;
            }
        }
    }
}