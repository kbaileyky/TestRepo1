<%@ Page Title="List Endpoints" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="TestListEndpoints.aspx.cs" Inherits="KeystoneWebsite.Endpoints.TestListEndpoints" %>


<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <hgroup class="title">
        <h1><%: Title %></h1>
    </hgroup>
    <br />
    <section>
        <span class="auto-style1">:public void EndpointManager:List_Endpoints(string admin_url, string user_token, string admin_token)</span>
    </section>
    <br />
    <br />

    <div class="tabbable tabs-left">
        <ul class="nav nav-tabs">
            <li class="active">
                <a href="#1A" data-toggle="tab">Function Specifications</a>
            </li>
            <li class>
                <a href="#1B" data-toggle="tab">Test Plan</a>
            </li>
            <li class>
                <a href="#1C" data-toggle="tab">Test 1 - SUCCESS</a>
            </li>
            <li class>
                <a href="#1D" data-toggle="tab">Test 2 - Bad Admin URL</a>
            </li>
            <li class>
                <a href="#1E" data-toggle="tab">Test 3 - Bad Admin Token</a>
            </li>
        </ul>
        <div class="tab-content">
            <div class="tab-pane active" id="1A">

                <section>
                    <b><span class="auto-style2">Function Arguments/Payloads</span>:   </b>

                    <ul>

                        <li>admin_url: The url is the OpenStack server address. The port required is the admin port number. 	For example: http://sampleserveraddress:35357, where 35357 is the admin port</li>
                        <li>user_token: This is the id of a token given to a user (can be admin)</li>
                        <li>admin_token: This is the id of a token given to a user with admin permissions</li>
                    </ul>

                </section>
                <section>

                    <b><span class="auto-style2">Explicit Message Returns</span>:   </b>
                    <ul>

                        <li>Successful:  </li>
                        <ul>
                            <li>void. The endpoint_list field of the Endpoint_Manager will contain a parsed list of endpoints or an empty list of Endpoints if none are found.  </li>
                        </ul>
                        <li>Specific Throws:  </li>
                        <ul>
                            <li>Error Invalid Admin Token:  "Exception of type 'Trinity.OpenStack.Unauthorized' was thrown.”</li>
                            <li>Error Invalid URL : "The operation has timed out”</li>


                        </ul>
                    </ul>
                </section>
                <section>
                    <span class="auto-style1">Description</span><br />
                    When passed a valid arguments (url, userToken, AdminToken), the List_Endpoints function shall
execute a C# curl command to retrieve a list of endpoints that the userToken has access to from the Open Stack .
Keystone Database service list on the designated URL server.  The various message returns, specified above, will be explicitly returned as is applicable. Function will also throw general web request errors, such as not found, invalid URL, etc.


                </section>
            </div>
            <div class="tab-pane" id="1B">
                <section>
                    <b>Test 1</b><br />
                    Overview:
        <ul>
            <li>Verify Current Token</li>
            <li>Get Endpoint list (containing whatever is on the server)</li>
        </ul>


                </section>
                <section>
                    <b>Test 2</b><br />
                    Overview:
        <ul>
            <li>Verify Current Token</li>
            <li>Create Tenant</li>
            <li>Create Service</li>
            <li>Create User</li>
            <li>Get Test Token</li>
            <li>Get Endpoint list using new user token (should be empty)</li>
            <li>Delete User</li>
            <li>Delete Service</li>
            <li>Delete Tenant</li>
        </ul>


                </section>
                <section>
                    [Other peoples documentation]

                </section>
                <section>
                    <span class="auto-style1">Get Endpoint List</span>
                    <br />
                    <br />
                    <blockquote class="pullquote">
                        curl -H -X GET "X-Auth-Token:_token_id_" http://sampleserveraddress:35357/v2.0/tokens/_token_id_/endpoints
                    </blockquote>



                </section>
            </div>
            <div class="tab-pane" id="1C">
                <section>
                    <span class="auto-style1">Test 1</span>
                    <br />
                    <br />
                    Test 1 will run through the test sequence for test 1 <strong>without throwing an error</strong>.
         <br />
                    <br />
                    Output will be two populated list boxes containing the endpoints that are in the database after the test. When selected information about the endpoint will appear to the right of the list box. If the test and clean up are successful a label will appear next to the test button with the word &quot;Pass&quot;. If the test fails a label will appear next to the test button with the word &quot;FAIL&quot;.&nbsp; Keep in mind that passing the test will neither create nor delete endpoints. .
        <br />
                    <br />
                </section>
                <br />
                <asp:UpdatePanel ID="UpdatePanel1" UpdateMode="Conditional" runat="server">
                    <ContentTemplate>

                                                    <asp:UpdateProgress ID="updateProgress" runat="server">
                           <ProgressTemplate>
                               <div style="position: fixed; text-align: center; height: 100%; width: 100%; top: 0; right: 0; left: 0; z-index: 9999999; background-color: #000000; opacity: 0.7;">
                                   <span style="border-width: 0px; position: fixed; padding: 50px; background-color: #FFFFFF; font-size: 36px; left: 40%; top: 40%;">Test in Progress ...</span>
                               </div>
                           </ProgressTemplate>
                       </asp:UpdateProgress>

                        <asp:Button ID="btnTest1" runat="server" Text="Test 1" OnClick="btnTest1_Click" /><asp:Label ID="lblCreateEPPassFail" runat="server" Text="FAIL" Visible="false"></asp:Label>


                        <section>
                            <table style="width: 50%;">
                                <tr>
                                    <td class="auto-style1">
                                        <asp:ListBox ID="lstbxEndpoints" runat="server" Height="240px" Width="400px" AutoPostBack="True" OnSelectedIndexChanged="lstbxEndpoints_SelectedIndexChanged"></asp:ListBox></td>
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
                                                        <asp:Label ID="lblName" runat="server" Text="."></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="auto-style5">
                                                        <asp:Label ID="Label10" runat="server" Text="Region"></asp:Label>
                                                    </td>
                                                    <td>
                                                        <asp:Label ID="lblregion" runat="server" Text="."></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="auto-style5">
                                                        <asp:Label ID="Label11" runat="server" Text="ID"></asp:Label>
                                                    </td>
                                                    <td>
                                                        <asp:Label ID="lblID" runat="server" Text="."></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="auto-style5">
                                                        <asp:Label ID="Label12" runat="server" Text="Type"></asp:Label>
                                                    </td>
                                                    <td>
                                                        <asp:Label ID="lbltype" runat="server" Text="."></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="auto-style5">
                                                        <asp:Label ID="Label13" runat="server" Text="Admin URL"></asp:Label>
                                                    </td>
                                                    <td>
                                                        <asp:Label ID="lblAdminURL" runat="server" Text="."></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="auto-style5">
                                                        <asp:Label ID="Label14" runat="server" Text="Public URL"></asp:Label>
                                                    </td>
                                                    <td>
                                                        <asp:Label ID="lblpublicURL" runat="server" Text="."></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="auto-style5">
                                                        <asp:Label ID="Label15" runat="server" Text="Internal URL"></asp:Label>
                                                    </td>
                                                    <td>
                                                        <asp:Label ID="lblIntURL" runat="server" Text="."></asp:Label>
                                                    </td>
                                                </tr>
                                            </table>
                                        </asp:Panel>
                                    </td>

                                </tr>
                            </table>

                        </section>

                    </ContentTemplate>
                </asp:UpdatePanel>

                <%--   <section>
         <span class="auto-style1">Test 2</span>
        <br /><br />
         Test 2 will run through the test sequence for test 2 without <strong>throwing an error, the result should be an empty list</strong>.
         <br />
         <br />
         Output will be an empty list box. If the test and clean up are successful a label will appear next to the test button with the word &quot;Pass&quot;. If the test fails a label will appear next to the test button with the word &quot;FAIL&quot;.&nbsp; Keep in mind that passing the test will neither create nor delete endpoints.
        <br /><br />
        <asp:Button ID="btnTest2" runat="server" Text="Run Test 2" OnClick="btnTest2_Click" /><asp:Label ID="lblTest2" runat="server" Text="FAIL" Visible="False"></asp:Label><br />
        <asp:Label ID="Label2" runat="server">Output for Test 2</asp:Label>
     <table style="width:50%;">
         <tr>
             <td class="auto-style1"> <asp:ListBox ID="lstbxEndpointsTEst2" runat="server" Height="240px" Width="572px"  AutoPostBack="True" OnSelectedIndexChanged="lstbxEndpoints_SelectedIndexChanged"></asp:ListBox></td>
             <td class="auto-style2">
                 <asp:Panel ID="pnlEndpointInfoTest2" runat="server" Height="270px" ScrollBars="Auto" Width="568px" Visible="False">
                     <asp:Label ID="lblEndpoint0" runat="server" Text="Endpoint:"></asp:Label>
                     <br />
                     <table style="width:100%;">
                         <tr>
                             <td class="auto-style4">
                                 <asp:Label ID="Label17" runat="server" Text="Name"></asp:Label>
                             </td>
                             <td class="auto-style3">
                                 <asp:Label ID="lblName0" runat="server" Text="."></asp:Label>
                             </td>
                         </tr>
                         <tr>
                             <td class="auto-style5">
                                 <asp:Label ID="Label18" runat="server" Text="Region"></asp:Label>
                             </td>
                             <td>
                                 <asp:Label ID="lblregion0" runat="server" Text="."></asp:Label>
                             </td>
                         </tr>
                         <tr>
                             <td class="auto-style5">
                                 <asp:Label ID="Label19" runat="server" Text="ID"></asp:Label>
                             </td>
                             <td>
                                 <asp:Label ID="lblID0" runat="server" Text="."></asp:Label>
                             </td>
                         </tr>
                         <tr>
                             <td class="auto-style5">
                                 <asp:Label ID="Label20" runat="server" Text="Type"></asp:Label>
                             </td>
                             <td>
                                 <asp:Label ID="lbltype0" runat="server" Text="."></asp:Label>
                             </td>
                         </tr>
                         <tr>
                             <td class="auto-style5">
                                 <asp:Label ID="Label21" runat="server" Text="Admin URL"></asp:Label>
                             </td>
                             <td>
                                 <asp:Label ID="lblAdminURL0" runat="server" Text="."></asp:Label>
                             </td>
                         </tr>
                         <tr>
                             <td class="auto-style5">
                                 <asp:Label ID="Label22" runat="server" Text="Public URL"></asp:Label>
                             </td>
                             <td>
                                 <asp:Label ID="lblpublicURL0" runat="server" Text="."></asp:Label>
                             </td>
                         </tr>
                         <tr>
                             <td class="auto-style5">
                                 <asp:Label ID="Label23" runat="server" Text="Internal URL"></asp:Label>
                             </td>
                             <td>
                                 <asp:Label ID="lblIntURL0" runat="server" Text="."></asp:Label>
                             </td>
                         </tr>
                     </table>
                 </asp:Panel>
             </td>

         </tr>
     </table>

      </section>--%>
            </div>
            <div class="tab-pane" id="1D">
                <section>
                    <span class="auto-style1">Test 2</span>
                    <br />
                    <br />
                    Test 2 will attempt to run through the test sequence but will have<strong> an incorrect admin url</strong>.

         <br />
                    <br />
                    Output will be the message from the exception that is thrown.&nbsp; If the test and clean up are successful a label will appear next to the test button with the word &quot;Pass&quot;. If the test fails a label will appear next to the test button with the word &quot;FAIL&quot;.&nbsp; Keep in mind that passing the test will neither create nor delete endpoints. 
        <br />
                    <br />
                    <asp:UpdatePanel ID="UpdatePanel2" UpdateMode="Conditional" runat="server">
                        <ContentTemplate>

                                                        <asp:UpdateProgress ID="updateProgress1" runat="server">
                           <ProgressTemplate>
                               <div style="position: fixed; text-align: center; height: 100%; width: 100%; top: 0; right: 0; left: 0; z-index: 9999999; background-color: #000000; opacity: 0.7;">
                                   <span style="border-width: 0px; position: fixed; padding: 50px; background-color: #FFFFFF; font-size: 36px; left: 40%; top: 40%;">Test in Progress ...</span>
                               </div>
                           </ProgressTemplate>
                       </asp:UpdateProgress>

                            <asp:Button ID="btnTest3" runat="server" Text="Run Test 2" OnClick="btnTest3_Click" /><asp:Label ID="lblTest3" runat="server" Text="FAIL" Visible="False"></asp:Label><br />
                            <asp:Label ID="Label4" AssociatedControlID="txtbTest3" runat="server">Output for Test 2</asp:Label>
                            <asp:TextBox ID="txtbTest3" runat="server" Height="240px" Width="400px" TextMode="MultiLine"></asp:TextBox>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </section>
            </div>
            <div class="tab-pane" id="1E">
                <section>
                    <span class="auto-style1">Test 3</span>
                    <br />
                    <br />
                    Test 3 will attempt to run through the test sequence but will have<strong> an incorrect admin token.</strong><br />
                    <br />
                    &nbsp;Output will be the message from the exception that is thrown. If the test and clean up are successful a label will appear next to the test button with the word &quot;Pass&quot;. If the test fails a label will appear next to the test button with the word &quot;FAIL&quot;.&nbsp; Keep in mind that passing the test will neither create nor delete endpoints. 
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

                            <asp:Button ID="btnTest4" runat="server" Text="Run Test 3" OnClick="btnTest4_Click" /><asp:Label ID="lblTest4" runat="server" Text="FAIL" Visible="False"></asp:Label><br />
                            <asp:Label ID="Label6" AssociatedControlID="txtbTest4" runat="server">Output for Test 3</asp:Label>
                            <asp:TextBox ID="txtbTest4" runat="server" Height="240px" Width="400px" TextMode="MultiLine"></asp:TextBox>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </section>


            </div>
        </div>
    </div>
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

