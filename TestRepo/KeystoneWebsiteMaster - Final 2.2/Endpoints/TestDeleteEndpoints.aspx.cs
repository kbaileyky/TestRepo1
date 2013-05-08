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
    public partial class TestDeleteEndpoints : System.Web.UI.Page
    {

        protected static List<Endpoint> beforeList;
        protected static List<Endpoint> afterList;

        protected static TestDeleteEndpoint epTest;



        protected void Page_Load(object sender, EventArgs e)
        {

            if (sender != null && sender.GetType().Equals(this.GetType()))
            {
                if (((TestDeleteEndpoints)sender).CurrentTest != null)
                {
                    epTest = ((TestDeleteEndpoints)sender).CurrentTest;
                    beforeList = ((TestDeleteEndpoints)sender).beforeTestList;
                    afterList = ((TestDeleteEndpoints)sender).afterTestList;
                }
                else
                {
                    epTest = new TestDeleteEndpoint();
                    beforeList = new List<Endpoint>();
                    afterList = new List<Endpoint>();

                }
            }
            else
            {
                epTest = new TestDeleteEndpoint();
                beforeList = new List<Endpoint>();
                afterList = new List<Endpoint>();
            }

        }


        protected void btnTest1_Click(object sender, EventArgs e)
        {
            lstbxEndpoints.Items.Clear();
            epTest = new TestDeleteEndpoint();
            try
            {
                lblCreateEPPassFail.Visible = epTest.Set_Up_Delete_Endpoints_Test(LoginSession.adminURL, LoginSession.userToken.token_id, "tstEPTen121314", "tstEPService121314");
                lblCreateEPPassFail.Text = "PASS";

                epTest.em = Endpoint.List_Endpoints(LoginSession.adminURL, LoginSession.userToken.token_id, LoginSession.userToken.token_id);

                foreach (Endpoint endp in epTest.em)
                {
                    beforeList.Add(endp);
                }
                foreach (Endpoint endp in beforeList)
                {
                    lstbxEndpoints.Items.Add(endp.name + " " + endp.region + " " + endp.id);

                }
                //End Set Up
            }
            catch (Exception x)
            {
                lblEndpoint.Text = x.Message;
                lblCreateEPPassFail.Visible = true;
                lblCreateEPPassFail.Text = "FAIL";
            }

            Boolean ret = true;
            String output = String.Empty;




            lstbxAfter.Items.Clear();
            try
            {
                lblTearDown1.Visible = epTest.Tear_Down_Delete_Endpoints_Test(LoginSession.adminURL, LoginSession.userToken.token_id, epTest.endpoint_testUser, epTest.endpoint_testServiceid, epTest.endpoint_testTenantid);
                lblTearDown1.Text = "PASS";
                epTest.em = Endpoint.List_Endpoints(LoginSession.adminURL, LoginSession.userToken.token_id, LoginSession.userToken.token_id);


                foreach (Endpoint endp in epTest.em)
                {
                    afterList.Add(endp);
                }
                foreach (Endpoint endp in afterList)
                {

                    lstbxAfter.Items.Add(endp.name + " " + endp.region + " " + endp.id);

                }


                //End Run Test


            }
            catch (Exception x)
            {
                lblEndpoint.Text = x.Message;
                lblCreateEPPassFail.Visible = true;
                lblCreateEPPassFail.Text = "FAIL";
                pnlEndpointInfo.Visible = true;
            }



        }


        public TestDeleteEndpoint CurrentTest
        {
            get
            {
                return epTest;
            }
        }
        public List<Endpoint> beforeTestList
        {
            get
            {
                return beforeList;
            }
        }
        public List<Endpoint> afterTestList
        {
            get
            {
                return afterList;
            }
        }

        protected void lstbxEndpoints_SelectedIndexChanged(object sender, EventArgs e)
        {
            pnlEndpointInfo.Visible = true;
            if (epTest.em != null)
            {

                Endpoint ep = beforeList[lstbxEndpoints.SelectedIndex];
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

        protected void lstbxDuring_SelectedIndexChanged(object sender, EventArgs e)
        {
            pnlDuringEpInfo.Visible = true;
            if (epTest.em != null)
            {

                Endpoint ep = afterList[lstbxAfter.SelectedIndex];
                lblDuringName.Text = ep.name;
                lblDuringID.Text = ep.id;
                lblDuringAdminURL.Text = ep.admin_url;
                lblDuringType.Text = ep.endpoint_type;
                lblDuringInternalURL.Text = ep.internal_url;
                lblDuringPublicURL.Text = ep.public_url;
                lblDuringRegion.Text = ep.region;
            }
            else
            {
                lblEndpointDuring.Text = "Error null Endpoint List";
            }
        }
        /// <summary>
        /// Test 2 -Bad Admin token
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnTest2_Click(object sender, EventArgs e)
        {
            lstbxEndpoints.Items.Clear();
            epTest = new TestDeleteEndpoint();
            try
            {
                lblCreateEPPassFail.Visible = epTest.Set_Up_Delete_Endpoints_Test(LoginSession.adminURL, LoginSession.userToken.token_id, "tstEPTen121314", "tstEPService121314");
                lblCreateEPPassFail.Text = "PASS";

                epTest.em = Endpoint.List_Endpoints(LoginSession.adminURL, LoginSession.userToken.token_id, LoginSession.userToken.token_id);
                //End Set Up
            }
            catch (Exception x)
            {
                txtbTest2.Text = x.Message;
                lblCreateEPPassFail.Visible = true;
                lblTest2.Text = "FAIL";
            }

            Boolean ret = true;
            String output = String.Empty;




            lstbxAfter.Items.Clear();
            try
            {
                epTest.Tear_Down_Delete_Endpoints_Test(LoginSession.adminURL, "BadAdminTokengg1112131415", epTest.endpoint_testUser, epTest.endpoint_testServiceid, epTest.endpoint_testTenantid);

                lblTest2.Text = "FAIL";
                //End Run Test


            }
            catch (Exception x)
            {
                txtbTest2.Text = x.Message;
                lblTest2.Visible = epTest.Tear_Down_Delete_Endpoints_Test(LoginSession.adminURL, LoginSession.userToken.token_id, epTest.endpoint_testUser, epTest.endpoint_testServiceid, epTest.endpoint_testTenantid);
                lblTest2.Text = "PASS";
            }


        }
        /// <summary>
        /// TEst 3 - Incorrect admin url
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnTest3_Click(object sender, EventArgs e)
        {
            lstbxEndpoints.Items.Clear();
            epTest = new TestDeleteEndpoint();
            try
            {
                lblCreateEPPassFail.Visible = epTest.Set_Up_Delete_Endpoints_Test(LoginSession.adminURL, LoginSession.userToken.token_id, "tstEPTen121314", "tstEPService121314");
                lblCreateEPPassFail.Text = "PASS";

                epTest.em = Endpoint.List_Endpoints(LoginSession.adminURL, LoginSession.userToken.token_id, LoginSession.userToken.token_id);
                //End Set Up
            }
            catch (Exception x)
            {
                txtbTest3.Text = x.Message;
                lblTest3.Visible = true;
                lblTest3.Text = "FAIL";
            }

            Boolean ret = true;
            String output = String.Empty;




            lstbxAfter.Items.Clear();
            try
            {
                epTest.Tear_Down_Delete_Endpoints_Test("http://BadAdminUrl:35357", LoginSession.userToken.token_id, epTest.endpoint_testUser, epTest.endpoint_testServiceid, epTest.endpoint_testTenantid);

                lblTest2.Text = "FAIL";
                //End Run Test


            }
            catch (Exception x)
            {
                txtbTest3.Text = x.Message;
                lblTest3.Visible = epTest.Tear_Down_Delete_Endpoints_Test(LoginSession.adminURL, LoginSession.userToken.token_id, epTest.endpoint_testUser, epTest.endpoint_testServiceid, epTest.endpoint_testTenantid);
                lblTest3.Text = "PASS";
            }
        }

        protected void btnTest4_Click(object sender, EventArgs e)
        {

            lstbxEndpoints.Items.Clear();
            epTest = new TestDeleteEndpoint();
            try
            {
                lblCreateEPPassFail.Visible = epTest.Set_Up_Delete_Endpoints_Test(LoginSession.adminURL, LoginSession.userToken.token_id, "tstEPTen121314", "tstEPService121314");
                lblCreateEPPassFail.Text = "PASS";

                epTest.em = Endpoint.List_Endpoints(LoginSession.adminURL, LoginSession.userToken.token_id, LoginSession.userToken.token_id);
                //End Set Up
            }
            catch (Exception x)
            {
                txtbTest4.Text = x.Message;
                lblTest4.Visible = true;
                lblTest4.Text = "FAIL";
            }

            Boolean ret = true;
            String output = String.Empty;




            lstbxAfter.Items.Clear();
            try
            {
                Endpoint fakeEP = new Endpoint();
                fakeEP.Delete_Endpoint(LoginSession.adminURL, LoginSession.userToken.token_id);

                lblTest4.Text = "FAIL";
                //End Run Test


            }
            catch (Exception x)
            {
                txtbTest4.Text = x.Message;
                lblTest4.Visible = epTest.Tear_Down_Delete_Endpoints_Test(LoginSession.adminURL, LoginSession.userToken.token_id, epTest.endpoint_testUser, epTest.endpoint_testServiceid, epTest.endpoint_testTenantid);
                lblTest4.Text = "PASS";
            }

        }
    }
}