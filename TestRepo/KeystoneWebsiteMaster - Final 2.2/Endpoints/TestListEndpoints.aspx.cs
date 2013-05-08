using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Trinity.OpenStack;
using Trinity.OpenStack.Tests;

namespace KeystoneWebsite.Endpoints
{
    public partial class TestListEndpoints : System.Web.UI.Page
    {
        protected static List<Endpoint> Test1Endpoints;

        protected void Page_Load(object sender, EventArgs e)
        {

            if (sender != null && sender.GetType().Equals(this.GetType()))
            {
                if (((TestListEndpoints)sender).Test1Info != null)
                    Test1Endpoints = ((TestListEndpoints)sender).Test1Info;
                else
                    Test1Endpoints = new List<Endpoint>();

            }
            else
            {
                Test1Endpoints = new List<Endpoint>();
            }
            
        }
        protected void btnTest1_Click(object sender, EventArgs e)
        {
            try
            {

                Test1Endpoints = new List<Endpoint>();
                lstbxEndpoints.Items.Clear();
                Test1Endpoints= Endpoint.List_Endpoints(LoginSession.adminURL, LoginSession.userToken.token_id, LoginSession.userToken.token_id);

                foreach (Endpoint endp in Test1Endpoints)
                {
                    lstbxEndpoints.Items.Add(endp.name + " " + endp.region + " " + endp.id);

                }

           }
            catch (Exception x)
            {
                lblEndpoint.Text = x.Message;
            }
        }

        public List<Endpoint> Test1Info
        {
            get
            {
                return Test1Endpoints;
            }
        }

        protected void lstbxEndpoints_SelectedIndexChanged(object sender, EventArgs e)
        {
            pnlEndpointInfo.Visible = true;
            if (Test1Endpoints != null)
            {

                Endpoint ep = Test1Endpoints[lstbxEndpoints.SelectedIndex];
                lblName.Text = ep.name;
                lblID.Text = ep.id;
                lblAdminURL.Text = ep.admin_url;
                lbltype.Text = ep.endpoint_type;
                lblIntURL.Text = ep.internal_url;
                lblpublicURL.Text = ep.public_url;
                lblregion.Text = ep.region;
            }
            else
            {
                lblEndpoint.Text = "Error null Endpoint List";
            }

        }
        ///// <summary>
        ///// Test 2 - Empty List (create new user)
        ///// </summary>
        ///// <param name="sender"></param>
        ///// <param name="e"></param>
        //protected void btnTest2_Click(object sender, EventArgs e)
        //{
        //    try
        //    {
        //   //     User u = Trinity.OpenStack.User.Add(LoginSession.adminURL, "epTestUser1112131415", "testUser", "true", 
        //  //      User u = User.Add(admin_url2 + "users/", testUserName, testUserPw, "true", testTenantId, "null", admin_token);
        //        lstbxEndpoints.Items.Clear();
        //        TestEmptyListEndPoint newTest = new TestEmptyListEndPoint();
        //        Test1Endpoints = new List<Endpoint>();
        //        if (newTest.Set_Up_EmptyList_Endpoints_Test(LoginSession.adminURL, LoginSession.userToken.token_id, "EpEmptyListTestTen112131415", "EpEmptyListTestService1112131415"))
        //        {
        //            lblTest2.Visible = true;
        //            lblTest2.Text = "PASS";
        //            lblEndpoint0.Text = "Count in Endpoint list = " + newTest.em.Count;

        //            pnlEndpointInfoTest2.Visible = true;
        //        }
        //        else
        //        {
        //            lblTest2.Visible = true;

        //            lblTest2.Text = "FAIL";
        //        }

        //        Test1Endpoints= Endpoint.List_Endpoints(LoginSession.adminURL, LoginSession.userToken.token_id, LoginSession.userToken.token_id);

        //        foreach (Endpoint endp in Test1Endpoints)
        //        {
        //            lstbxEndpoints.Items.Add(endp.name + " " + endp.region + " " + endp.id);

        //        }

        //    }
        //    catch (Exception x)
        //    {
                
        //        lblEndpoint0.Text = x.Message;
        //    }
        //}

        /// <summary>
        /// Test 3 - Bad Admin URL
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnTest3_Click(object sender, EventArgs e)
        {
            try
            {

                Test1Endpoints = new List<Endpoint>();
                lstbxEndpoints.Items.Clear();
                Test1Endpoints = Endpoint.List_Endpoints("http://BadFakeAdminURL:35357", LoginSession.userToken.token_id, LoginSession.userToken.token_id);

            }
            catch (Exception x)
            {
                txtbTest3.Text = x.Message;
            }
        }

        /// <summary>
        /// Test 4 - Bad Admin Token
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnTest4_Click(object sender, EventArgs e)
        {
            try
            {

                Test1Endpoints = new List<Endpoint>();
                lstbxEndpoints.Items.Clear();
                Test1Endpoints = Endpoint.List_Endpoints(LoginSession.adminURL, LoginSession.userToken.token_id,"BadAdminToken112131415");
            }
            catch (Exception x)
            {
                txtbTest4.Text = x.Message;
            }
        }

    }
}