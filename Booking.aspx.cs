using System;
using System.Data;
using MySql.Data.MySqlClient;

public partial class Booking : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["user_type"] == null)
            Response.Redirect("Login.aspx");

        if (!IsPostBack)
        {
            if (Request.QueryString["sid"] != null)
            {
                LoadDetails();
            }
            else
            {
                Response.Redirect("SearchParking.aspx");
            }
        }
    }

    private void LoadDetails()
    {
        string slotId = Request.QueryString["sid"];
        string date = Request.QueryString["date"];
        string start = Request.QueryString["start"];
        string end = Request.QueryString["end"];

        hfSlotId.Value = slotId;
        // lblDate removed from UI, we combine date time in start/end labels
        
        DateTime startDt = DateTime.Parse(date + " " + start);
        DateTime endDt = DateTime.Parse(date + " " + end);
        
        lblStartTime.Text = startDt.ToString("MMM dd, yyyy HH:mm");
        lblEndTime.Text = endDt.ToString("MMM dd, yyyy HH:mm");

        // Get Slot Name
        object slotName = DbConnection.ExecuteScalar("SELECT slot_location FROM parking_slot WHERE slot_id=" + slotId);
        lblSlot.Text = slotName != null ? slotName.ToString() : "Unknown Slot";

        // Calculate Bill
        TimeSpan duration = endDt - startDt;
        double hours = duration.TotalHours;
        
        if (hours < 1) hours = 1; // Minimum 1 hour charge
        
        // Rate: 50 Rs per hour
        double bill = hours * 50.0;
        lblTotal.Text = "₹" + bill.ToString("F2");
    }

    protected void btnConfirm_Click(object sender, EventArgs e)
    {
        string customerId = "";
        
        if (Session["customer_id"] != null)
        {
            customerId = Session["customer_id"].ToString();
        }
        else if (Session["user_type"] != null && Session["user_type"].ToString() == "admin")
        {
            // For admin testing, find or create a dummy customer record for 'admin'
            object adminCustId = DbConnection.ExecuteScalar("SELECT customer_id FROM customer WHERE username='admin'");
            if (adminCustId == null)
            {
                // Create profile for admin if not exists
                DbConnection.ExecuteNonQuery("INSERT INTO customer (username, name, email) VALUES ('admin', 'System Admin', 'admin@parkingsystem.com')");
                adminCustId = DbConnection.ExecuteScalar("SELECT customer_id FROM customer WHERE username='admin'");
            }
            customerId = adminCustId.ToString();
            Session["customer_id"] = customerId; // Cache it
        }
        else
        {
            // Session expired or invalid
            Response.Redirect("Login.aspx");
            return;
        }

        string slotId = hfSlotId.Value;
        
        DateTime start = DateTime.Parse(lblStartTime.Text);
        DateTime end = DateTime.Parse(lblEndTime.Text);
        
        // Remove '₹' from bill
        string bill = lblTotal.Text.Replace("₹", "");

        // Create Booking with Pending Status
        string query = @"INSERT INTO booking (customer_id, slot_id, start_time, end_time, total_bill, status) 
                         VALUES (@cid, @sid, @start, @end, @bill, 'Pending');
                         SELECT LAST_INSERT_ID();";
        
        MySqlParameter[] parameters = {
            new MySqlParameter("@cid", customerId),
            new MySqlParameter("@sid", slotId),
            new MySqlParameter("@start", start),
            new MySqlParameter("@end", end),
            new MySqlParameter("@bill", bill)
        };

        object bookingId = DbConnection.ExecuteScalar(query, parameters);
        
        // Redirect to Payment
        Response.Redirect("Payment.aspx?booking_id=" + bookingId);
    }
}
