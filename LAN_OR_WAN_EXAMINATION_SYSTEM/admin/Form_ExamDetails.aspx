<%@ Page Language="C#" MasterPageFile="Admin.Master" AutoEventWireup="true" CodeBehind="Form_ExamDetails.aspx.cs" Inherits="LAN_OR_WAN_EXAMINATION_SYSTEM.admin.Form_ExamDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="maincontent" runat="Server">
    <div class="col-md-12">
        <div class="card">
            <div class="btn-group bg-danger">
                <asp:Button ID="btnpnlDetailsExam" runat="server" Text="Exam Details" CssClass="btn btn-info" BorderStyle="None" CausesValidation="False" BackColor="#343A40" />
            </div>
            <div class="card mb-2">
                <div class="card-body">
                    <div class="table table-responsive">
                        <asp:DetailsView ID="dvExamDetails" runat="server" Height="50px" GridLines="None" CssClass="table table-bordered" AutoGenerateRows="False">
                            <Fields>
                                <asp:BoundField DataField="CATEGORY NAME" HeaderText="Category Name">
                                    <HeaderStyle Font-Bold="true" CssClass="col-md-0" />
                                </asp:BoundField>
                                <asp:BoundField DataField="SUBJECT NAME" HeaderText="Subject Name">
                                    <HeaderStyle Font-Bold="true" CssClass="col-md-0" />
                                </asp:BoundField>
                                <asp:BoundField DataField="name" HeaderText="Exam Name">
                                    <HeaderStyle Font-Bold="true" CssClass="col-md-0" />
                                </asp:BoundField>
                                <asp:BoundField DataField="description" HeaderText="Description">
                                    <HeaderStyle Font-Bold="true" CssClass="col-md-0" />
                                </asp:BoundField>
                                <asp:BoundField DataField="DURATION TIME" HeaderText="Duration Time">
                                    <HeaderStyle Font-Bold="true" CssClass="col-md-0" />
                                </asp:BoundField>
                                <asp:BoundField DataField="TOTAL QUESTION" HeaderText="Total Question">
                                    <HeaderStyle Font-Bold="true" CssClass="col-md-0" />
                                </asp:BoundField>
                                <asp:BoundField DataField="PASS MARK" HeaderText="Pass Mark">
                                    <HeaderStyle Font-Bold="true" CssClass="col-md-0" />
                                </asp:BoundField>
                                <asp:BoundField DataField="CREATED DATE AND TIME" HeaderText="Created Date and Time">
                                    <HeaderStyle Font-Bold="true" CssClass="col-md-0" />
                                </asp:BoundField>
                                <asp:BoundField DataField="CREATED BY" HeaderText="Created By">
                                    <HeaderStyle Font-Bold="true" CssClass="col-md-0" />
                                </asp:BoundField>
                                <asp:BoundField DataField="STATUS" HeaderText="Status">
                                    <HeaderStyle Font-Bold="true" CssClass="col-md-0" />
                                </asp:BoundField>
                            </Fields>
                            <FooterTemplate>
                                <br />
                                <asp:Button ID="btnBack" runat="server" Text="Back" CssClass="btn btn-info" BackColor="#343A40" BorderStyle="None" ForeColor="White" PostBackUrl="~/admin/Form_Exams.aspx" Width="98px" />
                            </FooterTemplate>
                        </asp:DetailsView>
                        <asp:Panel ID="pnlExamDetailsWarning" runat="server" Visible="false">
                            <div class="card-footer">
                                <br />
                                <div class="alert alert-danger text-center">
                                    <asp:Label ID="lblExamDetailsWarning" runat="server" />
                                </div>
                            </div>
                        </asp:Panel>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
