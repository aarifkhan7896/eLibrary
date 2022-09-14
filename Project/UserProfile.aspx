<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="UserProfile.aspx.cs" Inherits="Project.Dashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div class="row">
            <div class="col-md-6">
                <div class="container">
                    <div class="inner mt-3 d-flex justify-content-center align-items-center flex-column">
                        <div class="card">
                            <img src="https://cdn3.iconfinder.com/data/icons/vector-icons-6/96/256-1024.png" alt="avatar" style="width: 8rem; height: 8rem; margin: auto; margin-top: 1rem;" />
                            <div class="card-body">
                                <div class="mb-4 text-center">
                                    <h5 class="card-title fs-1 fw-bold">Profile</h5>
                                </div>
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group mb-4">
                                            <asp:Label ID="Label1" runat="server" Text="First Name" CssClass="label"></asp:Label>
                                            <asp:TextBox ID="fname" ClientIDMode="Static" runat="server" CssClass="form-control" placeholder="Enter First Name"></asp:TextBox>
                                            <asp:Label ID="fnameError" ClientIDMode="Static" runat="server" ForeColor="#CC0000"></asp:Label>
                                        </div>
                                        <div class="form-group mb-4">
                                            <asp:Label ID="Label3" runat="server" Text="Email" CssClass="label"></asp:Label>
                                            <asp:TextBox ID="email" ClientIDMode="Static" runat="server" CssClass="form-control" placeholder="Enter Email"></asp:TextBox>
                                            <asp:Label ID="emailError" ClientIDMode="Static" runat="server" ForeColor="#CC0000"></asp:Label>
                                        </div>
                                        <div class="form-group mb-4">
                                            <asp:Label ID="Label5" runat="server" Text="Contact" CssClass="label"></asp:Label>
                                            <asp:TextBox ID="contact" ClientIDMode="Static" runat="server" CssClass="form-control" placeholder="Enter Contact Number"></asp:TextBox>
                                            <asp:Label ID="contactError" ClientIDMode="Static" runat="server" ForeColor="#CC0000"></asp:Label>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group mb-4">
                                            <asp:Label ID="Label2" runat="server" Text="Last Name" CssClass="label"></asp:Label>
                                            <asp:TextBox ID="lname" ClientIDMode="Static" runat="server" CssClass="form-control" placeholder="Enter Last Name"></asp:TextBox>
                                            <asp:Label ID="lnameError" ClientIDMode="Static" runat="server" ForeColor="#CC0000"></asp:Label>
                                        </div>
                                        <div class="form-group mb-4">
                                            <asp:Label ID="Label7" runat="server" Text="Pincode" CssClass="label"></asp:Label>
                                            <asp:TextBox ID="pincode" ClientIDMode="Static" runat="server" CssClass="form-control" placeholder="Enter Pincode"></asp:TextBox>
                                            <asp:Label ID="pincodeError" ClientIDMode="Static" runat="server" ForeColor="#CC0000"></asp:Label>
                                        </div>
                                        <div class="form-group mb-4">
                                            <asp:Label ID="Label4" runat="server" Text="Password" CssClass="label"></asp:Label>
                                            <asp:TextBox ID="password" ClientIDMode="Static" runat="server" TextMode="Password" CssClass="form-control" placeholder="Enter Password">Password</asp:TextBox>
                                            <asp:Label ID="passError" ClientIDMode="Static" runat="server" ForeColor="#CC0000"></asp:Label>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col">
                                        <div class="form-group mb-4">
                                            <asp:Label ID="Label6" runat="server" Text="Address" CssClass="label"></asp:Label>
                                            <textarea id="address" class="form-control fs-4" placeholder="Enter Address" cols="20" rows="3" style="resize:none;"></textarea>
                                            <asp:Label ID="addressError" ClientIDMode="Static" runat="server" ForeColor="#CC0000"></asp:Label>
                                        </div>
                                    </div>
                                </div>
                                <div class="text-center mb-4">
                                    <asp:Button ID="signUpBtn" ClientIDMode="Static" runat="server" Text="Update" CssClass="btn btn-success w-100 fs-4 py-2 px-5" OnClientClick="return signUpForm()" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-6">
                <div class="container">
                    <div class="inner issuedBooks mt-3">
                        <div class="card">
                            <img src="https://cdn.shopify.com/s/files/1/0068/9166/7513/products/designer-mix_1024x1024.png?v=1528009673" alt="books" style="width: 8rem; height: 8rem; margin: auto;" />
                            <h5 class="card-title fs-1 fw-bold text-center">Issued Books</h5>
                            <div class="card-body">
                                <table class="table table-bordered table-hover text-center">
                                    <tr class=" bg-success text-light">
                                        <th class="fs-4">S.No.</th>
                                        <th class="fs-4">Name</th>
                                        <th class="fs-4">Author</th>
                                    </tr>
                                    <tr>
                                        <td>1</td>
                                        <td>One</td>
                                        <td>One</td>
                                    </tr>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
