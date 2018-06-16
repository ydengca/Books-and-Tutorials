<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="RegistrationFormHtml5.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 254px;
        }
    </style>
</head>
<body>
    <h3>Register</h3>
    <form id="form1" runat="server">
        
    <div>
    
        <table style="width:59%;">
            <tr>
                <td class="auto-style1">Username</td>
                <td>
                    <asp:TextBox ID="txtUserName" runat="server" Width="186px"></asp:TextBox>
                </td>
               
            </tr>
            <tr>
                <td class="auto-style1">Email</td>
                <td>
                    <asp:TextBox ID="txtEmail" runat="server" TextMode="Email" Width="184px"></asp:TextBox>
                </td>
               
            </tr>
            <tr>
                <td class="auto-style1">Date of Birth</td>
                <td>
                    <asp:TextBox ID="txtDob" runat="server" TextMode="Date" Width="184px"></asp:TextBox>
                </td>
               
            </tr>
            <tr>
                <td class="auto-style1">Age in Years</td>
                <td>
                    <asp:TextBox ID="txtAge" runat="server" TextMode="Number" Width="184px"></asp:TextBox>
                </td>
               
            </tr>
            <tr>
                <td class="auto-style1">Phone no.</td>
                <td>
                    <asp:TextBox ID="txtPhone" runat="server" TextMode="Phone" Width="184px"></asp:TextBox>
                </td>
               
            </tr>
            <tr>
                <td class="auto-style1">Blog address</td>
                <td>
                    <asp:TextBox ID="txtBlog" runat="server" TextMode="Url" Width="184px"></asp:TextBox>
                </td>
               
            </tr>
            <tr>
                <td>&nbsp;</td><td><input type="submit"/></td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
