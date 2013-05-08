<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="TenantTestCreate.aspx.cs" Inherits="KeystoneWebsite.Tenants.TenantTestCreate" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <hgroup class="title">
        <h1>Tenant Test Create</h1>
        <h2>&nbsp;</h2>
    </hgroup>

    <article>
        <h2>Function Specification:</h2>
        <p>Trinity Rackspace ASP.NET group will provide Rackspace with a function to create a new Keystone tenant.</p>
        <h3>Function Prototype: </h3>
        <h5>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Message <- TenantCreate(string URL, string UserToken, string TenantName, string TenantDescrption)</h5>
        <h3>Function Arguments/Payloads:</h3>
        <h5>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;URL:            the OpenStack server address<br />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            UserToken: 	the admin's Token ID <br />
            TenantName: the name of the tenant to be created <br />
            TenantDescription: the description of the tenant to be created</h5>
        <h3>Explicit Returns:</h3>
        <h5>Successful: 	“Tenant Was Successfully Added”</h5>
        <h5>Unsuccessful:These errors will be passed as Exceptions:</h5>
        <br>
        <h5>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;        
        “Error #1: This is not a valid server URL.”<br />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        “Error #2: We are unable to reach this URL.”<br />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        “Error #3: This is not a valid admin token.”<br />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        “Error #4: A tenant with that name already exists.”</h5>
        <p>When passed valid arguments (URL, UserToken, TenantName, TenantDescription), the TenantCreate function shall execute a C# curl command to add a tenant to the OpenStack Keystone Database service list on the designated URL server. The various message returns, specified above, will be explicitly returned as is applicable.</p>
    </article>

</asp:Content>
