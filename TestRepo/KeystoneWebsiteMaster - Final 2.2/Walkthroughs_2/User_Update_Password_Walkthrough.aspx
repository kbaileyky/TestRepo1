<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="User_Update_Password_Walkthrough.aspx.cs" Inherits="KeystoneWebsite.Users.User_Update_Password_Walkthrough" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="server">

    <h1 style="margin-left:145px;">Update User Password Walkthrough</h1>
    </asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    <asp:Panel ID="Panel1" runat="server" BorderColor="#323232" BorderStyle="Solid" BorderWidth="5px" 
            ForeColor="Black"            
            
            style="z-index: 1; top: 257px; position: absolute; height: 210px; width: 1200px; left: 12px;">
            <asp:TextBox ID="txtPrototype" runat="server" 
                style="z-index: 1; left: 206px; top: 14px; position: absolute; width: 973px; bottom: 183px" 
                Visible="True" Height="24px" >public static User Update_Password(string url, string admin_token, string user_id, string user_name, string password)

</asp:TextBox>
            <asp:Label ID="lblLevel1" runat="server" Font-Underline="True" 
                style="z-index: 1; left: 20px; top: 68px; position: absolute" 
                Text="Data obtained by login:" ForeColor="#DE0000"></asp:Label>
            <asp:Label ID="lblURL" runat="server" 
                style="z-index: 1; left: 457px; top: 131px; position: absolute; margin-top: 0px;" 
                Text="Endpoint URL"></asp:Label>
            <asp:TextBox ID="txtURL" runat="server" 
                style="z-index: 1; left: 580px; top: 128px; position: absolute"></asp:TextBox>
            <asp:Label ID="lblTenantId" runat="server" 
                style="z-index: 1; left: 484px; top: 166px; position: absolute" 
                Text="TenantId"></asp:Label>
            <asp:Label ID="lblPrototype" runat="server" Font-Underline="True" 
                style="z-index: 1; left: 8px; top: 16px; position: absolute; height: 30px; right: 1008px;" 
                Text="Update Password Prototype:"></asp:Label>
            <asp:Button ID="btnNext1" runat="server" onclick="btnNext1_Click" 
                style="z-index: 1; left: 55px; top: 116px; position: absolute" 
                Text="Next" />           
            <br />
            <br />
            <br />
            <asp:TextBox ID="txtToken" runat="server" style="z-index: 1; left: 580px; top: 93px; position: absolute; width: 310px"></asp:TextBox>
            <br />
            <asp:Label ID="lblToken" runat="server" style="z-index: 1; left: 462px; top: 61px; position: absolute; margin-top: 36px;" Text=" Admin Token"></asp:Label>
            <asp:TextBox ID="txtTenantId" runat="server" style="z-index: 1; left: 580px; top: 163px; position: absolute; width: 313px"></asp:TextBox>
        </asp:Panel>
    
        <asp:Panel ID="Panel2" runat="server" BorderColor="#323232" 
            BorderStyle="Solid" BorderWidth="5px" 
        style="z-index: 1; top: 482px; position: absolute; height: 175px; width: 1200px; left: 11px;" 
        Visible="False">
        
            <asp:Label ID="lblLevel3" runat="server" Font-Underline="True" 
                style="z-index: 1; left: 28px; top: 7px; position: absolute" 
                Text="Data that is needed to be entered:" ForeColor="#DE0000"></asp:Label>
            <asp:Label ID="lblUserID" runat="server"                 
                style="z-index: 1; left: 376px; top: 21px; position: absolute; height: 26px;" 
                Text="UserID" ForeColor="Black"></asp:Label>
            <asp:TextBox ID="txtUserId" runat="server"
                style="z-index: 1; left: 448px; top: 14px; position: absolute; width: 342px"></asp:TextBox>
            <asp:Label ID="lblName" runat="server" 
                style="z-index: 1; left: 373px; top: 59px; position: absolute" 
                Text="Name" ForeColor="Black"></asp:Label>
            <asp:Button ID="btnNext2" runat="server" onclick="btnNext2_Click" 
                style="z-index: 1; left: 59px; top: 114px; position: absolute; height: 41px;" Text="Next" />
            <asp:TextBox ID="txtName" runat="server" 
                style="z-index: 1; left: 447px; top: 54px; position: absolute; width: 341px"></asp:TextBox>
            <asp:Label ID="lblNote" runat="server" ForeColor="#DE0000" 
                style="z-index: 1; left: 429px; top: 139px; position: absolute" 
                Text="Get the UserID and Name from the next panel."></asp:Label>
            <asp:Label ID="lblPassword" runat="server" 
                style="z-index: 1; left: 342px; top: 96px; position: absolute" 
                Text="New Password" ForeColor="Black"></asp:Label>
            <asp:TextBox ID="txtPassword" runat="server" 
                style="z-index: 1; left: 446px; top: 93px; position: absolute; width: 341px"></asp:TextBox>
            </asp:Panel>

            <asp:Panel ID="Panel3" runat="server"
            BorderColor="#323232" BorderStyle="Solid" BorderWidth="5px" 
        style="z-index: 1; top: 696px; position: absolute; height: 242px; width: 1200px" 
        Visible="False">
            <asp:TextBox ID="txtResult" runat="server" 
                style="z-index: 1; left: 486px; top: 26px; position: absolute; width: 366px; height: 108px" 
                TextMode="MultiLine"></asp:TextBox>
            <asp:Label ID="lblLevel4" runat="server" 
                style="z-index: 1; left: 327px; top: 30px; position: absolute; width: 171px;" 
                Text="List of  Current Users:" ForeColor="Black"></asp:Label>
            <asp:Label ID="lblCommand" runat="server" 
                style="z-index: 1; left: 332px; top: 158px; position: absolute" 
                
                    Text=" Command: User.Update_Password(endpoint_url, admin_token, txtUserId.Text, txtName.Text, txtpassword.Text);" 
                    ForeColor="Black"></asp:Label>
                <asp:Button ID="btnNext3" runat="server" ForeColor="Black" 
                    onclick="btnNext3_Click" 
                    style="z-index: 1; left: 555px; top: 194px; position: absolute" 
                    Text="Run the  Command" />
        </asp:Panel>
    
        <asp:Panel ID="Panel4" runat="server" BorderColor="#323232" 
            BorderStyle="Solid" BorderWidth="5px" 
            style="z-index: 1; top: 954px; position: absolute; height: 206px; width: 1208px" 
            Visible="False">
            <asp:Label ID="lblAddResult" runat="server" ForeColor="Black" 
                style="z-index: 1; left: 128px; top: 41px; position: absolute" 
                Text="Update Password Result"></asp:Label>
            <asp:Label ID="lblError" runat="server" ForeColor="#DE0000" 
                Text="Errors are caught and epressed thought a catch command:"></asp:Label>
            <asp:Label ID="lblChangeAll" runat="server" ForeColor="#DE0000" 
                style="z-index: 1; left: 285px; top: 174px; position: absolute" 
                
                Text="Change values above to evaluate the command and hit the run button to see the output."></asp:Label>
            <asp:TextBox ID="txtUpdatePasswordResult" runat="server" 
                style="z-index: 1; left: 301px; top: 35px; position: absolute; width: 632px; height: 111px" 
                TextMode="MultiLine"></asp:TextBox>
        </asp:Panel>

    <asp:Panel ID="Panel5" runat="server" Height="978px" Width="1304px">
    </asp:Panel>

</asp:Content>
