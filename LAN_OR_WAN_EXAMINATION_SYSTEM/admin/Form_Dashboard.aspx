<%@ Page Title="" Language="C#" MasterPageFile="../admin/Admin.Master" AutoEventWireup="true" CodeBehind="Form_Dashboard.aspx.cs" Inherits="LAN_OR_WAN_EXAMINATION_SYSTEM.admin.Form_Dashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="maincontent" runat="Server">
    <div class="col-12">
        <h1>Dashboard</h1>
        <hr />
    </div>
    <div class="col-xl-4 col-sm-6 mb-4">
        <div class="card text-white bg-primary o-hidden h-100">
            <div class="card-body">
                <div class="mr-5">
                    <h5>TOTAL CATEGORIES -
                    <asp:Label ID="lblTotalCategories" runat="server"></asp:Label>
                    </h5>
                </div>
            </div>
            <a class="card-footer text-white clearfix small z-1" href="Form_Categories.aspx">
                <span class="float-left">View Details</span>
                <span class="float-right">
                    <i class="fa fa-angle-right"></i>
                </span>
            </a>
        </div>
    </div>
    <div class="col-xl-4 col-sm-6 mb-4">
        <div class="card text-white bg-primary o-hidden h-100">
            <div class="card-body">
                <div class="mr-5">
                    <h5>TOTAL SUBJECTS -
                    <asp:Label ID="lblTotalSubjects" runat="server"></asp:Label>
                    </h5>
                </div>
            </div>
            <a class="card-footer text-white clearfix small z-1" href="Form_Subjects.aspx">
                <span class="float-left">View Details</span>
                <span class="float-right">
                    <i class="fa fa-angle-right"></i>
                </span>
            </a>
        </div>
    </div>
    <div class="col-xl-4 col-sm-6 mb-4">
        <div class="card text-white bg-primary o-hidden h-100">
            <div class="card-body">
                <div class="mr-5">
                    <h5>TOTAL EXAMS -
                    <asp:Label ID="lblTotalExams" runat="server"></asp:Label>
                    </h5>
                </div>
                <div class="mr-5">
                    Active - 
                    <asp:Label ID="lblExamActive" runat="server"></asp:Label>
                </div>
                <div class="mr-5">
                    Inactive -
                    <asp:Label ID="lblExamInactive" runat="server"></asp:Label>
                </div>
            </div>
            <a class="card-footer text-white clearfix small z-1" href="Form_Exams.aspx">
                <span class="float-left">View Details</span>
                <span class="float-right">
                    <i class="fa fa-angle-right"></i>
                </span>
            </a>
        </div>
    </div>
    <br />
    <div class="col-xl-4 col-sm-6 mb-4">
        <div class="card text-white bg-primary o-hidden h-100">
            <div class="card-body">
                <div class="mr-5">
                    <h5>TOTAL QUESTIONS -
                    <asp:Label ID="lblTotalQuestions" runat="server"></asp:Label>
                    </h5>
                </div>
            </div>
            <a class="card-footer text-white clearfix small z-1" href="Form_Questions.aspx">
                <span class="float-left">View Details</span>
                <span class="float-right">
                    <i class="fa fa-angle-right"></i>
                </span>
            </a>
        </div>
    </div>
    <div class="col-xl-4 col-sm-6 mb-4">
        <div class="card text-white bg-primary o-hidden h-100">
            <div class="card-body">
                <div class="mr-5">
                    <h5>TOTAL RESULTS -
                    <asp:Label ID="lblTotalResults" runat="server"></asp:Label>
                    </h5>
                </div>
                <div class="mr-5">
                    Today -
                    <asp:Label ID="lblToday" runat="server"></asp:Label>
                </div>
                <div class="mr-5">
                    Previous -
                    <asp:Label ID="lblPrevious" runat="server"></asp:Label>
                </div>
            </div>
            <a class="card-footer text-white clearfix small z-1" href="Form_Results.aspx">
                <span class="float-left">View Details</span>
                <span class="float-right">
                    <i class="fa fa-angle-right"></i>
                </span>
            </a>
        </div>
    </div>
    <div class="col-xl-4 col-sm-6 mb-4">
        <div class="card text-white bg-primary o-hidden h-100">
            <div class="card-body">
                <div class="mr-5">
                    <h5>TOTAL STUDENTS -
                    <asp:Label ID="lblTotalStudents" runat="server"></asp:Label>
                    </h5>
                </div>
            </div>
            <a class="card-footer text-white clearfix small z-1" href="Form_Students.aspx">
                <span class="float-left">View Details</span>
                <span class="float-right">
                    <i class="fa fa-angle-right"></i>
                </span>
            </a>
        </div>
    </div>
    <div class="col-md-12">
        <div class="card">
            <div class="card-header">
                <asp:Panel ID="pnlWarning" runat="server" Visible="false">
                    <div class="card-footer">
                        <br />
                        <div class="alert alert-danger text-center">
                            <asp:Label ID="lblWarning" runat="server" />
                        </div>
                    </div>
                </asp:Panel>
            </div>
        </div>
    </div>
</asp:Content>
