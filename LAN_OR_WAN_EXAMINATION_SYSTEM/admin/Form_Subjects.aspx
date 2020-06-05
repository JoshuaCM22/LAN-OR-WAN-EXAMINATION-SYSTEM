<%@ Page Language="C#" MasterPageFile="Admin.Master" AutoEventWireup="true" CodeBehind="Form_Subjects.aspx.cs" Inherits="LAN_OR_WAN_EXAMINATION_SYSTEM.admin.Form_Subjects" %>

<asp:Content ID="Content1" ContentPlaceHolderID="maincontent" runat="Server">
    <div class="col-12">
        <h1>Subjects</h1>
        <hr />
        <br />
        Search By:
        <asp:DropDownList ID="ddlFilter" runat="server" Height="30px" Width="135px">
            <asp:ListItem Selected="True">None</asp:ListItem>
            <asp:ListItem>Subject Name</asp:ListItem>
            <asp:ListItem>Category Name</asp:ListItem>
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
                <asp:Button ID="btnpnlSubjectList" runat="server" Text="Subject List" CssClass="btn btn-info" BorderStyle="None" CausesValidation="False" OnClick="btnpnlSubjectList_Click" />
                <asp:Button ID="btnpnlAddSubject" runat="server" Text="Add Subject" CssClass="btn btn-info" BorderStyle="None" CausesValidation="False" OnClick="btnpnlAddSubject_Click" />
            </div>
            <asp:Panel ID="pnlAddSubject" runat="server">
                <div class="card-body">
                    <div class="row form-group">
                        <div class="col-md-4">
                            <h6>Subject Name</h6>
                            <asp:TextBox ID="txtSubject" runat="server" CssClass="form-control"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvSubject" runat="server" ErrorMessage="No Subject found!" ControlToValidate="txtSubject" ForeColor="red"></asp:RequiredFieldValidator>
                        </div>
                    </div>
                    <div class="row form-group">
                        <div class="col-md-4">
                            <h6>Select Category</h6>
                            <asp:DropDownList ID="ddlCategory" runat="server" CssClass="form-control" DataTextField="name" DataValueField="id">
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="rfvCategory" runat="server" ErrorMessage="No Category found!" ControlToValidate="ddlCategory" ForeColor="red" InitialValue="-1"></asp:RequiredFieldValidator>
                        </div>
                    </div>
                    <div class="card-footer">
                        <div class="offset-2">
                            <asp:Button ID="btnAddSubject" runat="server" Text="Add Subject" CssClass="btn" BackColor="#343A40" BorderStyle="None" ForeColor="White" OnClick="btnAddSubject_Click" />
                        </div>
                        <asp:Panel ID="pnlAddSubjectWarning" runat="server" Visible="false">
                            <br />
                            <div class="alert alert-danger text-center">
                                <asp:Label ID="lblAddSubjectWarning" runat="server" />
                            </div>
                        </asp:Panel>
                    </div>
                </div>
            </asp:Panel>
            <asp:Panel ID="pnlSubjectList" runat="server">
                <div class="card text-center mb-3">
                    <div class="card-body">
                        <div class="table-responsive">
                            <asp:GridView ID="gvSubjectList" runat="server" GridLines="None" AutoGenerateColumns="False" CssClass="table table-bordered" OnRowCommand="gvSubjectList_RowCommand" AllowPaging="True" OnPageIndexChanging="gvSubjectList_PageIndexChanging" PageSize="5">
                                <Columns>
                                    <asp:BoundField DataField="SUBJECT NAME" HeaderText="Subject Name" />
                                    <asp:BoundField DataField="CATEGORY NAME" HeaderText="Category Name" NullDisplayText="The subject is under no category" />
                                    <asp:TemplateField HeaderText="Options">
                                        <ItemTemplate>
                                            <asp:HyperLink ID="btnEditSubject" runat="server" CssClass="btn" BackColor="#343A40" BorderStyle="None" ForeColor="White" NavigateUrl='<%# "~/admin/Form_EditSubject.aspx?subjectId=" + Eval("id") %>'>
                                            <i class="fa fa-pencil-square-o" aria-hidden="true"></i>Edit
                                            </asp:HyperLink>
                                            <br />
                                            <br />
                                            <asp:LinkButton ID="btnDeleteSubject" runat="server" CssClass="btn" BackColor="#343A40" BorderStyle="None" ForeColor="White" CommandArgument='<%# Eval("SUBJECT NAME") %>' CommandName="DeleteRow" OnClientClick="return confirm('Are you sure you want to delete ?')">
                                            <i class="fa fa-trash" aria-hidden="true"></i>Delete
                                            </asp:LinkButton>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                                <EmptyDataTemplate>
                                    No Subjects found!                    
                                </EmptyDataTemplate>
                                <PagerStyle CssClass="card-footer" HorizontalAlign="Right" />
                            </asp:GridView>
                        </div>
                        <asp:Panel ID="pnlSubjectListWarning" runat="server" Visible="false">
                            <div class="card-footer">
                                <br />
                                <div class="alert alert-danger text-center">
                                    <asp:Label ID="lblSubjectListWarning" runat="server" />
                                </div>
                            </div>
                        </asp:Panel>
                    </div>
                </div>
            </asp:Panel>
        </div>
    </div>
</asp:Content>
