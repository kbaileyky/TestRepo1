<%@ Page Title="Add Role to User" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="UsersAddRole.aspx.cs" Inherits="KeystoneWebsite.Users.UsersAddRole" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="server">
    <h1 style="margin-left:145px;">Add Role to User</h1>
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
                <p>Trinity Software Inc. will provide Rackspace with a function to Add Roles to Users on the Keystone service.</p>
                <h4>Function Prototype</h4>
                <p>public static Role AddRoleToUser(string url, string UserId, string TenantId, string RoleId, string Admin_Token)</p>
                <h4>Function Arguments/Payloads:</h4>
                <p>url: the OpenStack server address<br />
                    UserId: the ID of the User the Role is being added to<br />
                    TenantId: the ID of the User's Tenant<br />
                    RoleId: the ID of the Role that is being added to the User<br />
                    Admin_Token: the admin&#39;s Token ID<br />
                </p>
                <h4>Explicit Message Returns:</h4>
                 <p>Successful:<br />
                   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                   A User will be added and a User will be returned with the new User's information.<br />

                    Unsuccessful:
                    <br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                   Invalid URL: "The operation has timed out."<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                   Invalid Admin Token: "The remote server returned an error: (401) Unauthorized."<br />
                <p/>
                <p>On a successful return, this function will add a new Role with the designated role ID
                     by executing a C# HTTPWebRequest to the OpenStack Keystone service at the URL server. 
                    If an error occurs, a message defining the error will be explicitly returned as an Exception. 
                </p>
            </div>
            <div class="tab-pane" id="1B">
                <h3>Test Plan</h3>
                <ul>
                    <li>Create Tenant</li>
                    <li>Create Test User</li>
                    <li>Get User Roles List (Should Be Empty)
                        <br />Do 10 Times
                    </li>
                    <li>Create Test Role</li>
                    <li>Add Test Role to User</li>
                    <li>Get List of User Roles (Should contain 10 test roles)
                        <br />Do 10 Times
                    </li>
                    <li>Remove Test Role From User</li>
                    <li>Delete Test Role</li>
                    <li>Get List of User Roles (Should be empty)</li>
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
                        <asp:UpdateProgress ID="updateProgress2" runat="server">
                            <ProgressTemplate>
                                <div style="position: fixed; text-align: center; height: 100%; width: 100%; top: 0; right: 0; left: 0; z-index: 9999999; background-color: #000000; opacity: 0.7;">
                                    <span style="border-width: 0px; position: fixed; padding: 50px; background-color: #FFFFFF; font-size: 36px; left: 40%; top: 40%;">Test in Progress ...</span>
                                </div>
                            </ProgressTemplate>
                        </asp:UpdateProgress>
                        <section>
                            <span class="auto-style1">Test 1</span>
                            <br />
                            <br />
                            Test 1 will run through the planned test sequence without throwing an error. 

        Output will be the string of each role as they are created (10). If the test and clean up are successful the button will turn blue and a label will appear next to it with the word "Pass". If the test fails
        the button will turn red and a label will appear next to the it with the word "FAIL".
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
                                        <asp:Label ID="Label31" runat="server" Text="After Set Up"></asp:Label>
                                        <asp:ListBox ID="lstbxUsers" runat="server" Height="240px" Width="572px" OnSelectedIndexChanged="lstbxUsers_SelectedIndexChanged" AutoPostBack="True"></asp:ListBox></td>
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
                                                        <asp:Label ID="Label11" runat="server" Text="ID"></asp:Label>
                                                    </td>
                                                    <td>
                                                        <asp:Label ID="lblID" runat="server" Text=""></asp:Label>
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
                                        <asp:ListBox ID="lstbxDuring" runat="server" Height="240px" Width="572px" AutoPostBack="True" OnSelectedIndexChanged="lstbxDuring_SelectedIndexChanged"></asp:ListBox></td>
                                    <td class="auto-style2">
                                        <asp:Panel ID="pnlDuringEpInfo" runat="server" Height="270px" ScrollBars="Auto" Width="568px" Visible="False">
                                            <asp:Label ID="lblUserDuring" runat="server" Text="User:"></asp:Label>
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
                                                        <asp:Label ID="Label22" runat="server" Text="ID"></asp:Label>
                                                    </td>
                                                    <td>
                                                        <asp:Label ID="lblDuringID" runat="server" Text=""></asp:Label>
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
                                        <asp:ListBox ID="lstbxAfter" runat="server" Height="240px" Width="572px" AutoPostBack="True" OnSelectedIndexChanged="ListBox1_SelectedIndexChanged"></asp:ListBox></td>
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
                                                    <td class="auto-style5">
                                                        <asp:Label ID="Label29" runat="server" Text="ID"></asp:Label>
                                                    </td>
                                                    <td>
                                                        <asp:Label ID="lblAfterID" runat="server" Text=""></asp:Label>
                                                    </td>
                                                </tr>
                                            </table>
                                        </asp:Panel>
                                    </td>
                                </tr>
                            </table>

                        </section>



                        <section>
                            <span class="auto-style1">Test 2</span>
                            <br />
                            <br />
                            Test 2 will attempt to run through the planned test sequence but will have an incorrect admin token.

        Output will be the message from the exception that is thrown. If the test and clean up are successful the button will turn blue and a label will appear next to it with the word "Pass". If the test fails
        the button will turn red and a label will appear next to the it with the word "FAIL". Keep in mind that passing the test will create no roles.
        <br />
                            <br />
                            <asp:Button ID="Button1" runat="server" Text="Run Test 2" /><asp:Label ID="Label1" runat="server" Text="FAIL" Visible="false"></asp:Label><br />
                            <asp:Label ID="Label2" AssociatedControlID="TextBox1" runat="server">Output for Test 2</asp:Label>
                            <asp:TextBox ID="TextBox1" runat="server" Height="240px" Width="358px"></asp:TextBox>
                        </section>
                        <section>
                            <span class="auto-style1">Test 3</span>
                            <br />
                            <br />
                            Test 3 will attempt to run through the planned test sequence but will have an incorrect admin url.

        Output will be the message from the exception that is thrown. If the test and clean up are successful the button will turn blue and a label will appear next to it with the word "Pass". If the test fails
        the button will turn red and a label will appear next to the it with the word "FAIL". Keep in mind that passing the test will create no roles.
        <br />
                            <br />
                            <asp:Button ID="Button2" runat="server" Text="Run Test 3" /><asp:Label ID="Label3" runat="server" Text="FAIL" Visible="false"></asp:Label><br />
                            <asp:Label ID="Label4" AssociatedControlID="TextBox2" runat="server">Output for Test 3</asp:Label>
                            <asp:TextBox ID="TextBox2" runat="server" Height="240px" Width="358px"></asp:TextBox>
                        </section>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
        </div>
    </div>
</asp:Content>