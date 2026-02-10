<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="Register.aspx.cs"
    Inherits="Register" %>

    <asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    </asp:Content>
    <asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
        <div style="display: flex; justify-content: center; align-items: center; padding: 2rem 0;">
            <div class="card fade-in" style="width: 100%; max-width: 500px;">
                <div class="text-center mb-3">
                    <h2>Create Account</h2>
                    <p>Join us for seamless parking</p>
                </div>

                <asp:Label ID="lblMessage" runat="server" CssClass="mb-3"
                    style="display: block; text-align: center; color: #ef4444; min-height: 1.5em;"></asp:Label>

                <div class="form-group">
                    <label class="form-label">Full Name</label>
                    <asp:TextBox ID="txtName" runat="server" CssClass="form-control" placeholder="John Doe">
                    </asp:TextBox>
                </div>

                <div class="form-group">
                    <label class="form-label">Username</label>
                    <asp:TextBox ID="txtUsername" runat="server" CssClass="form-control" placeholder="johndoe">
                    </asp:TextBox>
                </div>

                <div class="form-group">
                    <label class="form-label">Email</label>
                    <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" TextMode="Email"
                        placeholder="john@example.com"></asp:TextBox>
                </div>

                <div class="form-group">
                    <label class="form-label">Phone</label>
                    <asp:TextBox ID="txtPhone" runat="server" CssClass="form-control" placeholder="1234567890">
                    </asp:TextBox>
                </div>

                <div class="form-group">
                    <label class="form-label">Address</label>
                    <asp:TextBox ID="txtAddress" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="2"
                        placeholder="Your address"></asp:TextBox>
                </div>

                <div class="form-group">
                    <label class="form-label">Password</label>
                    <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" CssClass="form-control"
                        placeholder="******"></asp:TextBox>
                </div>

                <div class="form-group">
                    <label class="form-label">Confirm Password</label>
                    <asp:TextBox ID="txtConfirmPassword" runat="server" TextMode="Password" CssClass="form-control"
                        placeholder="******"></asp:TextBox>
                </div>

                <asp:Button ID="btnRegister" runat="server" Text="Register" OnClick="btnRegister_Click"
                    CssClass="btn btn-primary btn-block mb-3" />

                <div class="text-center">
                    <p style="font-size: 0.9rem;">
                        Already have an account? <a href="Login.aspx">Login here</a>
                    </p>
                </div>
            </div>
        </div>
    </asp:Content>