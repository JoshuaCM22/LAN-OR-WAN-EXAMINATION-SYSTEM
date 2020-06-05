<%@ Page Language="C#" MasterPageFile="Admin.Master" AutoEventWireup="true" CodeBehind="Form_Exams.aspx.cs" Inherits="LAN_OR_WAN_EXAMINATION_SYSTEM.admin.Form_Exams" %>

<asp:Content ID="Content1" ContentPlaceHolderID="maincontent" runat="Server">
    <div class="col-12">
        <h1>Exams</h1>
        <hr />
        <br />
        Exam Name:
        <asp:TextBox ID="txtSearch" runat="server" Width="210px"></asp:TextBox>
        <asp:Button ID="btnSearch" CssClass="btn btn-primary" ForeColor="White" runat="server" Text="Search" Width="98px" OnClick="btnSearch_Click"></asp:Button>
        <br />
        <br />
        <br />
        <br />
    </div>
    <div class="col-md-12">
        <div class="card">
            <div class="btn-group bg-danger">
                <asp:Button ID="btnpnlExamList" runat="server" Text="Exam List" CssClass="btn btn-info" BorderStyle="None" CausesValidation="False" OnClick="btnpnlExamList_Click" />
                <asp:Button ID="btnpnlAddExam" runat="server" Text="Add Exam" CssClass="btn btn-info" BorderStyle="None" CausesValidation="False" OnClick="btnpnlAddExam_Click" />
            </div>
            <asp:Panel ID="pnlAddExam" runat="server">
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
                            <asp:DropDownList ID="ddlSubjectExam" runat="server" CssClass="form-control" DataTextField="SUBJECT NAME" DataValueField="id">
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="rfvSubjectExam" runat="server" ErrorMessage="No Subject found!" ControlToValidate="ddlSubjectExam" ForeColor="red" InitialValue="-1"></asp:RequiredFieldValidator>
                        </div>
                    </div>
                    <div class="row form-group">
                        <div class="col-md-4">
                            <h6>Exam Name</h6>
                            <asp:TextBox ID="txtExamName" runat="server" CssClass="form-control"></asp:TextBox>
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
                    <div class="card-footer">
                        <div class="offset-2">
                            <asp:Button ID="btnAddExam" runat="server" Text="Add Exam" CssClass="btn" BackColor="#343A40" BorderStyle="None" ForeColor="White" OnClick="btnAddExam_Click" />
                        </div>
                        <asp:Panel ID="pnlAddExamWarning" runat="server" Visible="false">
                            <br />
                            <div class="alert alert-danger text-center">
                                <asp:Label ID="lblExamAddWarning" runat="server" />
                            </div>
                        </asp:Panel>
                    </div>
                </div>
            </asp:Panel>
            <asp:Panel ID="pnlExamList" runat="server">
                <div class="card text-center mb-3">
                    <div class="card-body">
                        <div class="table-responsive">
                            <asp:GridView ID="gvExamList" runat="server" GridLines="None" CssClass="table table-bordered" AutoGenerateColumns="False" OnRowCommand="gvExamList_RowCommand" AllowPaging="True" OnPageIndexChanging="gvExamList_PageIndexChanging" PageSize="5">
                                <Columns>
                                    <asp:BoundField DataField="name" HeaderText="Exam Name" />
                                    <asp:TemplateField HeaderText="Options">
                                        <ItemTemplate>
                                            <asp:HyperLink ID="btnDetailsExam" runat="server" CssClass="btn" BackColor="#343A40" BorderStyle="None" ForeColor="White" NavigateUrl='<%# "~/admin/Form_ExamDetails.aspx?examId=" + Eval("id") %>'>
                                            <i class="fa fa-info-circle" aria-hidden="true"></i> Details
                                            </asp:HyperLink>
                                            <br />
                                            <br />
                                            <asp:HyperLink ID="btnEditExam" runat="server" CssClass="btn" BackColor="#343A40" BorderStyle="None" ForeColor="White" NavigateUrl='<%# "~/admin/Form_EditExam.aspx?examId=" + Eval("id") %>'>
                                            <i class="fa fa-pencil-square-o" aria-hidden="true"></i> Edit
                                            </asp:HyperLink>
                                            <br />
                                            <br />
                                            <asp:LinkButton ID="btnDeleteExam" runat="server" CssClass="btn" BackColor="#343A40" BorderStyle="None" ForeColor="White" CommandArgument='<%# Eval("id") %>' CommandName="DeleteExam" OnClientClick="return confirm('Are you sure you want to delete ?')">
                                            <i class="fa fa-trash" aria-hidden="true"></i> Delete
                                            </asp:LinkButton>
                                            <br />
                                            <br />
                                            <asp:HyperLink ID="btnAddQuestion" runat="server" CssClass="btn" BackColor="#343A40" BorderStyle="None" ForeColor="White" NavigateUrl='<%# "~/admin/Form_AddQuestion.aspx?examId=" + Eval("id") %>'>
                                            <i class="fa fa-plus" aria-hidden="true"></i> Add Question
                                            </asp:HyperLink>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                                <EmptyDataTemplate>
                                    No Exams found!                               
                                </EmptyDataTemplate>
                                <PagerStyle CssClass="card-footer" HorizontalAlign="Right" />
                            </asp:GridView>
                        </div>
                        <asp:Panel ID="pnlExamListWarning" runat="server" Visible="false">
                            <div class="card-footer">
                                <br />
                                <div class="alert alert-danger text-center">
                                    <asp:Label ID="lblExamListWarning" runat="server" />
                                </div>
                            </div>
                        </asp:Panel>
                    </div>
                </div>
            </asp:Panel>
        </div>
    </div>
</asp:Content>
