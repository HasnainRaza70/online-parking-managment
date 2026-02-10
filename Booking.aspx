<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="Booking.aspx.cs"
    Inherits="Booking" %>

    <asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    </asp:Content>
    <asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
        <div style="display: flex; justify-content: center; align-items: center; min-height: 60vh;">
            <div class="card fade-in" style="width: 100%; max-width: 500px;">
                <h2 class="mb-3 text-center">Confirm Booking</h2>
                <asp:HiddenField ID="hfSlotId" runat="server" />

                <div
                    style="background: rgba(255,255,255,0.05); padding: 1.5rem; border-radius: var(--radius); margin-bottom: 1.5rem;">
                    <div class="form-group"
                        style="display: flex; justify-content: space-between; border-bottom: 1px solid var(--border-color); padding-bottom: 0.5rem;">
                        <span class="text-muted">Slot</span>
                        <asp:Label ID="lblSlot" runat="server" Font-Bold="true"></asp:Label>
                    </div>
                    <div class="form-group"
                        style="display: flex; justify-content: space-between; border-bottom: 1px solid var(--border-color); padding-bottom: 0.5rem;">
                        <span class="text-muted">Start Time</span>
                        <asp:Label ID="lblStartTime" runat="server"></asp:Label>
                    </div>
                    <div class="form-group"
                        style="display: flex; justify-content: space-between; border-bottom: 1px solid var(--border-color); padding-bottom: 0.5rem;">
                        <span class="text-muted">End Time</span>
                        <asp:Label ID="lblEndTime" runat="server"></asp:Label>
                    </div>
                    <div class="form-group" style="display: flex; justify-content: space-between; margin-bottom: 0;">
                        <span class="text-muted">Total Cost</span>
                        <asp:Label ID="lblTotal" runat="server" Font-Bold="true" ForeColor="#4ade80" Font-Size="1.25em">
                        </asp:Label>
                    </div>
                </div>

                <asp:Button ID="btnConfirm" runat="server" Text="Confirm & Pay" OnClick="btnConfirm_Click"
                    CssClass="btn btn-primary btn-block" />
                <a href="SearchParking.aspx" class="btn btn-danger btn-block mt-4"
                    style="text-decoration: none;">Cancel</a>
            </div>
        </div>
    </asp:Content>