<%@ Page Title="Create Endpoints" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="TestCreateEndpoints.aspx.cs" Inherits="KeystoneWebsite.Endpoinnts.TestCreateEndpoints" %>


<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <hgroup class="title">
        <h1><%: Title %></h1>
    </hgroup>
    <br />
    <section>
        <span class="auto-style1">public Endpoint Endpoint::Create_Endpoint(string admin_token, string admin_url, string name, string region, string service_id, string public_url, string internal_url, string tenant_id)</span>
    </section>
    <br />
    <br />

    
    <div class="tabbable tabs-left">
        <ul class="nav nav-tabs">
            <li class="active">
                <a href="#1A" data-toggle="tab">Function Specification</a>
            </li>
            <li class>
                <a href="#1B" data-toggle="tab">Test Plan</a>
            </li>
            <li class>
                <a href="#1C" data-toggle="tab">Test 1 - SUCCESS</a>
            </li>
                        <li class>
                <a href="#1D" data-toggle="tab">Test 2 - Bad Admin Token</a>
            </li>
            <li class>
                <a href="#1E" data-toggle="tab">Test 3 - Bad Admin URL</a>
            </li>
                        <li class>
                <a href="#1F" data-toggle="tab">Test 4 - Bad Service ID</a>
            </li>

        </ul>
        <div class="tab-content">
            <div class="tab-pane active" id="1A">

    <section>
        <b><span class="auto-style2">Function Arguments/Payloads</span>:   </b>

        <ul>
            <li>admin_token: This is the id of a token given to a user with admin permissions</li>
            <li>admin_url: The url is the OpenStack server address. The port required is the admin port number. 	For example: http://sampleserveraddress:35357, where 35357 is the admin port</li>
            <li>name:	Name of the endpoint</li>
            <li>region: The region of the Endpoint </li>
            <li>service_id: ID of the service that the endpoint is associated with</li>
            <li>public_url:  The service address for the endpoint </li>
            <li>internal_url: The internal address for the endpoint.</li>
            <li>tenant_id:    ID of the tenant that the endpoint is associated with</li>

        </ul>

    </section>
    <section>

        <b><span class="auto-style2">Explicit Message Returns</span>:   </b>
        <ul>

            <li>Successful:  </li>
            <ul>
                <li>An Endpoint that mirriors the newly created one on the server.   </li>
            </ul>
            <li>Specific Throws:  </li>
            <ul>
                <li>Error Invalid Admin Token:  "Exception of type 'Trinity.OpenStack.Unauthorized' was thrown.”</li>
                <li>Error Invalid URL : "The operation has timed out”</li>
                <li>Error Invalid Service ID: "Exception of type 'Trinity.OpenStack.ObjectNotFound' was thrown. ”</li>

                
                <!--<li>“DLL Error # 4: Incompatible JSON String: does not represent an Endpoint”</li> -->


            </ul>
        </ul>
    </section>
    <section>
        <span class="auto-style1">Description</span><br />
        When passed a valid arguments (user_id, admin_url, name, region, service_id, public_url, internal_url, tenant_id), the Create Endpoints function shall execute a C# curl command to create a new endpoint with the specified parameters on the Open Stack database. It shall return an Endpoint object.  The various message returns, specified above, will be explicitly returned as is applicable. Function will also throw general web request errors, such as not found, invalid URL, etc.


    </section>

                </div>
            <div class="tab-pane" id="1B">
    <section>
        <b>Test</b><br />
        Overview:
        <ul>
            <li>Verify Current Token</li>
            <li>Create Tenant</li>
            <li>Create Service</li>
            <li>Create User</li>
            <li>Get Test Token</li>
            <li>Get Endpoint list (May already contain Endpoints, but these will not be disturbed)</li>
            <ul>
                Do 10 Times
                 <li>Create Endpoint</li>
                <li>Get Endpoint list (+1)</li>
            </ul>
            <ul>
                Do 10 Times
                 <li>Delete Endpoint</li>
                <li>Get Endpoint list (+1)</li>
            </ul>
            <li>Delete User</li>
            <li>Delete Service</li>
            <li>Delete Tenant</li>
        </ul>


    </section>
    <section>

    </section>
    <section>
        <span class="auto-style1">Get Endpoint List</span>
        <br />
        <br />
        <blockquote class="pullquote">
            curl -H -X GET "X-Auth-Token:_token_id_" http://sampleserveraddress:35357/v2.0/tokens/_token_id_/endpoints
        </blockquote>

        <br />

        <span class="auto-style1">Create Endpoint*</span><br />
        <br />
        <blockquote class="pullquote">
            curl -X POST -H "X-Auth-Token:_token_id_}" -H "Content-type: application/json" -d '{"endpoint": {	"name": "_name_","region": "_region_name_","service_id":"_service_id_","publicurl": "http://sampleserveraddressA:5000/v2.0/_selected_tenant_","adminurl": "http://sampleserveraddressB:35357/v2.0/_tenant_id_","internalurl":"http://sampleserveraddressC:5000/v2.0/_selected_tenant_"}}'  http://sampleserveraddressB:35357/v2.0/endpoints  />
        </blockquote>
        <br />
        <br />
        Formatted data field:
        <p>
            {"endpoint": {	"name": "_name_",
            <br />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; "region": "_region_name_",<br />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; "service_id":"_service_id_",<br />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; "publicurl": "http://sampleserveraddressA:5000/v2.0/_selected_tenant_",<br />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; "adminurl": "http://sampleserveraddressB:35357/v2.0/_tenant_id_",<br />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; "internalurl":"http://sampleserveraddressC:5000/v2.0/_selected_tenant_"}}
        </p>
        <br />


        <br />
        <br />



    </section>
    <section>
        <span class="auto-style1">Delete Endpoint</span>
        <br />
        <br />
        <blockquote class="pullquote">
            curl -X DELETE -H "X-Auth-Token:_token_id_" http://sampleserveraddress:35357/v2.0/tokens/_token_id_/endpoints/_endpoint_id_
        </blockquote>
    </section>
    <section>
        <br />
        <br />
        While the only feature being tested here is the Create Endpoints feature, because there are so many parameters that endpoints are reliant on, there is a chance that other error messages may appear.
        Testing cases here are strictly limited to create endpoints function.

    </section>

                </div>
            <div class="tab-pane" id="1C">
    <section>
        <span class="auto-style1">Test 1</span>
        <br />
        <br />
        Test 1 will run through the test sequence <strong>without throwing an error</strong>.<br />
        <br />

        Output will be two populated list boxes containing the endpoints that are in the database after set up, after the test, and after clean up. When selected information about the endpoint will appear to the right of the list box. If the test and clean up are successful a label will appear next to the test button with the word "Pass". If the test fails
        a label will appear next to the test button with the word "FAIL".
        <br />
        <br />
                                         <asp:UpdatePanel ID="UpdatePanel4" UpdateMode="Conditional" runat="server">
                        <ContentTemplate>

                                                        <asp:UpdateProgress ID="updateProgress" runat="server">
                           <ProgressTemplate>
                               <div style="position: fixed; text-align: center; height: 100%; width: 100%; top: 0; right: 0; left: 0; z-index: 9999999; background-color: #000000; opacity: 0.7;">
                                   <span style="border-width: 0px; position: fixed; padding: 50px; background-color: #FFFFFF; font-size: 36px; left: 40%; top: 40%;">Test in Progress ...</span>
                               </div>
                           </ProgressTemplate>
                       </asp:UpdateProgress>

        <asp:Button ID="btnTest1" runat="server" Text="Test 1" OnClick="btnTest1_Click" /><br />

        <asp:Label ID="Label19" runat="server" Text="Set Up:"></asp:Label><asp:Label ID="lblCreateEPPassFail" runat="server" Text="FAIL" Visible="false"></asp:Label>
        <br />
        <asp:Label ID="Label23" runat="server" Text="Run Test: "></asp:Label>
        <asp:Label ID="lblRunTest1" runat="server" Text="FAIL" Visible="false"></asp:Label>
        <br />
        <asp:Label ID="Label27" runat="server" Text="Clean Up:"></asp:Label><asp:Label ID="lblTearDown1" runat="server" Text="FAIL" Visible="false"></asp:Label>
        <br />


        <table style="width: 50%;">
            <tr>
                <td class="auto-style1">
                    <asp:Label ID="Label31" runat="server" Text="After Set Up"></asp:Label>
                    <asp:ListBox ID="lstbxEndpoints" runat="server" Height="240px" Width="400px" OnSelectedIndexChanged="lstbxEndpoints_SelectedIndexChanged" AutoPostBack="True"></asp:ListBox></td>
                <td class="auto-style2">
                    <asp:Panel ID="pnlEndpointInfo" runat="server" Height="330px" ScrollBars="Auto" Width="568px" Visible="False">
                        <asp:Label ID="lblEndpoint" runat="server" Text="Endpoint:"></asp:Label>
                        <br />
                        <table style="width: 100%;">
                            <tr>
                                <td class="auto-style4">
                                    <asp:Label ID="Label9" runat="server" Text="Name"></asp:Label>
                                </td>
                                <td class="auto-style3">
                                    <asp:Label ID="lblName" runat="server" Text=""></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style5">
                                    <asp:Label ID="Label10" runat="server" Text="Region"></asp:Label>
                                </td>
                                <td>
                                    <asp:Label ID="lblregion" runat="server" Text=""></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style5">
                                    <asp:Label ID="Label11" runat="server" Text="ID"></asp:Label>
                                </td>
                                <td>
                                    <asp:Label ID="lblID" runat="server" Text=""></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style5">
                                    <asp:Label ID="Label12" runat="server" Text="Type"></asp:Label>
                                </td>
                                <td>
                                    <asp:Label ID="lbltype" runat="server" Text=""></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style5">
                                    <asp:Label ID="Label13" runat="server" Text="Admin URL"></asp:Label>
                                </td>
                                <td>
                                    <asp:Label ID="lblAdminURL" runat="server" Text=""></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style5">
                                    <asp:Label ID="Label14" runat="server" Text="Public URL"></asp:Label>
                                </td>
                                <td>
                                    <asp:Label ID="lblpublicURL" runat="server" Text=""></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style5">
                                    <asp:Label ID="Label15" runat="server" Text="Internal URL"></asp:Label>
                                </td>
                                <td>
                                    <asp:Label ID="lblIntURL" runat="server" Text=""></asp:Label>
                                </td>
                            </tr>
                        </table>
                    </asp:Panel>
                </td>

            </tr>
        </table>

        <table style="width: 50%;">
            <tr>
                <td class="auto-style1">
                    <asp:Label ID="Label32" runat="server" Text="After Running Test"></asp:Label>
                    <asp:ListBox ID="lstbxDuring" runat="server" Height="240px" Width="400px" AutoPostBack="True" OnSelectedIndexChanged="lstbxDuring_SelectedIndexChanged"></asp:ListBox></td>
                <td class="auto-style2">
                    <asp:Panel ID="pnlDuringEpInfo" runat="server" Height="330px" ScrollBars="Auto" Width="568px" Visible="False">
                        <asp:Label ID="lblEndpointDuring" runat="server" Text="Endpoint:"></asp:Label>
                        <br />
                        <table style="width: 100%;">
                            <tr>
                                <td class="auto-style4">
                                    <asp:Label ID="Label18" runat="server" Text="Name"></asp:Label>
                                </td>
                                <td class="auto-style3">
                                    <asp:Label ID="lblDuringName" runat="server" Text=""></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style5">
                                    <asp:Label ID="Label20" runat="server" Text="Region"></asp:Label>
                                </td>
                                <td>
                                    <asp:Label ID="lblDuringRegion" runat="server" Text=""></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style5">
                                    <asp:Label ID="Label22" runat="server" Text="ID"></asp:Label>
                                </td>
                                <td>
                                    <asp:Label ID="lblDuringID" runat="server" Text=""></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style5">
                                    <asp:Label ID="Label24" runat="server" Text="Type"></asp:Label>
                                </td>
                                <td>
                                    <asp:Label ID="lblDuringType" runat="server" Text=""></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style5">
                                    <asp:Label ID="Label26" runat="server" Text="Admin URL"></asp:Label>
                                </td>
                                <td>
                                    <asp:Label ID="lblDuringAdminURL" runat="server" Text=""></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style5">
                                    <asp:Label ID="Label28" runat="server" Text="Public URL"></asp:Label>
                                </td>
                                <td>
                                    <asp:Label ID="lblDuringPublicURL" runat="server" Text=""></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style5">
                                    <asp:Label ID="Label30" runat="server" Text="Internal URL"></asp:Label>
                                </td>
                                <td>
                                    <asp:Label ID="lblDuringInternalURL" runat="server" Text=""></asp:Label>
                                </td>
                            </tr>
                        </table>
                    </asp:Panel>
                </td>

            </tr>
        </table>

        <table style="width: 50%;">
            <tr>
                <td class="auto-style1">
                    <asp:Label ID="Label17" runat="server" Text="After Clean Up"></asp:Label>
                    <asp:ListBox ID="lstbxAfterEP" runat="server" Height="240px" Width="400px" AutoPostBack="True" OnSelectedIndexChanged="ListBox1_SelectedIndexChanged"></asp:ListBox></td>
                <td class="auto-style2">
                    <asp:Panel ID="pnlAfterEpInfo" runat="server" Height="329px" ScrollBars="Auto" Width="568px" Visible="False">
                        <asp:Label ID="lblEndpointAfter" runat="server" Text="Endpoint:"></asp:Label>
                        <br />
                        <table style="width: 100%;">
                            <tr>
                                <td class="auto-style4">
                                    <asp:Label ID="Label21" runat="server" Text="Name"></asp:Label>
                                </td>
                                <td class="auto-style3">
                                    <asp:Label ID="lblAfterName" runat="server" Text=""></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style5">
                                    <asp:Label ID="Label25" runat="server" Text="Region"></asp:Label>
                                </td>
                                <td>
                                    <asp:Label ID="lblAfterRegion" runat="server" Text=""></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style5">
                                    <asp:Label ID="Label29" runat="server" Text="ID"></asp:Label>
                                </td>
                                <td>
                                    <asp:Label ID="lblAfterID" runat="server" Text=""></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style5">
                                    <asp:Label ID="Label34" runat="server" Text="Type"></asp:Label>
                                </td>
                                <td>
                                    <asp:Label ID="lblAfterType" runat="server" Text=""></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style5">
                                    <asp:Label ID="Label36" runat="server" Text="Admin URL"></asp:Label>
                                </td>
                                <td>
                                    <asp:Label ID="lblAfterAdminURL" runat="server" Text=""></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style5">
                                    <asp:Label ID="Label38" runat="server" Text="Public URL"></asp:Label>
                                </td>
                                <td>
                                    <asp:Label ID="lblAfterPublicURL" runat="server" Text=""></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style5">
                                    <asp:Label ID="Label40" runat="server" Text="Internal URL"></asp:Label>
                                </td>
                                <td>
                                    <asp:Label ID="lblAfterInternalURL" runat="server" Text=""></asp:Label>
                                </td>
                            </tr>
                        </table>
                    </asp:Panel>
                </td>

            </tr>
        </table>

                            </ContentTemplate>
                                             </asp:UpdatePanel>
    </section>

</div>
            <div class="tab-pane" id="1D">
    <section>
        <span class="auto-style1">Test 2</span>
        <br />
        <br />
        Test 2 will attempt to run through the test sequence but will have an <strong>incorrect admin token</strong>.<br />
        <br />
&nbsp;Output will be the message from the exception that is thrown. If the test and clean up are successful a label will appear next to the test button with the word "Pass". If the test fails
        a label will appear next to the test button with the word "FAIL". Keep in mind that passing the test will create no endpoints.
        <br />
        <br />
                                         <asp:UpdatePanel ID="UpdatePanel1" UpdateMode="Conditional" runat="server">
                        <ContentTemplate>

                                                        <asp:UpdateProgress ID="updateProgress1" runat="server">
                           <ProgressTemplate>
                               <div style="position: fixed; text-align: center; height: 100%; width: 100%; top: 0; right: 0; left: 0; z-index: 9999999; background-color: #000000; opacity: 0.7;">
                                   <span style="border-width: 0px; position: fixed; padding: 50px; background-color: #FFFFFF; font-size: 36px; left: 40%; top: 40%;">Test in Progress ...</span>
                               </div>
                           </ProgressTemplate>
                       </asp:UpdateProgress>


        <asp:Button ID="Button1" runat="server" Text="Run Test 2" OnClick="Button1_Click" /><asp:Label ID="lblTest2" runat="server" Text="FAIL" Visible="False"></asp:Label><br />
        <asp:Label ID="Label2" AssociatedControlID="txtbTest2" runat="server">Output for Test 2</asp:Label>
                <asp:TextBox ID="txtbTest2" runat="server" Height="240px" Width="400px" TextMode="MultiLine"></asp:TextBox>
   
                            </ContentTemplate>
                                             </asp:UpdatePanel>
                             </section>
                </div>
                <div class="tab-pane" id="1E">
    <section>
        <span class="auto-style1">Test 3</span>
        <br />
        <br />
        Test 3 will attempt to run through the test sequence but will have an <strong>incorrect admin url</strong>.

        <br />
        <br />
        Output will be the message from the exception that is thrown. If the test and clean up are successful a label will appear next to the test button with the word "Pass". If the test fails
        a label will appear next to the test button with the word "FAIL". Keep in mind that passing the test will create no endpoints.
        <br />
        <br />
                                         <asp:UpdatePanel ID="UpdatePanel2" UpdateMode="Conditional" runat="server">
                        <ContentTemplate>
                            <asp:UpdateProgress ID="updateProgress3" runat="server">
                           <ProgressTemplate>
                               <div style="position: fixed; text-align: center; height: 100%; width: 100%; top: 0; right: 0; left: 0; z-index: 9999999; background-color: #000000; opacity: 0.7;">
                                   <span style="border-width: 0px; position: fixed; padding: 50px; background-color: #FFFFFF; font-size: 36px; left: 40%; top: 40%;">Test in Progress ...</span>
                               </div>
                           </ProgressTemplate>
                       </asp:UpdateProgress>


        <asp:Button ID="btnTest3" runat="server" Text="Run Test 3" OnClick="btnTest3_Click" /><asp:Label ID="lblTest3" runat="server" Text="FAIL" Visible="False"></asp:Label><br />
        <asp:Label ID="Label4" AssociatedControlID="txtbTest3" runat="server">Output for Test 3</asp:Label>
        <asp:TextBox ID="txtbTest3" runat="server" Height="240px" Width="400px" TextMode="MultiLine"></asp:TextBox>
                            </ContentTemplate>
                                             </asp:UpdatePanel>
    </section>
                    </div>
            <div class="tab-pane" id="1F">
    <section>
        <span class="auto-style1">Test 4</span>
        <br />
        <br />
        Test 4 will attempt to run through the test sequence but will have an <strong>incorrect service ID</strong>.

        <br />
        <br />
        Output will be the message from the exception that is thrown.If the test and clean up are successful a label will appear next to the test button with the word "Pass". If the test fails
        a label will appear next to the test button with the word "FAIL". Keep in mind that passing the test will create no endpoints.
        <br />
        <br />
                                         <asp:UpdatePanel ID="UpdatePanel3" UpdateMode="Conditional" runat="server">
                        <ContentTemplate>

                                                        <asp:UpdateProgress ID="updateProgress2" runat="server">
                           <ProgressTemplate>
                               <div style="position: fixed; text-align: center; height: 100%; width: 100%; top: 0; right: 0; left: 0; z-index: 9999999; background-color: #000000; opacity: 0.7;">
                                   <span style="border-width: 0px; position: fixed; padding: 50px; background-color: #FFFFFF; font-size: 36px; left: 40%; top: 40%;">Test in Progress ...</span>
                               </div>
                           </ProgressTemplate>
                       </asp:UpdateProgress>

        <asp:Button ID="btnTest4" runat="server" Text="Run Test 4" OnClick="btnTest4_Click" /><asp:Label ID="lblTest4" runat="server" Text="FAIL" Visible="False"></asp:Label><br />
        <asp:Label ID="Label6" AssociatedControlID="txtbTest4" runat="server">Output for Test 4</asp:Label>
        <asp:TextBox ID="txtbTest4" runat="server" Height="240px" Width="400px" TextMode="MultiLine"></asp:TextBox>
                            </ContentTemplate>
                                             </asp:UpdatePanel>
    </section>
                </div>
            </div>
        </div>
<%-- <section>
        <span class="auto-style1">Test 5</span>
        <br />
        <br />
        Test 5 will attempt to run through the test sequence but will have an<strong> incorrect tenant ID</strong>.

        <br />
        <br />
        Output will be the message from the exception that is thrown. If the test and clean up are successful a label will appear next to the test button with the word "Pass". If the test fails
        a label will appear next to the test button with the word "FAIL". Keep in mind that passing the test will create no endpoints.
        <br />
        <br />
        <asp:Button ID="btnTest5" runat="server" Text="Run Test 5" OnClick="btnTest5_Click" /><asp:Label ID="lblTest5" runat="server" Text="FAIL" Visible="False"></asp:Label><br />
        <asp:Label ID="Label8" AssociatedControlID="txtbTest5" runat="server">Output for Test 5</asp:Label>
        <asp:TextBox ID="txtbTest5" runat="server" Height="240px" Width="358px"></asp:TextBox>
    </section>--%>



</asp:Content>
<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="HeadContent">
    <style type="text/css">
        .auto-style1 {
            font-size: medium;
            font-weight: bold;
        }

        .auto-style2 {
            font-size: medium;
        }
    </style>
</asp:Content>

