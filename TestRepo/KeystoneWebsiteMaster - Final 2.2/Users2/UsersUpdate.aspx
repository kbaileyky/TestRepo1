<%@ Page Title="Update User" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="UsersUpdate.aspx.cs" Inherits="KeystoneWebsite.Users.UsersUpdate" %>

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
                <p>public static User Update(string admin_token, string userID, string UserName, string Email, string Enabled, string TenantID, string url)</p>
                <h4>Function Arguments/Payloads:</h4>
                <p>admin_token: the admin&#39;s Token ID<br />
                    userID: the ID used to identify the User<br />
                    UserName: the new Username for the User<br />
                    Email: the new email for the User<br />
                    Enabled: the new enabled status for the User<br />
                    TenantID: the TenantID for the User<br />
                    url:            the OpenStack server address<br />
                </p>

                <h4>Explicit Message Returns: (Fix These)</h4>
                <p>Successful: A User will be returned with the updated information.<br />

                   Unsuccessful: <br />
                   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                   "Invalid URL: "The operation has timed out."<br />
                   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                   "Invalid Admin Token: "The remote server returned an error: (401) Unauthorized."<br />
                   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                   "Invalid User ID: "Exception of type 'Trinity.OpenStack.ObjectNotFound' was thrown."<br />
                <p/>
                <p>When passed valid arguments (adminToken, userID, url), the Udate User
                    function shall execute a C# json PUT command to update the user specified by the
                    userID on the designated URL server, provided the adminToken is valid.  The various
                    message returns, specified above, will be explictly returned as is applicable.
                    Function specification approved by: David Nikaido and Kendall Bailey.
                </p>
            </div>
            <div class="tab-pane" id="1B">
                <h3>Test Plan</h3>
                <ul>
                    <li>Create Test Tenant</li>
                    <li>Get Test Token</li>
                    <li>Create Test User</li>
                    <li>Call Update for username</li>
                    <li>Call Update for email</li>
                    <li>Call Update for tenantID</li>
                    <li>Call Update for all valid fields at once (username, email, tenantID)</li>
                    <li>Delete Test User</li>
                    <li>Delete Test Tenant</li>
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
                        <section>
                            <h4>Test 1</h4>
                            <br />
                            <br />
                            Test 1 will run through the planned test sequence without throwing an error. 

        Output will be each iteration of the User after the Update commands are called.  Updated versions will be stored in a list and added to a list
        and added to a list box that will display the information when it is clicked.  If the test and clean up are successful it will be indicated by
        a label stating "PASS."  Otherwise the label will read "FAIL" and the error message will be printed to the right of the list box.
        <br />
                            <br />
                            <asp:Label ID="Label16" runat="server" Text="Admin URL" AssociatedControlID="txtbAdminURL"></asp:Label>
                            <asp:TextBox ID="txtbAdminURL" runat="server"></asp:TextBox>
                            <br />
                            <asp:Button ID="btnTest1" runat="server" Text="Test 1" OnClick="btnTest1_Click" /><br />

                            <asp:Label ID="Label19" runat="server" Text="Set Up:"></asp:Label><asp:Label ID="lblCreateUserPassFail" runat="server" Text="FAIL" Visible="false"></asp:Label>
                            <br />
                            <asp:Label ID="Label23" runat="server" Text="Run Test: "></asp:Label>
                            <asp:Label ID="lblRunTest1" runat="server" Text="FAIL" Visible="false"></asp:Label>
                            <br />
                            <asp:Label ID="Label27" runat="server" Text="Clean Up:"></asp:Label><asp:Label ID="lblTearDown1" runat="server" Text="FAIL" Visible="false"></asp:Label>
                            <br />


                            <table style="width: 50%;">
                                <tr>
                                    <td class="auto-style1">
                                        <asp:Label ID="Label31" runat="server" Text="Initial User"></asp:Label>
                                        <asp:ListBox ID="lstbxUsers" runat="server" Height="200px" Width="425px" OnSelectedIndexChanged="lstbxUsers_SelectedIndexChanged" AutoPostBack="True"></asp:ListBox></td>
                                    <td class="auto-style2">
                                        <asp:Panel ID="pnlUserInfo" runat="server" Height="270px" ScrollBars="Auto" Width="568px" Visible="False">
                                            <asp:Label ID="lblUser" runat="server" Text="User:"></asp:Label>
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
                                                        <asp:Label ID="Label10" runat="server" Text="Enabled"></asp:Label>
                                                    </td>
                                                    <td>
                                                        <asp:Label ID="lblEnabled" runat="server" Text=""></asp:Label>
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
                                                        <asp:Label ID="Label12" runat="server" Text="Email"></asp:Label>
                                                    </td>
                                                    <td>
                                                        <asp:Label ID="lblEmail" runat="server" Text=""></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="auto-style5">
                                                        <asp:Label ID="Label14" runat="server" Text="Tenant ID"></asp:Label>
                                                    </td>
                                                    <td>
                                                        <asp:Label ID="lblTenantID" runat="server" Text=""></asp:Label>
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
                                        <asp:Label ID="Label17" runat="server" Text="User Updates"></asp:Label>
                                        <asp:ListBox ID="lstbxAfter" runat="server" Height="200px" Width="425px" AutoPostBack="True" OnSelectedIndexChanged="ListBox1_SelectedIndexChanged"></asp:ListBox></td>
                                    <td class="auto-style2">
                                        <asp:Panel ID="pnlAfterEpInfo" runat="server" Height="270px" ScrollBars="Auto" Width="568px" Visible="False">
                                            <asp:Label ID="lblUserAfter" runat="server" Text="Updates:"></asp:Label>
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
                                                        <asp:Label ID="Label25" runat="server" Text="Enabled"></asp:Label>
                                                    </td>
                                                    <td>
                                                        <asp:Label ID="lblAfterEnabled" runat="server" Text=""></asp:Label>
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
                                                        <asp:Label ID="Label34" runat="server" Text="Email"></asp:Label>
                                                    </td>
                                                    <td>
                                                        <asp:Label ID="lblAfterEmail" runat="server" Text=""></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="auto-style5">
                                                        <asp:Label ID="Label38" runat="server" Text="Tenant ID"></asp:Label>
                                                    </td>
                                                    <td>
                                                        <asp:Label ID="lblAfterTenantID" runat="server" Text=""></asp:Label>
                                                    </td>
                                                </tr>
                                            </table>
                                        </asp:Panel>
                                    </td>

                                </tr>
                            </table>

                        </section>



                        <section>
                            <h4>Test 2</h4>
                            <br />
                            <br />
                            Test 2 will attempt to run through the planned test sequence but will have an incorrect admin url.

        Output will be the message from the exception that is thrown.
        <br />
                            <br />
                            <asp:Button ID="Button1" runat="server" Text="Run Test 2"  OnClick="btnTest2_Click"/><asp:Label ID="Label1" runat="server" Text="FAIL" Visible="false"></asp:Label><br />
                            <asp:Label ID="Label2" AssociatedControlID="TextBox1" runat="server">Output for Test 2</asp:Label>
                            <asp:TextBox ID="TextBox1" runat="server" Height="200px" Width="425px"></asp:TextBox>
                        </section>
                        <section>
                            <h4>Test 3</h4>
                            <br />
                            <br />
                            Test 3 will attempt to run through the planned test sequence but will have an incorrect admin token.

        Output will be the message from the exception that is thrown.
        <br />
                            <br />
                            <asp:Button ID="Button2" runat="server" Text="Run Test 3"  OnClick="btnTest3_Click" /><asp:Label ID="Label3" runat="server" Text="FAIL" Visible="false"></asp:Label><br />
                            <asp:Label ID="Label4" AssociatedControlID="TextBox2" runat="server">Output for Test 3</asp:Label>
                            <asp:TextBox ID="TextBox2" runat="server" Height="200px" Width="425px"></asp:TextBox>
                        </section>
                        <section>
                            <h4>Test 4</h4>
                            <br />
                            <br />
                            Test 4 will attempt to run through the above sequence but will attempt to delete an non-existent User.

        Output will be the message from the exception that is thrown.
        <br />
                            <br />
                            <asp:Button ID="Button3" runat="server" Text="Run Test 4"  OnClick="btnTest4_Click"/><asp:Label ID="Label5" runat="server" Text="FAIL" Visible="false"></asp:Label><br />
                            <asp:Label ID="Label6" AssociatedControlID="TextBox3" runat="server">Output for Test 4</asp:Label>
                            <asp:TextBox ID="TextBox3" runat="server" Height="200px" Width="425px"></asp:TextBox>
                        </section>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
        </div>
    </div>    
</asp:Content>