<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="TenantTestGet.aspx.cs" Inherits="KeystoneWebsite.Tenants.TenantTestGet" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <hgroup class="title">
        <h1>Tenant Test Get</h1>
        <h2>&nbsp;</h2>
    </hgroup>

    <article>
        <h2>Function Specification:</h2>
        <p>1.	Trinity Rackspace ASP.NET group will provide Rackspace with a function to list all of the Keystone tenants that the user can access.</p>
        <h3>Function Prototype: </h3>
        <h5>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Message <- TenantGet(string URL, string AdminToken)</h5>
        <h3>Function Arguments/Payloads:</h3>
        <h5>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;URL:            the OpenStack server address<br />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            AdminToken: 	the admin's Token ID</h5>
        <h3>Explicit Returns:</h3>
        <h5>Successful: 	Returns json string with tenants the user can access.</h5>
        <h5>Unsuccessful:These errors will be passed as Exceptions:</h5>
        <h5>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;        
        “Error #1: This is not a valid server URL.”<br />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        “Error #2: We are unable to reach this URL.”<br />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        “Error #3: This is not a valid admin token.”</h5>
        <p>When passed valid arguments (URL, UserToken), the TenantGet function shall execute a C# curl command to return a list of the tenants the user can access from the OpenStack Keystone Database service list on the designated URL server. The various message returns, specified above, will be explicitly returned as is applicable.</p>
    </article>

</asp:Content>
