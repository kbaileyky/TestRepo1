<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="IncrementForm.aspx.cs" Inherits="KeystoneWebsite.IncrementForm" %>

<!DOCTYPE html>
<style type="text/css">
  .center {text-align:center;
           vertical-align:middle;}
</style>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>



<body class="center">



    <form id="form1" runat="server">
    <div >
    

        <ul>
        <asp:Label ID="lbl1" runat="server" AssociatedControlID ="txtbInputNum" Text="Number to Increment"> </asp:Label>
        <asp:TextBox ID="txtbInputNum" runat="server"></asp:TextBox>
        </ul>
        <ul>
        <asp:Label ID="lblReturnNum" runat="server" Text =" "></asp:Label>
        </ul>
        <ul>
        <asp:Button ID="btnInc" runat="server" Text="Increment" OnClick="btnInc_Click" />
        </ul>


    </div>
    </form>
</body>
</html>
