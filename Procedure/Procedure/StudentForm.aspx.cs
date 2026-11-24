using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace Procedure
{
    public partial class StudentForm : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection("data source=DESKTOP-J30HFG9\\SQLEXPRESS;initial catalog=userinfo; integrated security=true");
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ShowCountry();
                showData();
            }

        }

        public void showData()
        {
            SqlCommand cmd = new SqlCommand("showStudents", con);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            con.Close();
            gv_student.DataSource = dt;
            gv_student.DataBind();
            txtname.Text = "";
            ddlcountry.SelectedIndex = 0;
            ddlstate.SelectedIndex = 0;
            rblgender.ClearSelection();
        }

        public void ShowCountry()
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("showCountry", con);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            con.Close();
            ddlcountry.DataValueField = "countryid";
            ddlcountry.DataTextField = "countryname";
            ddlcountry.DataSource = dt;
            ddlcountry.DataBind();
            ddlcountry.Items.Insert(0, new ListItem("-- Select --", "0"));
        }

        public void ShowState()
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("showState", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@cid", ddlcountry.SelectedValue);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            con.Close();
            ddlstate.DataValueField = "stateid";
            ddlstate.DataTextField = "statename";
            ddlstate.DataSource = dt;
            ddlstate.DataBind();
            ddlstate.Items.Insert(0, new ListItem("-- Select --", "0"));
        }

        protected void btnsave_Click(object sender, EventArgs e)
        {
            if (btnsave.Text == "Save")
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("insertStudents", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@sname",txtname.Text);
                cmd.Parameters.AddWithValue("@scountry",ddlcountry.SelectedValue);
                cmd.Parameters.AddWithValue("@sgender", rblgender.SelectedValue);
                cmd.Parameters.AddWithValue("@sstate", ddlstate.SelectedValue);
                cmd.ExecuteNonQuery();
                con.Close();
                showData();
            }
            else if (btnsave.Text == "Update")
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("updateStudents", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@sname",txtname.Text);
                cmd.Parameters.AddWithValue("@scountry",ddlcountry.SelectedValue);
                cmd.Parameters.AddWithValue("@sstate", ddlstate.SelectedValue);
                cmd.Parameters.AddWithValue("@sgender", rblgender.SelectedValue);
                cmd.Parameters.AddWithValue("@sid", ViewState["idViaCmd"]);
                cmd.ExecuteNonQuery();
                con.Close();
                showData();
                btnsave.Text = "Save";
            }

        }

        protected void ddlcountry_SelectedIndexChanged(object sender, EventArgs e)
        {
            ShowState();
        }

        protected void gv_student_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "DeleteData")
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("deleteStudent", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@sid", e.CommandArgument);
                cmd.ExecuteNonQuery();
                con.Close();
                showData();
            }
            else if (e.CommandName == "UpdateData")
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("editStudent", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@sid", e.CommandArgument);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                con.Close();
                txtname.Text = dt.Rows[0]["StudentName"].ToString();
                rblgender.SelectedValue = dt.Rows[0]["StudentGender"].ToString();
                ddlcountry.SelectedValue = dt.Rows[0]["StudentCountry"].ToString();
                ShowState();
                ddlstate.SelectedValue = dt.Rows[0]["StudentState"].ToString();
                ViewState["idViaCmd"] = e.CommandArgument;
                btnsave.Text = "Update";
            }

        }
    }
}