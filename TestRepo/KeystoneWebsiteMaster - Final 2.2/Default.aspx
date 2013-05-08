<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="KeystoneWebsite._Default" %>

<asp:Content runat="server" ID="FeaturedContent" ContentPlaceHolderID="FeaturedContent">
    <section class="featured">
        <div class="content-wrapper">
            <hgroup class="title">
                <h1>OpenStack Keystone C# Client.</h1>
            </hgroup>
            <p>
                Keystone is an OpenStack project that provides Identity, Token, Catalog and Policy services for use specifically 
                by projects in the OpenStack family. It implements OpenStack’s Identity API.

                Students at Trinity University have implemented a .NET version of Keystone. Test our service by using the drop down menus above!

            </p>
        </div>
    </section>
</asp:Content>
<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
<img src="Images/keystone-logo-4.png" class="img-rounded">
    <h3>Keystone Project Goals:</h3>
    <ol class="round">
        <li class="one">
            <h5>Develop a .NET API</h5>
            This API can be used by .NET developers to easily access the OpenStack Keystone service. By simply importing
            our .dll file a few simple calls can be used to unlock the Keystone potential.
        </li>
        <li class="two">
            <h5>Develop a Usable Error Reporting System</h5>
            Using a simple but complete Error Reporting System, the .NET Keystone service will be easy to manage and debug.
        </li>
        <li class="three">
            <h5>Develop a Web Interface</h5>
            By allowing our users to test our .NET Keystone service on the web, we hope that choosing our product will be an easy
            decision!  
        </li>
    </ol>
</asp:Content>
