<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EndpointsPrinterFriendly.aspx.cs" Inherits="KeystoneWebsite.Endpoints.EndpointsPrinterFriendly" %>
<%@ PreviousPageType VirtualPath="ViewEndpoints.aspx" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:Label ID="lblText" runat="server" Text="Label" Visible="False"></asp:Label>
    
    </div>
        <asp:TextBox ID="TextBox1" runat="server" BorderStyle="None" Height="1225px" ReadOnly="True" TextMode="MultiLine" Width="993px"></asp:TextBox>
    </form>
</body>
</html>
