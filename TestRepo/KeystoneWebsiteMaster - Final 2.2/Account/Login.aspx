<%@ Page Title="Log in" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="True" CodeBehind="Login.aspx.cs" Inherits="KeystoneWebsite.Account.Login" %>
<%@ Register Src="~/Account/OpenAuthProviders.ascx" TagPrefix="uc" TagName="OpenAuthProviders" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <hgroup class="title">
        <h1><%: Title %>.</h1>
    </hgroup>
    <section id="loginForm">
        <h2>a local account to log in.</h2>
        <asp:Panel ID="Panel1" runat="server">
            <ul>
                <asp:Label ID="Label1" runat="server" Text="* Username" AssociatedControlID="txtbUserName"></asp:Label>
                <asp:TextBox ID="txtbUserName" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate ="txtbUserName" CssClass="field-validation-error" runat="server" ErrorMessage="Username is required"></asp:RequiredFieldValidator>
            </ul>
            <ul>
                <asp:Label ID="Label2" runat="server" Text="* Password" AssociatedControlID="txtbPassword"></asp:Label>
                <asp:TextBox ID="txtbPassword" runat="server" TextMode="Password"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ControlToValidate ="txtbPassword" CssClass="field-validation-error" runat="server" ErrorMessage="Password is required"></asp:RequiredFieldValidator>
            </ul>
            <ul>
                <asp:Label ID="Label3" runat="server" Text="* Login Server" AssociatedControlID="txtbURL"></asp:Label>
                <asp:TextBox ID="txtbURL" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ControlToValidate ="txtbURL" CssClass="field-validation-error" runat="server" ErrorMessage="Server Address is required"></asp:RequiredFieldValidator>
            </ul>
            <ul>
                <asp:Label ID="Label5" runat="server" Text="* Admin Address" AssociatedControlID="txtbAdminURL"></asp:Label>
                <asp:TextBox ID="txtbAdminURL" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" ControlToValidate ="txtbAdminURL" CssClass="field-validation-error" runat="server" ErrorMessage="Admin Address is required"></asp:RequiredFieldValidator><br />
                   <asp:Label ID="Label6" runat="server" Font-Size="X-Small" Text="The admin address should be the same as the login address with a different port"></asp:Label>

            </ul>
            <ul>
   
                 
                <asp:Label ID="Label4" runat="server" Text="Tenant" AssociatedControlID="txtbTenant"></asp:Label>
                <asp:TextBox ID="txtbTenant" runat="server"></asp:TextBox>

            </ul>
            <ul>
                    <asp:Button ID="btnLogIn" runat="server" Text="Log In" OnClick="btnLogIn_Click" />
            </ul>
        </asp:Panel>
        <p>
          <label id ="lbl1">* - Field is required</label>
        </p>
    </section>
    <section>
        <asp:Label ID ="lblLoginRet" runat ="server"> </asp:Label>


    </section>
</asp:Content>
