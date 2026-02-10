<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="Payment.aspx.cs"
    Inherits="Payment" %>

    <asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    </asp:Content>
    <asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
        <div style="display: flex; justify-content: center; align-items: center; min-height: 60vh;">
            <div class="card fade-in" style="width: 100%; max-width: 450px;">
                <div class="text-center mb-3">
                    <div style="font-size: 3rem; margin-bottom: 1rem;">💳</div>
                    <h2>Secure Payment</h2>
                    <p>Complete your booking</p>
                </div>

                <div class="form-group text-center mb-3">
                    <span class="text-muted">Amount Due</span>
                    <div style="font-size: 2rem; font-weight: 700; color: var(--secondary-color);">
                        <asp:Label ID="lblAmount" runat="server"></asp:Label>
                    </div>
                </div>

                <div class="form-group">
                    <label class="form-label">Card Number</label>
                    <asp:TextBox ID="txtCard" runat="server" CssClass="form-control" placeholder="0000 0000 0000 0000">
                    </asp:TextBox>
                </div>

                <div style="display: flex; gap: 1rem;">
                    <div class="form-group" style="flex: 1;">
                        <label class="form-label">Expiry</label>
                        <asp:TextBox ID="txtExpiry" runat="server" CssClass="form-control" placeholder="MM/YY">
                        </asp:TextBox>
                    </div>
                    <div class="form-group" style="flex: 1;">
                        <label class="form-label">CVV</label>
                        <asp:TextBox ID="txtCvv" runat="server" CssClass="form-control" placeholder="123"></asp:TextBox>
                    </div>
                </div>

                <asp:Button ID="btnPay" runat="server" Text="Pay Now" OnClick="btnPay_Click"
                    CssClass="btn btn-primary btn-block" />

                <asp:Label ID="lblMessage" runat="server" CssClass="mt-4"
                    style="display: block; text-align: center; color: #4ade80;"></asp:Label>
            </div>
        </div>
    </asp:Content>