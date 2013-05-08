<%@ Page Title="List Roles" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="UsersUpdate.aspx.cs" Inherits="KeystoneWebsite.Users.UsersUpdate" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="server">
    <h1 style="margin-left:145px;">Update User</h1>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    <div class="tabbable tabs-left">
        <ul class="nav nav-tabs">
            <li class ="active">
                <a href="#1A" data-toggle="tab">Functional Specifications</a>
            </li>
            <li>
                <a href="#1B" data-toggle="tab">Test Plan</a>
            </li>
            <li>
                <a href="#1C" data-toggle="tab">Test Cases</a>
            </li>
        </ul>
        <div class="tab-content">
            <div class="tab-pane active" id="1A">
                <h3>Functional Specification</h3>
                <p>Trinity Software Inc. will provide Rackspace with a function to Update a User from the Keystone service.</p>
                <h4>Function Prototype</h4>
                <p> public static string Update(string admin_token,string UserID, string UserName, string Email, string Enabled, string TenantID, string url )</p>
                <h4>Function Arguments/Payloads:</h4>
                <p>admin_token: the admin&#39;s Token ID<br />
                    UserID: the ID used to identify the User<br />
                    UserName: the new Username for the User<br />
                    Email: the new email for the User<br />
                    Enabled: the new enabled status for the User<br />
                    TenantID: the TenantID for the User<br />
                    url:            the OpenStack server address<br />
                </p>
                <h4>Support Function Prototype</h4>
                <p>(Used to collect information when object return is NULL)<br />
                   StringMessage <-- List (string URL, string AdminToken)
                </p>
                <h4>Explicit Message Returns:</h4>
                <p>Successful: The User&#39;s new information will be printed.<br />

                   Unsuccessful: "Error #1: The server is not responding."<br />
                   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                   "Error #2: Invalid admin_token."<br />
                   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                   "Error #3: Invalid userID."<br />
                   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                   "Error #4: Invalid tenantID.”<br />
                   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; "Error #5: Invalid url."
                <p/>
                <p>When passed valid arguments (adminToken, userID, tenantID, url), the Udate User
                    function shall execute a C# json PUT command to update the user specified by the
                    userID on the designated URL server, provided the adminToken is valid.  The various
                    message returns, specified above, will be explictly returned as is applicable.
                    Function specification approved by: David Nikaido and Kendall Bailey.
                </p>
            </div>
            <div class="tab-pane" id="1B">
                <h3>Test Plan</h3>
                <ol>
                    <li>Create a new User to use for testing and print that user's information.</li>
                    <li>Call a successful update and print the new information.</li>
                    <li>Call an unsuccessful update with an invalid AdminToken.</li>
                    <li>Call an unsuccessful update with an invalid UserID.</li>
                    <li>Call an unsuccessful update with an invalid TenantID.</li>
                    <li>Call an unsuccessful update with an invalid URL.</li>
                    <li>Delete the User.</li>
                </ol>
                <h4>Functions Used in Testing</h4>
                <ul>
                    <li>public static Token Request_WithTenantID(string _url, string username, string password, string tenant)</li>
                    <li>public static User Add(string url, string name, string password, string enabled, string tenantID, string email, string adminToken)</li>
                    <li>public static string Update(string adminToken, string userID, string username, string email, string enabled, string tenantID, string url)</li>
                    <li>public static string Delete(string url, string userID, string adminToken)</li>
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
                <asp:UpdatePanel ID="UpdatePanel1" UpdateMode="Conditional" runat="server">
                    <ContentTemplate>
                        <asp:Button ID="btnTest" runat="server" Text="Submit" OnClick="btnTest_Click"/>
                        <br />
                        <h4>Test results:</h4>
                        <h5>Create User:</h5>
                        <asp:Label ID="lblAddUsername" runat="server" Text="Label">Initial info...</asp:Label>
                        <asp:Label ID="lblAddEmail" runat="server" Text="Label">Initial info...</asp:Label>
                        <asp:Label ID="lblAddEnabled" runat="server" Text="Label">Initial info...</asp:Label>
                        <h5>Successful Update of User:</h5>
                        <asp:Label ID="lblUpdateUsername" runat="server" Text="Label">Initial info...</asp:Label>
                        <asp:Label ID="lblUpdateEmail" runat="server" Text="Label">Initial info...</asp:Label>
                        <asp:Label ID="lblUpdateEnabled" runat="server" Text="Label">Initial info...</asp:Label>
                        <h5>Invalid Admin Token:</h5>
                        <asp:Label ID="lblAdminToken" runat="server" Text="Label">Initial info...</asp:Label>
                        <h5>Invalid User ID:</h5>
                        <asp:Label ID="lblUserID" runat="server" Text="Label">Initial info...</asp:Label>
                        <h5>Invalid Tenant ID:</h5>
                        <asp:Label ID="lblTenantID" runat="server" Text="Label">Initial info...</asp:Label>
                        <h5>Invalid URL:</h5>
                        <asp:Label ID="lblURL" runat="server" Text="Label">Initial info...</asp:Label>
                        <h5>Delete User:</h5>
                        <asp:Label ID="lblDeleteUser" runat="server" Text="Label">Initial info...</asp:Label>
                    </ContentTemplate>
                </asp:UpdatePanel>

            </div>
        </div>
    </div>    
</asp:Content>