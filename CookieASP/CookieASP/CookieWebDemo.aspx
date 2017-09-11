<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CookieWebDemo.aspx.cs" Inherits="CookieASP.CookieWebDemo" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
    </div>
        <asp:TextBox ID="txtUser" runat="server" Text="user"></asp:TextBox>
        <p>
            <asp:TextBox ID="txtPass" runat="server" TextMode="Password"></asp:TextBox>
        </p>
        <p>
            <asp:CheckBox ID="cbRemember" runat="server" Text="Remember" />
        </p>
        <p>
            <asp:Button ID="btnLogin" runat="server" Text="Login" OnClick="btnLogin_Click" />
            <asp:Button ID="btnClear" runat="server" OnClick="btnClear_Click" Text="ClearCookie" />
        </p>
    </form>
</body>
</html>
