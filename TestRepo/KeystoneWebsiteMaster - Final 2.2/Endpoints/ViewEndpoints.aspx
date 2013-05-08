<%@ Page Language="C#" Title="View Endpoints" AutoEventWireup="true" CodeBehind="ViewEndpoints.aspx.cs" Inherits="KeystoneWebsite.Endpoints.WebForm1" MasterPageFile="~/Site.Master" %>


<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <hgroup class="title">
        <h1><%: Title %></h1>
    </hgroup>

    <section>
        <span class="auto-style6"><strong>Trinity.Openstack.Endpoint Class</strong></span>
    </section>
    <br />
    <strong>Public Properties</strong><br />
    <ul>
        <li>id</li>
        <li>name</li>
        <li>endpoint_type</li>
        <li>region</li>
        <li>admin_url</li>
        <li>public_url</li>
        <li>internal_url</li>
    </ul>


    <strong>Public Constructors</strong><br />


    <ul>
        <li>Endpoint Constuctor</li>
    </ul>

    <strong>Public Methods</strong><br />
    <ul>
        <li>Boolean Delete_Endpoint(string url, string adminToken)</li>
        <li>string ToString()</li>
    </ul>


    <strong>Public Static Methods</strong><br />
    <ul>
        <li>Endpoint Create_Endpoint(string admin_token_id, string user_id, string admin_url, string service_name, string region, string service_id, string public_url, string internal_url, string tenant_id)</li>
        <li>List &lt;Endpoint&gt; List_Endpoint(string url, string userId, string AdminToken)</li>
        <li>Endpoint Parse(string string_to_parse)</li>
    </ul>



    <table style="width: 100%;">
        <tr>
            <%--             <td>
                 <asp:Label ID="Label3" runat="server" Text="Select User" AssociatedControlID ="drplstTokens"></asp:Label>
                 <asp:DropDownList ID="drplstTokens" runat="server" Height="26px" Width="659px">
                 </asp:DropDownList>  
               
            
         </tr>
         <tr>
            <asp:Label ID="Label4" runat="server" style="font-size: small" Text="* if left blank will default to Admin Token"></asp:Label>--%>
        </tr>
    </table>
    <br />
    <asp:UpdatePanel ID="UpdatePanel3" UpdateMode="Conditional" runat="server">
        <ContentTemplate>

            <asp:UpdateProgress ID="updateProgress" runat="server">
                <ProgressTemplate>
                    <div style="position: fixed; text-align: center; height: 100%; width: 100%; top: 0; right: 0; left: 0; z-index: 9999999; background-color: #000000; opacity: 0.7;">
                        <span style="border-width: 0px; position: fixed; padding: 50px; background-color: #FFFFFF; font-size: 36px; left: 40%; top: 40%;">Test in Progress ...</span>
                    </div>
                </ProgressTemplate>
            </asp:UpdateProgress>


            <section>
                <asp:Button ID="btnListEndpoints" runat="server" Height="52px" Text="Get Endpoints" Width="182px" OnClick="btnListEndpoints_Click" />
            </section>

            <table style="width: 50%; height: 359px;">
                <tr>
                    <td class="auto-style1">
                        <asp:ListBox ID="lstbxEndpoints" runat="server" Height="280px" Width="572px" OnSelectedIndexChanged="lstbxEndpoints_SelectedIndexChanged" AutoPostBack="True"></asp:ListBox></td>
                    <td class="auto-style2">
                        <asp:Panel ID="pnlEndpointInfo" runat="server" Height="329px" ScrollBars="Auto" Width="568px" Visible="False">
                            <asp:Label ID="lblEndpoint" runat="server" Text="Endpoint:"></asp:Label>
                            <br />
                            <table style="width: 100%; height: 231px;">
                                <tr>
                                    <td class="auto-style4">
                                        <asp:Label ID="Label6" runat="server" Text="Name"></asp:Label>
                                    </td>
                                    <td class="auto-style3">
                                        <asp:Label ID="lblName" runat="server" Text="."></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="auto-style5">
                                        <asp:Label ID="Label7" runat="server" Text="Region"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:Label ID="lblregion" runat="server" Text="."></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="auto-style5">
                                        <asp:Label ID="Label9" runat="server" Text="ID"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:Label ID="lblID" runat="server" Text="."></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="auto-style5">
                                        <asp:Label ID="Label8" runat="server" Text="Type"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:Label ID="lbltype" runat="server" Text="."></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="auto-style5">
                                        <asp:Label ID="Label10" runat="server" Text="Admin URL"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:Label ID="lblAdminURL" runat="server" Text="."></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="auto-style5">
                                        <asp:Label ID="Label11" runat="server" Text="Public URL"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:Label ID="lblpublicURL" runat="server" Text="."></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="auto-style5">
                                        <asp:Label ID="Label12" runat="server" Text="Internal URL"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:Label ID="lblIntURL" runat="server" Text="."></asp:Label>
                                    </td>
                                </tr>
                            </table>
                        </asp:Panel>
                    </td>

                </tr>
            </table>
        </ContentTemplate>
    </asp:UpdatePanel>

    <asp:LinkButton ID="lnkbtnPrintFV" runat="server" PostBackUrl="~/Endpoints/EndpointsPrinterFriendly.aspx">Printer Friendly Version</asp:LinkButton>

    <br />
    <br />
</asp:Content>


<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="HeadContent">
    <style type="text/css">
        .auto-style1 {
            width: 1161px;
        }

        .auto-style2 {
            width: 596px;
        }

        .auto-style3 {
            height: 28px;
        }

        .auto-style4 {
            height: 28px;
            width: 91px;
        }

        .auto-style5 {
            width: 91px;
        }

        .auto-style6 {
            width: 1161px;
            font-size: large;
        }
    </style>
</asp:Content>



