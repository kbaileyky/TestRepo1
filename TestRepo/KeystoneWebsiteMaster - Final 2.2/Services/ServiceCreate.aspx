<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ServiceCreate.aspx.cs" Inherits="KeystoneWebsite.Services.ServiceCreate" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="server">
    <h1 style="margin-left:145px;">Create Services</h1>
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
                <p>Trinity Computer Science Inc. will provide Intel Inc. with a function to Create a Service in the Keystone Database</p>
                <h4>Function Prototype</h4>
                <p> Object <-- Create (string URL, string Name, string ServiceType, string Description, string AdminToken)</p>
                <h4>Function Arguments/Payloads:</h4>
                <p>URL: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;the OpenStack server address <br />
                   Name: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;the name of the new service to create <br />
                   ServiceType: the type of the service to create <br />
                    Description: &nbsp;the description of the service to create <br />
                   AdminToken: the admin's Token ID
                </p>
                <h4>Support Function Prototype</h4>
                <p>(Used to collect information when object return is NULL)<br />
                   StringMessage <-- Create (string URL, string Name, string ServiceType, string Description, string AdminToken)
                </p>
                <h6>Explicit Message Returns:</h6>
                <p>Successful: &nbsp;&nbsp;&nbsp;&nbsp;"Object returned when successful"<br />
                   Unsuccessful: "Error #1 <-- The server URL is invalid - unable to reach server"<br />
                   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                   "Error #2 <-- The Name is invalid"
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                   "Error #3 <-- The ServiceType is invalid"
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                   "Error #4 <-- The Description is invalid"
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                   "Error #5 <-- The AdminToken is invalid"
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                   "Error #6 <-- The service already exists! Cannot have duplicates"
                <p/>
                <p>When passed valid arguments (URL, AdminToken), the List Service function shall 
                    execute a C# json GET command to retrieve the list of all services from the 
                    OpenStack Keystone Database service list on the designated URl server. The 
                    condition of no services in the list is not handled as an error. The various
                    message returns, specified above, will be explicitly returned as is applicable. 
                    Function specification approved by: David Nikaido and Kendall Bailey.</p>
            </div>
            <div class="tab-pane" id="1B">
                <h3>Test Plan</h3>
                <ol>
                    <li>Call the List function.</li>
                    <li>If List is unsuccessful, that is, if a NULL object is returned, then call the string List function 
                        to retrieve the error message and show it. Identify what is wrong, correct it, and restart the test 
                        plan. There are only 2 possible errors for List: either an invalid server URl or an invalid AdminToken.</li>
                    <li>Otherwise, we have retrieved a list of all services in the database</li>
                    <li>Double check that List truly works by doing the following.</li>
                    <li>Create a test service.
                        <ul>
                            <li>Generate new parameters (Name, ServiceType, Description, AdminToken) for a new service by using the function GenerateNewServiceParameters so that this new service to be created will not be a duplicate of a service that is already in the database</li>
                            <li>GenerateNewServiceParameters utilizes the List function to determine what is in the database</li>
                        </ul>
                    </li>
                    <li>Call the Get function using the ServiceID of the test service we just created to verify that the test service has been added to the database.</li>
                    <li>If Get is unsuccessful, that is, if a NULL object is returned, then call the string Get function to retrieve the error message and show the message. Correct the error, and restart the test plan.</li>
                    <li>Otherwise, we have successfully retrieved the test service from the database, verifying a new test service has been added.</li>
                    <li>Call the List function again.</li>
                    <li>If List is unsuccessful, then call the string List function to retrieve the error message and show it. Identify what is wrong, correct it, delete the test service, and restart the test plan.</li>
                    <li>Otherwise, if the return from List shows the newly added service, then List works properly and the test is a SUCCESS. If the return from List shows the exact same list as in the beginning of the test (step 4), then List is not working properly, and the test is a FAILURE because List is not working properly. Delete the test service and restart the test plan.</li>
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
                    <asp:ListItem selected="True" Value="1">Case 1: Calling Create with valid URL and AdminToken</asp:ListItem>
                    <asp:ListItem Value="2">Case 2: Calling Create with an invalid AdminToken</asp:ListItem>
                    <asp:ListItem Value="3">Case 3: Calling Create with valid URL and AdminToken arguments</asp:ListItem>
                </asp:RadioButtonList>
                <asp:UpdatePanel ID="UpdatePanel1" UpdateMode="Conditional" runat="server">
                    <ContentTemplate>
                        <asp:Button ID="btnServiceTest" runat="server" Text="Submit" OnClick="btnServiceTest_Click"/>
                        <br />
                        <h4>Test results:</h4>
                        <asp:TextBox ID="txtTest1" runat="server" Height="140px" TextMode="MultiLine" Width="800px" BackColor="White"></asp:TextBox>
                    </ContentTemplate>
                </asp:UpdatePanel>

            </div>
        </div>
    </div>   
</asp:Content>
