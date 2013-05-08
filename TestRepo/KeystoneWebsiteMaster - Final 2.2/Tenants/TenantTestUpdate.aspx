<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="TenantTestUpdate.aspx.cs" Inherits="KeystoneWebsite.Tenants.TenantTestUpdate" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <hgroup class="title">
        <h1>Tenant Test Update</h1>
    </hgroup>
    <br />
    <section>
        <span class="auto-style1">public Tenant Tenant::Update(string url, string UserToken, string tenantID, string tenantDescription)</span>
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
                        <li>tenantID: the id of the tenant to return</li>
                        <li>tenantID: the new tenant description</li>
                    </ul>
                </section>
    
                <section>
                    <b><span class="auto-style2">Explicit Message Returns</span>:   </b>
                    <ul>
                        <li>Successful:  </li>
                        <ul>
                            <li>Updates the requested Tenant's description</li>
                        </ul>
                        <li>Specific Throws:  </li>
                        <ul>
                            <li>Error Invalid Admin Token:  "Exception of type 'Trinity.OpenStack.Unauthorized' was thrown.”</li>
                            <li>Error Invalid URL : "The operation has timed out”</li>
                            <li>Error Invalid Tenant ID: "Exception of type 'Trinity.OpenStack.ObjectNotFound' was thrown.”</li>
                        </ul>
                    </ul>
                </section>
    
                <section>
                    <span class="auto-style1">Description</span><br />
                    When passed valid arguments (url, UserToken, tenantID, tenantDescription), the Tenant Update function shall execute a C# curl command to update a tenant description from the OpenStack Keystone Database service list on the designated URL server. The various message returns, specified above, will be explicitly returned as is applicable.
                </section>
            </div>

             <div class="tab-pane" id="1B">
                <section>
                    <b>Test</b><br />
                    Overview:
                    <ul>
                        <li>Create Tenant</li>
                        <li>List Tenants</li>
                        <li>Update Tenant</li>
                        <li>List Tenants</li>
                        <li>Delete Tenant</li>
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
                        <p>Call Update with valid parameters.<br />Tenant.Update(&quot;http://cloud.cs.trinity.edu:35357/&quot;, t.token_id, tenant.tenantID, &quot;new tenant description&quot;)<br />
                            <asp:Button ID="btnTest1" runat="server" Text="Update Tenant" OnClick="btnTest1_Click" />
                            <br />
                            Tenant.Create(&quot;http://cloud.cs.trinity.edu:35357/&quot;, t.token_id, "adminTestNew999", "another test tenant");<br />
                            <asp:TextBox ID="txtTest1" runat="server" Height="140px" ReadOnly="True" TextMode="MultiLine" Width="402px"></asp:TextBox>
                            <br />
                            Tenant.Update("http://cloud.cs.trinity.edu:35357/", t.token_id, TestTenantID, "new tenant id");<br />
                            <asp:TextBox ID="txtTest2" runat="server" Height="140px" ReadOnly="True" TextMode="MultiLine" Width="402px"></asp:TextBox>
                            <br />
                            Tenant.Delete("http://cloud.cs.trinity.edu:35357/", t.token_id, TestTenantID);<br />
                            <asp:TextBox ID="txtTest3" runat="server" Height="140px" ReadOnly="True" TextMode="MultiLine" Width="402px"></asp:TextBox>
                        </p>

                       <h5>Test Case 2:</h5>
                       <p>Call Update with invalid admin token.<br />Tenant.Update(&quot;http://cloud.cs.trinity.edu:35357/&quot;, &quot;this is completely wrong&quot;, tenant.tenantID, &quot;new tenant description&quot;)<br />
                            <asp:Button ID="btnTest2" runat="server" Text="Update Tenant" OnClick="btnTest2_Click" />
                            <br />
                            <asp:TextBox ID="txtTest4" runat="server" Height="140px" ReadOnly="True" TextMode="MultiLine" Width="402px"></asp:TextBox>
                            <br />
                       </p>

                       <h5>Test Case 3:</h5>
                       <p>Call Update with invalid url.<br />Tenant.Update(&quot;this isn't even a URL???&quot;, t.token_id, tenant.tenantID, &quot;new tenant description&quot;)<br />
                            <asp:Button ID="btnTest3" runat="server" Text="Update Tenant" OnClick="btnTest3_Click" />
                            <br />
                            <asp:TextBox ID="txtTest5" runat="server" Height="140px" ReadOnly="True" TextMode="MultiLine" Width="402px"></asp:TextBox>
                            <br />
                       </p>

                       <h5>Test Case 4:</h5>
                       <p>Call Update with invalid tenant id.<br />Tenant.Update(&quot;http://cloud.cs.trinity.edu:35357/&quot;, t.token_id, &quot;not a tenant id&quot;, &quot;new tenant description&quot;)<br />
                            <asp:Button ID="btnTest4" runat="server" Text="Update Tenant" OnClick="btnTest4_Click" />
                            <br />
                            <asp:TextBox ID="txtTest6" runat="server" Height="140px" ReadOnly="True" TextMode="MultiLine" Width="402px"></asp:TextBox>
                            <br />
                       </p>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
        </div>
    </div>
</asp:Content>

