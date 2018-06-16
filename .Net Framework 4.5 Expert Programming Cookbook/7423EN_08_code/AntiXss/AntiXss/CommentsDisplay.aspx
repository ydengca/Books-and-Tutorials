<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CommentsDisplay.aspx.cs" Inherits="AntiXss.CommentsDisplay" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <table style="width:100%; height: 129px;">
            <tr>
                <td class="auto-style1">Title</td>
                <td>
                    <asp:Literal ID="ltlTitle" runat="server"></asp:Literal>
                </td>                
            </tr>
            <tr>
                <td class="auto-style1">Comment</td>
                <td>
                    <asp:Literal ID="ltlComments" runat="server"></asp:Literal>  
                </td>                
            </tr>
            <tr>
                <td class="auto-style1">Comment(Unsafe)</td>
                <td>
                    <asp:Literal ID="ltlUnsafeComments" runat="server"></asp:Literal>  
                </td>                
            </tr>
        </table>
       
    </div>
    </form>
</body>
</html>
