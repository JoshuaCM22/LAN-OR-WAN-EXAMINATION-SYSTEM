<%@ Page Language="C#" MasterPageFile="Admin.master" AutoEventWireup="true" CodeBehind="Form_AddQuestion.aspx.cs" Inherits="LAN_OR_WAN_EXAMINATION_SYSTEM.admin.Form_AddQuestion" %>

<asp:Content ID="Content1" ContentPlaceHolderID="maincontent" runat="Server">
    <div class="col-md-12">
        <div class="card">
            <div class="btn-group bg-danger">
                <asp:Button ID="btnpnlAddQuestion" runat="server" Text="Add Question" CssClass="btn btn-info" BorderStyle="None" CausesValidation="False" BackColor="#343A40" />
            </div>
            <div class="card-body">
                <div class="row form-group">
                    <div class="col-md-9">
                        <h6>Question</h6>
                        <asp:TextBox ID="txtQuestion" runat="server" TextMode="MultiLine" CssClass="form-control" Height="150px"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvQuestion" runat="server" ErrorMessage="No Question found!" ControlToValidate="txtQuestion" ForeColor="red"></asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="row form-group">
                    <div class="col-md-9">
                        <h6>Option One</h6>
                        <asp:TextBox ID="txtOptionOne" runat="server" CssClass="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvOptionOne" runat="server" ErrorMessage="No Option One found!" ControlToValidate="txtOptionOne" ForeColor="red"></asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="row form-group">
                    <div class="col-md-9">
                        <h6>Option Two</h6>
                        <asp:TextBox ID="txtOptionTwo" runat="server" CssClass="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvOptionTwo" runat="server" ErrorMessage="No Option Two found!" ControlToValidate="txtOptionTwo" ForeColor="red"></asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="row form-group">
                    <div class="col-md-9">
                        <h6>Option Three</h6>
                        <asp:TextBox ID="txtOptionThree" runat="server" CssClass="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvOptionThree" runat="server" ErrorMessage="No Option Three found!" ControlToValidate="txtOptionThree" ForeColor="red"></asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="row form-group">
                    <div class="col-md-9">
                        <h6>Option Four</h6>
                        <asp:TextBox ID="txtOptionFour" runat="server" CssClass="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvOptionFour" runat="server" ErrorMessage="No Option Four found!" ControlToValidate="txtOptionFour" ForeColor="red"></asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="row form-group">
                    <div class="col-md-4">
                        <h6>Correct Answer</h6>
                        <asp:RadioButtonList ID="rblCorrectAnswer" runat="server" RepeatDirection="Horizontal" RepeatLayout="Table" CellPadding="10">
                            <asp:ListItem Text="Option One" Value="1"></asp:ListItem>
                            <asp:ListItem Text="Option Two" Value="2"></asp:ListItem>
                            <asp:ListItem Text="Option Three" Value="3"></asp:ListItem>
                            <asp:ListItem Text="Option Four" Value="4"></asp:ListItem>
                        </asp:RadioButtonList>
                        <asp:RequiredFieldValidator ID="rfvEditCorrectAnswer" runat="server" ErrorMessage="No Correct Answer found!" ControlToValidate="rblCorrectAnswer" ForeColor="red"></asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="card-footer">
                    <div class="offset-2">
                        <asp:Button ID="btnAddQuestion" runat="server" Text="Add Question" CssClass="btn" BackColor="#343A40" BorderStyle="None" ForeColor="White" OnClick="btnAddQuestion_Click" />
                        <asp:Button ID="btnBack" runat="server" Text="Back" CssClass="btn" BackColor="#343A40" BorderStyle="None" ForeColor="White" OnClick="btnBack_Click" Width="98px" />
                    </div>
                    <asp:Panel ID="pnlAddQuestionWarning" runat="server" Visible="false">
                        <br />
                        <div class="alert alert-danger text-center">
                            <asp:Label ID="lblAddQuestionWarning" runat="server" />
                        </div>
                    </asp:Panel>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
