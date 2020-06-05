<%@ Page Language="C#" MasterPageFile="Admin.Master" AutoEventWireup="true" CodeBehind="Form_Admins.aspx.cs" Inherits="LAN_OR_WAN_EXAMINATION_SYSTEM.admin.Form_Admins" %>

<asp:Content ID="Content1" ContentPlaceHolderID="maincontent" runat="Server">
    <div class="col-12">
        <h1>Admins</h1>
        <hr />
        <br />
        Search By:
        <asp:DropDownList ID="ddlFilter" runat="server" Height="30px" Width="135px">
            <asp:ListItem Selected="True">None</asp:ListItem>
            <asp:ListItem>Email</asp:ListItem>
            <asp:ListItem>Full Name</asp:ListItem>
            <asp:ListItem>Account Status</asp:ListItem>
        </asp:DropDownList>
        <asp:TextBox ID="txtSearch" runat="server" Width="200px"></asp:TextBox>
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
                <asp:Button ID="btnpnlAdminList" runat="server" Text="Admin List" CssClass="btn btn-info" OnClick="btnpnlAdminList_Click" BorderStyle="None" CausesValidation="False" />
                <asp:Button ID="btnpnlAddAdmin" runat="server" Text="Add Admin" CssClass="btn btn-info" OnClick="btnpnlAddAdmin_Click" BorderStyle="None" CausesValidation="False" />
            </div>
            <asp:Panel ID="pnlAddAdmin" runat="server">
                <div class="card-body">
                    <div class="row form-group">
                        <div class="col-md-4">
                            <h6>Email</h6>
                            <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" TextMode="Email" MaxLength="50"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ErrorMessage="No Email found!" ControlToValidate="txtEmail" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="revEmail" runat="server" ErrorMessage="Enter validate email!" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ControlToValidate="txtEmail" Display="Dynamic" ForeColor="Red"></asp:RegularExpressionValidator>
                        </div>
                    </div>
                    <div class="row form-group">
                        <div class="col-md-4">
                            <h6>Password</h6>
                            <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control" TextMode="Password" MaxLength="16"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvPassword" runat="server" ErrorMessage="No Password found!" ControlToValidate="txtPassword" ForeColor="red" Display="Dynamic"></asp:RequiredFieldValidator>
                        </div>
                    </div>
                    <div class="row form-group">
                        <div class="col-md-4">
                            <h6>Full Name</h6>
                            <asp:TextBox ID="txtFullName" runat="server" CssClass="form-control"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvFullName" runat="server" ErrorMessage="No Full Name found!" ControlToValidate="txtFullName" ForeColor="red"></asp:RequiredFieldValidator>
                        </div>
                    </div>
                    <div class="row form-group">
                        <div class="col-md-4">
                            <h6>Secret Question</h6>
                            <asp:DropDownList ID="ddlSecretQuestion" runat="server" CssClass="form-control">
                                <asp:ListItem Selected="True">None</asp:ListItem>
                                <asp:ListItem>What is your favorite color?</asp:ListItem>
                                <asp:ListItem>What is your contact number?</asp:ListItem>
                                <asp:ListItem>When is your birthday?</asp:ListItem>
                                <asp:ListItem>What is love for you?</asp:ListItem>
                                <asp:ListItem>Where were you born ?</asp:ListItem>
                                <asp:ListItem>What is the meaning of life?</asp:ListItem>
                                <asp:ListItem>What is your gender?</asp:ListItem>
                                <asp:ListItem>What is your civil status in life?</asp:ListItem>
                                <asp:ListItem>What is your dream in life?</asp:ListItem>
                                <asp:ListItem>What things that makes you happy?</asp:ListItem>
                                <asp:ListItem>What things that makes you sad?</asp:ListItem>
                                <asp:ListItem>What things that makes you mad?</asp:ListItem>
                                <asp:ListItem>What is your job?</asp:ListItem>
                                <asp:ListItem>What is your favorite song?</asp:ListItem>
                                <asp:ListItem>What is your favorite band?</asp:ListItem>
                                <asp:ListItem>What is your favorite singer?</asp:ListItem>
                            </asp:DropDownList>
                            <asp:Label ID="lblNoSecretQuestionFound" runat="server" Text="No Secret Question found!" ForeColor="Red" Visible="False"></asp:Label>
                        </div>
                    </div>
                    <div class="row form-group">
                        <div class="col-md-4">
                            <h6>Secret Answer</h6>
                            <asp:TextBox ID="txtSecretAnswer" runat="server" CssClass="form-control" TextMode="Password" MaxLength="16"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvSecretAnswer" runat="server" ErrorMessage="No Secret Answer found!" ControlToValidate="txtSecretAnswer" ForeColor="red" Display="Dynamic"></asp:RequiredFieldValidator>
                        </div>
                    </div>
                    <br />
                    <br />
                    <div class="card-footer">
                        <div class="offset-2">
                            <asp:Button ID="btnAddAdmin" runat="server" Text="Add Admin" CssClass="btn" BackColor="#343A40" BorderStyle="None" ForeColor="White" OnClick="btnAddAdmin_Click" />
                        </div>
                        <asp:Panel ID="pnlAddAdminWarning" runat="server" Visible="false">
                            <br />
                            <div class="alert alert-danger text-center">
                                <asp:Label ID="lblAdminAddWarning" runat="server" />
                            </div>
                        </asp:Panel>
                    </div>
                </div>
            </asp:Panel>
            <asp:Panel ID="pnlAdminList" runat="server">
                <div class="card text-center mb-3">
                    <div class="card-body">
                        <div class="table-responsive">
                            <asp:GridView ID="gvAdminList" runat="server" GridLines="None" AllowPaging="True" AutoGenerateColumns="False" CssClass="table table-bordered" PageSize="8" OnPageIndexChanging="gvAdminList_PageIndexChanging">
                                <Columns>
                                    <asp:BoundField DataField="email" HeaderText="Email" />
                                    <asp:BoundField DataField="FULL NAME" HeaderText="Full Name" />
                                    <asp:BoundField DataField="ACCOUNT STATUS" HeaderText="Account Status" />
                                    <asp:TemplateField HeaderText="Options">
                                        <ItemTemplate>
                                            <asp:HyperLink ID="hlEditExam" runat="server" CssClass="btn" BackColor="#343A40" BorderStyle="None" ForeColor="White" NavigateUrl='<%# "~/admin/Form_EditAdmin.aspx?adminId=" + Eval("id") %>'>
                                            <i class="fa fa-pencil-square-o" aria-hidden="true"></i> Edit
                                    </asp:HyperLink>
                                            <br />
                                            <br />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>
                        </div>
                        <asp:Panel ID="pnlAdminListShowWarning" runat="server" Visible="false">
                            <div class="card-footer">
                                <br />
                                <div class="alert alert-danger text-center">
                                    <asp:Label ID="lblAdminListShowWarning" runat="server" />
                                </div>
                            </div>
                        </asp:Panel>
                    </div>
                </div>
            </asp:Panel>
        </div>
    </div>
</asp:Content>
