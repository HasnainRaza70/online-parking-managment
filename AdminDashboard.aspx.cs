using System;

public partial class AdminDashboard : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["user_type"] == null || Session["user_type"].ToString() != "admin")
        {
            Response.Redirect("Login.aspx");
        }

        if (!IsPostBack)
        {
            LoadStats();
        }
    }

    private void LoadStats()
    {
        // Total Slots
        object total = DbConnection.ExecuteScalar("SELECT COUNT(*) FROM parking_slot");
        lblTotalSlots.Text = total.ToString();

        // Booked Slots (Current active bookings or just status='Booked')
        // Assuming status updates are real-time on slot table
        object booked = DbConnection.ExecuteScalar("SELECT COUNT(*) FROM parking_slot WHERE status='Booked'");
        lblBookedSlots.Text = booked.ToString();

        // Available Slots
        object available = DbConnection.ExecuteScalar("SELECT COUNT(*) FROM parking_slot WHERE status='Available'");
        lblAvailableSlots.Text = available.ToString();

        // Earnings
        object earnings = DbConnection.ExecuteScalar("SELECT SUM(amount) FROM payment WHERE payment_status='Success'");
        lblEarnings.Text = (earnings != DBNull.Value) ? Convert.ToDecimal(earnings).ToString("N2") : "0.00";
    }
}
