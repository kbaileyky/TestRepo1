<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="User_Delete_Walkthrough.aspx.cs" Inherits="KeystoneWebsite.Users.User_Delete_Walkthrough" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="server">
    <h1 style="margin-left:145px;">Delete User Walkthrough</h1>

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    <asp:Panel ID ="Panel6" runat="server" Height="939px" Width="1269px"></asp:Panel>
    <asp:Panel ID="Panel1" runat="server" BorderColor="#323232" BorderStyle="Solid" BorderWidth="5px" 
            ForeColor="Black"            
            style="z-index: 1; top: 242px; position: absolute; height: 182px; width: 1200px">
            <asp:TextBox ID="txtPrototype" runat="server" 
                style="z-index: 1; left: 204px; top: 8px; position: absolute; width: 857px; bottom: 77px" 
                Visible="True" Height="24px">public static string Delete(string url, string user_id, string admin_token)</asp:TextBox>
            <asp:Label ID="lblToken" runat="server" style="z-index: 1; left: 391px; top: 66px; position: absolute" Text=" Admin Token"></asp:Label>
            <asp:TextBox ID="txtURL" runat="server" style="z-index: 1; left: 500px; top: 100px; position: absolute"></asp:TextBox>
            <asp:TextBox ID="txtTenantId" runat="server" style="z-index: 1; left: 500px; top: 135px; position: absolute; width: 266px; right: 420px;"></asp:TextBox>
            <asp:Label ID="lblPrototype" runat="server" Font-Underline="True" style="z-index: 1; left: 36px; top: 11px; position: absolute; height: 30px; right: 1011px;" Text="Delete User Prototype:"></asp:Label>
            <asp:TextBox ID="txtToken" runat="server" style="z-index: 1; left: 500px; top: 63px; position: absolute; width: 266px"></asp:TextBox>
            <asp:Label ID="lblURL" runat="server" style="z-index: 1; left: 387px; top: 103px; position: absolute" Text="Endpoint URL"></asp:Label>
            <asp:Label ID="lblLevel1" runat="server" Font-Underline="True" 
                style="z-index: 1; left: 33px; top: 80px; position: absolute" 
                Text="Data obtained by login:" ForeColor="#DE0000"></asp:Label>
            <asp:Button ID="btnNext1" runat="server" onclick="btnNext1_Click" style="z-index: 1; left: 58px; top: 126px; position: absolute" Text="Next" />
            <asp:Label ID="lblTenantId" runat="server" style="z-index: 1; left: 412px; top: 137px; position: absolute" Text="TenantId"></asp:Label>
        </asp:Panel>
    
        <asp:Panel ID="Panel2" runat="server"  BorderColor="#323232" 
            BorderStyle="Solid" BorderWidth="5px"
            style="z-index: 1; top: 453px; position: absolute; height: 166px; width: 1200px;" 
            Visible="False">
            <asp:Button ID="btnNext2" runat="server" onclick="btnNext2_Click" 
                style="z-index: 1; left: 34px; top: 114px; position: absolute" 
                Text="Next" />
            <asp:Label ID="lblLevel3" runat="server" Font-Underline="True" 
                style="z-index: 1; left: 22px; top: 14px; position: absolute" 
                Text="Data that is needed to be entered:" ForeColor="#DE0000"></asp:Label>
            <asp:Label ID="lblUserID" runat="server"                 
                style="z-index: 1; left: 304px; top: 108px; position: absolute; height: 26px;" 
                Text="UserID" ForeColor="Black"></asp:Label>
            <asp:TextBox ID="txtUserId" runat="server"
                style="z-index: 1; left: 369px; top: 108px; position: absolute; width: 407px"></asp:TextBox>
            <asp:Label ID="lblNote" runat="server" ForeColor="#DE0000" 
                style="z-index: 1; left: 407px; top: 50px; position: absolute" 
                Text="Note: Pick UserId from list below after hitting NEXT."></asp:Label>
            </asp:Panel>

            <asp:Panel ID="Panel3" runat="server" 
            BorderColor="#323232" BorderStyle="Solid" BorderWidth="5px" 
            style="z-index: 1; top: 646px; position: absolute; height: 279px; width: 1200px" 
            Visible="False">
            <asp:TextBox ID="txtResult" runat="server" 
                style="z-index: 1; left: 297px; top: 25px; position: absolute; width: 626px; height: 131px" 
                TextMode="MultiLine"></asp:TextBox>
            <asp:Label ID="lblLevel4" runat="server" 
                style="z-index: 1; left: 45px; top: 26px; position: absolute" 
                Text="List of  Current Users:" ForeColor="Black"></asp:Label>
            <asp:Label ID="lblCommand" runat="server" 
                style="z-index: 1; left: 281px; top: 188px; position: absolute" 
                
                    Text=" Command: StackUser.Delete(delete_url, ddlUsers.SelectedValue.ToString(), Session[&quot;token_value&quot;].ToString());" 
                    ForeColor="Black"></asp:Label>
                <asp:Button ID="btnRenew" runat="server" onclick="btnRenew_Click" 
                    style="z-index: 1; left: 974px; top: 78px; position: absolute" Text="Update" />
                <asp:Button ID="btnNext3" runat="server" ForeColor="Black" onclick="btnNext3_Click" style="z-index: 1; left: 519px; top: 220px; position: absolute" Text="Run the  Command" />
        </asp:Panel>
    
        <asp:Panel ID="Panel4" runat="server"
            BorderStyle="Solid" BorderWidth="5px" 
            style="z-index: 1; top: 949px; position: absolute; height: 200px; width: 1208px" 
            Visible="False" BorderColor="#323232">
            <asp:TextBox ID="txtDeleteResult" runat="server" 
                style="z-index: 1; left: 225px; top: 26px; position: absolute; width: 632px; height: 103px" 
                TextMode="MultiLine"></asp:TextBox>
            <asp:Label ID="lblDeleteResult" runat="server" ForeColor="White" 
                style="z-index: 1; left: 84px; top: 30px; position: absolute" 
                Text="Delete User Return."></asp:Label>
            <asp:Label ID="lblTestIt" runat="server" ForeColor="#DE0000"
                style="z-index: 1; left: 245px; top: 158px; position: absolute" 
                Text="Change any input value above, press Run the Command, and observe the results in the Delete User Return Pane."></asp:Label>
        </asp:Panel>

</asp:Content>
