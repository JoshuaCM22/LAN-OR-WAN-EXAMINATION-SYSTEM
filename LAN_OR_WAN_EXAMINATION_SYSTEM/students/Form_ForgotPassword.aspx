<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Form_ForgotPassword.aspx.cs" Inherits="LAN_OR_WAN_EXAMINATION_SYSTEM.students.Form_ForgotPassword" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>ES - Forgot Password?</title>
    <link rel="icon" href="../assets/image/logo.png">
    <link href="../assets/bootstrap/css/bootstrap.min.css" rel="stylesheet" />
    <link href="../assets/custom/css/custom.css" rel="stylesheet" />
</head>
<body class="bg-dark">
    <div class="container">
        <div class="card card-login mx-auto mt-5">
            <div class="text-center">
                <div class="card-header">FORGOT PASSWORD - STUDENTS</div>
            </div>
            <div class="card-body">
                <form runat="server" id="formForgotPassword">
                    <asp:Panel ID="panelWarning" runat="server" Visible="false">
                        <div class="form-group card-header text-center">
                            <div class="alert-danger">
                                <asp:Label ID="lblWarning" runat="server" Text="Label" CssClass="col-form-label text-center"></asp:Label>
                            </div>
                        </div>
                    </asp:Panel>
                    <br>
                    <div class="form-group">
                        <label for="lblEmail">Email</label>
                        <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" placeholder="Enter your email" TextMode="Email" OnTextChanged="txtEmail_TextChanged" AutoPostBack="True"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ErrorMessage="No Email Found!" ControlToValidate="txtEmail" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="revEmail" runat="server" ErrorMessage="Enter validate email!" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ControlToValidate="txtEmail" Display="Dynamic" ForeColor="Red"></asp:RegularExpressionValidator>
                    </div>
                    <div class="form-group">
                        <label for="lblSecretQuestion">Secret Question</label>
                        <asp:DropDownList ID="ddlSecretQuestion" runat="server" CssClass="form-control">
                            <asp:ListItem Selected="True">None</asp:ListItem>
                            <asp:ListItem>What is your favorite color?</asp:ListItem>
                            <asp:ListItem>What is your contact number?</asp:ListItem>
                            <asp:ListItem>When is your birthday?</asp:ListItem>
                            <asp:ListItem>What is love for you?</asp:ListItem>
                            <asp:ListItem>Where were you born ?</asp:ListItem>
                            <asp:ListItem>What is the meaning of life?</asp:ListItem>
                            <asp:ListItem>What is your gender?</asp:ListItem>
                            <asp:ListItem>What is your civil status in life?</asp:ListItem>
                            <asp:ListItem>What is your dream in life?</asp:ListItem>
                            <asp:ListItem>What things that makes you happy?</asp:ListItem>
                            <asp:ListItem>What things that makes you sad?</asp:ListItem>
                            <asp:ListItem>What things that makes you mad?</asp:ListItem>
                            <asp:ListItem>What is your job?</asp:ListItem>
                            <asp:ListItem>What is your favorite song?</asp:ListItem>
                            <asp:ListItem>What is your favorite band?</asp:ListItem>
                            <asp:ListItem>What is your favorite singer?</asp:ListItem>
                        </asp:DropDownList>
                        <asp:Label ID="lblNoSecretQuestionFound" runat="server" Text="No Secret Question Found!" ForeColor="Red" Visible="False"></asp:Label>
                    </div>
                    <div class="form-group">
                        <label for="lblSecretAnswer">Secret Answer</label>
                        <asp:TextBox ID="txtSecretAnswer" runat="server" CssClass="form-control" placeholder="Enter your secret answer" TextMode="Password"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvSecretAnswer" runat="server" ErrorMessage="No Secret Answer Found!" ControlToValidate="txtSecretAnswer" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                    </div>
                    <div class="form-group">
                        <div class="form-check">
                            <div class="form-check-input remembermecustom">
                                <input type="checkbox" onchange="document.getElementById('txtSecretAnswer').type = this.checked ? 'text' : 'password'">
                                Show Secret Answer
                            </div>
                        </div>
                    </div>
                    <br />
                    <br />
                    <div class="text-center">
                        <asp:Button ID="btnSubmit" runat="server" Text="Submit" CssClass="btn btn-primary" Width="148px" OnClick="btnSubmit_Click" />
                        <label for="lblSpace"></label>
                        <asp:Button ID="btnBack" CssClass="btn btn-primary" ForeColor="White" runat="server" Text="Back"
                            Width="148px" OnClick="btnBack_Click"></asp:Button>
                    </div>
                    <br />
                </form>
            </div>
        </div>
    </div>
</body>
</html>
