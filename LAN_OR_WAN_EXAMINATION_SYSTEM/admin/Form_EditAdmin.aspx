<%@ Page Language="C#" MasterPageFile="Admin.Master" AutoEventWireup="true" CodeBehind="Form_EditAdmin.aspx.cs" Inherits="LAN_OR_WAN_EXAMINATION_SYSTEM.admin.Form_EditAdmin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="maincontent" runat="Server">
    <div class="col-md-12">
        <div class="card">
            <div class="btn-group bg-danger">
                <asp:Button ID="btnpnlEditAdmin" runat="server" Text="Edit Admin Details" CssClass="btn btn-info" BorderStyle="None" CausesValidation="False" BackColor="#343A40" />
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
                <asp:Panel ID="pnlEditAdminWarning" runat="server" Visible="false">
                    <br />
                    <div class="alert alert-danger text-center">
                        <asp:Label ID="lblEditAdminWarning" runat="server" />
                    </div>
                </asp:Panel>
            </div>
        </div>
    </div>
    </div>
</asp:Content>
