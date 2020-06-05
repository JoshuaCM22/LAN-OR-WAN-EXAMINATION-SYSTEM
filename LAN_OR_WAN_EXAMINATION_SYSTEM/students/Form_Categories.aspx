<%@ Page Title="" Language="C#" MasterPageFile="../students/Student.Master" AutoEventWireup="true" CodeBehind="Form_Categories.aspx.cs" Inherits="LAN_OR_WAN_EXAMINATION_SYSTEM.students.Form_Categories" %>

<asp:Content ID="Content1" ContentPlaceHolderID="maincontentplaceholder" runat="Server">
    <hr />
    <h2 class="text-center">Categories</h2>
    <br>
    <div class="row">
        <asp:Repeater ID="rptCategoryList" runat="server">
            <ItemTemplate>
                <div class="col-lg-3 mb-3">
                    <div class="card h-100 text-center">
                        <h4 class="card-header"><%# Eval("name") %></h4>
                        <div class="card-footer">
                            <asp:HyperLink ID="btnCategory" runat="server" CssClass="btn btn-primary" ForeColor="White" NavigateUrl='<%# "../students/Form_CategoryItem.aspx?categoryId=" +  Eval("id") %>'>Go to subjects</asp:HyperLink>
                        </div>
                    </div>
                </div>
            </ItemTemplate>
        </asp:Repeater>
        <div class="col-md-12">
            <div class="card">
                <div class="card-header">
                    <asp:Panel ID="pnlCategoryShowWarning" runat="server" Visible="false">
                        <br />
                        <div class="alert alert-danger text-center">
                            <asp:Label ID="lblCategoryShowWarning" runat="server" />
                        </div>
                    </asp:Panel>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
