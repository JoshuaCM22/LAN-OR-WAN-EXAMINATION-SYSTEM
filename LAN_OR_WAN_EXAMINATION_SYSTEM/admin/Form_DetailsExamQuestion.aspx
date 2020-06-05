<%@ Page Language="C#" MasterPageFile="Admin.master" AutoEventWireup="true" CodeBehind="Form_DetailsExamQuestion.aspx.cs" Inherits="LAN_OR_WAN_EXAMINATION_SYSTEM.admin.Form_DetailsExamQuestion" %>

<asp:Content ID="Content1" ContentPlaceHolderID="maincontent" runat="Server">
    <div class="col-md-12">
        <div class="card">
            <div class="btn-group bg-danger">
                <asp:Button ID="btnDetailsExamQuestion" runat="server" Text="Details Exam Question" CssClass="btn btn-info" BorderStyle="None" CausesValidation="False" BackColor="#343A40" />
            </div>
            <div class="card mb-0">
                <div class="card-body">
                    <div class="table table-responsive">
                        <asp:DetailsView ID="gvExamDetails" runat="server" GridLines="None" CssClass="table table-bordered" AutoGenerateRows="False">
                            <Fields>
                                <asp:BoundField DataField="EXAM NAME" HeaderText="Exam Name">
                                    <HeaderStyle Font-Bold="true" CssClass="col-md-0" />
                                </asp:BoundField>
                                <asp:BoundField DataField="QUESTION" HeaderText="Question">
                                    <HeaderStyle Font-Bold="true" CssClass="col-md-0" />
                                </asp:BoundField>
                                <asp:BoundField DataField="OPTION ONE" HeaderText="Option One">
                                    <HeaderStyle Font-Bold="true" CssClass="col-md-0" />
                                </asp:BoundField>
                                <asp:BoundField DataField="OPTION TWO" HeaderText="Option Two">
                                    <HeaderStyle Font-Bold="true" CssClass="col-md-0" />
                                </asp:BoundField>
                                <asp:BoundField DataField="OPTION THREE" HeaderText="Option Three">
                                    <HeaderStyle Font-Bold="true" CssClass="col-md-0" />
                                </asp:BoundField>
                                <asp:BoundField DataField="OPTION FOUR" HeaderText="Option Four">
                                    <HeaderStyle Font-Bold="true" CssClass="col-md-0" />
                                </asp:BoundField>
                                <asp:BoundField DataField="CORRECT ANSWER" HeaderText="Correct answer">
                                    <HeaderStyle Font-Bold="true" CssClass="col-md-0" />
                                </asp:BoundField>
                                <asp:BoundField DataField="CREATED BY" HeaderText="Created by">
                                    <HeaderStyle Font-Bold="true" CssClass="col-md-0" />
                                </asp:BoundField>
                            </Fields>
                            <FooterTemplate>
                                <br />
                                <asp:Button ID="btnBackQuestion" runat="server" Text="Back" CssClass="btn btn-info" BackColor="#343A40" BorderStyle="None" ForeColor="White" PostBackUrl="~/admin/Form_Questions.aspx" Width="98px" />
                            </FooterTemplate>
                            <HeaderStyle CssClass="text-center" />
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
