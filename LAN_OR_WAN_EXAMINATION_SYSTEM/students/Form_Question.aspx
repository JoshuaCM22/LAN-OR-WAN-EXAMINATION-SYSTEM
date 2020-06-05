<%@ Page Title="" Language="C#" MasterPageFile="../students/Student.Master" AutoEventWireup="true" CodeBehind="Form_Question.aspx.cs" Inherits="LAN_OR_WAN_EXAMINATION_SYSTEM.students.Form_Question" %>

<asp:Content ID="Content1" ContentPlaceHolderID="maincontentplaceholder" runat="Server">
    <br />
    <h3 class="text-center">Answer all questions.</h3>
    <hr />
    <asp:GridView ID="gvExamQuestion" runat="server" AutoGenerateColumns="False" GridLines="None">
        <Columns>
            <asp:TemplateField>
                <ItemTemplate>
                    <asp:Label ID="lblId" runat="server" Text='<%# Eval("id") %>' Visible="false"></asp:Label>
                    <%=noOfQuestion = noOfQuestion + 1%><asp:Label ID="lblQuestion" runat="server" Text='<%# ") " + Eval("QUESTION") %>'></asp:Label>
                    <br />
                    A
                    <asp:RadioButton ID="rbtnOptionOne" runat="server" GroupName="a" />
                    <asp:Label ID="lblOptionOne" runat="server" Text='<%#Eval("OPTION ONE")%>'></asp:Label>
                    <br />
                    B
                    <asp:RadioButton ID="rbtnOptionTwo" runat="server" GroupName="a" />
                    <asp:Label ID="lblOptionTwo" runat="server" Text='<%#Eval("OPTION TWO")%>'></asp:Label>
                    <br />
                    C
                    <asp:RadioButton ID="rbtnOptionThree" runat="server" GroupName="a" />
                    <asp:Label ID="lblOptionThree" runat="server" Text='<%#Eval("OPTION THREE")%>'></asp:Label>
                    <br />
                    D
                    <asp:RadioButton ID="rbtnOptionFour" runat="server" GroupName="a" />
                    <asp:Label ID="lblOptionFour" runat="server" Text='<%#Eval("OPTION FOUR")%>'></asp:Label>
                    <hr />
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
    <asp:Button ID="btnSubmit" runat="server" Text="Submit" CssClass="btn btn-success" OnClick="btnSubmit_Click"
        ClientIDMode="Static" />
    <asp:Button ID="btnBack" CssClass="btn btn-primary" ForeColor="White" runat="server" Text="BACK"
        OnClientClick="JavaScript:window.history.back(1);return false;"></asp:Button>
    <br />
    <br />
    <div class="col-md-12">
        <div class="card">
            <div class="card-header">
                <asp:Panel ID="pnlQuestionShowWarning" runat="server" Visible="false">
                    <br />
                    <div class="alert alert-danger text-center">
                        <asp:Label ID="lblQuestionShowWarning" runat="server" />
                    </div>
                </asp:Panel>
            </div>
        </div>
    </div>
    <br />
    <script src="../assets/custom/js/custom.js"></script>
</asp:Content>
