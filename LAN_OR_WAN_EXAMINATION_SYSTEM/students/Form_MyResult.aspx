<%@ Page Title="" Language="C#" AutoEventWireup="true" MasterPageFile="../students/Student.Master" CodeBehind="Form_MyResult.aspx.cs" Inherits="LAN_OR_WAN_EXAMINATION_SYSTEM.students.Form_MyResult" %>

<asp:Content ID="Content1" ContentPlaceHolderID="maincontentplaceholder" runat="Server">
    <br />
    <hr />
    <div class="text-center">
        Search By:
        <asp:DropDownList ID="ddlFilter" runat="server" Height="30px" Width="140px">
            <asp:ListItem Selected="True">None</asp:ListItem>
            <asp:ListItem>Exam Name</asp:ListItem>
            <asp:ListItem>Total Question</asp:ListItem>
            <asp:ListItem>Your Score</asp:ListItem>
            <asp:ListItem>Status</asp:ListItem>
            <asp:ListItem>Date and Time</asp:ListItem>
        </asp:DropDownList>
        <asp:TextBox ID="txtSearch" runat="server" Width="220px"></asp:TextBox>
        <br />
        <br />
        <asp:Button ID="btnSearch" CssClass="btn btn-primary" ForeColor="White" runat="server" Text="Search" Width="98px" OnClick="btnSearch_Click"></asp:Button>
    </div>
    <hr />
    <br />
    <div class="card-header">
        <h2 class="text-center">My Results</h2>
    </div>
    <asp:GridView ID="gvMyResult" runat="server" GridLines="None" AllowPaging="True" AutoGenerateColumns="False" CssClass="table table-bordered" OnPageIndexChanging="gvMyResult_PageIndexChanging" PageSize="8">
        <Columns>
            <asp:BoundField DataField="EXAM NAME" HeaderText="Exam Name" NullDisplayText="no exam name" />
            <asp:BoundField DataField="TOTAL QUESTION" HeaderText="Total Question" />
            <asp:BoundField DataField="SCORE" HeaderText="Your Score" />
            <asp:BoundField DataField="STATUS" HeaderText="Status" />
            <asp:BoundField DataField="DATE AND TIME" HeaderText="Date and Time" NullDisplayText="There is some problem to find exam date" />
        </Columns>
    </asp:GridView>
    <div class="col-md-12">
        <div class="card">
            <div class="card-header">
                <asp:Panel ID="pnlMyResultShowWarning" runat="server" Visible="false">
                    <br />
                    <div class="alert alert-danger text-center">
                        <asp:Label ID="lblMyResultShowWarning" runat="server" />
                    </div>
                </asp:Panel>
            </div>
        </div>
    </div>
</asp:Content>
