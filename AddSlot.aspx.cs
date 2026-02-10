using System;
using System.Data;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;

public partial class AddSlot : System.Web.UI.Page
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
        DataTable dt = DbConnection.ExecuteQuery("SELECT * FROM parking_slot ORDER BY slot_id DESC");
        gvSlots.DataSource = dt;
        gvSlots.DataBind();
    }

    protected void btnAdd_Click(object sender, EventArgs e)
    {
        string location = txtLocation.Text.Trim();
        string type = ddlType.SelectedValue;
        string status = ddlStatus.SelectedValue;

        // Check duplicate
        object check = DbConnection.ExecuteScalar("SELECT COUNT(*) FROM parking_slot WHERE slot_location='" + location + "'");
        if (Convert.ToInt32(check) > 0)
        {
            lblMessage.Text = "<span style='color:red;'>Slot location already exists.</span>";
            return;
        }

        string query = "INSERT INTO parking_slot (slot_location, slot_type, status) VALUES (@loc, @type, @status)";
        MySqlParameter[] parameters = {
            new MySqlParameter("@loc", location),
            new MySqlParameter("@type", type),
            new MySqlParameter("@status", status)
        };

        DbConnection.ExecuteNonQuery(query, parameters);
        
        txtLocation.Text = "";
        lblMessage.Text = "<span style='color:green;'>Slot added successfully.</span>";
        BindGrid();
    }

    protected void gvSlots_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        int id = Convert.ToInt32(gvSlots.DataKeys[e.RowIndex].Value);
        string query = "DELETE FROM parking_slot WHERE slot_id = @id";
        MySqlParameter[] px = { new MySqlParameter("@id", id) };
        
        DbConnection.ExecuteNonQuery(query, px);
        BindGrid();
    }

    protected void gvSlots_RowEditing(object sender, GridViewEditEventArgs e)
    {
        gvSlots.EditIndex = e.NewEditIndex;
        BindGrid();
    }

    protected void gvSlots_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        gvSlots.EditIndex = -1;
        BindGrid();
    }

    protected void gvSlots_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        int id = Convert.ToInt32(gvSlots.DataKeys[e.RowIndex].Value);
        
        // Find controls
        TextBox txtLoc = (TextBox)gvSlots.Rows[e.RowIndex].FindControl("txtEditLoc");
        DropDownList ddlType = (DropDownList)gvSlots.Rows[e.RowIndex].FindControl("ddlEditType");
        DropDownList ddlStatus = (DropDownList)gvSlots.Rows[e.RowIndex].FindControl("ddlEditStatus");

        string query = "UPDATE parking_slot SET slot_location=@loc, slot_type=@type, status=@stat WHERE slot_id=@id";
        MySqlParameter[] p = {
            new MySqlParameter("@loc", txtLoc.Text),
            new MySqlParameter("@type", ddlType.SelectedValue),
            new MySqlParameter("@stat", ddlStatus.SelectedValue),
            new MySqlParameter("@id", id)
        };

        DbConnection.ExecuteNonQuery(query, p);
        
        gvSlots.EditIndex = -1;
        BindGrid();
    }

    public string GetStatusClass(string status)
    {
        if (status == "Available") return "status-available";
        if (status == "Booked") return "status-booked";
        return "status-pending";
    }
}
