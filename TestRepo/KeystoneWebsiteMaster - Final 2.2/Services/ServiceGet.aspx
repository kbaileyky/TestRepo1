<%@ Page Title="Get Services" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ServiceGet.aspx.cs" Inherits="KeystoneWebsite.Services.ServiceGet" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    <hgroup class="title">
        <h1><%: Title %>.</h1>
        <h2>&nbsp;</h2>
    </hgroup>

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
                <p>Trinity Computer Science Inc. will provide Intel Inc. with a function to Get a Service in the Keystone Database</p>
                <h4>Function Prototype</h4>
                <p> Object <-- Get (string URL, string ServiceID, string AdminToken)</p>
                <h4>Function Arguments/Payloads:</h4>
                <p>URL: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;the OpenStack server address <br />
                   ServiceID: the ServiceID of the service to retrieve <br />
                   AdminToken: the admin's Token ID
                </p>
                <h4>Support Function Prototype</h4>
                <p>(Used to collect information when object return is NULL)<br />
                   StringMessage <-- Get (string URL, string ServiceID, string AdminToken)
                </p>
                <h6>Explicit Message Returns:</h6>
                <p>Successful: &nbsp;&nbsp;&nbsp;&nbsp;"Object returned when successful"<br />
                   Unsuccessful: "Error #1 <-- The server URL is invalid - unable to reach server"<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                   "Error #2 <-- The ServiceID is invalid - cannot be found!"<br />
                   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                   "Error #3 <-- The AdminToken is invalid"
                <p/>
                <p>When passed valid arguments (URL, ServiceID, AdminToken), the Get Service function shall ecevute a C# json GET
                    command to retrieve the designated service from the Open Stack Keystone Database service list on the designated
                    URL server. The various message returns, specified above, will be explicitly returned as is applicable. 
                    Function specification approved by: David Nikaido and Kendall Bailey.</p>
            </div>
            <div class="tab-pane" id="1B">
                <h3>Test Plan</h3>
                <ol>
                    <li>Check to see if there are any services in the database by calling the List function.</li>
                    <li>If List is unsuccessful, that is, if a NULL object is returned, then call the string List function 
                        to retrieve the error message and show it. Identify what is wrong, correct it, and restart the test 
                        plan.</li>
                    <li>Otherwise, we have retrieved a list of all services in the database</li>
                    <li>If the list is empty, then we need to create a test service.
                        <ul>
                            <li>Generate new parameters (Name, ServiceType, Description, AdminToken) for a new service by using the function GenerateNewServiceParameters so that this new service to be created will not be a duplicate of a service that is already in the database</li>
                            <li>GenerateNewServiceParameters utilizes the List function to determine what is in the database</li>
                        </ul>
                    </li>
                    <li>Now we have a service to test our Get against (whether the service was already in the database or we just
                        created it.
                    </li>
                    <li>Call the Get function using the ServiceID of the one service we want to retrieve.</li>
                    <li>If Get is unsuccessful, that is, if a NULL object is returned, then call the string Get function to retrieve the error message and show the message. Correct the error, and restart the test plan.</li>
                    <li>Otherwise, we have successfully retrieved the test service from the database, verifying that our Get function works.
                        The test is a SUCCESS.
                    </li>
                    <li>Clean up: If we had created a test service (from step 4 fo this test plan), then we need to
                        delete it. Delete our servyce by calling the Delete function with the service's ServiceID. If 
                        Delete was unsuccessful, that is, if a NULL object is returned, then call the string Delete function to retrieve
                        the error message and show the message. Identify what the error is, correct it, then try to delete the service again.
                    </li>
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
                <asp:UpdatePanel ID="UpdatePanel1" UpdateMode="Conditional" runat="server">
                    <ContentTemplate>
                        <h4>Test Case 1:</h4>
                        <p>Call Get with valid parameters.</p>
                        <asp:Button ID="Button1" runat="server" Text="Get Service" OnClick="Button1_Click" />
                        <br />
                        <asp:TextBox ID="Text1" runat="server" Height="80px" ReadOnly="true" TextMode="MultiLine" Width="402px" BackColor="White"></asp:TextBox>
                        
                        <h4>Test Case 2:</h4>
                        <p>Call Get with an invalid URL.</p>
                        <asp:Button ID="Button2" runat="server" Text="Get Service" OnClick="Button2_Click"/>
                        <br />
                        <asp:TextBox ID="Text2" runat="server" Height="40px" ReadOnly="true" TextMode="MultiLine" Width="402px" BackColor="White"></asp:TextBox>

                        <h4>Test Case 3:</h4>
                        <p>Call Get with an invalid ServiceID.</p>
                        <asp:Button ID="Button3" runat="server" Text="Get Service" OnClick="Button3_Click" />
                        <br />
                        <asp:TextBox ID="Text3" runat="server" Height="40px" ReadOnly="true" TextMode="MultiLine" Width="402px" BackColor="White"></asp:TextBox>

                        <h4>Test Case 4:</h4>
                        <p>Call Get with an invalid Admin Token.</p>
                        <asp:Button ID="Button4" runat="server" Text="Get Service" OnClick="Button4_Click" />
                        <br />
                        <asp:TextBox ID="Text4" runat="server" Height="40px" ReadOnly="true" TextMode="MultiLine" Width="402px" BackColor="White"></asp:TextBox>
                   

                    </ContentTemplate>
                </asp:UpdatePanel>

            </div>
        </div>
    </div>    
</asp:Content>
