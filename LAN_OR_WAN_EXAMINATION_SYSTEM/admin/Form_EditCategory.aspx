<%@ Page Language="C#" MasterPageFile="Admin.Master" AutoEventWireup="true" CodeBehind="Form_EditCategory.aspx.cs" Inherits="LAN_OR_WAN_EXAMINATION_SYSTEM.admin.Form_EditCategory" %>

<asp:Content ID="Content1" ContentPlaceHolderID="maincontent" runat="Server">
    <div class="col-md-12">
        <div class="card">
            <div class="btn-group bg-danger">
                <asp:Button ID="btnpnlCategoryList" runat="server" Text="Edit Category" CssClass="btn btn-info" BorderStyle="None" CausesValidation="False" BackColor="#343A40" />
            </div>
            <div class="card-body">
                <div class="row form-group">
                    <div class="col-md-4">
                        <h6>Category Name</h6>
                        <asp:TextBox ID="txtCategoryEdit" runat="server" CssClass="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvCategory" runat="server" ErrorMessage="Enter category" ControlToValidate="txtCategoryEdit" ForeColor="red"></asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="card-footer">
                    <div class="offset-2">
                        <asp:Button ID="btnUpdate" runat="server" Text="Update" CssClass="btn" BackColor="#343A40" BorderStyle="None" ForeColor="White" OnClick="btnUpdate_Click" OnClientClick="return confirm('Are you sure you want to update ?')" />
                        <asp:Button ID="btnCancel" runat="server" Text="Cancel" CssClass="btn" BackColor="#343A40" BorderStyle="None" ForeColor="White" OnClick="btnCancel_Click" OnClientClick="return confirm('Are you sure you want to cancel ?')" />
                    </div>
                    <asp:Panel ID="pnlEditCategoryWarning" runat="server" Visible="false">
                        <br />
                        <div class="alert alert-danger text-center">
                            <asp:Label ID="lblEditCategoryWarning" runat="server" />
                        </div>
                    </asp:Panel>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
