<%@ Page Language="C#" MasterPageFile="Admin.Master" AutoEventWireup="true" CodeBehind="Form_EditMyAccount.aspx.cs" Inherits="LAN_OR_WAN_EXAMINATION_SYSTEM.admin.Form_EditMyAccount" %>

<asp:Content ID="Content1" ContentPlaceHolderID="maincontent" runat="Server">
    <div class="col-md-12">
        <div class="card">
            <div class="btn-group bg-danger">
                <asp:Button ID="btnpnlEditMyAccount" runat="server" Text="Edit My Account" CssClass="btn btn-info" BorderStyle="None" CausesValidation="False" BackColor="#343A40" />
            </div>
            <div class="card-body">
                <div class="row form-group">
                    <div class="col-md-4">
                        <h6>Email</h6>
                        <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" Enabled="false"></asp:TextBox>
                    </div>
                </div>
                <div class="row form-group">
                    <div class="col-md-4">
                        <h6>Password (Optional)</h6>
                        <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control" TextMode="Password" MaxLength="16"></asp:TextBox>
                    </div>
                </div>
                <div class="row form-group">
                    <div class="col-md-4">
                        <h6>Full Name</h6>
                        <asp:TextBox ID="txtFullName" runat="server" CssClass="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvFullName" runat="server" ErrorMessage="No Full Name found!" ControlToValidate="txtFullName" ForeColor="red"></asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="row form-group">
                    <div class="col-md-4">
                        <h6>Secret Question</h6>
                        <asp:DropDownList ID="ddlSecretQuestion" runat="server" CssClass="form-control">
                            <asp:ListItem>None</asp:ListItem>
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
                        <asp:Label ID="lblNoSecretQuestionFound" runat="server" Text="No Secret Question found!" ForeColor="Red" Visible="False"></asp:Label>
                    </div>
                </div>
                <div class="row form-group">
                    <div class="col-md-4">
                        <h6>Secret Answer (Optional)</h6>
                        <asp:TextBox ID="txtSecretAnswer" runat="server" CssClass="form-control" TextMode="Password" MaxLength="16"></asp:TextBox>
                    </div>
                </div>
                <div class="row form-group">
                    <div class="col-md-4">
                        <h6>Account Status</h6>
                        <asp:DropDownList ID="ddlAccountStatus" runat="server" CssClass="form-control" DataTextField="name" DataValueField="id">
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="rfvAccountStatus" runat="server" ErrorMessage="No Account Status found!" ControlToValidate="ddlAccountStatus" ForeColor="red" InitialValue="-1"></asp:RequiredFieldValidator>
                    </div>
                </div>
            </div>
            <div class="card-footer">
                <div class="offset-2">
                    <asp:Button ID="btnUpdate" runat="server" Text="Update" CssClass="btn" BackColor="#343A40" BorderStyle="None" ForeColor="White" OnClick="btnUpdate_Click" OnClientClick="return confirm('Are you sure you want to update ?')" />
                    <asp:Button ID="btnCancel" runat="server" Text="Cancel" CssClass="btn" BackColor="#343A40" BorderStyle="None" ForeColor="White" OnClick="btnCancel_Click" OnClientClick="return confirm('Are you sure you want to cancel ?')" />
                </div>
                <asp:Panel ID="pnlEditMyAccountWarning" runat="server" Visible="false">
                    <br />
                    <div class="alert alert-danger text-center">
                        <asp:Label ID="lblEditMyAccountWarning" runat="server" />
                    </div>
                </asp:Panel>
            </div>
        </div>
    </div>
</asp:Content>
