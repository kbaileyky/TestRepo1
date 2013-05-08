using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Trinity.OpenStack;

using Trinity.OpenStack.Tests;

namespace KeystoneWebsite.Endpoinnts
{
    public partial class TestCreateEndpoints : System.Web.UI.Page
    {
        protected static List<Endpoint> beforeList;
        protected static List<Endpoint> afterList;
        protected static List<Endpoint> duringList;

        protected static TestCreateEndpoint epTest;


        protected void Page_Load(object sender, EventArgs e)
        {

            if (sender != null && sender.GetType().Equals(this.GetType()))
            {
                if (((TestCreateEndpoints)sender).CurrentTest != null)
                {
                    epTest = ((TestCreateEndpoints)sender).CurrentTest;
                    beforeList = ((TestCreateEndpoints)sender).beforeTestList;
                    afterList = ((TestCreateEndpoints)sender).afterTestList;
                    duringList = ((TestCreateEndpoints)sender).duringTestList;
                }
                else
                {
                    epTest = new TestCreateEndpoint();
                    beforeList = new List<Endpoint>();
                    afterList = new List<Endpoint>();
                    duringList = new List<Endpoint>();

                }
            }
            else
            {
                epTest = new TestCreateEndpoint();
                beforeList = new List<Endpoint>();
                afterList = new List<Endpoint>();
                duringList = new List<Endpoint>();
            }

        }
        protected void btnTest1_Click(object sender, EventArgs e)
        {
            lstbxEndpoints.Items.Clear();
            epTest = new TestCreateEndpoint();
            try
            {
                lblCreateEPPassFail.Visible = epTest.Set_Up_Create_Endpoints_Test(LoginSession.adminURL, LoginSession.userToken.token_id, "tstEPTen121314", "tstEPService121314");
                lblCreateEPPassFail.Text = "PASS";

                foreach (Endpoint endp in epTest.em)
                {
                    beforeList.Add(endp);
                }
                foreach (Endpoint endp in beforeList)
                {
                    lstbxEndpoints.Items.Add(endp.name + " " + endp.region + " " + endp.id);

                }

                lstbxDuring.Items.Clear();
                Boolean ret = true;
                String output = String.Empty;

                //End Set Up
                try
                {
                    for (int i = 0; i < 10; i++)
                    {
                        ret |= epTest.Run_Test_Endpoints(LoginSession.adminURL, "http://TestURL:5000", "http://TestURL:5000", LoginSession.userToken.token_id, epTest.EPTestToken.token_id, epTest.endpoint_testTenantid, epTest.endpoint_testServiceid, "tstEPService121314", "TestRegion", i, "TestEndpoint123_", false, ref output);

                    }

                    lblRunTest1.Visible = ret;
                    lblRunTest1.Text = "PASS";
                    epTest.em= Endpoint.List_Endpoints(LoginSession.adminURL, LoginSession.userToken.token_id, LoginSession.userToken.token_id);

                    foreach (Endpoint endp in epTest.em)
                    {
                        duringList.Add(endp);
                    }
                    foreach (Endpoint endp in duringList)
                    {

                        lstbxDuring.Items.Add(endp.name + " " + endp.region + " " + endp.id);

                    }
                }
                catch (Exception x)
                {
                    lblEndpoint.Text = x.Message;
                    lblTearDown1.Visible = epTest.Tear_Down_Create_Endpoints_Test(LoginSession.adminURL, LoginSession.userToken.token_id, epTest.endpoint_testUser, epTest.endpoint_testServiceid, epTest.endpoint_testTenantid);
                   
                    lblCreateEPPassFail.Visible = true;
                    lblCreateEPPassFail.Text = "FAIL";
                    pnlEndpointInfo.Visible = true;
                }

                //End Run Test


                lstbxAfterEP.Items.Clear();
                try
                {
                    lblTearDown1.Visible = epTest.Tear_Down_Create_Endpoints_Test(LoginSession.adminURL, LoginSession.userToken.token_id, epTest.endpoint_testUser, epTest.endpoint_testServiceid, epTest.endpoint_testTenantid);
                    lblTearDown1.Text = "PASS";
                    epTest.em = Endpoint.List_Endpoints(LoginSession.adminURL, LoginSession.userToken.token_id, LoginSession.userToken.token_id);


                    foreach (Endpoint endp in epTest.em)
                    {
                        afterList.Add(endp);
                    }
                    foreach (Endpoint endp in afterList)
                    {

                        lstbxAfterEP.Items.Add(endp.name + " " + endp.region + " " + endp.id);

                    }

                }
                catch (Exception x)
                {
                    lblEndpoint.Text = x.Message;
                    lblTearDown1.Visible = epTest.Tear_Down_Create_Endpoints_Test(LoginSession.adminURL, LoginSession.userToken.token_id, epTest.endpoint_testUser, epTest.endpoint_testServiceid, epTest.endpoint_testTenantid);
                   
                    lblCreateEPPassFail.Visible = true;
                    lblCreateEPPassFail.Text = "FAIL";
                }

            }
            catch (Exception x)
            {
                lblEndpoint.Text = x.Message;
                try
                {
                    lblTearDown1.Visible = epTest.Tear_Down_Create_Endpoints_Test(LoginSession.adminURL, LoginSession.userToken.token_id, epTest.endpoint_testUser, epTest.endpoint_testServiceid, epTest.endpoint_testTenantid);
                }
                catch (Exception ex)
                {
                    lblEndpoint.Text = ex.Message;
                }
                lblCreateEPPassFail.Visible = true;
                lblCreateEPPassFail.Text = "FAIL";
                pnlEndpointInfo.Visible = true;
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


           protected void btnTearDown1_Click(object sender, EventArgs e)
           {/*
               lstbxEndpoints.Items.Clear();
               try
               {
                   lblTearDown1.Visible = epTest.Tear_Down_Create_Endpoints_Test(LoginSession.adminURL, LoginSession.userToken.token_id, epTest.endpoint_testUser, epTest.endpoint_testServiceid, epTest.endpoint_testTenantid);
                   lblTearDown1.Text = "PASS";
                   epTest.em.List_Endpoints(LoginSession.adminURL, LoginSession.userToken.token_id, LoginSession.userToken.token_id);
                   foreach (Endpoint endp in epTest.em.endpoint_list)
                   {
                       lstbxEndpoints.Items.Add(endp.name + " " + endp.region + " " + endp.id);

                   }

               }
               catch (Exception x)
               {
                   lblEndpoint.Text = x.Message;
                   lblCreateEPPassFail.Visible = true;
                   lblCreateEPPassFail.Text = "FAIL";
               } */
           }

           protected void btnRunTest1_Click(object sender, EventArgs e)
           {
             /*  lstbxEndpoints.Items.Clear();
               Boolean ret = true;
               String output = String.Empty;
               try
               {
                   for (int i = 0; i < 10; i++)
                   {
                       ret |= epTest.Run_Test_Endpoints(LoginSession.adminURL, "http://TestURL:5000", "http://TestURL:5000", LoginSession.userToken.token_id, epTest.EPTestToken.token_id, epTest.endpoint_testTenantid, epTest.endpoint_testServiceid, "tstEPService121314", "TestRegion", i, "TestEndpoint123_", false, ref output);

                   }

                   lblRunTest1.Visible = ret;
                   lblRunTest1.Text = "PASS";
                   epTest.em.List_Endpoints(LoginSession.adminURL, LoginSession.userToken.token_id, LoginSession.userToken.token_id);
                   foreach (Endpoint endp in epTest.em.endpoint_list)
                   {
                       lstbxEndpoints.Items.Add(endp.name + " " + endp.region + " " + endp.id);

                   }

               }
               catch (Exception x)
               {
                   lblEndpoint.Text = x.Message;
                   lblCreateEPPassFail.Visible = true;
                   lblCreateEPPassFail.Text = "FAIL";
               }
              * */
           } 

        public TestCreateEndpoint CurrentTest
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
        public List<Endpoint> duringTestList
        {
            get
            {
                return duringList;
            }
        }

        protected void lstbxDuring_SelectedIndexChanged(object sender, EventArgs e)
        {
            pnlDuringEpInfo.Visible = true;
            if (epTest.em != null)
            {

                Endpoint ep = duringList[lstbxDuring.SelectedIndex];
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

        protected void ListBox1_SelectedIndexChanged(object sender, EventArgs e)
        {
            pnlAfterEpInfo.Visible = true;
            if (epTest.em != null)
            {

                Endpoint ep = afterList[lstbxAfterEP.SelectedIndex];
                lblAfterName.Text = ep.name;
                lblAfterID.Text = ep.id;
                lblAfterAdminURL.Text = ep.admin_url;
                lblAfterType.Text = ep.endpoint_type;
                lblAfterInternalURL.Text = ep.internal_url;
                lblAfterPublicURL.Text = ep.public_url;
                lblAfterRegion.Text = ep.region;
            }
            else
            {
                lblEndpointAfter.Text = "Error null Endpoint List";
            }
        }

        /// <summary>
        /// Test 2 - bad admin token
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void Button1_Click(object sender, EventArgs e)
        {   
            lstbxDuring.Items.Clear();
            lstbxEndpoints.Items.Clear();
            lstbxAfterEP.Items.Clear();
            epTest = new TestCreateEndpoint();
            try
            {
                lblTest2.Visible = epTest.Set_Up_Create_Endpoints_Test(LoginSession.adminURL, LoginSession.userToken.token_id, "tstEPTen121314", "tstEPService121314");
                lblTest2.Text = "PASS";

   
                Boolean ret = true;
                String output = String.Empty;

                //End Set Up
                try
                {
                    for (int i = 0; i < 10; i++)
                    {
                        ret |= epTest.Run_Test_Endpoints(LoginSession.adminURL, "http://TestURL:5000", "http://TestURL:5000", "badadmindtoken11121314", "badadmindtoken11121314", epTest.endpoint_testTenantid, epTest.endpoint_testServiceid, "tstEPService121314", "TestRegion", i, "TestEndpoint123_", false, ref output);

                    }

                }
                catch (Exception x)
                {
                    lblTest2.Visible = epTest.Tear_Down_Create_Endpoints_Test(LoginSession.adminURL, LoginSession.userToken.token_id, epTest.endpoint_testUser, epTest.endpoint_testServiceid, epTest.endpoint_testTenantid);
                    lblTest2.Text = "PASS";
                    txtbTest2.Text = x.Message;
                }

                //End Run Test



                try
                {
                    lblTest2.Visible = epTest.Tear_Down_Create_Endpoints_Test(LoginSession.adminURL, LoginSession.userToken.token_id, epTest.endpoint_testUser, epTest.endpoint_testServiceid, epTest.endpoint_testTenantid);
                    lblTest2.Text = "PASS";

                }
                catch (Exception x)
                {
                }

            }
            catch (Exception x)
            {
                lblEndpoint.Text = x.Message;
                lblTest2.Visible = true;
                lblTest2.Text = "FAIL";
                pnlEndpointInfo.Visible = true;
            }

           
        }

        /// <summary>
        /// Test 3 - bad url
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnTest3_Click(object sender, EventArgs e)
        {
            lstbxDuring.Items.Clear();
            lstbxEndpoints.Items.Clear();
            lstbxAfterEP.Items.Clear();
            epTest = new TestCreateEndpoint();
            try
            {
                lblTest2.Visible = epTest.Set_Up_Create_Endpoints_Test(LoginSession.adminURL, LoginSession.userToken.token_id, "tstEPTen121314", "tstEPService121314");
                lblTest2.Text = "PASS";


                Boolean ret = true;
                String output = String.Empty;

                //End Set Up
                try
                {
                    for (int i = 0; i < 10; i++)
                    {
                        ret |= epTest.Run_Test_Endpoints("http://BadFakeAdminURL:35357", "http://TestURL:5000", "http://TestURL:5000", LoginSession.userToken.token_id, epTest.EPTestToken.token_id, epTest.endpoint_testTenantid, epTest.endpoint_testServiceid, "tstEPService121314", "TestRegion", i, "TestEndpoint123_", false, ref output);

                    }

                }
                catch (Exception x)
                {
                    txtbTest3.Text = x.Message;
                    lblTest3.Visible = epTest.Tear_Down_Create_Endpoints_Test(LoginSession.adminURL, LoginSession.userToken.token_id, epTest.endpoint_testUser, epTest.endpoint_testServiceid, epTest.endpoint_testTenantid);
                    lblTest3.Text = "PASS";
                }

                //End Run Test



                try
                {
                    lblTearDown1.Visible = epTest.Tear_Down_Create_Endpoints_Test(LoginSession.adminURL, LoginSession.userToken.token_id, epTest.endpoint_testUser, epTest.endpoint_testServiceid, epTest.endpoint_testTenantid);
                    lblTearDown1.Text = "PASS";

                }
                catch (Exception x)
                {
                }

            }
            catch (Exception x)
            {
                lblEndpoint.Text = x.Message;
                lblTest2.Visible = true;
                lblTest2.Text = "FAIL";
                pnlEndpointInfo.Visible = true;
            }

           
        }

        /// <summary>
        /// Test 4 - Bad Service ID
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnTest4_Click(object sender, EventArgs e)
        {
            lstbxDuring.Items.Clear();
            lstbxEndpoints.Items.Clear();
            lstbxAfterEP.Items.Clear();
            epTest = new TestCreateEndpoint();
            try
            {
                lblTest3.Visible = epTest.Set_Up_Create_Endpoints_Test(LoginSession.adminURL, LoginSession.userToken.token_id, "tstEPTen121314", "tstEPService121314");
                lblTest3.Text = "PASS";


                Boolean ret = true;
                String output = String.Empty;

                //End Set Up
                try
                {
                    for (int i = 0; i < 10; i++)
                    {
                        ret |= epTest.Run_Test_Endpoints(LoginSession.adminURL, "http://TestURL:5000", "http://TestURL:5000", LoginSession.userToken.token_id, epTest.EPTestToken.token_id, epTest.endpoint_testTenantid, "badserviceid112131415", "tstEPService121314", "TestRegion", i, "TestEndpoint123_", false, ref output);

                    }

                }
                catch (Exception x)
                {
                    txtbTest4.Text = x.Message;
                    lblTest4.Visible = epTest.Tear_Down_Create_Endpoints_Test(LoginSession.adminURL, LoginSession.userToken.token_id, epTest.endpoint_testUser, epTest.endpoint_testServiceid, epTest.endpoint_testTenantid);
                    lblTest4.Text = "PASS";
                }

                //End Run Test



                try
                {
                    lblTest4.Visible = epTest.Tear_Down_Create_Endpoints_Test(LoginSession.adminURL, LoginSession.userToken.token_id, epTest.endpoint_testUser, epTest.endpoint_testServiceid, epTest.endpoint_testTenantid);
                    lblTest4.Text = "PASS";

                }
                catch (Exception x)
                {
                    //txtbTest4.Text = x.Message;
                    //lblTest4.Visible = true;
                    //lblTest4.Text = "FAIL";
                }

            }
            catch (Exception x)
            {
                txtbTest4.Text = x.Message;
                lblTest4.Visible = true;
                lblTest4.Text = "FAIL";
                pnlEndpointInfo.Visible = true;
            }

           
        }


    //    /// <summary>
    //    /// Test 5 multiple endpoints (may need to delete)
    //    /// </summary>
    //    /// <param name="sender"></param>
    //    /// <param name="e"></param>
    //    protected void btnTest5_Click(object sender, EventArgs e)
    //    {

    //        lstbxDuring.Items.Clear();
    //        lstbxEndpoints.Items.Clear();
    //        lstbxAfterEP.Items.Clear();
    //        epTest = new TestCreateEndpoint();
    //        try
    //        {
    //            lblTest3.Visible = epTest.Set_Up_Create_Endpoints_Test(LoginSession.adminURL, LoginSession.userToken.token_id, "tstEPTen121314", "tstEPService121314");
    //            lblTest3.Text = "PASS";


    //            Boolean ret = true;
    //            String output = String.Empty;

    //            //End Set Up
    //            try
    //            {
    //                for (int i = 0; i < 10; i++)
    //                {
    //                    ret |= epTest.Run_Test_Endpoints(LoginSession.adminURL, "http://TestURL:5000", "http://TestURL:5000", LoginSession.userToken.token_id, epTest.EPTestToken.token_id, "BadTenantIDgg1112131415", epTest.endpoint_testServiceid, "tstEPService121314", "TestRegion", i, "TestEndpoint123_", false, ref output);

    //                }

    //            }
    //            catch (Exception x)
    //            {
    //                txtbTest5.Text = x.Message;
    //                lblTest5.Visible = epTest.Tear_Down_Create_Endpoints_Test(LoginSession.adminURL, LoginSession.userToken.token_id, epTest.endpoint_testUser, epTest.endpoint_testServiceid, epTest.endpoint_testTenantid);
    //                lblTest5.Text = "PASS";
    //            }

    //            //End Run Test



    //            try
    //            {
    //                lblTest5.Visible = epTest.Tear_Down_Create_Endpoints_Test(LoginSession.adminURL, LoginSession.userToken.token_id, epTest.endpoint_testUser, epTest.endpoint_testServiceid, epTest.endpoint_testTenantid);
    //                lblTest5.Text = "PASS";

    //            }
    //            catch (Exception x)
    //            {
    //                //txtbTest4.Text = x.Message;
    //                //lblTest4.Visible = true;
    //                //lblTest4.Text = "FAIL";
    //            }

    //        }
    //        catch (Exception x)
    //        {
    //            txtbTest5.Text = x.Message;
    //            lblTest5.Visible = true;
    //            lblTest5.Text = "FAIL";
    //            pnlEndpointInfo.Visible = true;
    //        }
    //    }
    }

}