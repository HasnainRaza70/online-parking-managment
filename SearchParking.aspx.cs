using System;
using System.Data;
using MySql.Data.MySqlClient;
using System.Web.UI.WebControls;

public partial class SearchParking : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["user_type"] == null)
            Response.Redirect("Login.aspx");
    }

    protected void btnSearch_Click(object sender, EventArgs e)
    {
        string date = txtDate.Text;
        string start = txtStartTime.Text;
        string end = txtEndTime.Text;

        if (string.IsNullOrEmpty(date) || string.IsNullOrEmpty(start) || string.IsNullOrEmpty(end))
        {
            lblError.Text = "Please select date and time.";
            return;
        }

        DateTime startDt, endDt;
        try {
            startDt = DateTime.Parse(date + " " + start);
            endDt = DateTime.Parse(date + " " + end);
            
            if (endDt <= startDt) {
                lblError.Text = "End time must be after start time.";
                return;
            }
            if (startDt < DateTime.Now) {
                 lblError.Text = "Start time cannot be in the past.";
                 return;
            }
        } catch {
            lblError.Text = "Invalid Date/Time format.";
            return;
        }

        string query = @"
            SELECT * FROM parking_slot 
            WHERE status = 'Available'
            AND slot_id NOT IN (
                SELECT slot_id FROM booking 
                WHERE status != 'Cancelled'
                AND (
                    (start_time <= @endDt) AND (end_time >= @startDt)
                )
            )";

        MySqlParameter[] parameters = {
            new MySqlParameter("@startDt", startDt),
            new MySqlParameter("@endDt", endDt)
        };

        DataTable dt = DbConnection.ExecuteQuery(query, parameters);
        
        if (dt.Rows.Count > 0) {
            rptSlots.DataSource = dt;
            rptSlots.DataBind();
            lblNoSlots.Visible = false;
        } else {
            rptSlots.DataSource = null;
            rptSlots.DataBind();
            lblNoSlots.Visible = true;
        }
        
        pnlResults.Visible = true;
        lblError.Text = "";
    }

    protected void rptSlots_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        if (e.CommandName == "Book")
        {
            string slotId = e.CommandArgument.ToString();
            string date = txtDate.Text;
            string start = txtStartTime.Text;
            string end = txtEndTime.Text;
            
            // Redirect to booking/confirmation page with details
            Response.Redirect("Booking.aspx?sid=" + slotId + "&date=" + date + "&start=" + start + "&end=" + end);
        }
    }

    public string GetDate() { return txtDate.Text; }
    public string GetStart() { return txtStartTime.Text; }
    public string GetEnd() { return txtEndTime.Text; }
}
