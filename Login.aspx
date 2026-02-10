<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="Login.aspx.cs"
    Inherits="Login" %>

    <asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    </asp:Content>
    <asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
        <div style="display: flex; justify-content: center; align-items: center; min-height: 60vh;">
            <div class="card fade-in" style="width: 100%; max-width: 400px;">
                <div class="text-center mb-3">
                    <h2 style="margin-bottom: 0.5rem;">Welcome Back</h2>
                    <p>Sign in to continue</p>
                </div>

                <asp:Label ID="lblMessage" runat="server" CssClass="mb-3"
                    style="display: block; text-align: center; color: #ef4444; min-height: 1.5em;"></asp:Label>

                <div class="form-group">
                    <label class="form-label">Username</label>
                    <asp:TextBox ID="txtUsername" runat="server" CssClass="form-control"
                        placeholder="Enter your username"></asp:TextBox>
                </div>

                <div class="form-group">
                    <label class="form-label">Password</label>
                    <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" CssClass="form-control"
                        placeholder="Enter your password"></asp:TextBox>
                </div>

                <asp:Button ID="btnLogin" runat="server" Text="Login" OnClick="btnLogin_Click"
                    CssClass="btn btn-primary btn-block mb-3" />

                <div class="text-center">
                    <p style="font-size: 0.9rem;">
                        Don't have an account? <a href="Register.aspx">Register here</a>
                    </p>
                </div>
            </div>
        </div>
    </asp:Content>