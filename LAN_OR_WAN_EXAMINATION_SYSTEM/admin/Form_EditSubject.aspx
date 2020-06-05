<%@ Page Language="C#" MasterPageFile="../admin/Admin.Master" AutoEventWireup="true" CodeBehind="Form_EditSubject.aspx.cs" Inherits="LAN_OR_WAN_EXAMINATION_SYSTEM.admin.Form_EditSubject" %>

<asp:Content ID="Content1" ContentPlaceHolderID="maincontent" runat="Server">
    <div class=" col-md-12">
        <div class="card">
            <div class="btn-group bg-danger">
                <asp:Button ID="btnpnlSubjectList" runat="server" Text="Edit Subject" CssClass="btn btn-info" BorderStyle="None" CausesValidation="False" BackColor="#343A40" />
            </div>
            <div class="card-body">
                <div class="row form-group">
                    <div class="col-md-4">
                        <h6>Subject Name</h6>
                        <asp:TextBox ID="txtSubjectEdit" runat="server" CssClass="form-control" Enabled="false"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvSubject" runat="server" ErrorMessage="No subject found!" ControlToValidate="txtSubjectEdit" ForeColor="red"></asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="row form-group">
                    <div class="col-md-4">
                        <h6>Select Category</h6>
                        <asp:DropDownList ID="ddlCategoryEdit" runat="server" CssClass="form-control" DataTextField="name" DataValueField="id">
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="rfvCategory" runat="server" ErrorMessage="You must select a category" ControlToValidate="ddlCategoryEdit" ForeColor="red" InitialValue="-1"></asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="card-footer">
                    <div class="offset-2">
                        <asp:Button ID="btnUpdate" runat="server" Text="Update" CssClass="btn" BackColor="#343A40" BorderStyle="None" ForeColor="White" OnClick="btnUpdate_Click" OnClientClick="return confirm('Are you sure you want to update ?')" />
                        <asp:Button ID="btnCancel" runat="server" Text="Cancel" CssClass="btn" BackColor="#343A40" BorderStyle="None" ForeColor="White" OnClick="btnCancel_Click" OnClientClick="return confirm('Are you sure you want to cancel ?')" />
                    </div>
                    <asp:Panel ID="pnlEditSubjectWarning" runat="server" Visible="false">
                        <br />
                        <div class="alert alert-danger text-center">
                            <asp:Label ID="lblEditSubjectWarning" runat="server" />
                        </div>
                    </asp:Panel>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
