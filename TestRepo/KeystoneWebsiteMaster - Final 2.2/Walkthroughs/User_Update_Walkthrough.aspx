<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="User_Update_Walkthrough.aspx.cs" Inherits="KeystoneWebsite.Users.User_Update_Walkthrough" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="server">
    <h1 style="margin-left:145px;">Update User Walkthrough</h1>
    </asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server"> 
       <asp:Panel ID="Panel5" runat="server" Height="1290px" Width="1264px">
    <asp:Panel ID="Panel1" runat="server" BorderColor="#323232" BorderStyle="Solid" BorderWidth="5px" 
            ForeColor="Black"            
            style="z-index: 1;top: 234px; position: absolute; height: 262px; width: 1200px; left: 7px;">
            <asp:TextBox ID="txtPrototype" runat="server" 
                style="z-index: 1; left: 201px; top: 17px; position: absolute; width: 973px; bottom: 207px; height: 56px;" 
                Visible="True" TextMode="MultiLine">public static User Update(string admin_token,string old_id, string new_id, string UserName, string Email,
                                                string Enabled, string TenantID, string url )</asp:TextBox>
            <asp:Label ID="lblLevel1" runat="server" Font-Underline="True" 
                style="z-index: 1; left: 11px; top: 118px; position: absolute" 
                Text="Data obtained by login:" ForeColor="#DE0000"></asp:Label>
            <asp:Label ID="lblToken" runat="server" 
                style="z-index: 1; left: 366px; top: 107px; position: absolute" 
                Text=" Admin Token"></asp:Label>
            <asp:TextBox ID="txtToken" runat="server"                
                
                
                style="z-index: 1; left: 471px; top: 104px; position: absolute; width: 311px"></asp:TextBox>
            <asp:Label ID="lblURL" runat="server" 
                style="z-index: 1; left: 366px; top: 147px; position: absolute" 
                Text="Endpoint URL"></asp:Label>
            <asp:TextBox ID="txtURL" runat="server" 
                style="z-index: 1; left: 471px; top: 143px; position: absolute; margin-top: 39;"></asp:TextBox>
            <asp:Label ID="lblTenantId" runat="server" 
                style="z-index: 1; left: 377px; top: 185px; position: absolute" 
                Text="TenantId"></asp:Label>
            <asp:TextBox ID="txtTenantId" runat="server"                
                
                
                style="z-index: 1; left: 471px; top: 182px; position: absolute; width: 313px; margin-top: 1;"></asp:TextBox>
            <asp:Label ID="lblPrototype" runat="server" Font-Underline="True" 
                style="z-index: 1; left: 8px; top: 34px; position: absolute; height: 30px; right: 1000px;" 
                Text="Update User Prototype:"></asp:Label>
            <asp:Button ID="btnNext1" runat="server" onclick="btnNext1_Click" 
                style="z-index: 1; left: 32px; top: 160px; position: absolute" 
                Text="Next" />           
        </asp:Panel>
    
        <asp:Panel ID="Panel2" runat="server" BorderColor="#323232" 
            BorderStyle="Solid" BorderWidth="5px" 
            
            
            style="z-index: 1; top: 507px; position: absolute; height: 250px; width: 1200px; left: 9px;" 
            Visible="False">
        
            <asp:Button ID="btnNext2" runat="server" onclick="btnNext2_Click" 
                style="z-index: 1; left: 23px; top: 154px; position: absolute; margin-top: 40;" 
                Text="Next" />
            <asp:Label ID="lblLevel3" runat="server" Font-Underline="True" 
                style="z-index: 1; left: 22px; top: 14px; position: absolute" 
                Text="Data that is needed to be entered:" ForeColor="#DE0000"></asp:Label>
            <asp:Label ID="lblUserID" runat="server"                 
                style="z-index: 1; left: 380px; top: 17px; position: absolute; height: 26px;" 
                Text="UserID" ForeColor="Black"></asp:Label>
            <asp:TextBox ID="txtUserId" runat="server"                 
                
                
                
                style="z-index: 1; left: 467px; top: 17px; position: absolute; width: 321px"></asp:TextBox>
            <asp:Label ID="lblEmail" runat="server" 
                style="z-index: 1; left: 381px; top: 128px; position: absolute" 
                Text="Email" ForeColor="Black"></asp:Label>
            <asp:TextBox ID="txtEmail" runat="server"                
                
                
                
                
                style="z-index: 1; left: 468px; top: 127px; position: absolute; width: 200px"></asp:TextBox>
            <asp:Label ID="lblUpdateEnabled" runat="server" 
                style="color: black; z-index: 1; left: 379px; top: 168px; position: absolute" 
                Text="Enabled" ForeColor="Black"></asp:Label>
            <asp:Label ID="lblName" runat="server" ForeColor="Black" 
                style="z-index: 1; left: 379px; top: 91px; position: absolute" Text="Name"></asp:Label>
            <asp:TextBox ID="txtName" runat="server" 
                
                style="z-index: 1; left: 468px; top: 88px; position: absolute; width: 198px"></asp:TextBox>
            <asp:TextBox ID="txtUpdateEnable" runat="server" 
                style="z-index: 1; left: 470px; top: 166px; position: absolute; width: 196px"></asp:TextBox>
            <asp:Label ID="lblNote" runat="server" ForeColor="#DE0000" 
                style="z-index: 1; left: 407px; top: 50px; position: absolute" 
                Text="Note: Pick id from list below after hitting NEXT."></asp:Label>
            </asp:Panel>

            <asp:Panel ID="Panel3" runat="server"
            BorderColor="#323232" BorderStyle="Solid" BorderWidth="5px"
            style="z-index: 1; top: 776px; position: absolute; height: 279px; width: 1200px" 
            Visible="False">
            <asp:Button ID="btnNext3" runat="server" onclick="btnNext3_Click" 
                style="z-index: 1; left: 420px; top: 227px; position: absolute" 
                Text="Run the Add Command" ForeColor="Black" />
            <asp:TextBox ID="txtResult" runat="server" 
                style="z-index: 1; left: 221px; top: 23px; position: absolute; width: 626px; height: 131px" 
                TextMode="MultiLine"></asp:TextBox>
                <asp:Button ID="btnRenew" runat="server" onclick="btnRenew_Click" 
                    style="z-index: 1; left: 915px; top: 80px; position: absolute" 
                    Text="Update" />
            <asp:Label ID="lblLevel4" runat="server" 
                style="z-index: 1; left: 45px; top: 26px; position: absolute" 
                Text="List of  Current Users:" ForeColor="Black"></asp:Label>
            <asp:Label ID="lblCommand" runat="server" 
                style="z-index: 1; left: 72px; top: 199px; position: absolute" 
                
                    Text=" Command: User.Update(Admin_Token, txtUserId.Text, txtUserId.Text, txtName.Text, txtEmail.Text, txtEnabled.Text, txtTenantID.Text, update_url);" 
                    ForeColor="Black"></asp:Label>
        </asp:Panel>
    
        <asp:Panel ID="Panel4" runat="server" BorderColor="#323232" 
            BorderStyle="Solid" BorderWidth="5px" 
            style="z-index: 1;top: 1092px; position: absolute; height: 393px; width: 1208px" 
            Visible="False">
            <asp:TextBox ID="txtUpdateResult" runat="server" 
                style="z-index: 1; left: 231px; top: 102px; position: absolute; width: 632px; height: 217px" 
                TextMode="MultiLine"></asp:TextBox>
            <asp:Label ID="lblAddResult" runat="server" ForeColor="Black" 
                style="z-index: 1; left: 77px; top: 111px; position: absolute" 
                Text="Update User Return."></asp:Label>
            <asp:Label ID="lblError" runat="server" ForeColor="#DE0000" 
                Text="If an error caught, the following command is run:"></asp:Label>
            <asp:Label ID="lblCommand0" runat="server" ForeColor="Black" 
                style="z-index: 1; left: 53px; top: 51px; position: absolute" 
                
                
                Text=" Command: StackUser.Update_Error(Admin_Token, txtUserId.Text, txtUserId.Text, txtName.Text, txtEmail.Text, txtEnabled.Text, txtTenantID.Text, update_url);"></asp:Label>
            <asp:Label ID="lblChangeAll" runat="server" ForeColor="#DE0000" 
                style="z-index: 1; left: 268px; top: 349px; position: absolute" 
                
                Text="Change values above to evaluate the command and hit the run button to see the output."></asp:Label>
        </asp:Panel>


    </asp:Panel>

</asp:Content>
