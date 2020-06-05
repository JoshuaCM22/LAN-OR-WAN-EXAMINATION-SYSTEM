<%@ Page Language="C#" MasterPageFile="Admin.Master" AutoEventWireup="true" CodeBehind="Form_EditExam.aspx.cs" Inherits="LAN_OR_WAN_EXAMINATION_SYSTEM.admin.Form_EditExam" %>

<asp:Content ID="Content1" ContentPlaceHolderID="maincontent" runat="Server">
    <div class=" col-md-12">
        <div class="card">
            <div class="btn-group bg-danger">
                <asp:Button ID="btnpnlEditExam" runat="server" Text="Edit Exam" CssClass="btn btn-info" BorderStyle="None" CausesValidation="False" BackColor="#343A40" />
            </div>
            <div class="card-body">
                <div class="row form-group">
                    <div class="col-md-4">
                        <h6>Select Category</h6>
                        <asp:DropDownList ID="ddlCategoryExam" runat="server" CssClass="form-control" DataTextField="name" DataValueField="id">
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="rfvCategory" runat="server" ErrorMessage="No Category found!" ControlToValidate="ddlCategoryExam" ForeColor="red" InitialValue="-1"></asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="row form-group">
                    <div class="col-md-4">
                        <h6>Select Subject</h6>
                        <asp:DropDownList ID="ddlSubjectExam" runat="server" CssClass="form-control" DataTextField="name" DataValueField="id">
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="rfvSubjectExam" runat="server" ErrorMessage="No Subject found!" ControlToValidate="ddlSubjectExam" ForeColor="red" InitialValue="-1"></asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="row form-group">
                    <div class="col-md-4">
                        <h6>Exam Name</h6>
                        <asp:TextBox ID="txtExamName" runat="server" CssClass="form-control" Enabled="false"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvExamName" runat="server" ErrorMessage="No Exam Name found!" ControlToValidate="txtExamName" ForeColor="red"></asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="row form-group">
                    <div class="col-md-9">
                        <h6>Description (Optional)</h6>
                        <asp:TextBox ID="txtDescription" runat="server" TextMode="MultiLine" CssClass="form-control" Height="150px"></asp:TextBox>
                    </div>
                </div>
                <div class="row form-group">
                    <div class="col-md-4">
                        <h6>Duration Time</h6>
                        <asp:TextBox ID="txtHours" runat="server" CssClass="form-control" placeholder="Hours - Please enter two digit number" TextMode="SingleLine" MaxLength="2"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvHours" runat="server" ErrorMessage="No Hours found!" ControlToValidate="txtHours" ForeColor="red" Display="Dynamic"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="revHours" runat="server" ErrorMessage="Enter two digit number" ControlToValidate="txtHours" ForeColor="red" ValidationExpression="^\d{1,45}$" Display="Dynamic"></asp:RegularExpressionValidator>
                        <asp:RegularExpressionValidator ID="revTwoDigitHours" runat="server" ErrorMessage="Please enter two digit number" ControlToValidate="txtHours" ForeColor="red" ValidationExpression="^\d{2}$" Display="Dynamic"></asp:RegularExpressionValidator>
                        <br />
                        <asp:TextBox ID="txtMinutes" runat="server" CssClass="form-control" placeholder="Minutes - Please enter two digit number" TextMode="SingleLine"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvMinutes" runat="server" ErrorMessage="No Minutes found!" ControlToValidate="txtMinutes" ForeColor="red" Display="Dynamic"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="revMinutes" runat="server" ErrorMessage="Enter two digit number" ControlToValidate="txtMinutes" ForeColor="red" ValidationExpression="^\d{1,45}$" Display="Dynamic"></asp:RegularExpressionValidator>
                        <asp:RegularExpressionValidator ID="revTwoDigitMinutes" runat="server" ErrorMessage="Please enter two digit number" ControlToValidate="txtMinutes" ForeColor="red" ValidationExpression="^\d{2}$" Display="Dynamic"></asp:RegularExpressionValidator>
                        <br />
                        <asp:TextBox ID="txtSeconds" runat="server" CssClass="form-control" placeholder="Seconds - Please enter two digit number" TextMode="SingleLine"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvSeconds" runat="server" ErrorMessage="No Seconds found!" ControlToValidate="txtSeconds" ForeColor="red" Display="Dynamic"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="revSeconds" runat="server" ErrorMessage="Enter two digit number" ControlToValidate="txtSeconds" ForeColor="red" ValidationExpression="^\d{1,45}$" Display="Dynamic"></asp:RegularExpressionValidator>
                        <asp:RegularExpressionValidator ID="revTwoDigitSeconds" runat="server" ErrorMessage="Please enter two digit number" ControlToValidate="txtSeconds" ForeColor="red" ValidationExpression="^\d{2}$" Display="Dynamic"></asp:RegularExpressionValidator>
                    </div>
                </div>
                <div class="row form-group">
                    <div class="col-md-4">
                        <h6>Total Question</h6>
                        <asp:TextBox ID="txtTotalQuestion" runat="server" CssClass="form-control" TextMode="SingleLine"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvTotalQuestion" runat="server" ErrorMessage="No Total Question found!" ControlToValidate="txtTotalQuestion" ForeColor="red" Display="Dynamic"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="revTotalQuestion" runat="server" ErrorMessage="Enter a valid total question" ControlToValidate="txtTotalQuestion" ForeColor="red" ValidationExpression="^\d{1,45}$" Display="Dynamic"></asp:RegularExpressionValidator>
                    </div>
                </div>
                <div class="row form-group">
                    <div class="col-md-4">
                        <h6>Pass Mark</h6>
                        <asp:TextBox ID="txtPassMark" runat="server" CssClass="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvPassMark" runat="server" ErrorMessage="No Pass Mark found!" ControlToValidate="txtPassMark" ForeColor="red" Display="Dynamic"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="revPassMark" runat="server" ErrorMessage="Enter a valid pass mark" ControlToValidate="txtPassMark" ForeColor="red" ValidationExpression="^\d{1,45}$" Display="Dynamic"></asp:RegularExpressionValidator>
                    </div>
                </div>
                <div class="row form-group">
                    <div class="col-md-4">
                        <h6>Status</h6>
                        <asp:DropDownList ID="ddlStatusExam" runat="server" CssClass="form-control" DataTextField="name" DataValueField="id">
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="rfvStatusExam" runat="server" ErrorMessage="No Status found!" ControlToValidate="ddlStatusExam" ForeColor="red" InitialValue="-1"></asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="card-footer">
                    <div class="offset-2">
                        <asp:Button ID="btnUpdate" runat="server" Text="Update" CssClass="btn" BackColor="#343A40" BorderStyle="None" ForeColor="White" OnClick="btnUpdate_Click" OnClientClick="return confirm('Are you sure you want to update ?')" />
                        <asp:Button ID="btnCancel" runat="server" Text="Cancel" CssClass="btn" BackColor="#343A40" BorderStyle="None" ForeColor="White" OnClick="btnCancel_Click" OnClientClick="return confirm('Are you sure you want to cancel ?')" />
                    </div>
                    <asp:Panel ID="pnlEditExamWarning" runat="server" Visible="false">
                        <br />
                        <div class="alert alert-danger text-center">
                            <asp:Label ID="lblExamEditWarning" runat="server" />
                        </div>
                    </asp:Panel>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
