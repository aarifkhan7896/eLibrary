<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="authormanagement.aspx.cs" Inherits="Project.authormanagement" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div class="row">
            <div class="col-md-6">
                <div class="card mt-5" style="width: 40rem; margin: auto;">
                    <div class="card-body">
                        <h5 class="card-title fs-1 text-muted fw-bold text-center">Author Details</h5>
                        <hr />
                        <div class="innerCard p-4">
                            <asp:Label ID="Label1" runat="server" Text="Author ID" CssClass="label fs-4"></asp:Label>
                            <div class="input-group mb-4">
                                <asp:TextBox ID="author" ClientIDMode="Static" runat="server" CssClass="form-control fs-4" placeholder="Enter Author ID"></asp:TextBox>
                                <asp:Button ID="search" runat="server" Text="Go" CssClass="btn btn-outline-dark fs-4 py-1 px-5" OnClick="search_Click" />
                            </div>
                            <div class="mb-4">
                                <asp:Label ID="Label2" runat="server" Text="Author Name" CssClass="label fs-4"></asp:Label>
                                <asp:TextBox ID="authorname" ClientIDMode="Static" runat="server" CssClass="form-control fs-4" placeholder="Enter Author Name"></asp:TextBox>
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
                <div class="card">
                    <div class="card-body">
                        <p class="card-title">Author List</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
