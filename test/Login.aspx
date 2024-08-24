<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="test.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        .auto-style1 {
            height: 27px;
        }
        body {background-color:floralwhite}
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div style="text-align:center;">
            <h1>로그인</h1>
            <br />
            <asp:MultiView ID="MultiView1" runat="server">
                <asp:View ID="View1" runat="server">
                    <table style="margin-left: auto; margin-right: auto;">
    <tr>
        <td class="auto-style1">아이디 : </td>
        <td class="auto-style1">
            <asp:TextBox ID="memID" runat="server"></asp:TextBox>
        </td>
        <td rowspan="2">
            <asp:Button ID="btnLogin" runat="server" Text="로그인" OnClick="btnLogin_Click" /></td>
    </tr>

    <tr>
        <td>비밀번호 : </td>
        <td>
            <asp:TextBox ID="memPW" runat="server" TextMode="Password"></asp:TextBox>
        </td>
    </tr>

    <tr>
        <td colspan="3">
            <asp:Button ID="Button1" runat="server" Text="아이디찾기" OnClick="Button1_Click" />
&nbsp;<asp:Button ID="Button2" runat="server" Text="비밀번호찾기" OnClick="Button2_Click" />
            &nbsp;<asp:Button ID="btnSubs" runat="server" PostBackUrl="~/Subscribe.aspx" Text="회원가입" OnClick="btnSubs_Click1" />
            </td>
    </tr>
</table>

                </asp:View>
                <asp:View ID="View2" runat="server">
                <table  style="margin-left: auto; margin-right: auto;">
                    <tr>
                        <td>
                            이름 : 
                        </td>
                        <td>
                            <asp:TextBox ID="txtselID" runat="server"></asp:TextBox>
                            <asp:Button ID="Button4" runat="server" Text="질문찾기" OnClick="Button4_Click"/>
                        </td>
                    </tr>
                    <tr>
                        <td>질문 : </td>
                        <td>
                            <asp:DropDownList ID="DropDownList1" runat="server" DataTextField="memQues" DataValueField="memQues" Width="300px"></asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:connectionString %>" SelectCommand="SELECT [memQues] FROM [member] WHERE ([memName] = @memName)">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="txtselID" Name="memName" PropertyName="Text" Type="String" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </td>
                    </tr>
                    <tr>
                        <td>답변 : </td>
                        <td>
                            <asp:TextBox ID="txtAns" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                </table>
                    <asp:Label ID="lblID" runat="server"></asp:Label>
                    <br />
                    <asp:Button ID="Button3" runat="server" Text="완료" OnClick="Button3_Click" />
                    &nbsp;&nbsp;
                    <asp:Button ID="Button5" runat="server" OnClick="Button5_Click" Text="이전" />
                    </asp:View>

                <asp:View ID="View3" runat="server">
                    <table  style="margin-left: auto; margin-right: auto;">
                    <tr>
                        <td>
                            이름 : 
                        </td>
                        <td>
                            <asp:TextBox ID="txtselPW1" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>아이디 : </td>
                        <td>
                          
                            <asp:TextBox ID="txtselPW2" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                </table>
                     <asp:Label ID="lblPW" runat="server"></asp:Label>
                    <br />
                    <asp:Button ID="Button6" runat="server" Text="완료" OnClick="Button6_Click"/>
                    &nbsp;&nbsp;
                    <asp:Button ID="Button7" runat="server" OnClick="Button5_Click" Text="이전" />
                </asp:View>
            </asp:MultiView>
        </div>
    </form>
</body>
</html>
