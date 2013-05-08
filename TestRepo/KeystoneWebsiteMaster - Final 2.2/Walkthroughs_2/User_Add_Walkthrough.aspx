<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="User_Add_Walkthrough.aspx.cs" Inherits="KeystoneWebsite.Users.User_Add_Walkthrough" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="server">

         <h1 style="margin-left:145px;">    Add User Walkthrough</h1>

         
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    <asp:Panel ID="Panel5" runat="server" Height="1169px" Width="1261px">
           <asp:Panel ID="Panel1" runat="server" BorderColor="#323232" BorderStyle="Solid" BorderWidth="5px" 
            ForeColor="White" 
            style="z-index: 1; position: absolute; height: 216px; width: 1200px">
            <asp:TextBox ID="txtPrototype" runat="server" 
                style="z-index: 1; left: 181px; top: 23px; position: absolute; width: 809px; bottom: 157px" 
                Visible="True">public static User Add(string url, string name, string password, string enabled, string tenantId, string email,  string admin_token)</asp:TextBox>
            <asp:Label ID="lblLevel1" runat="server" Font-Underline="True" 
                style="z-index: 1; left: 19px; top: 102px; position: absolute" 
                Text="Data obtained by login:" ForeColor="#DE0000"></asp:Label>
            <asp:TextBox ID="txtToken" runat="server" 
                style="z-index: 1; left: 429px; top: 88px; position: absolute; width: 266px"></asp:TextBox>
            <asp:Label ID="lblURL" runat="server" 
                style="z-index: 1; left: 382px; top: 129px; position: absolute" 
                Text="URL" ForeColor="Black"></asp:Label>
            <asp:TextBox ID="txtURL" runat="server" 
                style="z-index: 1; left: 429px; top: 128px; position: absolute"></asp:TextBox>
            <asp:Label ID="lblTenantId" runat="server" 
                style="z-index: 1; left: 353px; top: 163px; position: absolute; margin-top: 5px;" 
                Text="TenantId" ForeColor="Black"></asp:Label>
            <asp:TextBox ID="txtTenantId" runat="server"
                style="z-index: 1; left: 429px; top: 167px; position: absolute; width: 265px"></asp:TextBox>
            <asp:Label ID="lblPrototype" runat="server" Font-Underline="True" 
                style="z-index: 1; left: 25px; top: 25px; position: absolute; height: 30px; right: 991px;" 
                Text="Add User Prototype:" ForeColor="Black"></asp:Label>
            <asp:Button ID="btnNext1" runat="server" onclick="btnNext1_Click" 
                style="z-index: 1; left: 32px; top: 137px; position: absolute" 
                Text="Next" />           
            <asp:Label ID="lblToken" runat="server" 
                style="z-index: 1; left: 330px; top: 93px; position: absolute" 
                Text=" Admin Token" ForeColor="Black"></asp:Label>
        </asp:Panel>

    <asp:Panel ID="Panel2" runat="server" BorderColor="#323232" 
            BorderStyle="Solid" BorderWidth="5px"
            style="z-index: 1; top: 458px; position: absolute; height: 204px; width: 1200px;">
        
            <asp:Button ID="btnNext2" runat="server" onclick="btnNext2_Click" 
                style="z-index: 1; left: 28px; top: 146px; position: absolute" 
                Text="Next" />
            <asp:Label ID="lblLevel3" runat="server" Font-Underline="True" 
                style="z-index: 1; left: 22px; top: 14px; position: absolute" 
                Text="Data that is needed to be entered:" ForeColor="#DE0000"></asp:Label>
            <asp:Label ID="lblUserName" runat="server"                 
                style="z-index: 1; left: 372px; top: 40px; position: absolute; height: 26px;" 
                Text="Name" ForeColor="Black"></asp:Label>
            <asp:TextBox ID="txtName" runat="server"                 
                
                style="z-index: 1; left: 458px; top: 31px; position: absolute; width: 197px"></asp:TextBox>
            <asp:Label ID="lblPassword" runat="server" 
                style="z-index: 1; left: 355px; top: 78px; position: absolute" 
                Text="Password" ForeColor="Black"></asp:Label>
            <asp:TextBox ID="txtPassword" runat="server"                
                
                style="z-index: 1; left: 460px; top: 75px; position: absolute; width: 193px"></asp:TextBox>
            <asp:Label ID="lblEmail" runat="server" 
                style="z-index: 1; left: 381px; top: 119px; position: absolute" 
                Text="Email" ForeColor="Black"></asp:Label>
            <asp:TextBox ID="txtEmail" runat="server"                
                
                style="z-index: 1; left: 459px; top: 117px; position: absolute; width: 194px"></asp:TextBox>
            <asp:Label ID="lblEnabled" runat="server" ForeColor="#DE0000" 
                style="z-index: 1; left: 310px; top: 163px; position: absolute" 
                Text="The user is set to enabled by default (ie string enabled = true)."></asp:Label>
            </asp:Panel>

    <asp:Panel ID="Panel3" runat="server"
            BorderColor="#323232" BorderStyle="Solid" BorderWidth="5px"
            style="z-index: 1; top: 676px; position: absolute; height: 394px; width: 1200px;">
            <asp:Button ID="btnNext3" runat="server" onclick="btnNext3_Click" 
                style="z-index: 1; left: 455px; top: 309px; position: absolute" 
                Text="Run the  Command" ForeColor="Black" />
            <asp:TextBox ID="txtResult" runat="server" 
                style="z-index: 1; left: 221px; top: 23px; position: absolute; width: 626px; height: 220px" 
                TextMode="MultiLine"></asp:TextBox>
                <asp:Button ID="btnRenew" runat="server" onclick="btnRenew_Click" 
                    style="z-index: 1; left: 912px; top: 126px; position: absolute" Text="Update" />
            <asp:Label ID="lblLevel4" runat="server" 
                style="z-index: 1; left: 45px; top: 26px; position: absolute" 
                Text="List of  Current Users:" ForeColor="Black"></asp:Label>
            <asp:Label ID="lblCommand" runat="server" 
                style="z-index: 1; left: 226px; top: 277px; position: absolute" 
                
                    Text=" Command: User.Add(EndpointURL,Name,Password,&quot;true&quot;,TenantId,Email,AdminToken);" 
                    ForeColor="Black"></asp:Label>
        </asp:Panel>
    
        <asp:Panel ID="Panel4" runat="server" BorderColor="#323232" 
            BorderStyle="Solid" BorderWidth="5px" 
            style="z-index: 1; top: 1085px; position: absolute; height: 289px; width: 1208px;" 
            Visible="False">
            <asp:TextBox ID="txtAddResult" runat="server" 
                style="z-index: 1; left: 224px; top: 29px; position: absolute; width: 632px; height: 217px" 
                TextMode="MultiLine"></asp:TextBox>
            <asp:Label ID="lblAddResult" runat="server" ForeColor="Black" 
                style="z-index: 1; left: 102px; top: 57px; position: absolute" 
                Text="Add User Result"></asp:Label>
            <asp:Label ID="lblError" runat="server" ForeColor="#DE0000" 
                
                Text="If an error occurs, the error is caught and a specific message returned."></asp:Label>
            <asp:Label ID="lblChangeAll" runat="server" ForeColor="#DE0000" 
                style="z-index: 1; left: 293px; top: 265px; position: absolute" 
                
                Text="Change values above to evaluate the command and hit the run button to see the output."></asp:Label>
        </asp:Panel>
    </asp:Panel>
</asp:Content>
