using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Trinity.OpenStack;

namespace KeystoneWebsite.Services
{
    public partial class ServiceDelete : System.Web.UI.Page
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
            {   // correct parameters (url, serviceID, adminToken)
                TestCase1(sender, e);
            }
            else if (value == "2")
            {   // incorrect URL
                TestCase2();
            }
            else if (value == "3")
            {   // incorrect serviceID
                TestCase3();
            }
            else if (value == "4")
            {   //incorrect adminToken
                TestCase4();
            }
            else if (value == "5")
            {   // deleting a service that has other entities associated with it
            }
        }

        protected void TestCase4()
        {   // invalid AdminToken
            // Step 1 - Show current List
            txtTest1.Text = "Step 1 - Current services." + Environment.NewLine + Environment.NewLine;
            PrintList();
            // Step 2 - Add a test service
            txtTest1.Text += Environment.NewLine + "Step 2 - Add a test service." + Environment.NewLine + Environment.NewLine;
            string serviceID = AddService();
            // Step 3 - Show new list
            txtTest1.Text += Environment.NewLine + "Step 3 - Show services with new test service." + Environment.NewLine + Environment.NewLine;
            PrintList();
            // Step 4 - Delete test service with invalid URL
            txtTest1.Text += Environment.NewLine + "Step 4 - Delete test service with invalid AdminToken (WrongAdminToken)." + Environment.NewLine + Environment.NewLine;
            DeleteService(AdminURL, serviceID, "WrongAdminToken");
            //Step 5 - Show list
            txtTest1.Text += Environment.NewLine + Environment.NewLine + "Step 5 - The previous Delete failed as expected. The test service is still here." + Environment.NewLine + Environment.NewLine;
            PrintList();
            // Step 6 - Delete test service.
            txtTest1.Text += Environment.NewLine + "Step 6 - Clean up step. Delete test service." + Environment.NewLine;
            DeleteService(AdminURL, serviceID, AdminToken);
            //Step 7 - Show new list
            txtTest1.Text += Environment.NewLine + "Step 7 - Show new list." + Environment.NewLine + Environment.NewLine;
            PrintList();
        }

        protected void TestCase3()
        {   // invalid ServiceID
            // Step 1 - Show current List
            txtTest1.Text = "Step 1 - Current services." + Environment.NewLine + Environment.NewLine;
            PrintList();
            // Step 2 - Add a test service
            txtTest1.Text += Environment.NewLine + "Step 2 - Add a test service." + Environment.NewLine + Environment.NewLine;
            string serviceID = AddService();
            // Step 3 - Show new list
            txtTest1.Text += Environment.NewLine + "Step 3 - Show services with new test service." + Environment.NewLine + Environment.NewLine;
            PrintList();
            // Step 4 - Delete test service with invalid URL
            txtTest1.Text += Environment.NewLine + "Step 4 - Delete test service with invalid ServiceID (WrongServiceID)." + Environment.NewLine + Environment.NewLine;
            DeleteService(AdminURL, "WrongServiceID", AdminToken);
            //Step 5 - Show list
            txtTest1.Text += Environment.NewLine + Environment.NewLine + "Step 5 - The previous Delete failed as expected. The test service is still here." + Environment.NewLine + Environment.NewLine;
            PrintList();
            // Step 6 - Delete test service.
            txtTest1.Text += Environment.NewLine + "Step 6 - Clean up step. Delete test service." + Environment.NewLine;
            DeleteService(AdminURL, serviceID, AdminToken);
            //Step 7 - Show new list
            txtTest1.Text += Environment.NewLine + "Step 7 - Show new list." + Environment.NewLine + Environment.NewLine;
            PrintList();
        }

        protected void TestCase2()
        {   // invalid URL
            // Step 1 - Show current List
            txtTest1.Text = "Step 1 - Current services." + Environment.NewLine + Environment.NewLine;
            PrintList();
            // Step 2 - Add a test service
            txtTest1.Text += Environment.NewLine + "Step 2 - Add a test service." + Environment.NewLine + Environment.NewLine;
            string serviceID = AddService();
            // Step 3 - Show new list
            txtTest1.Text += Environment.NewLine + "Step 3 - Show services with new test service." + Environment.NewLine + Environment.NewLine;
            PrintList();
            // Step 4 - Delete test service with invalid URL
            txtTest1.Text += Environment.NewLine + "Step 4 - Delete test service with invalid URL (http://wrong.cs.trinity.edu)." + Environment.NewLine + Environment.NewLine;
            DeleteService("http://wrong.cs.trinity.edu", serviceID, AdminToken);
            //Step 5 - Show list
            txtTest1.Text += Environment.NewLine + Environment.NewLine + "Step 5 - The previous Delete failed as expected. The test service is still here." + Environment.NewLine + Environment.NewLine;
            PrintList();
            // Step 6 - Delete test service.
            txtTest1.Text += Environment.NewLine + "Step 6 - Clean up step. Delete test service." + Environment.NewLine;
            DeleteService(AdminURL, serviceID, AdminToken);
            //Step 7 - Show new list
            txtTest1.Text += Environment.NewLine + "Step 7 - Show new list." + Environment.NewLine + Environment.NewLine;
            PrintList();
        }

        protected void TestCase1(object sender, EventArgs e)
        {   // correct URL, ServiceID, and AdminToken
            // Step 1 - Show current List
            txtTest1.Text = "Step 1 - Current services." + Environment.NewLine + Environment.NewLine;
            PrintList();
            // Step 2 - Add a test service
            txtTest1.Text += Environment.NewLine + "Step 2 - Add a test service." + Environment.NewLine + Environment.NewLine;
            string serviceID = AddService();
            // Step 3 - Show new list
            txtTest1.Text += Environment.NewLine + "Step 3 - Show services with new test service." + Environment.NewLine + Environment.NewLine;
            PrintList();
            // Step 4 - Delete test service
            txtTest1.Text += Environment.NewLine + "Step 4 - Delete test service." + Environment.NewLine;
            DeleteService(AdminURL, serviceID, AdminToken);
            //Step 5 - Show new list
            txtTest1.Text += Environment.NewLine + "Step 5 - Show new list." + Environment.NewLine + Environment.NewLine;
            PrintList();
        }

        protected void DeleteService(string AdminURL, string serviceID, string AdminToken)
        {
            try
            {
                Service.Delete(AdminURL, serviceID, AdminToken);
            }
            catch (Exception x)
            {
                txtTest1.Text += x.Message;
            }
        }

        protected string AddService()
        {
            Service serv = new Service();
            try
            {
                serv = Service.Create(AdminURL, "Test2_Name", "Test2_Type", "Test2_Description", AdminToken);
            }
            catch (Exception x)
            {
                txtTest1.Text = x.Message;
            }
            txtTest1.Text += "ID: " + serv.id + ", Name: " + serv.name + ", Type: " + serv.type + ", Description: " + serv.description + Environment.NewLine;
            return serv.id;
        }

        protected void PrintList()
        {
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
    }
}