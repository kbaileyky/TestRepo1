<%@ Page Title="User Info" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="LoginUser.aspx.cs" Inherits="KeystoneWebsite.Account.LoginUser" %>


<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <hgroup class="title">
        <h1><%: Title %>.</h1>
    <h2>&nbsp;</h2>
    </hgroup>

    <article>
       <h2>Welcome, <asp:Label ID="lblUserName" runat="server" Text="Friend"></asp:Label>!</h2>
       <h4>User Information</h4>
        <p>
             <strong>Token ID</strong>:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Label ID="lblTokenID" runat="server" Text=""></asp:Label>
            <br />
            <strong>User ID</strong>:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Label ID="lblUserID" runat="server" Text=""></asp:Label>
            <br />
            <strong>User Roles:&nbsp;
            <br />
            <asp:TextBox ID="txtUserRoles" runat="server" Height="105px" TextMode="MultiLine" Width="817px"></asp:TextBox>
            </strong>
        </p>
    </article>
</asp:Content>
