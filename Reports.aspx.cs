using System;
using System.Data;
using MySql.Data.MySqlClient;

public partial class Reports : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["user_type"] == null || Session["user_type"].ToString() != "admin")
        {
            Response.Redirect("Login.aspx");
        }
    }

    protected void btnGenerate_Click(object sender, EventArgs e)
    {
        string start = txtStart.Text;
        string end = txtEnd.Text;

        if (string.IsNullOrEmpty(start) || string.IsNullOrEmpty(end))
        {
            lblError.Text = "Please select both start and end dates.";
            return;
        }

        DateTime sDate, eDate;
        if (!DateTime.TryParse(start, out sDate) || !DateTime.TryParse(end, out eDate))
        {
             lblError.Text = "Invalid date format.";
             return;
        }
        
        // Add time to end date to fully include that day
        eDate = eDate.AddDays(1).AddSeconds(-1);

        lblError.Text = "";
        GenerateReport(sDate, eDate);
    }

    private void GenerateReport(DateTime start, DateTime end)
    {
        // 1. Get List
        string queryLists = @"SELECT b.booking_id, c.name as customer_name, s.slot_location, b.start_time, b.end_time, b.total_bill, b.status 
                              FROM booking b
                              JOIN customer c ON b.customer_id = c.customer_id
                              JOIN parking_slot s ON b.slot_id = s.slot_id
                              WHERE b.start_time BETWEEN @start AND @end
                              ORDER BY b.start_time DESC";
        
        MySqlParameter[] p = {
            new MySqlParameter("@start", start),
            new MySqlParameter("@end", end) 
        };

        DataTable dt = DbConnection.ExecuteQuery(queryLists, p);
        gvReport.DataSource = dt;
        gvReport.DataBind();

        // 2. Aggregates
        // Calculate from DataView to avoid another DB trip or just sum manually
        decimal totalRev = 0;
        int count = dt.Rows.Count;
        
        foreach(DataRow row in dt.Rows) 
        {
            if (row["status"].ToString() != "Cancelled" && row["status"].ToString() != "Pending") 
            {
                 totalRev += Convert.ToDecimal(row["total_bill"]);
            }
        }
        
        lblTotalBookings.Text = count.ToString();
        lblTotalRevenue.Text = "₹" + totalRev.ToString("N2");
    }
}
