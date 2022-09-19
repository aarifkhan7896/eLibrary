<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="usermanagement.aspx.cs" Inherits="Project.usermanagement" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        $(document).ready(function () {
            $(".table").prepend($("<thead></thead>").append($(this).find("tr:first"))).dataTable();
        });
    </script>

    <style>
        .label {
            font-size: 1.5rem;
        }

        input[type="text"], input[type="password"] {
            font-size: 1.5rem;
            padding: .5rem 1rem;
        }

        th {
            font-size: 1.5rem;
        }

        td {
            font-size: 1.3rem;
        }

        input[type="search"] {
            padding: 0 .5rem;
        }

            input[type="search"]:focus {
                outline: none;
            }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div class="row">
            <div class="col-md-6 mt-5 p-5">
                <h4 class="text-muted fs-1 fw-bold text-center mb-5">User Details</h4>
                <div class="input-group mb-3">
                    <asp:TextBox ID="searchBox" runat="server" placeholder="Enter User ID" CssClass="form-control"></asp:TextBox>
                    <asp:Button ID="Search" runat="server" CssClass="btn btn-primary px-5 py-1 fs-3" Text="Go" OnClick="Search_Click" />
                </div>
                <div class="mb-5 text-center">
                    <div class="d-flex justify-content-evenly mt-3">
                        <asp:Button ID="approve" runat="server" Text="Approve" OnClick="approve_Click" CssClass="btn btn-success px-5 py-1 fs-4" />
                        <asp:Button ID="reject" runat="server" Text="Reject" OnClick="reject_Click" CssClass="btn btn-danger px-5 py-1 fs-4" />
                        <asp:Button ID="pending" runat="server" Text="Pending" OnClick="pending_Click" CssClass="btn btn-warning px-5 py-1 fs-4" />
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-6">
                        <div class="form-group mb-4">
                            <asp:Label ID="Label1" runat="server" Text="First Name" CssClass="label"></asp:Label>
                            <asp:TextBox ID="fname" ClientIDMode="Static" runat="server" CssClass="form-control" ReadOnly="true" disabled="disabled"></asp:TextBox>
                        </div>
                        <div class="form-group mb-4">
                            <asp:Label ID="Label3" runat="server" Text="Email" CssClass="label"></asp:Label>
                            <asp:TextBox ID="email" ClientIDMode="Static" runat="server" CssClass="form-control" ReadOnly="true" disabled="disabled"></asp:TextBox>
                        </div>
                        <div class="form-group mb-4">
                            <asp:Label ID="Label5" runat="server" Text="Contact" CssClass="label"></asp:Label>
                            <asp:TextBox ID="contact" ClientIDMode="Static" runat="server" CssClass="form-control" ReadOnly="true" disabled="disabled"></asp:TextBox>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-group mb-4">
                            <asp:Label ID="Label2" runat="server" Text="Last Name" CssClass="label"></asp:Label>
                            <asp:TextBox ID="lname" ClientIDMode="Static" runat="server" CssClass="form-control" ReadOnly="true" disabled="disabled"></asp:TextBox>
                        </div>
                        <div class="form-group mb-4">
                            <asp:Label ID="Label6" runat="server" Text="Address" CssClass="label"></asp:Label>
                            <asp:TextBox ID="address" ClientIDMode="Static" runat="server" CssClass="form-control" ReadOnly="true" disabled="disabled"></asp:TextBox>
                        </div>
                        <div class="form-group mb-4">
                            <asp:Label ID="Label7" runat="server" Text="Pincode" CssClass="label"></asp:Label>
                            <asp:TextBox ID="pincode" ClientIDMode="Static" runat="server" CssClass="form-control" ReadOnly="true" disabled="disabled"></asp:TextBox>
                        </div>
                    </div>
                    <div class="text-center mb-4">
                        <asp:Button ID="deleteBtn" ClientIDMode="Static" runat="server" Text="Delete User" CssClass="btn btn-danger w-100 fs-4 py-2 px-5" OnClick="deleteBtn_Click" />
                    </div>
                </div>
            </div>
            <div class="col-md-6 mt-5 p-3">
                <h4 class="text-muted fs-1 fw-bold text-center mb-5">User List</h4>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ProjectConnectionString %>" SelectCommand="SELECT * FROM [members]"></asp:SqlDataSource>
                <asp:GridView ID="GridView1" runat="server" CssClass="table table-striped cell-border" AutoGenerateColumns="False" DataKeyNames="user_id" DataSourceID="SqlDataSource1">
                    <Columns>
                        <asp:BoundField DataField="user_id" HeaderText="user_id" InsertVisible="False" ReadOnly="True" SortExpression="user_id" />
                        <asp:BoundField DataField="first_name" HeaderText="first_name" SortExpression="first_name" />
                        <asp:BoundField DataField="last_name" HeaderText="last_name" SortExpression="last_name" />
                        <asp:BoundField DataField="email" HeaderText="email" SortExpression="email" />
                        <asp:BoundField DataField="contact" HeaderText="contact" SortExpression="contact" />
                        <asp:BoundField DataField="status" HeaderText="status" SortExpression="status" />
                    </Columns>
                </asp:GridView>
            </div>

        </div>

    </div>
</asp:Content>
