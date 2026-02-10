<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="Feedback.aspx.cs"
    Inherits="Feedback" %>

    <asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    </asp:Content>
    <asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
        <div style="display: flex; justify-content: center; align-items: center; min-height: 60vh;">
            <div class="card fade-in" style="width: 100%; max-width: 500px;">
                <h2 class="mb-3">We Value Your Feedback</h2>

                <asp:Label ID="lblMessage" runat="server" CssClass="mb-3"
                    style="display: block; text-align: center; color: #4ade80;"></asp:Label>

                <div class="form-group">
                    <label class="form-label">Rating (1-5)</label>
                    <asp:DropDownList ID="ddlRating" runat="server" CssClass="form-control">
                        <asp:ListItem Value="5">⭐⭐⭐⭐⭐ - Excellent</asp:ListItem>
                        <asp:ListItem Value="4">⭐⭐⭐⭐ - Good</asp:ListItem>
                        <asp:ListItem Value="3">⭐⭐⭐ - Average</asp:ListItem>
                        <asp:ListItem Value="2">⭐⭐ - Poor</asp:ListItem>
                        <asp:ListItem Value="1">⭐ - Very Poor</asp:ListItem>
                    </asp:DropDownList>
                </div>

                <div class="form-group">
                    <label class="form-label">Comments</label>
                    <asp:TextBox ID="txtComment" runat="server" TextMode="MultiLine" Rows="4" CssClass="form-control"
                        placeholder="Tell us about your experience..."></asp:TextBox>
                </div>

                <asp:Button ID="btnSubmit" runat="server" Text="Submit Feedback" OnClick="btnSubmit_Click"
                    CssClass="btn btn-primary btn-block" />
            </div>
        </div>
    </asp:Content>