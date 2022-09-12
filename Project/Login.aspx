<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Project.Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div class="inner mt-3 d-flex justify-content-center align-items-center flex-column">
            <div class="card" style="width: 35rem;">
                <img src="https://images.unsplash.com/photo-1432821596592-e2c18b78144f?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2070&q=80" class="card-img-top" alt="img">
                <div class="card-body">
                    <div class="mb-4 text-center">
                        <h5 class="card-title fs-1 fw-bold">User Login</h5>
                    </div>
                    <div class="form-group mb-4">
                        <asp:Label ID="Label1" runat="server" Text="Email" CssClass="label"></asp:Label>
                        <asp:TextBox ID="email" ClientIDMode="Static" runat="server" CssClass="form-control" placeholder="Enter Email"></asp:TextBox>
                        <asp:Label ID="emailError" ClientIDMode="Static" runat="server" ForeColor="#CC0000"></asp:Label>
                    </div>
                    <div class="form-group mb-4">
                        <asp:Label ID="Label2" runat="server" Text="Password" CssClass="label"></asp:Label>
                        <asp:TextBox ID="password" ClientIDMode="Static" runat="server" TextMode="Password" CssClass="form-control" placeholder="Enter Password">Password</asp:TextBox>
                        <asp:Label ID="passError" ClientIDMode="Static" runat="server" ForeColor="#CC0000"></asp:Label>
                    </div>
                    <div class="text-center mb-4">
                        <asp:Button ID="LoginBtn" ClientIDMode="Static" runat="server" Text="Log in" CssClass="btn btn-success w-100 fs-4 py-2 px-5" OnClientClick="return loginForm()" OnClick="LoginBtn_Click" />
                    </div>
                </div>
            </div>
            <div class="mt-4">
                <p class="fs-3 fw-bold">Don't have an account? <a href="Signup.aspx">Sign Up</a></p>
            </div>
        </div>
    </div>
</asp:Content>
