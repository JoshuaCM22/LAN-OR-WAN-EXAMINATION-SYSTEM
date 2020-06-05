<%@ Page Language="C#" MasterPageFile="Admin.Master" AutoEventWireup="true" CodeBehind="Form_Questions.aspx.cs" Inherits="LAN_OR_WAN_EXAMINATION_SYSTEM.admin.Form_Questions" %>

<asp:Content ID="Content1" ContentPlaceHolderID="maincontent" runat="Server">
    <div class="col-12">
        <h1>Questions</h1>
        <hr />
        <br />
        Search By:
        <asp:DropDownList ID="ddlFilter" runat="server" Height="30px" Width="115px">
            <asp:ListItem Selected="True">None</asp:ListItem>
            <asp:ListItem>Exam Name</asp:ListItem>
            <asp:ListItem>Question</asp:ListItem>
        </asp:DropDownList>
        <asp:TextBox ID="txtSearch" runat="server" Width="195px"></asp:TextBox>
        <br />
        <br />
        <asp:Button ID="btnSearch" CssClass="btn btn-primary" ForeColor="White" runat="server" Text="Search" Width="98px" OnClick="btnSearch_Click"></asp:Button>
        <br />
        <br />
        <br />
        <br />
    </div>
    <div class="col-md-12">
        <div class="card">
            <div class="btn-group bg-danger">
                <asp:Button ID="btnpnlQuestionList" runat="server" Text="Question List" CssClass="btn btn-info" BorderStyle="None" CausesValidation="False" BackColor="#343A40" />
            </div>
        </div>
        <div class="card text-center mb-3">
            <div class="card-body">
                <div class="table-responsive">
                    <asp:GridView ID="gvExamQuestionList" runat="server" GridLines="None" CssClass="table table-bordered" AutoGenerateColumns="False" OnRowCommand="gvExamQuestionList_RowCommand" AllowPaging="True" OnPageIndexChanging="gvExamQuestionList_PageIndexChanging" PageSize="5">
                        <Columns>
                            <asp:TemplateField HeaderText="Exam Name">
                                <ItemTemplate>
                                    <asp:Label ID="lblExamName" runat="server" Text='<%# Bind("[EXAM NAME]") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Question">
                                <ItemTemplate>
                                    <asp:Label ID="lblQuestion" runat="server" Text='<%# Bind("QUESTION") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Options">
                                <ItemTemplate>
                                    <asp:HyperLink ID="btnDetailsExam" runat="server" CssClass="btn" BackColor="#343A40" BorderStyle="None" ForeColor="White" NavigateUrl='<%# "~/admin/Form_DetailsExamQuestion.aspx?questionId=" + Eval("id") %>'>
                                            <i class="fa fa-info-circle" aria-hidden="true"></i> Details
                                    </asp:HyperLink>
                                    <br />
                                    <br />
                                    <asp:HyperLink ID="btnEditExam" runat="server" CssClass="btn" BackColor="#343A40" BorderStyle="None" ForeColor="White" NavigateUrl='<%# "~/admin/Form_EditQuestion.aspx?questionId=" + Eval("id") %>'>
                                            <i class="fa fa-pencil-square-o" aria-hidden="true"></i> Edit
                                    </asp:HyperLink>
                                    <br />
                                    <br />
                                    <asp:LinkButton ID="btnDeleteExam" runat="server" CssClass="btn" BackColor="#343A40" BorderStyle="None" ForeColor="White" CommandArgument='<%# Eval("id") %>' CommandName="DeleteQuestion" OnClientClick="return confirm('Are you sure you want to delete ?')">
                                            <i class="fa fa-trash" aria-hidden="true"></i> Delete
                                    </asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                        <EmptyDataTemplate>
                            No Questions found!                   
                        </EmptyDataTemplate>
                        <PagerStyle CssClass="card-footer" HorizontalAlign="Right" />
                    </asp:GridView>
                </div>
                <asp:Panel ID="pnlExamQuestionWarning" runat="server" Visible="false">
                    <div class="card-footer">
                        <br />
                        <div class="alert alert-danger text-center">
                            <asp:Label ID="lblExamQuestionWarning" runat="server" />
                        </div>
                    </div>
                </asp:Panel>
            </div>
        </div>
    </div>
</asp:Content>
