<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="User_Get_WalkThrough.aspx.cs" Inherits="KeystoneWebsite.Users.User_Get_WalkThrough" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="server">
     <h1 style="margin-left:145px;">Get User Walkthrough</h1>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    <asp:Panel ID="Panel5" runat="server" Height="1146px" Width="1500px" style="margin-top: 0px">
    <asp:Panel ID="Panel1" runat="server" BorderColor="#323232" BorderStyle="Solid" BorderWidth="5px" 
            ForeColor="#323232"            
            style="z-index: 1; top: 246px; position: absolute; height: 265px; width: 1200px">
            <asp:TextBox ID="txtPrototype" runat="server" 
                style="z-index: 1; left: 169px; top: 21px; position: absolute; width: 973px; bottom: 243px; margin-top: 0;" 
                Visible="True" OnTextChanged="txtPrototype_TextChanged" Height="24px">public static User GetUserById(string url, string AdminID, string UserId)</asp:TextBox>
            <asp:Label ID="lblLevel1" runat="server" Font-Underline="True" 
                style="z-index: 1; left: 13px; top: 138px; position: absolute; height: 20px;" 
                Text="Data obtained by login:" ForeColor="#DE0000"></asp:Label>
            <asp:Label ID="lblToken" runat="server" 
                style="z-index: 1; left: 17px; top: 180px; position: absolute" 
                Text=" Admin Token"></asp:Label>
            <asp:TextBox ID="txtToken" runat="server" 
                style="z-index: 1; left: 135px; top: 174px; position: absolute; width: 266px"></asp:TextBox>
            <asp:Label ID="lblURL" runat="server" 
                style="z-index: 1; left: 446px; top: 179px; position: absolute" 
                Text="Endpoint URL"></asp:Label>
            <asp:TextBox ID="txtURL" runat="server" 
                style="z-index: 1; left: 577px; top: 174px; position: absolute"></asp:TextBox>
            <asp:Label ID="lblTenantId" runat="server" 
                style="z-index: 1; left: 808px; top: 179px; position: absolute" 
                Text="TenantId"></asp:Label>
            <asp:TextBox ID="txtTenantId" runat="server"
                style="z-index: 1; left: 869px; top: 174px; position: absolute; width: 313px"></asp:TextBox>
            <asp:Label ID="lblPrototype" runat="server" Font-Underline="True" 
                style="z-index: 1; left: 9px; top: 25px; position: absolute; height: 30px; right: 999px;" 
                Text="Get User Prototype:"></asp:Label>
            <asp:Button ID="btnNext1" runat="server" onclick="btnNext1_Click" 
                style="z-index: 1; left: 22px; top: 221px; position: absolute; height: 34px;" 
                Text="Next" />           
        </asp:Panel>
    
        <asp:Panel ID="Panel2" runat="server" BorderColor="#323232" 
            BorderStyle="Solid" BorderWidth="5px"
            style="z-index: 1;  top: 533px; position: absolute; height: 179px; width: 1200px" 
            Visible="False" ForeColor="Black">        
            <asp:Button ID="btnNext2" runat="server" onclick="btnNext2_Click" 
                style="z-index: 1; left: 32px; top: 103px; position: absolute" 
                Text="Next" />
            <asp:Label ID="lblLevel3" runat="server" Font-Underline="True" 
                style="z-index: 1; left: 22px; top: 14px; position: absolute" 
                Text="Data that is needed to be entered:" ForeColor="#DE0000"></asp:Label>
            <asp:Label ID="lblUserID" runat="server"                 
                style="z-index: 1; left: 373px; top: 114px; position: absolute; height: 26px;" 
                Text="UserID" ForeColor="Black"></asp:Label>
            <asp:TextBox ID="txtUserId" runat="server" 
                style="z-index: 1; left: 438px; top: 113px; position: absolute; width: 361px"></asp:TextBox>
            <asp:Label ID="lblNote" runat="server" ForeColor="#DE0000" 
                style="z-index: 1; left: 407px; top: 70px; position: absolute; right: 366px; text-align: center;" 
                Text="Note: Pick UserId from list below after hitting NEXT."></asp:Label>
            </asp:Panel>

            <asp:Panel ID="Panel3" runat="server"
            BorderColor="#323232" BorderStyle="Solid" BorderWidth="5px" 
            style="z-index: 1;  top: 733px; position: absolute; height: 279px; width: 1200px" 
            Visible="False" ForeColor="Black">
            <asp:Button ID="btnNext3" runat="server" onclick="btnNext3_Click" 
                style="z-index: 1; left: 497px; top: 224px; position: absolute" 
                Text="Run the Command" ForeColor="Black" />
            <asp:TextBox ID="txtResult" runat="server" 
                style="z-index: 1; left: 221px; top: 23px; position: absolute; width: 707px; height: 131px" 
                TextMode="MultiLine"></asp:TextBox>
                <asp:Button ID="btnRenew" runat="server" onclick="btnRenew_Click" 
                    style="z-index: 1; left: 978px; top: 79px; position: absolute" 
                    Text="Update" />
            <asp:Label ID="lblLevel4" runat="server" 
                style="z-index: 1; left: 45px; top: 26px; position: absolute" 
                Text="List of  Current Users:" ForeColor="Black"></asp:Label>
            <asp:Label ID="lblCommand" runat="server" 
                style="z-index: 1; left: 243px; top: 185px; position: absolute" 
                
                    Text="Command: -&gt;StackUser.GetUserById(url, Session[&quot;token_value&quot;].ToString(), ddlUsers.SelectedValue.ToString());" 
                    ForeColor="Black"></asp:Label>
        </asp:Panel>
    
        <asp:Panel ID="Panel4" runat="server" BorderColor="#323232" 
            BorderStyle="Solid" BorderWidth="5px" 
            style="z-index: 1; top: 1039px; position: absolute; height: 300px; width: 1200px" 
            Visible="False" ForeColor="Black">
            <asp:TextBox ID="txtGetResult" runat="server" 
                style="z-index: 1; left: 234px; top: 47px; position: absolute; width: 706px; height: 127px" 
                TextMode="MultiLine"></asp:TextBox>
            <asp:Label ID="lblAddResult" runat="server" ForeColor="Black" 
                style="z-index: 1; left: 113px; top: 50px; position: absolute" 
                Text="Get User Return:"></asp:Label>
            <asp:Label ID="lblError" runat="server" ForeColor="#DE0000" 
                Text="If an error is caught, the appropriate error message is returned :"></asp:Label>
            <asp:Label ID="lblTestIt" runat="server" ForeColor="#DE0000"
                style="z-index: 1; left: 238px; top: 210px; position: absolute" 
                Text="Change any input value above, press Run the Command, and observe the results in the Get User Return Pane."></asp:Label>
        </asp:Panel>

    </asp:Panel>
</asp:Content>
