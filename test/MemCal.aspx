<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MemCal.aspx.cs" Inherits="test.MemCal" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style>
        body {background-color:floralwhite}
        .header {height:10%;text-align:left;}
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div style="text-align:center;">
            <header class="header">
            <asp:LoginName ID="memID" runat="server" />
            님 반갑습니다!
           
            <asp:Button ID="Button1" runat="server" Text="로그아웃" OnClick="Button1_Click" />

                &nbsp;&nbsp;&nbsp;&nbsp;

                <asp:Button ID="btnBlog" runat="server" Text="Blog" OnClick="btnBlog_Click"/>
        </header>
        
           <h1 > Calendar</h1><br />
            <br />
            <asp:Calendar ID="Calendar1" runat="server" Height="537px" OnSelectionChanged="Calendar1_SelectionChanged" Width="1128px" style="margin-left: auto; margin-right: auto;">
                <SelectedDayStyle BackColor="#99CCFF" />
            </asp:Calendar>
            <asp:Label ID="lblDate" runat="server"></asp:Label>
            <hr />
        </div>
     
        <div>
            <asp:MultiView ID="MultiView1" runat="server" ActiveViewIndex="0">
                <asp:View ID="selCal" runat="server">
                    <div style="text-align:right">
            <asp:DropDownList ID="ddlsql" runat="server" OnSelectedIndexChanged="ddlsql_SelectedIndexChanged" AutoPostBack="True">
                <asp:ListItem Value="a">모두보기</asp:ListItem>
                <asp:ListItem Value="d">일기보기</asp:ListItem>
                <asp:ListItem Value="s">일정보기</asp:ListItem>
            </asp:DropDownList>

                    <br />
                    <br />
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="True" style="margin-left: auto; margin-right: auto;text-align:left;" Width="1000px">
                        <EmptyDataTemplate>
                            추가된 일정이 없습니다
                        </EmptyDataTemplate>
                    </asp:GridView>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server"></asp:SqlDataSource>
                    <br />
                    <br />
                    <asp:Button ID="btnSch" runat="server"  Text="일정추가" CommandArgument="1" CommandName="move" OnCommand="cmd_move"/>
&nbsp;<asp:Button ID="btnDia" runat="server" Text="일기추가" CommandArgument="2" CommandName="move" OnCommand="cmd_move"/>
                    <br />
                        </div>
                </asp:View>

                <asp:View ID="viewSch" runat="server">
                    <div style="text-align:center;align-self:center;">
                    <br />
                    <table  style="margin-left: auto; margin-right: auto;">
                        <tr>
                            <td>시작시간 : </td>
                            <td>
                                <asp:TextBox ID="starttime" runat="server" TextMode="Time"></asp:TextBox>
                            </td>
                            <td>종료시간 : </td>
                            <td>
                               <asp:TextBox ID="endtime" runat="server" TextMode="Time"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="4">
                                내용 :
                                <asp:TextBox ID="txtSch" runat="server" Width="1000px"></asp:TextBox>
                            </td>
                        </tr>

                    </table>
                    <hr />
                    <asp:Button ID="btnCan1" runat="server" Text="취소" CommandArgument="0" CommandName="move" OnCommand="cmd_move"/>
                    &nbsp;&nbsp;&nbsp;
                    <asp:Button ID="btnWrite1" runat="server" Text="완료" OnClick="btnWrite1_Click" />

                        </div>
                </asp:View>

                <asp:View ID="viewDia" runat="server">
                    <div style="text-align:center; vertical-align: top;">
                    내용 :
                    <asp:TextBox ID="txtDia" runat="server" Height="100px" TextMode="MultiLine" Width="1000px"></asp:TextBox>
                    <hr />
                    <asp:Button ID="btnCan2" runat="server" Text="취소" CommandArgument="0" CommandName="move" OnCommand="cmd_move" />
                    &nbsp;&nbsp;&nbsp;
                    <asp:Button ID="btnWrite2" runat="server" OnClick="btnWrite2_Click" Text="완료" />
                        </div>
                </asp:View>


            </asp:MultiView>
          

        </div>
    </form>
</body>
</html>
