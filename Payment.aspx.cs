using System;
using System.Data;
using MySql.Data.MySqlClient;

public partial class Payment : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["user_type"] == null)
            Response.Redirect("Login.aspx");

        if (!IsPostBack)
        {
            if (Request.QueryString["booking_id"] != null)
            {
                string bookingId = Request.QueryString["booking_id"];
                object amount = DbConnection.ExecuteScalar("SELECT total_bill FROM booking WHERE booking_id=" + bookingId);
                lblAmount.Text = "₹" + amount.ToString();
            }
        }
    }

    protected void btnPay_Click(object sender, EventArgs e)
    {
        string bookingId = Request.QueryString["booking_id"];
        string amount = lblAmount.Text.Replace("₹", "");

        // Simulate processing...
        
        // Update Booking Status
        string updateQuery = "UPDATE booking SET status='Confirmed' WHERE booking_id=@bid";
        MySqlParameter[] p1 = { new MySqlParameter("@bid", bookingId) };
        DbConnection.ExecuteNonQuery(updateQuery, p1);

        // Record Payment
        string payQuery = "INSERT INTO payment (booking_id, amount, payment_status) VALUES (@bid, @amt, 'Success'); SELECT LAST_INSERT_ID();";
        MySqlParameter[] p2 = { 
            new MySqlParameter("@bid", bookingId),
            new MySqlParameter("@amt", amount)
        };
        object payId = DbConnection.ExecuteScalar(payQuery, p2);

        // Show Success
        lblMessage.Text = "Payment Successful! Invoice #" + payId.ToString() + ". <a href='ViewBookings.aspx'>View Bookings</a>";
        btnPay.Visible = false;
        
        // (Optional) Update Slot status to Booked? 
        // No, because slots can be booked for future times. 
        // Status 'Booked' in `parking_slot` usually means "Currently Occupied". 
        // This system logic in SearchParking handles future overlaps.
        // We can leave slot status as 'Available' unless it's physically out of order.
    }
}
