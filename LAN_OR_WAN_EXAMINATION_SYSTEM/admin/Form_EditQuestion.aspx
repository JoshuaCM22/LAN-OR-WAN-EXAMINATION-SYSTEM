<%@ Page Language="C#" MasterPageFile="Admin.Master" AutoEventWireup="true" CodeBehind="Form_EditQuestion.aspx.cs" Inherits="LAN_OR_WAN_EXAMINATION_SYSTEM.admin.Form_EditQuestion" %>

<asp:Content ID="Content1" ContentPlaceHolderID="maincontent" runat="Server">
    <div class="col-md-12">
        <div class="card">
            <div class="btn-group bg-danger">
                <asp:Button ID="btnpnlEditQuestion" runat="server" Text="Edit Question" CssClass="btn btn-info" BorderStyle="None" CausesValidation="False" BackColor="#343A40" />
            </div>
            <div class="card-body">
                <div class="row form-group">
                    <div class="col-md-4">
                        <h6>Exam Name</h6>
                        <asp:DropDownList ID="ddlEditExam" runat="server" CssClass="form-control" DataTextField="name" DataValueField="id">
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="rfvEditExam" runat="server" ErrorMessage="No Exam Name found!" ControlToValidate="ddlEditExam" ForeColor="red" InitialValue="-1" SetFocusOnError="true"></asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="row form-group">
                    <div class="col-md-9">
                        <h6>Question</h6>
                        <asp:TextBox ID="txtEditQuestion" runat="server" TextMode="MultiLine" CssClass="form-control" Height="150px" Enabled="false"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvEditQuestion" runat="server" ErrorMessage="No Question found!" ControlToValidate="txtEditQuestion" ForeColor="red"></asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="row form-group">
                    <div class="col-md-9">
                        <h6>Option One</h6>
                        <asp:TextBox ID="txtEditOptionOne" runat="server" CssClass="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvOptionOne" runat="server" ErrorMessage="No Option One found!" ControlToValidate="txtEditOptionOne" ForeColor="red"></asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="row form-group">
                    <div class="col-md-9">
                        <h6>Option Two</h6>
                        <asp:TextBox ID="txtEditOptionTwo" runat="server" CssClass="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvOptionTwo" runat="server" ErrorMessage="No Option Two found!" ControlToValidate="txtEditOptionTwo" ForeColor="red"></asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="row form-group">
                    <div class="col-md-9">
                        <h6>Option Three</h6>
                        <asp:TextBox ID="txtEditOptionThree" runat="server" CssClass="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvOptionThree" runat="server" ErrorMessage="No Option Three found!" ControlToValidate="txtEditOptionThree" ForeColor="red"></asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="row form-group">
                    <div class="col-md-9">
                        <h6>Option Four</h6>
                        <asp:TextBox ID="txtEditOptionFour" runat="server" CssClass="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvOptionFour" runat="server" ErrorMessage="No Option Four found!" ControlToValidate="txtEditOptionFour" ForeColor="red"></asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="row form-group">
                    <div class="col-md-4">
                        <h6>Correct Answer</h6>
                        <asp:RadioButtonList ID="rblEditCorrectAnswer" runat="server" RepeatDirection="Horizontal" RepeatLayout="Table" CellPadding="10">
                            <asp:ListItem Text="Option One" Value="1"></asp:ListItem>
                            <asp:ListItem Text="Option Two" Value="2"></asp:ListItem>
                            <asp:ListItem Text="Option Three" Value="3"></asp:ListItem>
                            <asp:ListItem Text="Option Four" Value="4"></asp:ListItem>
                        </asp:RadioButtonList>
                        <asp:RequiredFieldValidator ID="rfvEditCorrectAnswer" runat="server" ErrorMessage="No Correct Answer found!" ControlToValidate="rblEditCorrectAnswer" ForeColor="red"></asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="card-footer">
                    <div class="offset-2">
                        <asp:Button ID="btnUpdate" runat="server" Text="Update" CssClass="btn" BackColor="#343A40" BorderStyle="None" ForeColor="White" OnClick="btnUpdate_Click" OnClientClick="return confirm('Are you sure you want to update ?')" />
                        <asp:Button ID="btnCancel" runat="server" Text="Cancel" CssClass="btn" BackColor="#343A40" BorderStyle="None" ForeColor="White" OnClick="btnCancel_Click" OnClientClick="return confirm('Are you sure you want to cancel ?')" />
                    </div>
                    <asp:Panel ID="pnlEditQuestionWarning" runat="server" Visible="false">
                        <br />
                        <div class="alert alert-danger text-center">
                            <asp:Label ID="lblEditQuestionWarning" runat="server" />
                        </div>
                    </asp:Panel>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
