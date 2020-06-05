<%@ Page Title="" Language="C#" MasterPageFile="../students/Student.Master" AutoEventWireup="true" CodeBehind="Form_SubjectExam.aspx.cs" Inherits="LAN_OR_WAN_EXAMINATION_SYSTEM.students.Form_SubjectExam" %>

<asp:Content ID="Content1" ContentPlaceHolderID="maincontentplaceholder" runat="Server">
    <hr />
    <asp:Button ID="btnBack" CssClass="btn btn-primary" ForeColor="White" runat="server" Text="BACK"
        OnClientClick="JavaScript:window.history.back(1);return false;"></asp:Button>
    <hr />
    <h2 class="text-center">All     
        <asp:Label ID="lblSubjectExam" runat="server"></asp:Label>
        Subject Exams</h2>
    <hr />
    <div class="row">
        <asp:Repeater ID="rptSujectExam" runat="server" OnItemDataBound="rptSujectExam_ItemDataBound">
            <ItemTemplate>
                <div class="col-lg-4 mb-4">
                    <div class="card h-100">
                        <h3 class="card-header">Exam name: <%# examName = Convert.ToString(Eval("NAME")) %></h3>
                        <ul class="list-group list-group-flush">
                            <li class="list-group-item">Description: <%# Eval("DESCRIPTION") %></li>
                            <li class="list-group-item">Total Question: <%# Eval("TOTAL QUESTION") %></li>
                            <li class="list-group-item">Pass Mark: <%# Eval("PASS MARK") %></li>
                            <li class="list-group-item">Duration Time: <%# Eval("DURATION TIME") %></li>
                            <li class="list-group-item">
                                <asp:Label ID="lblDeactivatedNotification" runat="server" Text="This exam is not yet active!" ForeColor="Red" Font-Bold="True"></asp:Label>
                                <asp:HyperLink ID="hlTakeExam" runat="server" CssClass="btn btn-primary" ForeColor="White" NavigateUrl='<%# "../students/Form_Question.aspx?examId=" + Eval("id")%>' Text="Take exam"></asp:HyperLink>
                                <asp:Label ID="lblTakenNotification" runat="server" Text="You taken this exam today!" ForeColor="Red" Font-Bold="True"></asp:Label>
                            </li>
                        </ul>
                    </div>
                </div>
            </ItemTemplate>
        </asp:Repeater>
        <div class="col-md-12">
            <div class="card">
                <div class="card-header">
                    <asp:Panel ID="pnlExamShowWarning" runat="server" Visible="false">
                        <br />
                        <div class="alert alert-danger text-center">
                            <asp:Label ID="lblExamShowWarning" runat="server" />
                        </div>
                    </asp:Panel>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
