<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="LAN_OR_WAN_EXAMINATION_SYSTEM.admin.Default" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>ES - Login</title>
    <link rel="icon" href="../assets/image/logo.png">
    <link href="../assets/bootstrap/css/bootstrap.min.css" rel="stylesheet" />
    <link href="../assets/custom/css/custom.css" rel="stylesheet" />
</head>
<body class="bg-dark">
    <div class="container">
        <div class="card card-login mx-auto mt-5">
            <div class="text-center">
                <div class="card-header">EXAMINATION SYSTEM - ADMIN</div>
            </div>
            <div class="card-body">
                <form runat="server" id="formlogin">
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
                        <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" placeholder="Enter your email" TextMode="Email"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ErrorMessage="No Email Found!" ControlToValidate="txtEmail" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="revEmail" runat="server" ErrorMessage="Enter validate email!" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ControlToValidate="txtEmail" Display="Dynamic" ForeColor="Red"></asp:RegularExpressionValidator>
                    </div>
                    <div class="form-group">
                        <label for="lblPassword">Password</label>
                        <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control" placeholder="Enter your password" TextMode="Password"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvPassword" runat="server" ErrorMessage="No Password Found!" ControlToValidate="txtPassword" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                    </div>
                    <div class="form-group">
                        <div class="form-check">
                            <label class="form-check-label">
                                <asp:CheckBox ID="chkRemember" runat="server" CssClass="form-check-input remembermecustom" />
                                Remember Me</label>
                        </div>
                    </div>
                    <asp:Button ID="btnLogin" runat="server" Text="Log In" CssClass="btn btn-primary btn-block" OnClick="btnLogin_Click" />
                    <br>
                    <div class="text-center">
                        <h5><a class="d-block small" href="../admin/Form_ForgotPassword.aspx">Forgot Password?</a></h5>
                    </div>
                </form>
            </div>
        </div>
    </div>
</body>
</html>
