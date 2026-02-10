using System;
using System.Data;
using MySql.Data.MySqlClient;

public partial class Feedback : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["user_type"] == null)
            Response.Redirect("Login.aspx");
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        string custId = Session["customer_id"].ToString();
        int rating = int.Parse(ddlRating.SelectedValue);
        string comment = txtComment.Text.Trim();

        string query = "INSERT INTO feedback (customer_id, rating, comment) VALUES (@cid, @rate, @comment)";
        MySqlParameter[] px = {
            new MySqlParameter("@cid", custId),
            new MySqlParameter("@rate", rating),
            new MySqlParameter("@comment", comment)
        };
        
        DbConnection.ExecuteNonQuery(query, px);

        lblMessage.Text = "Thank you for your feedback!";
        txtComment.Text = "";
    }
}
