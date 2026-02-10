<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="AddSlot.aspx.cs"
    Inherits="AddSlot" %>

    <asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    </asp:Content>
    <asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
        <div style="display: flex; justify-content: center; align-items: center;">
            <div class="card fade-in" style="width: 100%; max-width: 600px;">
                <h2 class="mb-3">Manage Parking Slots</h2>

                <asp:Label ID="lblMessage" runat="server" CssClass="mb-3"
                    style="display: block; text-align: center; min-height: 1.5em;"></asp:Label>

                <div class="form-group">
                    <label class="form-label">Slot Location</label>
                    <asp:TextBox ID="txtLocation" runat="server" CssClass="form-control" placeholder="e.g. A-101">
                    </asp:TextBox>
                </div>

                <div class="form-group">
                    <label class="form-label">Slot Type</label>
                    <asp:DropDownList ID="ddlType" runat="server" CssClass="form-control">
                        <asp:ListItem Text="Compact" Value="Compact"></asp:ListItem>
                        <asp:ListItem Text="SUV" Value="SUV"></asp:ListItem>
                        <asp:ListItem Text="Bike" Value="Bike"></asp:ListItem>
                    </asp:DropDownList>
                </div>

                <div class="form-group">
                    <label class="form-label">Status</label>
                    <asp:DropDownList ID="ddlStatus" runat="server" CssClass="form-control">
                        <asp:ListItem Text="Available" Value="Available"></asp:ListItem>
                        <asp:ListItem Text="Maintenance" Value="Maintenance"></asp:ListItem>
                    </asp:DropDownList>
                </div>

                <asp:Button ID="btnAdd" runat="server" Text="Add Slot" OnClick="btnAdd_Click"
                    CssClass="btn btn-primary btn-block" />

                <hr style="margin: 2rem 0; border-color: var(--border-color);" />

                <h3 class="mb-3">Existing Slots</h3>
                <div class="table-container">
                    <asp:GridView ID="gvSlots" runat="server" AutoGenerateColumns="False" CssClass="custom-table"
                        DataKeyNames="slot_id" OnRowEditing="gvSlots_RowEditing" OnRowUpdating="gvSlots_RowUpdating"
                        OnRowCancelingEdit="gvSlots_RowCancelingEdit" OnRowDeleting="gvSlots_RowDeleting"
                        EmptyDataText="No slots found.">
                        <Columns>
                            <asp:BoundField DataField="slot_id" HeaderText="ID" ReadOnly="True" />

                            <asp:TemplateField HeaderText="Location">
                                <ItemTemplate>
                                    <%# Eval("slot_location") %>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtEditLoc" runat="server" Text='<%# Bind("slot_location") %>'
                                        CssClass="form-control" style="padding: 5px; height: auto;"></asp:TextBox>
                                </EditItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Type">
                                <ItemTemplate>
                                    <%# Eval("slot_type") %>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:DropDownList ID="ddlEditType" runat="server" CssClass="form-control"
                                        style="padding: 5px; height: auto;">
                                        <asp:ListItem>Compact</asp:ListItem>
                                        <asp:ListItem>SUV</asp:ListItem>
                                        <asp:ListItem>Bike</asp:ListItem>
                                    </asp:DropDownList>
                                </EditItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Status">
                                <ItemTemplate>
                                    <span class='<%# GetStatusClass(Eval("status").ToString()) %>'>
                                        <%# Eval("status") %>
                                    </span>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:DropDownList ID="ddlEditStatus" runat="server" CssClass="form-control"
                                        style="padding: 5px; height: auto;">
                                        <asp:ListItem>Available</asp:ListItem>
                                        <asp:ListItem>Maintenance</asp:ListItem>
                                        <asp:ListItem>Booked</asp:ListItem>
                                    </asp:DropDownList>
                                </EditItemTemplate>
                            </asp:TemplateField>

                            <asp:CommandField ShowEditButton="True" ShowDeleteButton="True"
                                ControlStyle-CssClass="btn btn-sm btn-outline-primary" />
                        </Columns>
                    </asp:GridView>
                </div>
            </div>
        </div>
    </asp:Content>