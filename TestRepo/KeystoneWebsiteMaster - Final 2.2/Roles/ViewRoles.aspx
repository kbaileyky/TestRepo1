<%@ Page Title="View Roles" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ViewRoles.aspx.cs" Inherits="KeystoneWebsite.Roles.ViewRoles" %>


<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <hgroup class="title">
        <h1><%: Title %></h1>
    </hgroup>

                    <h4>Use the View Roles feature to explore a list of Roles and their properties.</h4>


    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <asp:UpdateProgress ID="updateProgress" runat="server">
                <ProgressTemplate>
                    <div style="position: fixed; text-align: center; height: 100%; width: 100%; top: 0; right: 0; left: 0; z-index: 9999999; background-color: #000000; opacity: 0.7;">
                        <span style="border-width: 0px; position: fixed; padding: 50px; background-color: #FFFFFF; font-size: 36px; left: 40%; top: 40%;">Test in Progress ...</span>
                    </div>
                </ProgressTemplate>
            </asp:UpdateProgress>

            <br />
            <table style="width: 100%;">
                <tr>
                    <td class="auto-style6">
                        <asp:Label ID="Label5" runat="server" Text="URL" AssociatedControlID="txtbURL"></asp:Label>
                        <asp:TextBox ID="txtbURL" runat="server" Width="544px" Text="http://saturn.cs.trinity.edu:35357"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td></td>
                </tr>
                <tr>
                    <td></td>
                    <td>&nbsp;</td>
                </tr>
            </table>
            <br />
            <section>
                <asp:Button ID="btnListRoles" runat="server" Height="52px" Text="List Roles" Width="182px" OnClick="btnListRoles_Click" />
            </section>

            <table style="width: 50%;">
                <tr>
                    <td class="auto-style1">
                        <asp:ListBox ID="lstbxRoles" runat="server" Height="240px" Width="572px" OnSelectedIndexChanged="lstbxRoles_SelectedIndexChanged" AutoPostBack="True"></asp:ListBox></td>
                    <td class="auto-style2">
                        <asp:Panel ID="pnlRoleInfo" runat="server" Height="270px" ScrollBars="Auto" Width="568px" Visible="False">
                            <asp:Label ID="lblRole" runat="server" Text="Role:"></asp:Label>
                            <br />
                            <table style="width: 100%;">
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
                                        <asp:Label ID="Label7" runat="server" Text="ID"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:Label ID="lblID" runat="server" Text="."></asp:Label>
                                    </td>
                                </tr>
                            </table>
                        </asp:Panel>
                    </td>

                </tr>
            </table>

            <br />
            <br />
        </ContentTemplate>
    </asp:UpdatePanel>

</asp:Content>



