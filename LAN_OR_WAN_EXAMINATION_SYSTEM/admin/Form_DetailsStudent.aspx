<%@ Page Language="C#" MasterPageFile="Admin.master" AutoEventWireup="true" CodeBehind="Form_DetailsStudent.aspx.cs" Inherits="LAN_OR_WAN_EXAMINATION_SYSTEM.admin.Form_DetailsStudent" %>

<asp:Content ID="Content1" ContentPlaceHolderID="maincontent" runat="Server">
    <div class="col-md-12">
        <div class="card">
            <div class="btn-group bg-danger">
                <asp:Button ID="btnpnlDetailsStudent" runat="server" Text="Details of Student" CssClass="btn btn-info" BorderStyle="None" CausesValidation="False" BackColor="#343A40" />
            </div>
            <div class="card mb-0">
                <div class="card-body">
                    <div class="table table-responsive">
                        <asp:DetailsView ID="gvStudentDetails" runat="server" GridLines="None" CssClass="table table-bordered" AutoGenerateRows="False">
                            <Fields>
                                <asp:BoundField DataField="STUDENT ID NO" HeaderText="Student ID No">
                                    <HeaderStyle Font-Bold="true" CssClass="col-md-0" />
                                </asp:BoundField>
                                <asp:BoundField DataField="email" HeaderText="Email">
                                    <HeaderStyle Font-Bold="true" CssClass="col-md-0" />
                                </asp:BoundField>
                                <asp:BoundField DataField="FULL NAME" HeaderText="Full Name">
                                    <HeaderStyle Font-Bold="true" CssClass="col-md-0" />
                                </asp:BoundField>
                                <asp:BoundField DataField="SECRET QUESTION" HeaderText="Secret Question">
                                    <HeaderStyle Font-Bold="true" CssClass="col-md-0" />
                                </asp:BoundField>
                                <asp:BoundField DataField="REGISTERED DATE TIME" HeaderText="Registered Date Time">
                                    <HeaderStyle Font-Bold="true" CssClass="col-md-0" />
                                </asp:BoundField>
                                <asp:BoundField DataField="REGISTERED BY" HeaderText="Registered By">
                                    <HeaderStyle Font-Bold="true" CssClass="col-md-0" />
                                </asp:BoundField>
                                <asp:BoundField DataField="ACCOUNT STATUS" HeaderText="Account Status">
                                    <HeaderStyle Font-Bold="true" CssClass="col-md-0" />
                                </asp:BoundField>
                            </Fields>
                            <FooterTemplate>
                                <br />
                                <asp:Button ID="btnBackStudent" runat="server" Text="Back" CssClass="btn btn-info" BackColor="#343A40" BorderStyle="None" ForeColor="White" PostBackUrl="~/admin/Form_Students.aspx" Width="98px" />
                            </FooterTemplate>
                            <HeaderStyle CssClass="text-center" />
                        </asp:DetailsView>
                        <asp:Panel ID="pnlStudentDetailsWarning" runat="server" Visible="false">
                            <div class="card-footer">
                                <br />
                                <div class="alert alert-danger text-center">
                                    <asp:Label ID="lblStudentDetailsWarning" runat="server" />
                                </div>
                            </div>
                        </asp:Panel>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
