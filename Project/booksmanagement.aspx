<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="booksmanagement.aspx.cs" Inherits="Project.booksmanagement" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        $(document).ready(function () {
            $(".table").prepend($("<thead></thead>").append($(this).find("tr:first"))).dataTable();
        });
    </script>
    <style>
        span, #language, #authorname, #publishername, #date, #genre {
            font-size: 1.5rem;
        }

        input[type="text"], input[type="password"], input[type="number"] {
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
            <div class="col-md-6 mt-5">
                <div class="row">
                    <div class="col-md-6">
                        <div class="mb-3">
                            <asp:Label ID="Label1" runat="server" Text="Book ID"></asp:Label>
                            <div class="input-group">
                                <asp:TextBox ID="bookId" ClientIDMode="Static" runat="server" CssClass="form-control"></asp:TextBox>
                                <asp:Button ID="searchBtn" ClientIDMode="Static" runat="server" Text="Go" CssClass="btn btn-primary px-5 py-1 fs-3" OnClick="searchBtn_Click" />
                            </div>
                        </div>
                        <div class="mb-3">
                            <asp:Label ID="Label2" runat="server" Text="Book Name"></asp:Label>
                            <asp:TextBox ID="bookName" ClientIDMode="Static" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                        <div class="mb-3">
                            <asp:Label ID="Label3" runat="server" Text="Genre"></asp:Label>
                            <asp:DropDownList ID="genre" ClientIDMode="Static" runat="server" CssClass="form-control">
                                <asp:ListItem Text="Choose an option" Value="Action" />
                                <asp:ListItem Text="Adventure" Value="Adventure" />
                                <asp:ListItem Text="Motivation" Value="Motivation" />
                                <asp:ListItem Text="Comic" Value="Comic" />
                                <asp:ListItem Text="Health" Value="Health" />
                                <asp:ListItem Text="History" Value="History" />
                                <asp:ListItem Text="Math" Value="Math" />
                                <asp:ListItem Text="Textbook" Value="Textbook" />
                                <asp:ListItem Text="Science" Value="Science" />
                                <asp:ListItem Text="Travel" Value="Travel" />
                            </asp:DropDownList>
                        </div>
                        <div class="mb-3">
                            <asp:Label ID="Label4" runat="server" Text="Author Name"></asp:Label>
                            <asp:DropDownList ID="authorname" ClientIDMode="Static" runat="server" CssClass="form-control">
                                <asp:ListItem Text="Choose an option" Value="Action" />
                            </asp:DropDownList>
                        </div>
                        <div class="mb-3">
                            <asp:Label ID="Label5" runat="server" Text="Publisher Name"></asp:Label>
                            <asp:DropDownList ID="publishername" ClientIDMode="Static" runat="server" CssClass="form-control">
                                <asp:ListItem Text="Choose an option" Value="Action" />
                            </asp:DropDownList>
                        </div>
                        <div class="mb-3">
                            <asp:Label ID="Label7" runat="server" Text="Publish Date"></asp:Label>
                            <asp:TextBox ID="date" ClientIDMode="Static" runat="server" TextMode="Date" CssClass="form-control"></asp:TextBox>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="mb-3">
                            <asp:Label ID="Label6" runat="server" Text="Language"></asp:Label>
                            <asp:DropDownList class="form-control" ID="language" ClientIDMode="Static" runat="server" CssClass="form-control">
                                <asp:ListItem Text="Choose an option" Value="Default" />
                                <asp:ListItem Text="English" Value="English" />
                                <asp:ListItem Text="Hindi" Value="Hindi" />
                                <asp:ListItem Text="Marathi" Value="Marathi" />
                                <asp:ListItem Text="French" Value="French" />
                                <asp:ListItem Text="German" Value="German" />
                                <asp:ListItem Text="Urdu" Value="Urdu" />
                            </asp:DropDownList>
                        </div>
                        <div class="mb-3">
                            <asp:Label ID="Label8" runat="server" Text="Edition"></asp:Label>
                            <asp:TextBox ID="edition" ClientIDMode="Static" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                        <div class="mb-3">
                            <asp:Label ID="Label9" runat="server" Text="Description"></asp:Label>
                            <asp:TextBox ID="description" ClientIDMode="Static" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                        <div class="mb-3">
                            <asp:Label ID="Label10" runat="server" Text="Total Stock"></asp:Label>
                            <asp:TextBox ID="totalStock" ClientIDMode="Static" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                        <div class="mb-3">
                            <asp:Label ID="Label11" runat="server" Text="Available Stock"></asp:Label>
                            <asp:TextBox ID="availableStock" ClientIDMode="Static" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                        <div class="mb-3">
                            <asp:Label ID="Label12" runat="server" Text="Book Cost"></asp:Label>
                            <asp:TextBox ID="bookCost" ClientIDMode="Static" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                    </div>
                </div>
                <div class="mb-3 d-flex justify-content-evenly">
                    <asp:Button ID="addBtn" ClientIDMode="Static" runat="server" Text="Add" CssClass="btn btn-success px-5 py-1 fs-3" OnClick="addBtn_Click" />
                    <asp:Button ID="updateBtn" ClientIDMode="Static" runat="server" Text="Update" CssClass="btn btn-warning px-5 py-1 fs-3" OnClick="updateBtn_Click" />
                    <asp:Button ID="deleteBtn" ClientIDMode="Static" runat="server" Text="Delete" CssClass="btn btn-danger px-5 py-1 fs-3" OnClick="deleteBtn_Click" />
                </div>
            </div>
            <div class="col-md-6">
                <div class="mt-5">
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ProjectConnectionString %>" SelectCommand="SELECT * FROM [books]"></asp:SqlDataSource>
                    <asp:GridView ID="GridView1" CssClass="table table-striped cell-border" runat="server" AutoGenerateColumns="False" DataKeyNames="book_id" DataSourceID="SqlDataSource1">
                        <Columns>
                            <asp:BoundField DataField="book_id" HeaderText="Id" ReadOnly="True" SortExpression="book_id" />
                            <asp:BoundField DataField="book_name" HeaderText="Name" SortExpression="book_name" />
                            <asp:BoundField DataField="author_name" HeaderText="Author" SortExpression="author_name" />
                            <asp:BoundField DataField="edition" HeaderText="Edition" SortExpression="edition" />
                            <asp:BoundField DataField="description" HeaderText="Description" SortExpression="description" />
                            <asp:BoundField DataField="total_stock" HeaderText="Total" SortExpression="total_stock" />
                            <asp:BoundField DataField="available_stock" HeaderText="Available" SortExpression="available_stock" />
                        </Columns>
                    </asp:GridView>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
