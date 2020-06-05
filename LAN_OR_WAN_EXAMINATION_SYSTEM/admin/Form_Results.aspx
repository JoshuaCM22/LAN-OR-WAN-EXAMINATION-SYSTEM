<%@ Page Language="C#" MasterPageFile="Admin.Master" AutoEventWireup="true" CodeBehind="Form_Results.aspx.cs" Inherits="LAN_OR_WAN_EXAMINATION_SYSTEM.admin.Form_Results" %>

<asp:Content ID="Content1" ContentPlaceHolderID="maincontent" runat="Server">
    <div class="col-12">
        <h1>Results</h1>
        <hr />
        <br />
        Search By:
        <asp:DropDownList ID="ddlFilter" runat="server" Height="30px" Width="135px">
            <asp:ListItem Selected="True">None</asp:ListItem>
            <asp:ListItem>Exam Name</asp:ListItem>
            <asp:ListItem>Student ID No</asp:ListItem>
            <asp:ListItem>Total Question</asp:ListItem>
            <asp:ListItem>Score</asp:ListItem>
            <asp:ListItem>Status</asp:ListItem>
            <asp:ListItem>Date and Time</asp:ListItem>
        </asp:DropDownList>
        <asp:TextBox ID="txtSearch" runat="server" Width="180px"></asp:TextBox>
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
                <asp:Button ID="btnpnlResultList" runat="server" Text="Result List" CssClass="btn btn-info" BorderStyle="None" CausesValidation="False" BackColor="#343A40" />
            </div>
            <div class="card text-center mb-3">
                <div class="card-body">
                    <div class="table-responsive">
                        <asp:GridView ID="gvResults" runat="server" GridLines="None" AllowPaging="True" AutoGenerateColumns="False" CssClass="table table-bordered" PageSize="8" OnPageIndexChanging="gvResults_PageIndexChanging">
                            <Columns>
                                <asp:BoundField DataField="EXAM NAME" HeaderText="Exam Name" />
                                <asp:BoundField DataField="STUDENT ID NO" HeaderText="Student ID No" />
                                <asp:BoundField DataField="TOTAL QUESTION" HeaderText="Total Question" />
                                <asp:BoundField DataField="SCORE" HeaderText="Score" />
                                <asp:BoundField DataField="STATUS" HeaderText="Status" />
                                <asp:BoundField DataField="DATE AND TIME" DataFormatString="{0:M/d/yy}" HeaderText="Date and Time" />
                            </Columns>
                        </asp:GridView>
                    </div>
                </div>
                <asp:Panel ID="pnlResultShowWarning" runat="server" Visible="false">
                    <div class="card-footer">
                        <br />
                        <div class="alert alert-danger text-center">
                            <asp:Label ID="lblResultShowWarning" runat="server" />
                        </div>
                    </div>
                </asp:Panel>
            </div>
        </div>
    </div>
</asp:Content>
