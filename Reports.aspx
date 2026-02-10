<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="Reports.aspx.cs"
    Inherits="Reports" %>

    <asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    </asp:Content>
    <asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
        <div class="fade-in">
            <div class="card">
                <h2 class="mb-3">Reports & Analytics</h2>

                <div
                    style="background: rgba(255,255,255,0.05); padding: 1.5rem; border-radius: var(--radius); margin-bottom: 2rem;">
                    <h4 class="mb-2">Filter by Date</h4>
                    <div style="display: flex; gap: 1rem; align-items: flex-end; flex-wrap: wrap;">
                        <div class="form-group" style="flex: 1; min-width: 200px; margin-bottom: 0;">
                            <label>Start Date</label>
                            <asp:TextBox ID="txtStart" runat="server" TextMode="Date" CssClass="form-control">
                            </asp:TextBox>
                        </div>
                        <div class="form-group" style="flex: 1; min-width: 200px; margin-bottom: 0;">
                            <label>End Date</label>
                            <asp:TextBox ID="txtEnd" runat="server" TextMode="Date" CssClass="form-control">
                            </asp:TextBox>
                        </div>
                        <div style="margin-bottom: 0.2rem;">
                            <asp:Button ID="btnGenerate" runat="server" Text="Generate Report"
                                OnClick="btnGenerate_Click" CssClass="btn btn-primary" />
                        </div>
                    </div>
                    <asp:Label ID="lblError" runat="server" ForeColor="Red"
                        style="display:block; margin-top:0.5rem; font-size: 0.9em;"></asp:Label>
                </div>

                <div class="dashboard-grid" style="margin-bottom: 2rem;">
                    <div class="stat-card">
                        <h3>Total Revenue</h3>
                        <p class="stat-value" style="color: #4ade80;">
                            <asp:Label ID="lblTotalRevenue" runat="server" Text="₹0.00"></asp:Label>
                        </p>
                    </div>
                    <div class="stat-card">
                        <h3>Total Bookings</h3>
                        <p class="stat-value" style="color: var(--secondary-color);">
                            <asp:Label ID="lblTotalBookings" runat="server" Text="0"></asp:Label>
                        </p>
                    </div>
                </div>

                <h3 class="mb-3">Booking History</h3>
                <div class="table-container">
                    <asp:GridView ID="gvReport" runat="server" AutoGenerateColumns="False" CssClass="custom-table"
                        EmptyDataText="No records found for this period.">
                        <Columns>
                            <asp:BoundField DataField="booking_id" HeaderText="#" />
                            <asp:BoundField DataField="customer_name" HeaderText="Customer" />
                            <asp:BoundField DataField="slot_location" HeaderText="Slot" />
                            <asp:BoundField DataField="start_time" HeaderText="Start"
                                DataFormatString="{0:MMM dd, HH:mm}" />
                            <asp:BoundField DataField="end_time" HeaderText="End"
                                DataFormatString="{0:MMM dd, HH:mm}" />
                            <asp:BoundField DataField="total_bill" HeaderText="Bill (₹)" DataFormatString="{0:F2}" />
                            <asp:BoundField DataField="status" HeaderText="Status" />
                        </Columns>
                    </asp:GridView>
                </div>
            </div>
        </div>
    </asp:Content>