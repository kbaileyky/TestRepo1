<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="User_Add_Role_Walkthrough.aspx.cs" Inherits="KeystoneWebsite.User_Add_Role_Walkthrough" %>

<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="HeadContent">
    </asp:Content>
<asp:Content ID="Content3" runat="server" contentplaceholderid="FeaturedContent">
         <h1 style="margin-left:145px;">User Add Role Walkthrough</h1>
</asp:Content>
<asp:Content ID="Content4" runat="server" contentplaceholderid="MainContent">

           <asp:Panel ID="Panel5" runat="server" Height="857px" Width="1274px">   

     <asp:Panel ID="Panel1" runat="server" BorderColor="#323232" BorderStyle="Solid" BorderWidth="5px" 
            ForeColor="White"            
            
            style="z-index: 1; top: 243px; position: absolute; height: 195px; width: 1200px; margin-left: 0px;">
            <asp:TextBox ID="txtPrototype" runat="server" 
                style="z-index: 1; left: 171px; top: 23px; position: absolute; width: 714px; bottom: 141px; margin-top: 0px; height: 21px;" 
                Visible="True">public static Role AddRoleToUser(string url, string UserId, string TenantId, string RoleId, string Admin_Token)
        </asp:TextBox>
            <asp:Label ID="lblLevel1" runat="server" Font-Underline="True" 
                style="z-index: 1; left: 32px; top: 110px; position: absolute" 
                Text="Data obtained by login:" ForeColor="#DE0000"></asp:Label>
            <asp:Label ID="lblToken" runat="server" 
                style="z-index: 1; left: 467px; top: 76px; position: absolute" 
                Text=" Admin Token" ForeColor="Black"></asp:Label>
            <asp:TextBox ID="txtToken" runat="server"                
                
                
                
                style="z-index: 1; left: 584px; top: 71px; position: absolute; width: 310px"></asp:TextBox>
            <asp:TextBox ID="txtURL" runat="server" 
                style="z-index: 1; left: 583px; top: 111px; position: absolute"></asp:TextBox>
            <asp:Label ID="lblTenantId" runat="server" 
                style="z-index: 1; left: 482px; top: 151px; position: absolute" 
                Text="TenantId" ForeColor="Black"></asp:Label>
            <asp:TextBox ID="txtTenantId" runat="server"                
                
                
                
                style="z-index: 1; left: 583px; top: 141px; position: absolute; width: 313px; margin-top: 6px;"></asp:TextBox>
            <asp:Label ID="lblPrototype" runat="server" Font-Underline="True" 
                style="z-index: 1; left: 27px; top: 24px; position: absolute; height: 30px; right: 989px;" 
                Text="Add Role Prototype:" ForeColor="Black"></asp:Label>
            <asp:Button ID="btnNext1" runat="server" onclick="btnNext1_Click" 
                style="z-index: 1; left: 55px; top: 146px; position: absolute" 
                Text="Next" />           
            <asp:Label ID="lblURL" runat="server" style="z-index: 1; left: 463px; top: 114px; position: absolute; height: 22px;" Text="Endpoint URL" ForeColor="Black"></asp:Label>
        </asp:Panel>
    
        <asp:Panel ID="Panel2" runat="server" BorderColor="#323232" 
            BorderStyle="Solid" BorderWidth="5px" 
            
            
            
        style="z-index: 1;  top: 461px; position: absolute; height: 117px; width: 1200px">
        
            <asp:Label ID="lblLevel3" runat="server" Font-Underline="True" 
                style="z-index: 1; left: 28px; top: 7px; position: absolute" 
                Text="Data that is needed to be entered:" ForeColor="#DE0000"></asp:Label>
            <asp:Label ID="lblUserID" runat="server"                 
                style="z-index: 1; left: 376px; top: 21px; position: absolute; height: 26px;" 
                Text="UserID" ForeColor="Black"></asp:Label>
            <asp:TextBox ID="txtUserID" runat="server"                 
                
                
                style="z-index: 1; left: 448px; top: 14px; position: absolute; width: 342px"></asp:TextBox>
            <asp:Label ID="lblRoleID" runat="server" 
                style="z-index: 1; left: 373px; top: 59px; position: absolute" 
                Text="RoleID" ForeColor="Black"></asp:Label>
            <asp:Button ID="btnNext2" runat="server" onclick="btnNext2_Click" 
                style="z-index: 1; left: 75px; top: 59px; position: absolute" Text="Next" />
            <asp:TextBox ID="txtRoleID" runat="server" 
                style="z-index: 1; left: 447px; top: 54px; position: absolute; width: 341px"></asp:TextBox>
            <asp:Label ID="lblNote" runat="server" ForeColor="#DE0000" 
                style="z-index: 1; left: 377px; top: 92px; position: absolute" 
                Text="Get the UserID and RoleID from the next panel."></asp:Label>
            </asp:Panel>

            <asp:Panel ID="Panel3" runat="server"
            BorderColor="#323232" BorderStyle="Solid" BorderWidth="5px" 
            
            
            
        style="z-index: 1;  top: 596px; position: absolute; height: 242px; width: 1200px">
            <asp:TextBox ID="txtResult" runat="server" 
                style="z-index: 1; left: 199px; top: 24px; position: absolute; width: 366px; height: 108px" 
                TextMode="MultiLine"></asp:TextBox>
            <asp:Label ID="lblLevel4" runat="server" 
                style="z-index: 1; left: 13px; top: 25px; position: absolute; width: 171px;" 
                Text="List of  Current Users:" ForeColor="Black"></asp:Label>
            <asp:Label ID="lblCommand" runat="server" 
                style="z-index: 1; left: 176px; top: 162px; position: absolute" 
                
                    Text=" Command: StackUser.Add(EndpointURL,Name,Password,&quot;true&quot;,TenantId,Email,AdminToken);" 
                    ForeColor="Black"></asp:Label>
                <asp:Button ID="btnNext3" runat="server" ForeColor="Black" 
                    onclick="btnNext3_Click" 
                    style="z-index: 1; left: 469px; top: 196px; position: absolute" 
                    Text="Run the  Command" />
                <asp:Label ID="lblRoleList" runat="server" ForeColor="Black" 
                    style="z-index: 1; left: 657px; top: 35px; position: absolute" 
                    Text="List of Roles"></asp:Label>
                <asp:TextBox ID="txtRoles" runat="server" 
                    style="z-index: 1; left: 766px; top: 27px; position: absolute; width: 366px; height: 108px" 
                    TextMode="MultiLine"></asp:TextBox>
        </asp:Panel>
    
        <asp:Panel ID="Panel4" runat="server" BorderColor="#323232" 
            BorderStyle="Solid" BorderWidth="5px" 
            style="z-index: 1; top: 854px; position: absolute; height: 206px; width: 1208px">
            <asp:Label ID="lblAddResult" runat="server" ForeColor="Black" 
                style="z-index: 1; left: 156px; top: 39px; position: absolute" 
                Text="Add Role Result"></asp:Label>
            <asp:Label ID="lblError" runat="server" ForeColor="#DE0000" 
                Text="Errors are caught and epressed thought a catch command:"></asp:Label>
            <asp:Label ID="lblChangeAll" runat="server" ForeColor="#DE0000" 
                style="z-index: 1; left: 285px; top: 174px; position: absolute" 
                
                Text="Change values above to evaluate the command and hit the run button to see the output."></asp:Label>
            <asp:TextBox ID="txtAddResult" runat="server" 
                style="z-index: 1; left: 301px; top: 35px; position: absolute; width: 632px; height: 111px" 
                TextMode="MultiLine"></asp:TextBox>
        </asp:Panel>


    </asp:Panel>
</asp:Content>

