<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="TenantTestList.aspx.cs" Inherits="KeystoneWebsite.Tenants.TenantTestList" %>
       
<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <hgroup class="title">
        <h1>Tenant Test List</h1>
    </hgroup>
    <br />
    <section>
        <span class="auto-style1">public Tenant Tenant::List(string url, string UserToken)</span>
    </section>
    <br />
    <br />

    <div class="tabbable tabs-left">
        <ul class="nav nav-tabs">
            <li class="active">
                <a href="#1A" data-toggle="tab">Function Specification</a>
            </li>
            <li class>
                <a href="#1B" data-toggle="tab">Test Plan</a>
            </li>
            <li class>
                <a href="#1C" data-toggle="tab">Tests</a>
            </li>
        </ul>

        <div class="tab-content">
            
            <div class="tab-pane active" id="1A">
                <section>
                    <b><span class="auto-style2">Function Arguments/Payloads</span>:   </b>
                    <ul>
                        <li>url: the OpenStack server address</li>
                        <li>UserToken: the admin's Token ID</li>
                    </ul>
                </section>
    
                <section>
                    <b><span class="auto-style2">Explicit Message Returns</span>:   </b>
                    <ul>
                        <li>Successful:  </li>
                        <ul>
                            <li>Returns a list of tenant objects</li>
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
                    When passed valid arguments (url, UserToken), the Tenant List function shall execute a C# curl command to return a list of tenants the user can access from the OpenStack Keystone Database service list on the designated URL server. The various message returns, specified above, will be explicitly returned as is applicable.
                </section>
            </div>

            <div class="tab-pane" id="1B">
                <section>
                    <b>Test</b><br />
                    Overview:
                    <ul>
                        <li>List Tenants</li>
                    </ul>
                </section>
            </div>

            <div class="tab-pane" id="1C">
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
                        <asp:UpdateProgress ID="updateProgress" runat="server">
                            <ProgressTemplate>
                                <div style="position: fixed; text-align: center; height: 100%; width: 100%; top: 0; right: 0; left: 0; z-index: 9999999; background-color: #000000; opacity: 0.7;">
                                    <span style="border-width: 0px; position: fixed; padding: 50px; background-color: #FFFFFF; font-size: 36px; left: 40%; top: 40%;">Test in Progress ...</span>
                                </div>
                            </ProgressTemplate>
                        </asp:UpdateProgress>      
                        <h5>Test Case 1:</h5>
                        <p>Call List with valid parameters.<br />Tenant.List(&quot;http://cloud.cs.trinity.edu:35357/&quot;, t.token_id)<br />
                            <asp:Button ID="Button1" runat="server" Text="List Tenants" OnClick="btnTest1_Click" />
                            <br />
                            <asp:TextBox ID="txtTest1" runat="server" Height="140px" ReadOnly="True" TextMode="MultiLine" Width="402px"></asp:TextBox>
                        </p>
                        <br />
                        <br />

                        <h5>Test Case 2:</h5>
                        <p>Call List with invalid admin token.<br />Tenant.List(&quot;http://cloud.cs.trinity.edu:35357/&quot;, &quot;not an admin token id&quot;)<br />
                            <asp:Button ID="Button2" runat="server" Text="List Tenants" OnClick="btnTest2_Click" />
                            <br />
                            <asp:TextBox ID="txtTest2" runat="server" Height="140px" ReadOnly="True" TextMode="MultiLine" Width="402px"></asp:TextBox>
                        </p>
                        <br />
                        <br />

                        <h5>Test Case 3:</h5>
                        <p>Call List with invalid url.<br />Tenant.List(&quot;this isn't even a URL???&quot;, t.token_id)<br />
                            <asp:Button ID="Button3" runat="server" Text="List Tenants" OnClick="btnTest3_Click" />
                            <br />
                            <asp:TextBox ID="txtTest3" runat="server" Height="140px" ReadOnly="True" TextMode="MultiLine" Width="402px"></asp:TextBox>
                        </p>
                        <br />
                        <br />
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
        </div>
    </div>
</asp:Content>