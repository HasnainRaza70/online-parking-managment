using System;
using System.Data;

public partial class ViewFeedback : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["user_type"] == null || Session["user_type"].ToString() != "admin")
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
        string query = @"SELECT f.feedback_id, c.name as customer_name, f.rating, f.comment, f.created_at 
                         FROM feedback f 
                         JOIN customer c ON f.customer_id = c.customer_id 
                         ORDER BY f.created_at DESC";
        
        gvFeedback.DataSource = DbConnection.ExecuteQuery(query);
        gvFeedback.DataBind();
    }

    public string GetStars(object ratingObj)
    {
        if (ratingObj == null) return "";
        int rating = Convert.ToInt32(ratingObj);
        string stars = "";
        for (int i = 0; i < rating; i++) stars += "★";
        return stars;
    }
}
