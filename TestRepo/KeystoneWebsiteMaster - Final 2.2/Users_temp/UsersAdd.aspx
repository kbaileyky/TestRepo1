<%@ Page Title="Add User" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="UsersAdd.aspx.cs" Inherits="KeystoneWebsite.Users.UsersAdd" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="server">
    <h1 style="margin-left:145px;">Add User</h1>
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
                <p>Trinity Software Inc. will provide Rackspace with a function to Add Users to the Keystone service.</p>
                <h4>Function Prototype</h4>
                <p>public static User Add(string url, string username, string password, string enabled, string tenantID, string email, string admin_token)</p>
                <h4>Function Arguments/Payloads:</h4>
                <p>url: the OpenStack server address<br />
                    username: the username for the new User<br />
                    password: the password for the new User<br />
                    enabled: the enabled status for the new User<br />
                    tenantID: the ID of the tenant for the new User<br />
                    email: the email for the new User<br />
                    admin_token: the admin&#39;s Token ID<br />
                </p>
                <h4>Support Function Prototype</h4>
                <p>(Used to collect information when object return is NULL)<br />
                   StringMessage <-- List (string url, string admin_token)
                </p>
                <h4>Explicit Message Returns:</h4>
                <p>Successful: The User will be added.<br />

                   Unsuccessful: "Error #1: The server is not responding."<br />
                   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                   "Error #2: Invalid url."<br />
                   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                   "Error #3: Invalid admin_token."<br />
                   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                   "Error #4: Invalid tenantID."<br />
                   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                   "Error #5: Username already taken."<br />
                <p/>
                <p>On a successful return, this function will add a new User with the designated username
                     by executing a C# HTTPWebRequest to the OpenStack Keystone service at the URL server. 
                    If an error occurs, a message defining the error will be explicitly returned as an Exception. 
                </p>
            </div>
            <div class="tab-pane" id="1B">
                <h3>Test Plan</h3>
                <ol>
                    <li>Call the List function using correct arguments.</li>
                    <li>Create a new user.</li>
                    <li>Call the List function again to demonstrate that the new user has been added</li>
                    <li>Call the List function again to show that the user has been removed</li>
                    <li>Call an unsuccessful Add with an invalid url.</li>
                    <li>Call an unsuccessful Add with an invalid admin_token.</li>
                    <li>Call an unsuccessful Add with an invalid tokenID.</li>
                    <li>Call an unsuccessful Add with an invalid username</li>
                    <li>Delete the new user.</li>
                </ol>
                <h4>Functions Used in Testing</h4>
                <ul>
                    <li>public static Token Request_WithTenantID(string _url, string username, string password, string tenant)</li>
                    <li>public static User Add(string url, string name, string password, string enabled, string tenantID, string email, string adminToken)</li>
                    <li>public static string List(string url, string admin_token)</li>
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
                        <asp:Button ID="btnTest" runat="server" Text="Submit" OnClick="btnTest_Click" />
                        <br />
                        <h4>Test results:</h4>
                        <h5>List Users:</h5>
                        <asp:Label ID="lblFirstListCall" runat="server" Text="Label">Initial info...</asp:Label>
                        <h5>Add User "Quincy1":</h5>
                        <asp:Label ID="lblAddQuincy" runat="server" Text="Label">Initial info...</asp:Label>
                        <h5>Second List Users Call:</h5>
                        <asp:Label ID="lblSecondListCall" runat="server" Text="Label">Initial info...</asp:Label>
                        <h5>Invalid URL:</h5>
                        <asp:Label ID="lblURL" runat="server" Text="Label">Initial info...</asp:Label>
                        <h5>Invalid admin_token:</h5>
                        <asp:Label ID="lblAdminToken" runat="server" Text="Label">Initial info...</asp:Label>
                        <h5>Invalid tokenID:</h5>
                        <asp:Label ID="lblTokenID" runat="server" Text="Label">Initial info...</asp:Label>
                        <h5>Invalid username:</h5>
                        <asp:Label ID="lblUsername" runat="server" Text="Label">Initial info...</asp:Label>                </asp:UpdatePanel>
                        <h5>Delete "Quincy1":</h5>
                        <asp:Label ID="lblDeleteQuincy" runat="server" Text="Label">Initial info...</asp:Label>
                   </ContentTemplate>
                </asp:UpdatePanel>
            </div>
        </div>
    </div>    
</asp:Content>