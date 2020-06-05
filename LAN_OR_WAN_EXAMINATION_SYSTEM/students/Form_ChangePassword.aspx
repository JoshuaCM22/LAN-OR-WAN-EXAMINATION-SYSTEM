<%@ Page Title="" Language="C#" MasterPageFile="Student.Master" AutoEventWireup="true" CodeBehind="Form_ChangePassword.aspx.cs" Inherits="LAN_OR_WAN_EXAMINATION_SYSTEM.students.Form_ChangePassword" %>

<asp:Content ID="Content1" ContentPlaceHolderID="maincontentplaceholder" runat="Server">
    <div class="col-md-12">
        <div class="card">
            <br />
            <br />
            <h3 class="text-center">Change Password</h3>
            <div class="card-body">
                <div class="row form-group">
                    <div class="col-md-4">
                        Current Password
                        <asp:TextBox ID="txtCurrentPassword" runat="server" CssClass="form-control" TextMode="Password" MaxLength="16"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvCurrentPassword" runat="server" ErrorMessage="No Current Password Found!" ControlToValidate="txtCurrentPassword" ForeColor="red" Display="Dynamic"></asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="row form-group">
                    <div class="col-md-4">
                        New Password
                        <asp:TextBox ID="txtNewPassword" runat="server" CssClass="form-control" TextMode="Password" MaxLength="16"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvNewPassword" runat="server" ErrorMessage="No New Password Found!" ControlToValidate="txtNewPassword" ForeColor="red" Display="Dynamic"></asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="row form-group">
                    <div class="col-md-4">
                        Confirm New Password
                        <asp:TextBox ID="txtConfirmNewPassword" runat="server" CssClass="form-control" TextMode="Password" MaxLength="16"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvConfirmNewPassword" runat="server" ErrorMessage="No Confirm New Password Found!" ControlToValidate="txtConfirmNewPassword" ForeColor="red" Display="Dynamic"></asp:RequiredFieldValidator>
                    </div>
                </div>
                <asp:CompareValidator ID="cvNewPasswordAndConfirmNewPassword" runat="server" ErrorMessage="Your New Password and Confirm New Password are not the same" ControlToValidate="txtConfirmNewPassword" ControlToCompare="txtNewPassword" ForeColor="Red" Display="Dynamic"></asp:CompareValidator>
            </div>
            <div class="col-md-4">
                <asp:Button ID="btnChangePassword" runat="server" Text="Change Password" CssClass="btn btn-info" BorderStyle="None" BackColor="#343A40" OnClick="btnChangePassword_Click" Height="41px" Width="200px" />
            </div>
            <br />
            <div class="card-footer">
                <asp:Panel ID="pnlChangePasswordWarning" runat="server" Visible="false">
                    <br />
                    <div class="alert alert-danger text-center">
                        <asp:Label ID="lblChangePasswordWarning" runat="server" />
                    </div>
                </asp:Panel>
            </div>
        </div>
    </div>
</asp:Content>
