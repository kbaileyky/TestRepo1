<%@ Page Title="Delete User" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="UsersDelete.aspx.cs" Inherits="KeystoneWebsite.Users.UsersDelete" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="server">
    <h1 style="margin-left:145px;">Delete User</h1>
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
                <p>Trinity Software Inc. will provide Rackspace with a function to Delete Users from the Keystone service.</p>
                <h4>Function Prototype</h4>
                <p>public static string Delete(string url, string user_id, string admin_token)</p>
                <h4>Function Arguments/Payloads:</h4>
                <p>url: the OpenStack server address<br />
                    user_id: the ID for the User to be deleted<br />
                    admin_token: the admin&#39;s Token ID<br />
                </p>
                <h4>Explicit Message Returns:</h4>
                <p>
                    Successful:
                    <br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    A User will be returned with the updated information.<br />

                    Unsuccessful:
                    <br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                   Invalid URL: "The operation has timed out."<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                   Invalid Admin Token: "The remote server returned an error: (401) Unauthorized."<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                   Invalid User ID: "Exception of type 'Trinity.OpenStack.ObjectNotFound' was thrown."<br />
                <p/>
                <p>On a successful return, this function will delete a User with the designated userID 
                   by executing a C# HTTPWebRequest to the OpenStack Keystone service at the URL server. 
                   If an error occurs, a message defining the error will be explicitly returned as an Exception.
                </p>

            </div>
            <div class="tab-pane" id="1B">
                <h3>Test Plan</h3>
                <ul>
                    <li>Create Test Tenant
                        <br /> Do 10 Times:
                    </li>
                    <li>Create Test User</li>
                    <li>Get User list (May already contain Users, but these will not be disturbed)
                        <br /> Do 10 Times:
                    </li>
                    <li>Delete Test User</li>
                    <li>Get User list (To make sure all test users have been deleted)</li>
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
                        <asp:UpdateProgress ID="updateProgress2" runat="server">
                            <ProgressTemplate>
                                <div style="position: fixed; text-align: center; height: 100%; width: 100%; top: 0; right: 0; left: 0; z-index: 9999999; background-color: #000000; opacity: 0.7;">
                                    <span style="border-width: 0px; position: fixed; padding: 50px; background-color: #FFFFFF; font-size: 36px; left: 40%; top: 40%;">Test in Progress ...</span>
                                </div>
                            </ProgressTemplate>
                        </asp:UpdateProgress>
                        <section>
                            <h4>Test 1 - Successful</h4>
                            Test 1 will run through the planned test sequence without throwing an error. 

        Output will be the list of Users before and after the calls to Delete.
        <br />
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
                                        <asp:Label ID="Label31" runat="server" Text="After Set Up"></asp:Label>
                                        <asp:ListBox ID="lstbxUsers" runat="server" Height="240px" Width="450px" OnSelectedIndexChanged="lstbxUsers_SelectedIndexChanged" AutoPostBack="True"></asp:ListBox></td>
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
                                        <asp:Label ID="Label17" runat="server" Text="After Clean Up"></asp:Label>
                                        <asp:ListBox ID="lstbxAfter" runat="server" Height="240px" Width="400px" AutoPostBack="True" OnSelectedIndexChanged="ListBox1_SelectedIndexChanged"></asp:ListBox></td>
                                    <td class="auto-style2">
                                        <asp:Panel ID="pnlAfterEpInfo" runat="server" Height="270px" ScrollBars="Auto" Width="568px" Visible="False">
                                            <asp:Label ID="lblUserAfter" runat="server" Text="User:"></asp:Label>
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
                        <section>
                            <h4>Test 2 - Invalid URL</h4>
                            Test 2 will attempt to run through the planned test sequence but will have an incorrect admin url.

        Output will be the message from the exception that is thrown.
        <br />
                            <br />
                            <asp:Button ID="Button1" runat="server" Text="Run Test 2" OnClick="btnTest2_Click" /><asp:Label ID="Label1" runat="server" Text="FAIL" Visible="false"></asp:Label><br />
                            <asp:Label ID="Label2" AssociatedControlID="TextBox1" runat="server">Output for Test 2</asp:Label>
                            <asp:TextBox ID="TextBox1" runat="server" Height="200px" Width="425px" Enabled ="false"></asp:TextBox>
                        </section>
                        <section>
                            <h4>Test 3 - Invalid Admin</h4>
                            Test 3 will attempt to run through the planned test sequence but will have an incorrect admin token.

        Output will be the message from the exception that is thrown.
        <br />
                            <br />
                            <asp:Button ID="Button2" runat="server" Text="Run Test 3" OnClick="btnTest3_Click" /><asp:Label ID="Label3" runat="server" Text="FAIL" Visible="false"></asp:Label><br />
                            <asp:Label ID="Label4" AssociatedControlID="TextBox2" runat="server">Output for Test 3</asp:Label>
                            <asp:TextBox ID="TextBox2" runat="server" Height="200px" Width="425px" Enabled ="False"></asp:TextBox>
                        </section>
                        <section>
                            <h4>Test 4 - Non-Existent User</h4>
                            Test 4 will attempt to run through the above sequence but will attempt to update a non-existent User.

        Output will be the message from the exception that is thrown.
        <br />
                            <br />
                            <asp:Button ID="Button3" runat="server" Text="Run Test 4" OnClick="btnTest4_Click" /><asp:Label ID="Label5" runat="server" Text="FAIL" Visible="false"></asp:Label><br />
                            <asp:Label ID="Label6" AssociatedControlID="TextBox3" runat="server">Output for Test 4</asp:Label>
                            <asp:TextBox ID="TextBox3" runat="server" Height="200px" Width="425px" Enabled ="false"></asp:TextBox>
                        </section>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
        </div>
    </div>    
</asp:Content>