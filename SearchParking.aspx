<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="SearchParking.aspx.cs"
    Inherits="SearchParking" %>

    <asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
        <style>
            .slot-grid {
                display: grid;
                grid-template-columns: repeat(auto-fill, minmax(250px, 1fr));
                gap: 1.5rem;
                margin-top: 2rem;
            }
        </style>
    </asp:Content>
    <asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
        <div class="fade-in">
            <div class="card mb-3" style="max-width: 800px; margin: 0 auto;">
                <h2 class="mb-3 text-center">Find Your Spot</h2>

                <div class="dashboard-grid">
                    <div class="form-group">
                        <label class="form-label">Date</label>
                        <asp:TextBox ID="txtDate" runat="server" TextMode="Date" CssClass="form-control"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label class="form-label">Start Time</label>
                        <asp:TextBox ID="txtStartTime" runat="server" TextMode="Time" CssClass="form-control">
                        </asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label class="form-label">End Time</label>
                        <asp:TextBox ID="txtEndTime" runat="server" TextMode="Time" CssClass="form-control">
                        </asp:TextBox>
                    </div>
                </div>

                <div class="text-center">
                    <asp:Button ID="btnSearch" runat="server" Text="Check Availability" OnClick="btnSearch_Click"
                        CssClass="btn btn-primary" style="min-width: 200px;" />
                </div>
            </div>

            <asp:Label ID="lblError" runat="server" CssClass="text-danger text-center"
                style="display:block; margin: 1rem 0;"></asp:Label>

            <asp:Panel ID="pnlResults" runat="server" Visible="false">
                <h3 class="mb-3">Available Slots</h3>
                <div class="slot-grid">
                    <asp:Repeater ID="rptSlots" runat="server" OnItemCommand="rptSlots_ItemCommand">
                        <ItemTemplate>
                            <div class="card text-center">
                                <h3 style="color: var(--secondary-color); margin-bottom: 0.5rem;">
                                    <%# Eval("slot_location") %>
                                </h3>
                                <p class="mb-2">
                                    <%# Eval("slot_type") %>
                                </p>
                                <span
                                    style="display: inline-block; padding: 0.25rem 0.75rem; background: rgba(74, 222, 128, 0.2); color: #4ade80; border-radius: 99px; font-size: 0.8rem; margin-bottom: 1rem;">Available</span>

                                <asp:Button ID="btnBook" runat="server" Text="Book This Spot"
                                    CommandArgument='<%# Eval("slot_id") %>' CommandName="Book"
                                    CssClass="btn btn-primary btn-block" />
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>
                    <asp:Label ID="lblNoSlots" runat="server" Text="No slots available for this time." Visible="false"
                        CssClass="text-muted"></asp:Label>
                </div>
            </asp:Panel>
        </div>
    </asp:Content>