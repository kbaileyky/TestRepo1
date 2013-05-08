<%@ Page Title="View Roles" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ViewRoles.aspx.cs" Inherits="KeystoneWebsite.Roles.ViewRoles" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
     <hgroup class="title">
        <h1><%: Title %></h1>
    </hgroup>

    

     
     <br />
     <table style="width:100%;">
         <tr>
             <td>
                 <asp:Label ID="Label5" runat="server" Text="URL" AssociatedControlID ="txtbURL"></asp:Label>
                 <asp:TextBox ID="txtbURL" runat="server" Width="544px" Text="http://cloud.cs.trinity.edu:35357"></asp:TextBox>
             </td>
          </tr>
         <tr>
             <td>
                   <asp:Label ID="Label1" runat="server" Text="Token ID" AssociatedControlID ="txtbToken"></asp:Label>
                  <asp:TextBox ID="txtbToken" runat="server" Width="542px"></asp:TextBox>

             </td>
         </tr>
         <tr>
             <td>
                 <asp:Label ID="Label3" runat="server" Text="Select Token" AssociatedControlID ="drplstTokens"></asp:Label>
                 <asp:DropDownList ID="drplstTokens" runat="server" Height="26px" Width="659px">
                 </asp:DropDownList>  
               
             </td>
             <td>
                <asp:Button ID="btnGetTokens" runat="server" Height="36px" Text="Get Tokens" Width="172px" />
             </td>
         </tr>
         <tr>
            <asp:Label ID="Label4" runat="server" style="font-size: small" Text="* if left blank will default to Admin Token"></asp:Label>
         </tr>
     </table>
<br />
    <section>
        <asp:Button ID="btnListRoles" runat="server" Height="52px" Text="Get Roles" Width="182px" OnClick="btnListRoles_Click" />
    </section> 
    
     <table style="width:50%;">
         <tr>
             <td class="auto-style1"> <asp:ListBox ID="lstbxRoles" runat="server" Height="240px" Width="572px" OnSelectedIndexChanged="lstbxRoles_SelectedIndexChanged" AutoPostBack="True"></asp:ListBox></td>
             <td class="auto-style2">
                 <asp:Panel ID="pnlRoleInfo" runat="server" Height="270px" ScrollBars="Auto" Width="568px" Visible="False">
                     <asp:Label ID="lblRole" runat="server" Text="Role:"></asp:Label>
                     <br />
                     <table style="width:100%;">
                         <tr>
                             <td class="auto-style4">
                                 <asp:Label ID="Label6" runat="server" Text="Name"></asp:Label>
                             </td>
                             <td class="auto-style3">
                                 <asp:Label ID="lblName" runat="server" Text="."></asp:Label>
                             </td>
                         </tr>
                         <tr>
                             <td class="auto-style5">
                                 <asp:Label ID="Label7" runat="server" Text="ID"></asp:Label>
                             </td>
                             <td>
                                 <asp:Label ID="lblID" runat="server" Text="."></asp:Label>
                             </td>
                         </tr>
                                      </table>
                 </asp:Panel>
             </td>

         </tr>
     </table>

     <asp:LinkButton ID="lnkbtnPrintFV" runat="server" PostBackUrl="~/Endpoints/EndpointsPrinterFriendly.aspx">Printer Friendly Version</asp:LinkButton>

     <br /><br />
</asp:Content>


<asp:Content ID="Content4" runat="server" contentplaceholderid="HeadContent">
    <style type="text/css">
        .auto-style1
        {
            width: 1161px;
        }
        .auto-style2
        {
            width: 596px;
        }
        .auto-style3
        {
            height: 28px;
        }
        .auto-style4
        {
            height: 28px;
            width: 91px;
        }
        .auto-style5
        {
            width: 91px;
        }
    </style>
</asp:Content>




