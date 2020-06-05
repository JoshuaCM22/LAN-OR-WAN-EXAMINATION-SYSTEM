<%@ Page Language="C#" MasterPageFile="Admin.Master" AutoEventWireup="true" CodeBehind="Form_Categories.aspx.cs" Inherits="LAN_OR_WAN_EXAMINATION_SYSTEM.admin.Form_Categories" %>

<asp:Content ID="Content1" ContentPlaceHolderID="maincontent" runat="Server">
    <div class="col-12">
        <h1>Categories</h1>
        <hr />
        <br />
        Category Name:
        <asp:TextBox ID="txtSearch" runat="server" Width="195px"></asp:TextBox>
        <asp:Button ID="btnSearch" CssClass="btn btn-primary" ForeColor="White" runat="server" Text="Search" Width="80px" OnClick="btnSearch_Click"></asp:Button>
        <br />
        <br />
        <br />
        <br />
    </div>
    <div class="col-md-12">
        <div class="card">
            <div class="btn-group bg-danger">
                <asp:Button ID="btnpnlCategoryList" runat="server" Text="Category List" CssClass="btn btn-info" OnClick="btnpnlCategoryList_Click" BorderStyle="None" CausesValidation="False" />
                <asp:Button ID="btnpnlAddCategory" runat="server" Text="Add Category" CssClass="btn btn-info" OnClick="btnpnlAddCategory_Click" BorderStyle="None" CausesValidation="False" />
            </div>
            <asp:Panel ID="pnlAddCategory" runat="server">
                <div class="card-body">
                    <div class="row form-group">
                        <div class="col-md-4">
                            <h6>Category Name</h6>
                            <asp:TextBox ID="txtCategory" runat="server" CssClass="form-control"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvCategory" runat="server" ErrorMessage="No Category Found!" ControlToValidate="txtCategory" ForeColor="red"></asp:RequiredFieldValidator>
                        </div>
                    </div>
                    <div class="card-footer">
                        <div class="offset-2">
                            <asp:Button ID="btnAddCategory" runat="server" Text="Add Category" CssClass="btn" BackColor="#343A40" BorderStyle="None" ForeColor="White" OnClick="btnAddCategory_Click" />
                        </div>
                        <asp:Panel ID="pnlAddCategoryWarning" runat="server" Visible="false">
                            <br />
                            <div class="alert alert-danger text-center">
                                <asp:Label ID="lblCategoryAddWarning" runat="server" />
                            </div>
                        </asp:Panel>
                    </div>
                </div>
            </asp:Panel>
            <asp:Panel ID="pnlCategoryList" runat="server">
                <div class="card text-center mb-3">
                    <div class="card-body">
                        <div class="table-responsive">
                            <asp:GridView ID="gvCategoryList" runat="server" CssClass="table table-bordered" GridLines="None" AutoGenerateColumns="False" OnRowCommand="gvCategoryList_RowCommand" AllowPaging="True" PageSize="5" OnPageIndexChanging="gvCategoryList_PageIndexChanging">
                                <Columns>
                                    <asp:BoundField DataField="name" HeaderText="Category Name">
                                        <HeaderStyle CssClass="card-header" />
                                    </asp:BoundField>
                                    <asp:TemplateField HeaderText="Options">
                                        <HeaderStyle CssClass="card-header" />
                                        <ItemTemplate>
                                            <asp:HyperLink ID="hlEditCategory" runat="server" CssClass="btn" BackColor="#343A40" BorderStyle="None" ForeColor="White" NavigateUrl='<%# "~/admin/Form_EditCategory.aspx?categoryId=" + Eval("id")%>'>
                                            <i class="fa fa-pencil-square-o" aria-hidden="true"></i> Edit
                                            </asp:HyperLink>
                                            <asp:LinkButton ID="lbtnDeleteCategory" runat="server" CssClass="btn" BackColor="#343A40" BorderStyle="None" ForeColor="White" CommandArgument='<%# Eval("id") %>' CommandName="deleteCategory" OnClientClick="return confirm('Are you sure you want to delete ?')">
                                            <i class="fa fa-trash" aria-hidden="true"></i> Delete
                                            </asp:LinkButton>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                                <EmptyDataTemplate>
                                    No Categories found!                
                                </EmptyDataTemplate>
                                <PagerStyle CssClass="card-footer" HorizontalAlign="Right" />
                            </asp:GridView>
                        </div>
                        <asp:Panel ID="pnlCategoryListWarning" runat="server" Visible="false">
                            <div class="card-footer">
                                <br />
                                <div class="alert alert-danger text-center">
                                    <asp:Label ID="lblCategoryListWarning" runat="server" />
                                </div>
                            </div>
                        </asp:Panel>
                    </div>
                </div>
            </asp:Panel>
        </div>
    </div>
</asp:Content>
