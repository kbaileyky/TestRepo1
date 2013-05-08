<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ServiceDelete.aspx.cs" Inherits="KeystoneWebsite.Services.ServiceDelete" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="server">
    <h1 style="margin-left:145px;">Delete Service</h1>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    <div class="tabbable tabs-left">
        <ul class="nav nav-tabs">
            <li class="active">
                <a href="#1A" data-toggle="tab">Functional Specifications</a>
            </li>
            <li class>
                <a href="#1B" data-toggle="tab">Test Plan</a>
            </li>
            <li class>
                <a href="#1C" data-toggle="tab">Test Cases</a>
            </li>
        </ul>
        <div class="tab-content">
            <div class="tab-pane active" id="1A">
                <h3>Functional Specification</h3>
                <p>Trinity Computer Science Inc. will provide Intel Inc. with a function to Delete a Service in the Keystone Database</p>
                <h4>Function Prototype</h4>
                <p> Object <-- Delete (string URL, string ServiceID, string AdminToken)</p>
                <h4>Function Arguments/Payloads:</h4>
                <p>URL: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;the OpenStack server address <br />
                   ServiceID: the ServiceID of the service to delete <br />
                   AdminToken: the admin's Token ID
                </p>
                <h4>Support Function Prototype</h4>
                <p>(Used to collect information when object return is NULL)<br />
                   StringMessage <-- Delete (string URL, string ServiceID, string AdminToken)
                </p>
                <h6>Explicit Message Returns:</h6>
                <p>Successful: &nbsp;&nbsp;&nbsp;&nbsp;"Object returned when successful"<br />
                   Unsuccessful: "Error #1 <-- The server URL is invalid - unable to reach server"<br />
                   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                   "Error #2 <-- The ServiceID is invalid - cannot be found!"<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                   "Error #3 <-- The AdminToken is invalid"<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                   "Error #4 <-- The Service is still associated with other entitites - therefore cannot be deleted"
                <p/>
                <p>When passed valid arguments (URL, ServiceID, AdminToken), the Delete Service function shall execute a C# json DELETE command to delete the designated service from the OpenStack Keystone
                    Database service list on the designated URL service. A service may not be deleted if there are other entities, such as roles and tenants, that are still associated with it. The various
                    message returns, specified above, will be explicitly returned as is applicable. 
                    Function specification approved by: David Nikaido and Kendall Bailey.</p>
            </div>
            <div class="tab-pane" id="1B">
                <h3>Test Plan</h3>
                <ol>
                    <li>To prevent deleting a service that is in use/production, generate new parameters (Name, ServiceType, Description, AdminToken) for a new service by using the function 
                        GenerateNewServiceParamaters so that this new service to be created will not be a duplicate of a service that is already in the database
                        <ul>
                            <li>GenerateNewServiceParameters utilizes the List function to determine what is in the database</li>
                        </ul>
                    </li>
                    <li>Call the Create function to create a new service using the new parameters we retrieved from GenerateNewServiceParameters</li>
                    <li>If Create is unsuccessful, that is, if a NULL object is returned, then call the string Create function 
                        to retrieve the error message and show it. Identify what is wrong, correct it, and restart the test 
                        plan.</li>
                    <li>Otherwise, our test service for this delete test was successfully created, and we have
                        the ServiceID associated with it.
                    </li>
                    <li>Call the Get function to verify that the newly created service is in the database</li>
                    <li>If Get is unsuccessful, that is, if a NULL object is returned, then call the string Get function to retrieve the error message and show the message. Correct the error, and restart the test plan.</li>
                    <li>Otherwise, we have successfully retrieved the test service from the database, verifying a new test service has been added.</li>
                    <li>Delete our test service by calling the Delete function with the service's ServiceID.</li>
                    <li>If Delete was unsuccessful, that is, if a NULL object is returned, 
                        then call the string Delete function to retrieve the error message and show the message.
                        Identify what is wrong, correct it, then try to delete the service again.
                    </li>
                    <li>Otherwise, double check that the service was truly deleted by calling the Get function 
                        on the ServiceID.
                    </li>
                    <li>If Get is unsucessful, that is, if a NULL object is returned, then call the string Get function
                        to retrieve the error message and show the message.
                    </li>
                    <li>If the error is "Error #2 <-- The ServiceID is invalid - cannot be found!", then this verifies
                        that our Delete function works, and the test is a SUCCESS.
                    </li>
                    <li>If Get successfully retrieves the ServiceID, then our Delete functino did not properly delete the 
                        service. Then the test is a FAILURE because Delete does not do what it needs to do.
                    </li>
                    <li>Clean up step: delete the test service from the database.</li>
                </ol>
                <h4>Functions Used in Testing</h4>
                <ul>
                    <li>public static string Create(string URL, string Name, string ServiceType, string Description, string AdminToken)</li>
                    <li>public static object Create(string URL, string Name, string ServiceType, string Description, string AdminToken)</li>
                    <li>public static string Delete(string URL, string ServiceID, string AdminToken)</li>
                    <li>public static object Delete(string URL, string ServiceID, string AdminToken)</li>
                    <li>public static string Get (string URL, string ServiceID, string AdminToken)</li>
                    <li>public static object Get (string URL, string ServiceID, string AdminToken)</li>
                    <li>public static string List (string URL, string AdminToken)</li>
                    <li>public static object List (string URL, string AdminToken)</li>
                </ul>
                <h4>Optional functions that I will write to help testing validation</h4>
                <ul>
                    <li>public static object GenerateNewServiceParameters(string URL, string AdminToken)</li>
                </ul>
            </div>

            <style type="text/css">
                 table.radioWithProperWrap input
                 {    
                      float: left;
                 }

                 table.radioWithProperWrap label
                 {    
                      margin-left: 25px;
                      display: block;
                 }
            </style>

            <div class="tab-pane" id="1C">
                <h3>Test Cases</h3>
                <asp:RadioButtonList ID="RadioButtonList1" CssClass="radioWithProperWrap" runat="server">
                    <asp:ListItem selected="True" Value="1">Case 1: Calling Delete with valid URL, ServiceID, and AdminToken</asp:ListItem>
                    <asp:ListItem Value="2">Case 2: Calling Delete with an invalid URL and valid ServiceID and AdminToken</asp:ListItem>
                    <asp:ListItem Value="3">Case 3: Calling Delete with an invalid ServiceID and valid URL and AdminToken</asp:ListItem>
                    <asp:ListItem Value="4">Case 4: Calling Delete with an invalid AdminToken and valid URL and ServiceID</asp:ListItem>
                </asp:RadioButtonList>
                <asp:UpdatePanel ID="UpdatePanel1" UpdateMode="Conditional" runat="server">
                    <ContentTemplate>
                        <asp:Button ID="btnServiceTest" runat="server" Text="Submit" OnClick="btnServiceTest_Click"/>
                        <br />
                        <h4>Test results:</h4>
                        <asp:TextBox ID="txtTest1" runat="server" Height="740px" TextMode="MultiLine" Width="850px" BackColor="White"></asp:TextBox>
                    </ContentTemplate>
                </asp:UpdatePanel>

            </div>
        </div>
    </div>    
</asp:Content>
