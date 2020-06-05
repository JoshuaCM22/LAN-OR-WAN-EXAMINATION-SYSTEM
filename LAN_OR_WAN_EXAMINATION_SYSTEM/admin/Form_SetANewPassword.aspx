<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Form_SetANewPassword.aspx.cs" Inherits="LAN_OR_WAN_EXAMINATION_SYSTEM.admin.Form_SetANewPassword" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>ES - Set A New Password</title>
    <link rel="icon" href="../assets/image/logo.png">
    <link href="../assets/bootstrap/css/bootstrap.min.css" rel="stylesheet" />
    <link href="../assets/custom/css/custom.css" rel="stylesheet" />
</head>
<body class="bg-dark">
    <div class="container">
        <div class="card card-login mx-auto mt-5">
            <div class="text-center">
                <div class="card-header">SET A NEW PASSWORD - ADMIN</div>
            </div>
            <div class="card-body">
                <form runat="server" id="formSetANewPassword">
                    <asp:Panel ID="pnlWarning" runat="server" Visible="false">
                        <div class="form-group card-header text-center">
                            <div class="alert-danger">
                                <asp:Label ID="lblWarning" runat="server" Text="Label" CssClass="col-form-label text-center"></asp:Label>
                            </div>
                        </div>
                    </asp:Panel>
                    <br>
                    <div class="form-group">
                        <label for="lblNewPassword">New Password</label>
                        <asp:TextBox ID="txtNewPassword" runat="server" CssClass="form-control" placeholder="Enter your new password" TextMode="Password" MaxLength="16"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvNewPassword" runat="server" ErrorMessage="No New Password Found!" ControlToValidate="txtNewPassword" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                    </div>
                    <div class="form-group">
                        <label for="lblConfirmNewPassword">Confirm New Password</label>
                        <asp:TextBox ID="txtConfirmNewPassword" runat="server" CssClass="form-control" placeholder="Enter your confirm new password" TextMode="Password" MaxLength="16"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvConfirmNewPassword" runat="server" ErrorMessage="No Confirm New Password!" ControlToValidate="txtConfirmNewPassword" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                    </div>
                    <asp:CompareValidator ID="cv1" runat="server" ErrorMessage="Your New Password and Confirm New Password are not the same!" ControlToValidate="txtNewPassword" Display="Dynamic" ForeColor="Red" ControlToCompare="txtConfirmNewPassword"></asp:CompareValidator>
                    <div class="form-group">
                        <div class="form-check">
                            <div class="form-check-input remembermecustom">
                                <input type="checkbox" id="pass" onclick="showpass(this);" />
                                Show Password
                            </div>
                            <script type="text/javascript">
                                function showpass(check_box) {
                                    var txtNewPassword = document.getElementById("txtNewPassword");
                                    var txtConfirmNewPassword = document.getElementById("txtConfirmNewPassword");
                                    if (check_box.checked) {
                                        txtNewPassword.setAttribute("type", "text");
                                        txtConfirmNewPassword.setAttribute("type", "text");
                                    } else {
                                        txtNewPassword.setAttribute("type", "password");
                                        txtConfirmNewPassword.setAttribute("type", "password");
                                    }
                                }
                            </script>
                        </div>
                    </div>
                    <br />
                    <br />
                    <div class="text-center">
                        <asp:Button ID="btnConfirm" runat="server" Text="Submit" CssClass="btn btn-primary" Width="148px" OnClick="btnConfirm_Click" />
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
