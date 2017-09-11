<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddAccount.aspx.cs" Inherits="DataGviewASP.AddAccount" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:TextBox ID="txtUser" text="user" runat="server"></asp:TextBox>
        <asp:TextBox ID="txtPass" runat="server">pass</asp:TextBox>
        <asp:Button ID="btnInsert" runat="server" Text="Button" OnClick="btnInsert_Click" />
    </div>
    </form>
</body>
</html>
