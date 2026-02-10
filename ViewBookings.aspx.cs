using System;
using System.Data;
using MySql.Data.MySqlClient;

public partial class ViewBookings : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["user_type"] == null)
        {
            Response.Redirect("Login.aspx");
        }

        if (!IsPostBack)
        {
            BindGrid();
        }
    }

    private void BindGrid()
    {
        string query = "";
        string role = Session["user_type"].ToString();

        if (role == "admin") {
            query = @"SELECT b.booking_id, s.slot_location, b.start_time, b.end_time, b.total_bill, b.status 
                      FROM booking b 
                      JOIN parking_slot s ON b.slot_id = s.slot_id 
                      ORDER BY b.booking_id DESC";
            gvBookings.DataSource = DbConnection.ExecuteQuery(query);
        } else {
            string custId = Session["customer_id"] != null ? Session["customer_id"].ToString() : "0";
            query = @"SELECT b.booking_id, s.slot_location, b.start_time, b.end_time, b.total_bill, b.status 
                      FROM booking b 
                      JOIN parking_slot s ON b.slot_id = s.slot_id 
                      WHERE b.customer_id = @cid 
                      ORDER BY b.booking_id DESC";
            MySqlParameter[] px = { new MySqlParameter("@cid", custId) };
            gvBookings.DataSource = DbConnection.ExecuteQuery(query, px);
        }
        
        gvBookings.DataBind();
    }

    public string GetStatusClass(string status)
    {
        if (status == "Confirmed") return "status-available"; // Reusing green
        if (status == "Cancelled") return "status-booked";   // Reusing red
        return "status-pending";
    }
}
