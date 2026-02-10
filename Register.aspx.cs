using System;
using System.Data;
using MySql.Data.MySqlClient;

public partial class Register : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnRegister_Click(object sender, EventArgs e)
    {
        string name = txtName.Text.Trim();
        string email = txtEmail.Text.Trim();
        string phone = txtPhone.Text.Trim();
        string address = txtAddress.Text.Trim();
        string username = txtUsername.Text.Trim();
        string password = txtPassword.Text.Trim();

        // Check if username exists
        string checkQuery = "SELECT COUNT(*) FROM login WHERE username = @username";
        MySqlParameter[] checkParams = { new MySqlParameter("@username", username) };
        
        long count = (long)DbConnection.ExecuteScalar(checkQuery, checkParams);
        
        if (count > 0)
        {
            lblMessage.Text = "Username already taken.";
            lblMessage.ForeColor = System.Drawing.Color.Red;
            return;
        }

        try
        {
            // Insert into login
            string loginQuery = "INSERT INTO login (username, password, user_type, last_login) VALUES (@username, @password, 'customer', NOW())";
            MySqlParameter[] loginParams = {
                new MySqlParameter("@username", username),
                new MySqlParameter("@password", password)
            };
            DbConnection.ExecuteNonQuery(loginQuery, loginParams);

            // Insert into customer
            string custQuery = "INSERT INTO customer (username, name, phone, email, address) VALUES (@username, @name, @phone, @email, @address)";
            MySqlParameter[] custParams = {
                new MySqlParameter("@username", username),
                new MySqlParameter("@name", name),
                new MySqlParameter("@phone", phone),
                new MySqlParameter("@email", email),
                new MySqlParameter("@address", address)
            };
            DbConnection.ExecuteNonQuery(custQuery, custParams);

            lblMessage.Text = "Registration successful! Redirecting to login...";
            lblMessage.ForeColor = System.Drawing.Color.Green;
            
            // Redirect after short delay or immediately
            Response.AddHeader("REFRESH", "2;URL=Login.aspx");
        }
        catch (Exception ex)
        {
            lblMessage.Text = "Error: " + ex.Message;
            lblMessage.ForeColor = System.Drawing.Color.Red;
        }
    }
}
