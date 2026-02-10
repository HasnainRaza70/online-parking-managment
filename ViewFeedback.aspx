<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="ViewFeedback.aspx.cs"
    Inherits="ViewFeedback" %>

    <asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    </asp:Content>
    <asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
        <div class="fade-in">
            <div class="card">
                <h2 class="mb-3">Customer Feedback</h2>

                <div class="table-container">
                    <asp:GridView ID="gvFeedback" runat="server" AutoGenerateColumns="False" CssClass="custom-table"
                        EmptyDataText="No feedback received yet.">
                        <Columns>
                            <asp:BoundField DataField="feedback_id" HeaderText="#" />
                            <asp:BoundField DataField="customer_name" HeaderText="Customer" />
                            <asp:TemplateField HeaderText="Rating">
                                <ItemTemplate>
                                    <span style="color: gold;">
                                        <%# GetStars(Eval("rating")) %>
                                    </span>
                                    <span style="font-size: 0.8em; color: #888;">(<%# Eval("rating") %>/5)</span>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="comment" HeaderText="Comments" />
                            <asp:BoundField DataField="created_at" HeaderText="Date"
                                DataFormatString="{0:MMM dd, yyyy}" />
                        </Columns>
                    </asp:GridView>
                </div>
            </div>
        </div>
    </asp:Content>