<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="ViewBookings.aspx.cs"
    Inherits="ViewBookings" %>

    <asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    </asp:Content>
    <asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
        <div class="fade-in">
            <div class="card">
                <h2 class="mb-3">
                    <% if (Session["role"] !=null && Session["role"].ToString()=="admin" ) { %> All Bookings <% } else {
                            %> My Bookings <% } %>
                </h2>

                <div class="table-container">
                    <asp:GridView ID="gvBookings" runat="server" AutoGenerateColumns="False" CssClass="custom-table"
                        EmptyDataText="No bookings found.">
                        <Columns>
                            <asp:BoundField DataField="booking_id" HeaderText="#" />
                            <asp:BoundField DataField="slot_location" HeaderText="Slot" />
                            <asp:BoundField DataField="start_time" HeaderText="Start Time"
                                DataFormatString="{0:MMM dd, yyyy HH:mm}" />
                            <asp:BoundField DataField="end_time" HeaderText="End Time"
                                DataFormatString="{0:MMM dd, yyyy HH:mm}" />
                            <asp:BoundField DataField="total_bill" HeaderText="Total (₹)" DataFormatString="{0:F2}" />
                            <asp:BoundField DataField="status" HeaderText="Status" />
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <% if (Session["role"]==null || Session["role"].ToString() !="admin" ) { %>
                                        <%# Eval("status").ToString()=="Pending" ? "<a href='Payment.aspx?bid=" +
                                            Eval("booking_id")
                                            + "' class='btn btn-primary' style='padding: 0.25rem 0.5rem; font-size: 0.8rem;'>Pay Now</a>"
                                            : "" %>
                                            <% } %>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                </div>
            </div>
        </div>
    </asp:Content>