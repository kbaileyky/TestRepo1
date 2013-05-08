<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="UsersView.aspx.cs" Inherits="KeystoneWebsite.Users.UsersView" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
     <hgroup class="title">
        <h1>View Users</h1>
    </hgroup>

    <h5>List the Users on the system:</h5>
    <p>
        <asp:Button ID="btnTest1" runat="server" Text="View Users" OnClick="btnTest1_Click" />
        <br />
        <asp:TextBox ID="txtTest1" runat="server" Height="450px" ReadOnly="True" TextMode="MultiLine" Width="500px"></asp:TextBox>
        <br />
    </p>

</asp:Content>