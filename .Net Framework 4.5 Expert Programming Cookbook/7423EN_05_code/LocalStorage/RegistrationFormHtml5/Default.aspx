<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="RegistrationFormHtml5.Default" %>

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
    <script>
        function saveDraft() {
            
            window.localStorage.username = document.getElementById("txtUserName").value;
            window.localStorage.email = document.getElementById("txtEmail").value;
            window.localStorage.dob = document.getElementById("txtDob").value;
            window.localStorage.age = document.getElementById("txtAge").value;
            window.localStorage.phone = document.getElementById("txtPhone").value;
            window.localStorage.blog = document.getElementById("txtBlog").value;
        }

        function loadDraft() {
            document.getElementById("txtUserName").value = window.localStorage.username;
            document.getElementById("txtEmail").value = window.localStorage.email;
            document.getElementById("txtDob").value = window.localStorage.dob;
            document.getElementById("txtAge").value = window.localStorage.age;
            document.getElementById("txtPhone").value = window.localStorage.phone;
            document.getElementById("txtBlog").value = window.localStorage.blog;
        }
    </script>
</head>
<body>
    <h3>Register</h3>
    <form id="form1" runat="server">
    <div>
        <table style="width: 59%;">
            <tr>
                <td class="auto-style1">Username</td>
                <td class="auto-style2">
                    <asp:TextBox ID="txtUserName" runat="server" Width="186px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style1">Email</td>
                <td class="auto-style2">
                    <asp:TextBox ID="txtEmail" runat="server" TextMode="Email" Width="184px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style1">Date of Birth</td>
                <td class="auto-style2">
                    <asp:TextBox ID="txtDob" runat="server" TextMode="Date" Width="184px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style1">Age in Years</td>
                <td class="auto-style2">
                    <asp:TextBox ID="txtAge" runat="server" TextMode="Number" Width="184px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style1">Phone no.</td>
                <td class="auto-style2">
                    <asp:TextBox ID="txtPhone" runat="server" TextMode="Phone" Width="184px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style1">Blog address</td>
                <td class="auto-style2">
                    <asp:TextBox ID="txtBlog" runat="server" TextMode="Url" Width="184px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style1">
                    <input type="submit" /></td>
                <td class="auto-style2">
                    <asp:Button ID="btnReset" OnClick="btnReset_Click" runat="server" Text="Reset" />
                </td>
                <td class="auto-style1">
                    <button id="draft" onclick="saveDraft()">Save Draft</button>
                </td>
                <td class="auto-style1">
                    <button id="load" onclick="loadDraft()">Load Draft</button>
                </td>
            </tr>
        </table>
    </div>
    </form>
</body>
</html>
