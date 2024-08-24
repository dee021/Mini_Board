<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Subscribe.aspx.cs" Inherits="test.Subscribe" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        .auto-style1 {
            height: 26px;
        }
        body {background-color:floralwhite}
    </style>
   
</head>
<body>
    <form id="form1" runat="server">
        <div style="text-align: center">
            <h1>회원가입</h1>
            <br />
            <br />
            <br />
            <table style="text-align: left;margin-left:auto;margin-right:auto">
                <tr><td class="auto-style1">
            아이디</td><td class="auto-style1">
                <asp:TextBox ID="memID" runat="server" OnTextChanged="memID_TextChanged" AutoPostBack="True"></asp:TextBox>&nbsp;
                <asp:Button ID="checkID" runat="server" Text="중복확인" OnClick="checkID_Click" CausesValidation="False" />
                    </td> <td class="auto-style1">
                        <asp:Label ID="lblchkID" runat="server"></asp:Label>
            <asp:RequiredFieldValidator ID="memIDRequiredVal" runat="server" ErrorMessage="아이디를 입력주세요" ControlToValidate="memID" Display="Dynamic"></asp:RequiredFieldValidator>
                        <br />
            </td></tr>

                <tr><td>
            비밀번호</td>
                    <td style="font-size: xx-small; color: #FF0000"><asp:TextBox ID="memPW" runat="server"></asp:TextBox>
                        <br />
                       * 비밀번호는 영어와 숫자가 포함될 수 있습니다<br />
                        * 비밀번호는 최소 7자리 입니다</td>
                    <td>
            <asp:RequiredFieldValidator ID="memPWRequiredVal" runat="server" ErrorMessage="비밀번호를 입력해주세요" ControlToValidate="memPW" Display="Dynamic"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="chPWRegularExpVal" runat="server" ErrorMessage="비밀번호 형식을 확인해주세요" ValidationExpression="[0-9a-zA-Z]{7,20}" ControlToValidate="memPW"></asp:RegularExpressionValidator>
           </td></tr>

                <tr><td>
            비밀번호 확인</td><td><asp:TextBox ID="checkPW" runat="server"></asp:TextBox></td><td>
            <asp:RequiredFieldValidator ID="chPWRequiredVal" runat="server" ErrorMessage="비밀번호를 입력해주세요" ControlToValidate="checkPW" Display="Dynamic"></asp:RequiredFieldValidator>
                    <asp:CompareValidator ID="PWCompareVal" runat="server" ControlToCompare="memPW" ControlToValidate="checkPW" Display="Dynamic" ErrorMessage="비밀번호가 다릅니다"></asp:CompareValidator>
         </td>  </tr>

                <tr><td>
            이름</td><td><asp:TextBox ID="memName" runat="server"></asp:TextBox></td><td>
                    <asp:RequiredFieldValidator ID="memNameRequiredVal" runat="server" ControlToValidate="memName" Display="Dynamic" ErrorMessage="이름을 입력해주세요"></asp:RequiredFieldValidator>
                    </td>
         </tr>

                <tr><td>
            생년월일</td><td>
            <asp:TextBox ID="BirthYear" runat="server" MaxLength="4" placeholder="년(4자리)"></asp:TextBox>
&nbsp;
            <asp:DropDownList ID="BirthMonth" runat="server" Height="17px" Width="70px" OnSelectedIndexChanged="BirthMonth_SelectedIndexChanged" AutoPostBack="True">
                <asp:ListItem Selected="True" Value="0">월</asp:ListItem>
                <asp:ListItem Value="1">1</asp:ListItem>
                <asp:ListItem Value="2">2</asp:ListItem>
                <asp:ListItem Value="3">3</asp:ListItem>
                <asp:ListItem Value="4">4</asp:ListItem>
                <asp:ListItem Value="5">5</asp:ListItem>
                <asp:ListItem Value="6">6</asp:ListItem>
                <asp:ListItem Value="7">7</asp:ListItem>
                <asp:ListItem Value="8">8</asp:ListItem>
                <asp:ListItem Value="9">9</asp:ListItem>
                <asp:ListItem Value="10">10</asp:ListItem>
                <asp:ListItem Value="11">11</asp:ListItem>
                <asp:ListItem Value="12">12</asp:ListItem>
            </asp:DropDownList>
&nbsp;
            <asp:DropDownList ID="BirthDay" runat="server" Height="17px" Width="70px">
                <asp:ListItem Selected="True" Value="0">일</asp:ListItem>
                </asp:DropDownList>
          </td><td>
                        &nbsp;</td> </tr>

                <tr>
            <td>성별</td><td><asp:DropDownList ID="memGender" runat="server">
                <asp:ListItem Value="0">남</asp:ListItem>
                <asp:ListItem Value="1">여</asp:ListItem>
            </asp:DropDownList>
                  </td><td></td>  </tr>
                <tr>
                    <td>질문</td>
                    <td>
                        <asp:TextBox ID="memQues" runat="server"></asp:TextBox>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="질문을 입력해주세요" ControlToValidate="memQues"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td>답변</td>
                    <td>
                        <asp:TextBox ID="memAns" runat="server"></asp:TextBox>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="질문의 답을 입력해주세요" ControlToValidate="memAns"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                </table>
            <br />
            <br />
            <br />
            <asp:Button ID="btnSubscribe" runat="server" Text="회원가입" Enabled="False" OnClick="btnSubscribe_Click" ValidateRequestMode="Enabled"  />
            <br />
        </div>
    </form>
</body>
</html>
