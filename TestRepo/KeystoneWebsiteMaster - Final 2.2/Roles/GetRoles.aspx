﻿<%@ Page Title="Get Roles" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="GetRoles.aspx.cs" Inherits="KeystoneWebsite.Roles.GetRoles" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <hgroup class="title">
        <h1><%: Title %>.</h1>
        <h2>&nbsp;</h2>
    </hgroup>

    <div class="tabbable tabs-left">
        <ul class="nav nav-tabs" id="myTab">
            <li class="active">
                <a href="#1A" data-toggle="tab">Function Specifications</a>
            </li>
            <li>
                <a href="#1B" data-toggle="tab">Test Plan</a>
            </li>
            <li>
                <a href="#1C" data-toggle="tab">Run Tests</a>
            </li>
        </ul>
        <div class="tab-content">
            <div class="tab-pane active" id="1A">
                <h2>Function Specification:</h2>
                <p>Trinity Software Inc. will provide Rackspace with a function to Get a Role from the Keystone service.</p>
                <h3>Function Prototype: </h3>
                <h5>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;public static Role Get(string URL, string RoleID, string AdminToken) </h5>
                <h3>Function Arguments/Payloads:</h3>
                <ul>
                    <li>admin_url: The url is the OpenStack server address. The port required is the admin port number. For example: http://sampleserveraddress:35357, where 35357 is the admin port</li>
                    <li>role_id: the unique RoleID of the Role to be retrieved</li>
                    <li>user_token: This is the id of a token given to a user (can be admin)</li>
                    <li>admin_token: This is the id of a token given to a user with admin permissions</li>
                </ul>

                <h3>Explicit Returns:</h3>
                <ul>
                    <li>Successful:
                <ul>
                    <li>Role. The Role will be retrieved from the KeyStone database and returned to the user.</li>
                </ul>
                    </li>
                    <li>Error Messages:</li>
                    <li>&nbsp;<ul>
                        <li>Error Invalid URL : &quot;The operation has timed out”</li>
                        <li>Error Invalid Role ID: &quot;Exception of type &#39;Trinity.OpenStack.ObjectNotFound&#39; was thrown.&quot;</li>
                        <li>Error Invalid Admin Token: &quot;Exception of type &#39;Trinity.OpenStack.Unauthorized&#39; was thrown.”</li>
                    </ul>
                    </li>
                </ul>
                <h4>Description</h4>
                <p>On a successful return, this function will return a Role with the designated RoleID to the user by executing a C# HTTPWebRequest to the OpenStack Keystone service at the URL server. If an error occurs, a message defining the error will be explicitly returned as an Exception. </p>
            </div>
            <div id="1B" class="tab-pane">
                <section>
                    <b>Overview:</b>
                    <ul>
                        <li>Verify Login Token</li>
                        <li>Test 1:
                        <ul>
                            <li>Call Get with correct parameters</li>
                            <li>Display Role</li>
                        </ul>
                        </li>
                        <li>Test 2:<ul>
                            <li>Call Get with an invalid URL</li>
                            <li>Display error message: &quot;The operation has timed out.&quot;</li>
                        </ul>
                        </li>
                        <li>Test 3:<ul>
                            <li>Call Get with an invalid role_id</li>
                            <li>Display error message: &quot;Exception of type &#39;Trinity.OpenStack.ObjectNotFound&#39; was thrown.&quot;</li>
                        </ul>
                        </li>
                        <li>Test 4:<ul>
                            <li>Call Get with invalid admin_token</li>
                            <li>Display error message: &quot;Exception of type &#39;Trinity.OpenStack.Unauthorized&#39; was thrown.&quot;</li>
                        </ul>
                        </li>
                    </ul>
                </section>
                <section>
                    <span class="auto-style1"><strong>cURL Call: Role.Get</strong></span><br />
                    <br />
                    <blockquote class="pullquote">
                        curl -H -X GET &quot;X-Auth-Token:_token_id_&quot; http://sampleserveraddress:35357/v2.0/OS-KSADM/roles/_role_id_
                    </blockquote>
                </section>
            </div>
            <div id="1C" class="tab-pane">
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
                        <asp:UpdateProgress ID="updateProgress" runat="server">
                            <ProgressTemplate>
                                <div style="position: fixed; text-align: center; height: 100%; width: 100%; top: 0; right: 0; left: 0; z-index: 9999999; background-color: #000000; opacity: 0.7;">
                                    <span style="border-width: 0px; position: fixed; padding: 50px; background-color: #FFFFFF; font-size: 36px; left: 40%; top: 40%;">Test in Progress ...</span>
                                </div>
                            </ProgressTemplate>
                        </asp:UpdateProgress>
                        Admin URL:
                <asp:TextBox ID="txtAdminUrl" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" SetFocusOnError="true" ControlToValidate="txtAdminUrl" CssClass="field-validation-error" runat="server" ErrorMessage="Url is required"></asp:RequiredFieldValidator>

                        <h5>Test Case 1:</h5>
                        <p>
                            Call Get with valid parameters.<br />
                            <asp:Button ID="btnTest1" runat="server" Text="Get Role" OnClick="btnTest1_Click" />
                            <br />
                            <asp:TextBox ID="txtTest1" runat="server" Height="140px" ReadOnly="True" TextMode="MultiLine" Width="402px" BackColor="White"></asp:TextBox>
                        </p>
                        <h5>Test Case 2:</h5>
                        <p>
                            Call Get with an invalid URL.<br />
                            <asp:Button ID="btnTest2" runat="server" Text="Get Role" OnClick="btnTest2_Click" />
                            <br />
                            <asp:TextBox ID="txtTest2" runat="server" Height="184px" ReadOnly="True" TextMode="MultiLine" Width="400px" BackColor="White"></asp:TextBox>

                        </p>
                        <h5>Test Case 3:</h5>
                        <p>
                            Call Get with an invalid RoleID.<br />
                            <asp:Button ID="btnTest3" runat="server" Text="Get Role" OnClick="btnTest3_Click" />
                            <br />
                            <asp:TextBox ID="txtTest3" runat="server" Height="182px" ReadOnly="True" TextMode="MultiLine" Width="398px" BackColor="White"></asp:TextBox>
                        </p>
                        <h5>Test Case 4:</h5>
                        <p>
                            Call Get with an invalid Admin Token.<br />
                            <asp:Button ID="btnTest4" runat="server" Text="Get Role" OnClick="btnTest4_Click" />
                            <br />
                            <asp:TextBox ID="txtTest4" runat="server" Height="182px" ReadOnly="True" TextMode="MultiLine" Width="398px" BackColor="White"></asp:TextBox>
                        </p>
                        </div
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
        </div>
    </div>
</asp:Content>
