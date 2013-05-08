<%@ Page Title="Get Roles" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="GetRoles.aspx.cs" Inherits="KeystoneWebsite.Roles.GetRoles" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <hgroup class="title">
        <h1><%: Title %>.</h1>
        <h2>&nbsp;</h2>
    </hgroup>

    <article>
        <h2>Function Specification:</h2>
        <p>Trinity Software Inc. will provide Rackspace with a function to Get a Role from the Keystone service.</p>
        <h3>Function Prototype: </h3>
        <h5>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;public static Role Get(string URL, string RoleID, string AdminToken) </h5>
        <h3>Function Arguments/Payloads:</h3>
        <h5>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            URL:            the OpenStack server address<br />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            RoleID:		the unique RoleID of the Role to be retrieved<br />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            AdminToken: 	the admin's Token ID</h5>
            
        <h3>Explicit Returns:</h3>
        <h5>Successful: “Role [Name] was added successfully.”</h5>
        <h5>Unsuccessful: These errors will be passed as Exceptions:</h5>
        <h5>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;        
        “Error #1: The server is not responding.”<br />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        “Error #2: Invalid URL.”<br />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        “Error #3: Invalid RoleID.”<br />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        “Error #4: Invalid AdminToken.”<br />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        “Error #5: Role [RoleID] does not exist.”</h5>
        <p>On a successful return, this function will return a Role with the designated RoleID to the user by executing a C# HTTPWebRequest to the OpenStack Keystone service at the URL server. If an error occurs, a message defining the error will be explicitly returned as an Exception. </p>
        <h5>Test Case 1:</h5>
        <p>Call Get with valid parameters.<br />Role.Get(&quot;http://cloud.cs.trinity.edu:35357/&quot;, &quot;71c4f9bd148046babd446d53563ce816&quot;, t.token_id);<br />
            <asp:Button ID="btnTest1" runat="server" Text="Get Role"/>
            <br />
            <asp:TextBox ID="txtTest1" runat="server" Height="140px" ReadOnly="True" TextMode="MultiLine" Width="402px"></asp:TextBox>
        </p>
        <h5>Test Case 2:</h5>
        <p>Call Get with an invalid URL.<br />Role.Get(&quot;http://INVALID.cs.trinity.edu:35357/&quot;, &quot;71c4f9bd148046babd446d53563ce816&quot;, t.token_id);<br />
            <asp:Button ID="btnTest2" runat="server" Text="Get Role"/>
            <br />
            <asp:TextBox ID="txtTest2" runat="server" Height="184px" ReadOnly="True" TextMode="MultiLine" Width="400px"></asp:TextBox>

        </p>
        <h5>Test Case 3:</h5>
        <p>Call Get with an invalid RoleID.<br />Role.Get(&quot;http://cloud.cs.trinity.edu:35357/&quot;, &quot;999999999999999999999&quot;, t.token_id);<br />
            <asp:Button ID="btnTest3" runat="server" Text="Get Role"/>
            <br />
            <asp:TextBox ID="txtTest3" runat="server" Height="182px" ReadOnly="True" TextMode="MultiLine" Width="398px"></asp:TextBox>
        </p>
        <h5>Test Case 4:</h5>
        <p>Call Get with an invalid Admin Token.<br />Role.Get(&quot;http://cloud.cs.trinity.edu:35357/&quot;, &quot;71c4f9bd148046babd446d53563ce816&quot;,&quot;INVALID&quot;);<br />
            <asp:Button ID="btnTest4" runat="server" Text="Get Role"/>
            <br />
            <asp:TextBox ID="txtTest4" runat="server" Height="182px" ReadOnly="True" TextMode="MultiLine" Width="398px"></asp:TextBox>
        </p>
        <h5>Test Case 5:</h5>
        <p>Call Get with a RoleID that does not exist.<br />Role.Get(&quot;http://cloud.cs.trinity.edu:35357/&quot;, &quot;71c4f9bd148046babd446d53563ce816&quot;, t.token_id);<br />
            <asp:Button ID="btnTest5" runat="server" Text="Get Role"/>
            <br />
            <asp:TextBox ID="txtTest5" runat="server" Height="182px" ReadOnly="True" TextMode="MultiLine" Width="398px"></asp:TextBox>
        </p>
    </article>

    </asp:Content>
