<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="AdminDashboard.aspx.cs"
    Inherits="AdminDashboard" %>

    <asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    </asp:Content>
    <asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
        <div class="fade-in">
            <div style="display: flex; justify-content: space-between; align-items: center; margin-bottom: 2rem;">
                <h2>Admin Dashboard</h2>
                <div style="display: flex; gap: 1rem;">
                    <a href="AddSlot.aspx" class="btn btn-primary">Manage Slots</a>
                    <a href="ViewBookings.aspx" class="btn btn-primary">View All Bookings</a>
                </div>
            </div>

            <div class="dashboard-grid">
                <div class="card stat-card">
                    <span class="stat-label">Total Slots</span>
                    <asp:Label ID="lblTotalSlots" runat="server" CssClass="stat-value">0</asp:Label>
                </div>
                <div class="card stat-card">
                    <span class="stat-label">Available Slots</span>
                    <asp:Label ID="lblAvailableSlots" runat="server" CssClass="stat-value">0</asp:Label>
                </div>
                <div class="card stat-card">
                    <span class="stat-label">Booked Slots</span>
                    <asp:Label ID="lblBookedSlots" runat="server" CssClass="stat-value">0</asp:Label>
                </div>
                <div class="card stat-card">
                    <span class="stat-label">Total Earnings</span>
                    <div class="stat-value" style="color: #4ade80;">
                        ₹<asp:Label ID="lblEarnings" runat="server">0.00</asp:Label>
                    </div>
                </div>
            </div>

            <div class="card mt-4">
                <h3 class="mb-3">Recent Activity</h3>
                <!-- Placeholder for recent bookings or chart -->
                <p style="text-align: center; color: var(--text-muted);">System is running smoothly.</p>
            </div>
        </div>
    </asp:Content>