using System;
using System.Data;
using MySql.Data.MySqlClient;

public partial class ManageUsers : System.Web.UI.Page
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
        string search = txtSearch.Text.Trim();
        string query = @"SELECT c.customer_id, l.username, c.name, c.email, c.phone, c.address 
                         FROM customer c 
                         JOIN login l ON c.username = l.username";
        
        if (!string.IsNullOrEmpty(search))
        {
            query += " WHERE c.name LIKE @search OR c.email LIKE @search OR l.username LIKE @search";
        }
        
        MySqlParameter[] p = { new MySqlParameter("@search", "%" + search + "%") };
        
        gvUsers.DataSource = DbConnection.ExecuteQuery(query, p);
        gvUsers.DataBind();
    }

    protected void btnSearch_Click(object sender, EventArgs e)
    {
        BindGrid();
    }
}
