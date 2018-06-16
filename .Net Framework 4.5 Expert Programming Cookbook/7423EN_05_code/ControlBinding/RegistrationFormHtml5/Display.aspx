<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Display.aspx.cs" Inherits="RegistrationFormHtml5.Confirm" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
     <style type="text/css">
        .auto-style1 {
            width: 254px;
        }

        .auto-style2 {
            width: 160px;
        }
    </style>
</head>
<body>
    <h2>User Details</h2>
    <form id="form1" runat="server">
    <div>
    <asp:FormView ID="UserDetails" ItemType="RegistrationFormHtml5.Entities.User" 
            runat="server" CssClass="auto-style1">
        <ItemTemplate>
            <div>
            <asp:Label ID="Label1" runat="server" AssociatedControlID="UserName" CssClass="auto-style1">
                User Name:</asp:Label>
            <asp:Label ID="UserName" runat="server"  
                Text='<%#BindItem.UserName %>'  />
        </div>
            <div>
            <asp:Label ID="Label4" runat="server" AssociatedControlID="email" CssClass="auto-style1">
                Email:</asp:Label>
            <asp:Label ID="email" runat="server"  
                Text='<%#BindItem.Email %>'  />
        </div>
        <div>
            <asp:Label ID="Label2" runat="server" AssociatedControlID="age">
                Age:</asp:Label>
            <asp:Label ID="age" runat="server" 
                Text='<%#BindItem.Age %>' />
        </div>
        <div>
            <asp:Label ID="Label3" runat="server" AssociatedControlID="blog">
                Blog Address:</asp:Label>
            <asp:Label ID="blog" runat="server" 
                Text='<%#BindItem.Blog %>' />
        </div>
        </ItemTemplate>
    </asp:FormView>
    </div>
    </form>
</body>
</html>
