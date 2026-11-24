using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

namespace DynamicList
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
            SqlCommand cmd = new SqlCommand("select * from tblstudents join tblCountry on StudentCountry=countryid join tblstate on StudentState=stateid",con);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            con.Close();
            gv_student.DataSource = dt;
            gv_student.DataBind();
            txtname.Text = "";
            ddlcountry.SelectedIndex = 0;
            ddlstate.SelectedIndex = 0;
        }

        public void ShowCountry()
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("select * from tblCountry", con);
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
            SqlCommand cmd = new SqlCommand("select * from tblstate where countryid='"+ddlcountry.SelectedValue+"'", con);
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
            if(btnsave.Text == "Save")
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("insert into tblstudents (studentname, studentcountry, studentstate) values ('" + txtname.Text + "', '" + ddlcountry.SelectedValue + "', '" + ddlstate.SelectedValue + "')", con);
                cmd.ExecuteNonQuery();
                con.Close();
                showData();
            }else if (btnsave.Text == "Update")
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("Update tblstudents set studentname='"+txtname.Text+ "',studentcountry='"+ddlcountry.SelectedValue+ "',studentstate='"+ddlstate.SelectedValue+ "' where Studentid ='" + ViewState["idViaCmd"] + "'",con);
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
            if(e.CommandName == "DeleteData")
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("delete from tblstudents where Studentid = '" + e.CommandArgument+"'",con);
                cmd.ExecuteNonQuery();
                con.Close();
                showData();
            }
            else if(e.CommandName == "UpdateData")
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("select * from tblstudents where Studentid ='" + e.CommandArgument+"'",con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                con.Close();
                txtname.Text = dt.Rows[0]["StudentName"].ToString();
                ddlcountry.SelectedValue = dt.Rows[0]["StudentCountry"].ToString();
                ShowState();
                ddlstate.SelectedValue = dt.Rows[0]["StudentState"].ToString();
                ViewState["idViaCmd"] = e.CommandArgument;
                btnsave.Text = "Update";
            }

        }
    }
}