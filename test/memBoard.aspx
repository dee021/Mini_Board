<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="memBoard.aspx.cs" Inherits="test.memBoard" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style>
        body {background-color:floralwhite}
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h1 align="center"> 게시판 설정 </h1>
            <table style="margin-left:auto;margin-right:auto">
                <tr>
                    <td rowspan="2">
                        <asp:ListBox ID="ListBox1" runat="server" AutoPostBack="True"></asp:ListBox>
                    </td>
                    <td>
                        이름 : <asp:TextBox ID="txtBoard" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td align="center">
                        <asp:Button ID="btnDel" runat="server" Text="삭제" OnClick="btnDel_Click" />
                        &nbsp;&nbsp;&nbsp;
                        <asp:Button ID="btnAdd" runat="server" Text="추가" OnClick="btnAdd_Click" />
                    </td>
                </tr>
                <tr>
                    <td colspan="2" align="center">
                        <asp:Button ID="Button1" runat="server" Text="완료" PostBackUrl="~/MemBlog.aspx" />
                    </td>
                </tr>
            </table>



        </div>
    </form>
</body>
</html>
