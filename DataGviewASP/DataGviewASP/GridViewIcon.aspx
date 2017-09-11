<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="GridViewIcon.aspx.cs" Inherits="DataGviewASP.GridViewIcon" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
    </div>
        <asp:GridView ID="gridView" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" AllowPaging="True" PageSize="3" Height="167px" OnRowEditing="gridView_RowEditing" ShowFooter="True" OnPageIndexChanging="gridView_PageIndexChanging" OnRowCancelingEdit="gridView_RowCancelingEdit" OnRowDeleting="gridView_RowDeleting" OnRowUpdating="gridView_RowUpdating">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:TemplateField>
                    <EditItemTemplate>
                        <asp:ImageButton ID="ImageButton1" runat="server" Height="16px" ImageUrl="~/image/delete.png" />
                    </EditItemTemplate>
                    <FooterTemplate>
                        <asp:ImageButton ID="imgbtnDelete" runat="server" ImageUrl="~/image/delete.png" OnClick="imgbtnDelete_Click" />
                        <asp:ImageButton ID="imgbtnAdd" runat="server" CommandName="Create" ImageUrl="~/image/plus.png" OnClick="imgbtnAdd_Click" />
                    </FooterTemplate>
                    <HeaderTemplate>
                        <asp:CheckBox ID="ckAll" runat="server" OnCheckedChanged="ckAll_CheckedChanged" Text="CheckAll" AutoPostBack="True" />
                    </HeaderTemplate>
                    <ItemTemplate>
                        <asp:CheckBox ID="ckBoxRow" runat="server" AutoPostBack="True" />
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Left" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="UserName">
                    <EditItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("_user") %>'></asp:Label>
                    </EditItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="txtUser" runat="server" AutoPostBack="True"></asp:TextBox>
                    </FooterTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("_user") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Password">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("_pass") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="txtPass" runat="server" AutoPostBack="True"></asp:TextBox>
                    </FooterTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("_pass") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Edit">
                    <EditItemTemplate>
                        <asp:ImageButton ID="imgbtnUpdate" runat="server" CommandName="Update" ImageUrl="~/image/update.png" />
                        <asp:ImageButton ID="imgbtnCancel" runat="server" CommandName="Cancel" ImageUrl="~/image/cancel.png" />
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:ImageButton ID="imgbtnEdit" runat="server" CommandName="Edit" ImageUrl="~/image/account-edit.png" />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Delete">
                    <ItemTemplate>
                        <asp:ImageButton ID="ImageButton2" runat="server" CommandName="Delete" ImageUrl="~/image/delete.png" />
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            
            <EditRowStyle BackColor="#2461BF" />
            
            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <PagerSettings FirstPageText="" LastPageText="" NextPageText="" PreviousPageText="" />
            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
            <PagerTemplate>
                <asp:Button ID="btnFirst" runat="server" Text="First" CommandArgument="First" CommandName="Page" OnClick="btnFirst_Click" />
                <asp:Button ID="btnPrev" runat="server" Text="Previous" CommandArgument="Prev" CommandName="Page" OnClick="btnPrev_Click" />
                <asp:Button ID="btnNext" runat="server" Text="Next" CommandArgument="Next" CommandName="Page" OnClick="btnNext_Click" />
                <asp:Button ID="btnLast" runat="server" Text="Last" CommandArgument="Last" CommandName="Page" OnClick="btnLast_Click" />
            </PagerTemplate>
            
            <RowStyle BackColor="#EFF3FB" />
            
            <SelectedRowStyle BackColor="#D1DDF1" ForeColor="#333333" Font-Bold="True" />
            <SortedAscendingCellStyle BackColor="#F5F7FB" />
            <SortedAscendingHeaderStyle BackColor="#6D95E1" />
            <SortedDescendingCellStyle BackColor="#E9EBEF" />
            <SortedDescendingHeaderStyle BackColor="#4870BE" />
        </asp:GridView>
    </form>
</body>
</html>
