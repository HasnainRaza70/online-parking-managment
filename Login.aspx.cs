using System;
using System.Data;
using MySql.Data.MySqlClient;

public partial class Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["user_type"] != null)
        {
            if (Session["user_type"].ToString() == "admin")
                Response.Redirect("AdminDashboard.aspx");
            else
                Response.Redirect("Home.aspx");
        }
    }

    protected void btnLogin_Click(object sender, EventArgs e)
    {
        string username = txtUsername.Text.Trim();
        string password = txtPassword.Text.Trim();

        string query = "SELECT * FROM login WHERE username = @username AND password = @password";
        MySqlParameter[] parameters = {
            new MySqlParameter("@username", username),
            new MySqlParameter("@password", password)
        };

        DataTable dt = DbConnection.ExecuteQuery(query, parameters);

        if (dt.Rows.Count > 0)
        {
            DataRow row = dt.Rows[0];
            string userType = row["user_type"].ToString();
            
            Session["username"] = username;
            Session["user_type"] = userType;
            
            // If customer, get customer_id
            if (userType == "customer")
            {
                string custQuery = "SELECT customer_id FROM customer WHERE username = @username";
                MySqlParameter[] custParams = { new MySqlParameter("@username", username) };
                object custId = DbConnection.ExecuteScalar(custQuery, custParams);
                if (custId != null)
                {
                    Session["customer_id"] = custId.ToString();
                }
                Response.Redirect("Home.aspx");
            }
            else
            {
                Response.Redirect("AdminDashboard.aspx");
            }
        }
        else
        {
            lblMessage.Text = "Invalid username or password.";
        }
    }
}
