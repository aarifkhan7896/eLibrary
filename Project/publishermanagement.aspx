<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="publishermanagement.aspx.cs" Inherits="Project.publishermanagement" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        $(document).ready(function () {
            $(".table").prepend($("<thead></thead>").append($(this).find("tr:first"))).dataTable();
        });
    </script>
    <style>
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
            <div class="col-md-6">
                <div class="card mt-5" style="width: 40rem; margin: auto;">
                    <div class="card-body">
                        <h5 class="card-title fs-1 text-muted fw-bold text-center">Publisher Details</h5>
                        <hr />
                        <div class="innerCard p-4">
                            <asp:Label ID="Label1" runat="server" Text="Publisher ID" CssClass="label fs-4"></asp:Label>
                            <div class="input-group mb-4">
                                <asp:TextBox ID="publisher" ClientIDMode="Static" runat="server" CssClass="form-control fs-4" placeholder="Enter Publisher ID"></asp:TextBox>
                                <asp:Button ID="search" runat="server" Text="Go" CssClass="btn btn-outline-dark fs-4 py-1 px-5" />
                            </div>
                            <div class="mb-4">
                                <asp:Label ID="Label2" runat="server" Text="Publisher Name" CssClass="label fs-4"></asp:Label>
                                <asp:TextBox ID="publishername" ClientIDMode="Static" runat="server" CssClass="form-control fs-4" placeholder="Enter Publisher Name"></asp:TextBox>
                            </div>
                            <div class="d-flex justify-content-evenly">
                                <asp:Button ID="insert" runat="server" CssClass="btn btn-primary fs-4 py-2 px-5" Text="Add" OnClick="insert_Click" />
                                <asp:Button ID="update" runat="server" CssClass="btn btn-outline-success fs-4 py-2 px-5" Text="Update" OnClick="update_Click" />
                                <asp:Button ID="delete" runat="server" CssClass="btn btn-outline-danger fs-4 py-2 px-5" Text="Delete" OnClick="delete_Click" />
                            </div>
                        </div>

                    </div>
                </div>
            </div>
            <div class="col-md-6">
                <div class="grid-view mt-5">
                    <h5 class="card-title fs-1 text-muted fw-bold text-center">Publisher List</h5>
                    <hr />
                    <div class="mb-5"></div>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ProjectConnectionString %>" SelectCommand="SELECT * FROM [publisher]"></asp:SqlDataSource>
                    <asp:GridView ID="GridView1" CssClass="table table-striped cell-border" runat="server" AutoGenerateColumns="False" DataKeyNames="publisher_id" DataSourceID="SqlDataSource1">
                        <Columns>
                            <asp:BoundField DataField="publisher_id" HeaderText="Publisher Id" ReadOnly="True" SortExpression="publisher_id" />
                            <asp:BoundField DataField="publisher_name" HeaderText="Publisher Name" SortExpression="publisher_name" />
                        </Columns>
                    </asp:GridView>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
