using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;


namespace MasterPageProject
{
    public partial class UserForm : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection("data source=DESKTOP-J30HFG9\\SQLEXPRESS;initial catalog=userinfo; integrated security=true");
        protected void Page_Load(object sender, EventArgs e)
        {
            ShowData();
        }

        public void ShowData()
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("select * from users", con);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            con.Close();
            gvusers.DataSource = dt;
            gvusers.DataBind();
        }
        protected void btninsert_Click(object sender, EventArgs e)
        {
            if(btninsert.Text == "Insert")
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("insert into users(name,gender,course,city)values('" +txtname.Text+ "','" + rblgender.SelectedValue + "','" +ddlcourse.SelectedValue + "','" + ddlcity.SelectedValue+ "')", con);
                cmd.ExecuteNonQuery();
                con.Close();
                txtname.Text = "";
                rblgender.ClearSelection();
                ddlcourse.SelectedIndex = 0;
                ddlcity.SelectedIndex = 0;
                ShowData();
            } else if(btninsert.Text == "Update")
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("update users set name='" + txtname.Text+ "',gender='" + rblgender.SelectedValue+ "',course='" +ddlcourse.SelectedValue+ "',city='" +ddlcity.SelectedValue+ "' where id ='"+ ViewState["idViaCmd"] + "'", con);
                cmd.ExecuteNonQuery();
                con.Close();
                txtname.Text = "";
                rblgender.ClearSelection();
                ddlcourse.SelectedIndex = 0;
                ddlcity.SelectedIndex = 0;
                btninsert.Text = "Insert";
                ShowData();
            }
        }

        protected void gvusers_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if(e.CommandName == "del")
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("delete from users where id='" + e.CommandArgument + "'",con);
                cmd.ExecuteNonQuery();
                con.Close();
                ShowData();
            }
            else if (e.CommandName == "updateUser")
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("select * from users where id ='" + e.CommandArgument + "'", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                con.Close();
                txtname.Text = dt.Rows[0]["name"].ToString();
                rblgender.SelectedValue = dt.Rows[0]["gender"].ToString();
                ddlcourse.SelectedValue = dt.Rows[0]["course"].ToString();
                ddlcity.SelectedValue = dt.Rows[0]["city"].ToString();
                ViewState["idViaCmd"] = e.CommandArgument;
                btninsert.Text = "Update";
            }
        }
    }
}