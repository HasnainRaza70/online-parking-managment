<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="ManageUsers.aspx.cs"
    Inherits="ManageUsers" %>

    <asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    </asp:Content>
    <asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
        <div class="fade-in">
            <div class="card">
                <h2 class="mb-3">Manage Users</h2>

                <div style="margin-bottom: 1rem; display: flex; gap: 0.5rem;">
                    <asp:TextBox ID="txtSearch" runat="server" CssClass="form-control"
                        Placeholder="Search by Name or Email..." style="flex: 1;"></asp:TextBox>
                    <asp:Button ID="btnSearch" runat="server" Text="Search" OnClick="btnSearch_Click"
                        CssClass="btn btn-primary" />
                </div>

                <div class="table-container">
                    <asp:GridView ID="gvUsers" runat="server" AutoGenerateColumns="False" CssClass="custom-table"
                        EmptyDataText="No users found.">
                        <Columns>
                            <asp:BoundField DataField="customer_id" HeaderText="ID" />
                            <asp:BoundField DataField="username" HeaderText="Username" />
                            <asp:BoundField DataField="name" HeaderText="Name" />
                            <asp:BoundField DataField="email" HeaderText="Email" />
                            <asp:BoundField DataField="phone" HeaderText="Phone" />
                            <asp:BoundField DataField="address" HeaderText="Address" />
                        </Columns>
                    </asp:GridView>
                </div>
            </div>
        </div>
    </asp:Content>