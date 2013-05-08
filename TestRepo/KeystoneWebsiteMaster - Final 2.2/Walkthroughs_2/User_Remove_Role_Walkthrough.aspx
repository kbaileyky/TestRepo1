<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="User_Remove_Role_Walkthrough.aspx.cs" Inherits="KeystoneWebsite.User_Remove_Role" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="server">
     <h1 style="margin-left:145px;">Remove Role From User Walkthrough</h1>
     <asp:Panel ID="Panel5" runat="server" ForeColor="Black" Height="1019px" Width="1368px">
     </asp:Panel>
    </asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    <asp:Panel ID="Panel1" runat="server" BorderColor="#323232" BorderStyle="Solid" BorderWidth="5px" 
            ForeColor="Black"            
            style="z-index: 1; top: 226px; position: absolute; height: 180px; width: 1200px; left: 8px;">
            <asp:TextBox ID="txtPrototype" runat="server" 
                style="z-index: 1; left: 206px; top: 18px; position: absolute; width: 973px; bottom: 246px" 
                Visible="True" Height="24px">public static string DeleteRoleOfUser(string url, string UserId, string TenantId, string RoleId, string Admin_Token)
</asp:TextBox>
            <asp:Label ID="lblLevel1" runat="server" Font-Underline="True" 
                style="z-index: 1; left: 33px; top: 70px; position: absolute" 
                Text="Data obtained by login:" ForeColor="#DE0000"></asp:Label>
            <asp:Label ID="lblToken" runat="server" 
                style="z-index: 1; left: 393px; top: 77px; position: absolute" 
                Text=" Admin Token"></asp:Label>
            <asp:TextBox ID="txtToken" runat="server"  
                style="z-index: 1; left: 499px; top: 73px; position: absolute; width: 266px"></asp:TextBox>
            <asp:Label ID="lblURL" runat="server" 
                style="z-index: 1; left: 386px; top: 117px; position: absolute" 
                Text="Endpoint URL"></asp:Label>
            <asp:TextBox ID="txtURL" runat="server" 
                style="z-index: 1; left: 499px; top: 113px; position: absolute; margin-top: 59;"></asp:TextBox>
            
            <asp:Label ID="lblPrototype" runat="server" Font-Underline="True" 
                style="z-index: 1; left: 36px; top: 17px; position: absolute; height: 30px; right: 1011px;" 
                Text="Delete User Prototype:"></asp:Label>
            <asp:Button ID="btnNext1" runat="server" onclick="btnNext1_Click" 
                style="z-index: 1; left: 54px; top: 115px; position: absolute" 
                Text="Next" />           
        </asp:Panel>
    
        <asp:Panel ID="Panel2" runat="server" BorderColor="#323232" 
            BorderStyle="Solid" BorderWidth="5px"
            style="z-index: 1; top: 434px; position: absolute; height: 217px; width: 1200px; left: 12px;" 
            Visible="False" ForeColor="Black">
            <asp:Button ID="btnNext2" runat="server" onclick="btnNext2_Click" 
                style="z-index: 1; left: 47px; top: 142px; position: absolute" 
                Text="Next" />
            <asp:Label ID="lblLevel3" runat="server" Font-Underline="True" 
                style="z-index: 1; left: 22px; top: 14px; position: absolute" 
                Text="Data that is needed to be entered:" ForeColor="#DE0000"></asp:Label>
            <asp:Label ID="lblUserID" runat="server"                 
                style="z-index: 1; left: 306px; top: 55px; position: absolute; height: 26px;" 
                Text="UserID" ForeColor="Black"></asp:Label>
            <asp:TextBox ID="txtUserId" runat="server"
                style="z-index: 1; left: 372px; top: 55px; position: absolute; width: 407px"></asp:TextBox>
            <asp:Label ID="lblNote" runat="server" ForeColor="#DE0000" 
                style="z-index: 1; left: 346px; top: 22px; position: absolute" 
                Text="Note: Pick UserId, TenantId and RoleId from list below after hitting NEXT."></asp:Label>
            <asp:Label ID="lblTenantId" runat="server" 
                style="z-index: 1; left: 302px; top: 90px; position: absolute" 
                Text="TenantId"></asp:Label>
            <asp:TextBox ID="txtTenantId" runat="server" 
                style="z-index: 1; left: 373px; top: 92px; position: absolute; width: 402px; right: 425px; margin-top: 60;"></asp:TextBox>
            <asp:Label ID="lblRoleId" runat="server" style="z-index: 1; left: 307px; top: 129px; position: absolute" Text="RoleId"></asp:Label>
            
            <asp:TextBox ID="txtRoleId" runat="server" style="z-index: 1; left: 374px; top: 129px; position: absolute; width: 402px; right: 410px; margin-top: 60;"></asp:TextBox>
            
            </asp:Panel>            

            <asp:Panel ID="Panel3" runat="server"
            BorderColor="#323232" BorderStyle="Solid" BorderWidth="5px" 
            style="z-index: 1;  top: 692px; position: absolute; height: 279px; width: 1200px; left: 7px;" 
            Visible="False" ForeColor="Black">
            <asp:Button ID="btnNext3" runat="server" onclick="btnNext3_Click" 
                style="z-index: 1; left: 519px; top: 220px; position: absolute" 
                Text="Run the  Command" ForeColor="Black" />
            <asp:TextBox ID="txtResult" runat="server" 
                style="z-index: 1; left: 214px; top: 30px; position: absolute; width: 327px; height: 131px" 
                TextMode="MultiLine"></asp:TextBox>
            <asp:Label ID="lblListRoles" runat="server" 
                style="z-index: 1; left: 659px; top: 36px; position: absolute" 
                Text="List of  Roles" ForeColor="Black"></asp:Label>
            <asp:Label ID="lblCommand" runat="server" 
                style="z-index: 1; left: 281px; top: 188px; position: absolute" 
                
                    Text=" Command: StackUser.Delete(delete_url, ddlUsers.SelectedValue.ToString(), Session[&quot;token_value&quot;].ToString());" 
                    ForeColor="Black"></asp:Label>
                <asp:TextBox ID="txtRoleList" runat="server" style="z-index: 1; left: 756px; top: 28px; position: absolute; width: 327px; height: 131px" TextMode="MultiLine"></asp:TextBox>
                <asp:Label ID="lblLevel5" runat="server" ForeColor="Black" style="z-index: 1; left: 45px; top: 26px; position: absolute" Text="List of  Current Users:"></asp:Label>
        </asp:Panel>
    
        <asp:Panel ID="Panel4" runat="server" BorderColor="#323232" 
            BorderStyle="Solid" BorderWidth="5px" 
            style="z-index: 1; top: 1005px; position: absolute; height: 200px; width: 1208px; left: 10px;" 
            Visible="False" ForeColor="Black">
            <asp:TextBox ID="txtDeleteRoleResult" runat="server" 
                style="z-index: 1; left: 225px; top: 26px; position: absolute; width: 632px; height: 103px" 
                TextMode="MultiLine"></asp:TextBox>
            <asp:Label ID="lblDeleteResult" runat="server" ForeColor="Black" 
                style="z-index: 1; left: 84px; top: 30px; position: absolute" 
                Text="Delete User Return."></asp:Label>
            <asp:Label ID="lblTestIt" runat="server" ForeColor="#DE0000" 
                style="z-index: 1; left: 245px; top: 158px; position: absolute" 
                Text="Change any input value above, press Run the Command, and observe the results in the Delete User Return Pane."></asp:Label>
        </asp:Panel>

</asp:Content>
