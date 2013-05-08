<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ViewTenants.aspx.cs" Inherits="KeystoneWebsite.Tenants.ViewTenants" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
     <hgroup class="title">
        <h1>View Tenants</h1>
    </hgroup>

    <h5>List the Tenants on the system:</h5>
    <p>
        <asp:Button ID="btnTest1" runat="server" Text="View Tenants" OnClick="btnTest1_Click" />
        <br />
        <asp:TextBox ID="txtTest1" runat="server" Height="140px" ReadOnly="True" TextMode="MultiLine" Width="402px"></asp:TextBox>
        <br />
    </p>

</asp:Content>



