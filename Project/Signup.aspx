<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Signup.aspx.cs" Inherits="Project.Signup" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div class="inner mt-3 d-flex justify-content-center align-items-center flex-column">
            <div class="card" style="width: 42rem;">
                <img src="https://images.unsplash.com/photo-1525011268546-bf3f9b007f6a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80" class="card-img-top" alt="img">
                <div class="card-body">
                    <div class="mb-4 text-center">
                        <h5 class="card-title fs-1 fw-bold">Sign Up</h5>
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
                            <div class="form-group mb-4">
                                <asp:Label ID="Label6" runat="server" Text="Address" CssClass="label"></asp:Label>
                                <asp:TextBox ID="address" ClientIDMode="Static" runat="server" CssClass="form-control" placeholder="Enter Address"></asp:TextBox>
                                <asp:Label ID="addressError" ClientIDMode="Static" runat="server" ForeColor="#CC0000"></asp:Label>
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
                            <div class="form-group mb-4">
                                <asp:Label ID="Label8" runat="server" Text="Confirm Password" CssClass="label"></asp:Label>
                                <asp:TextBox ID="confirmpassword" ClientIDMode="Static" runat="server" TextMode="Password" CssClass="form-control" placeholder="Confirm Password">Password</asp:TextBox>
                                <asp:Label ID="confirmpasswordError" ClientIDMode="Static" runat="server" ForeColor="#CC0000"></asp:Label>
                            </div>
                        </div>
                    </div>
                    <div class="text-center mb-4">
                        <asp:Button ID="signUpBtn" ClientIDMode="Static" runat="server" Text="Sign Up" CssClass="btn btn-success w-100 fs-4 py-2 px-5" OnClientClick="return signUpForm()" OnClick="signUpBtn_Click" />
                    </div>
                </div>
            </div>
            <div class="mt-4">
                <p class="fs-3 fw-bold">Already have an account? <a href="Login.aspx">Login</a></p>
            </div>
        </div>
    </div>
</asp:Content>
