<%@ Page Title="" Language="C#" MasterPageFile="../students/Student.Master" AutoEventWireup="true" CodeBehind="Form_CategoryItem.aspx.cs" Inherits="LAN_OR_WAN_EXAMINATION_SYSTEM.students.Form_CategoryItem" %>

<asp:Content ID="Content1" ContentPlaceHolderID="maincontentplaceholder" runat="Server">
    <hr />
    <asp:Button ID="btnBack" CssClass="btn btn-primary" ForeColor="White" runat="server" Text="BACK"
        OnClientClick="JavaScript:window.history.back(1);return false;"></asp:Button>
    <hr />
    <h3 class="text-center">Category : 
        <asp:Label ID="lblCategorySubject" runat="server"></asp:Label>
        - All Subjects
    </h3>
    <br />
    <div class="row">
        <asp:Repeater ID="rptCategoryItem" runat="server">
            <ItemTemplate>
                <div class="col-lg-3 mb-3">
                    <div class="card h-100 text-center">
                        <h4 class="card-header"><%# Eval("SUBJECT NAME") %></h4>
                        <div class="card-footer">
                            <asp:HyperLink ID="btnCategory" runat="server" CssClass="btn btn-primary" ForeColor="White" NavigateUrl='<%# "../students/Form_SubjectExam.aspx?subjectId=" +  Eval("id") %>'>Go to exams</asp:HyperLink>
                        </div>
                    </div>
                </div>
            </ItemTemplate>
        </asp:Repeater>
        <div class="col-md-12">
            <div class="card">
                <div class="card-header">
                    <asp:Panel ID="pnlSubjectShowWarning" runat="server" Visible="false">
                        <br />
                        <div class="alert alert-danger text-center">
                            <asp:Label ID="lblSubjectShowWarning" runat="server" />
                        </div>
                    </asp:Panel>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
