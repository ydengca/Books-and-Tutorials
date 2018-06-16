<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="AntiXss.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1
        {
            width: 180px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <table style="width:100%; height: 129px;">
            <tr>
                <td class="auto-style1">Title</td>
                <td>
                    <asp:TextBox ID="txtTitle" runat="server" Width="227px" ValidateRequestMode="Disabled"></asp:TextBox>
                </td>                
            </tr>
            <tr>
                <td class="auto-style1">Comment</td>
                <td>
                    <asp:TextBox ID="txtComments" runat="server" Height="35px" TextMode="MultiLine" Width="292px" ValidateRequestMode="Disabled"></asp:TextBox>
                </td>                
            </tr>
            <tr>
                <td class="auto-style1"></td>
                <td>
                    
                    <asp:Button ID="btnSubmit" runat="server" OnClick="btnSubmit_Click" Text="Submit" />
                    
                </td>                
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
