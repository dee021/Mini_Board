<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MemBlog.aspx.cs" Inherits="test.MemBlog" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 800px;
        }
        body {background-color:floralwhite}
        .header {height:10%;}
        .nav {width:15%;float:left;}
        .section {width:85%;float:left;text-align:center;}
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div  class="auto-style1">
            <header class="header">
                <asp:LoginName ID="memID" runat="server" />
            님 반갑습니다!
           
            <asp:Button ID="Button1" runat="server" Text="로그아웃" OnClick="Button1_Click" />

                &nbsp;&nbsp;&nbsp;&nbsp;

                <asp:Button ID="btnBlog" runat="server" Text="Calendar" OnClick="btnBlog_Click"/>
            </header>
        <nav class="nav">
            게시판 목록<br />
            <br />
          
            <asp:ListBox ID="ListBox1" runat="server" AutoPostBack="True" BackColor="FloralWhite" Height="275px" style="border-style:none;"></asp:ListBox>
        </nav>
    
        <section class="section">
            <asp:Button ID="Button2" runat="server" Text="게시판설정" PostBackUrl="~/memBoard.aspx"/>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="btnWrite" runat="server" Text="글쓰기" PostBackUrl="~/BlogWrite.aspx" /><hr />
            <asp:DataList ID="DataList1" runat="server" DataSourceID="SqlDataSource1" Width="500px" style="margin-left:50px;">
                <ItemTemplate>
                   <asp:Label ID="titleLabel" runat="server" Text='<%# Eval("title") %>' Font-Size="Large" Font-Bold="True" />
                    <br />
                    <asp:Label ID="writeTimeLabel" runat="server" Text='<%# Eval("writeTime") %>' Font-Size="X-Small" />
                    <hr style="border: thin dashed #C0C0C0;" />
                    <asp:Label ID="contentsLabel" runat="server" Text='<%# Eval("contents") %>' />
                    <br />
                    <hr style="border-style: solid; border-width: medium" />
                </ItemTemplate>
            </asp:DataList>
         
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:connectionString %>" SelectCommand="SELECT [title], [writeTime], [contents] FROM [memBlog] WHERE (([memID] = @memID) AND ([board] = @board)) ORDER BY [writeTime] DESC">
                <SelectParameters>
                    <asp:CookieParameter CookieName="Member" Name="memID" Type="String" />
                    <asp:ControlParameter ControlID="ListBox1" Name="board" PropertyName="SelectedValue" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>
         
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
        </section>
    </div>
        </form>
    </body>
</html>
