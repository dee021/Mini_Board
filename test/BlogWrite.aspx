<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BlogWrite.aspx.cs" Inherits="test.BlogWirte" %>

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
            <h1 align="center"> 블로그 글 쓰기 </h1>
            <br />
            <table style="margin-left:auto;margin-right:auto;">
                <tr>
                    <td>제목 :</td>
                    <td>
                        <asp:TextBox ID="txtTitle" runat="server" Width="633px"></asp:TextBox>
                    </td>
                    <td>게시판</td>
                    <td>
                        <asp:DropDownList ID="ddlBoard" runat="server" DataSourceID="SqlDataSource1" DataTextField="board" DataValueField="board"></asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:connectionString %>" SelectCommand="SELECT [board] FROM [BlogList] WHERE ([memID] = @memID) ORDER BY [board]">
                            <SelectParameters>
                                <asp:CookieParameter CookieName="Member" Name="memID" Type="String" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </td>
                </tr>

                <tr>
                    <td colspan="4">내용</td>
                </tr>

                <tr>
                    <td colspan="4">
                        <asp:TextBox ID="txtCon" runat="server" Height="240px" TextMode="MultiLine" Width="708px"></asp:TextBox>
                    </td>
                </tr>

                <tr>
                    <td colspan="4" align="center">
                          <asp:Button ID="Button1" runat="server" PostBackUrl="~/MemBlog.aspx" Text="취소" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="Button2" runat="server" Text="완료" OnClick="Button2_Click" />
                    </td>
                </tr>
            </table>
            
          
          
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
        </div>
    </form>
</body>
</html>
