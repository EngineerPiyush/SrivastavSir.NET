using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;

namespace MasterPageProject
{
    public partial class StudentForm : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection("Data Source=DESKTOP-J30HFG9\\SQLEXPRESS; initial catalog=first_sqlserver_project; Integrated Security = true");
        protected void Page_Load(object sender, EventArgs e)
        {
            ShowData();
        }

        public void ShowData()
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("select * from Students",con);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            con.Close();
            gvstudents.DataSource = dt;
            gvstudents.DataBind();
        }
        protected void btnsubmit_Click(object sender, EventArgs e)
        {
            if(btnsubmit.Text == "Submit")
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("insert into Students(name,RollNo,age,MobileNumber,college)values('" + txtName.Text + "','" + txtRollno.Text + "','" + txtAge.Text + "','" + txtMobile.Text + "','" + txtCollege.Text + "')", con);
                cmd.ExecuteNonQuery();
                con.Close();
                txtName.Text = "";
                txtAge.Text = "";
                txtRollno.Text = "";
                txtMobile.Text = "";
                txtCollege.Text = "";
                ShowData();
            }
            else if (btnsubmit.Text == "Update")
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("Update Students set name='" + txtName.Text + "',Rollno='" + txtRollno.Text + "',age='" + txtAge.Text + "',MobileNumber='" + txtMobile.Text + "',college='" + txtCollege.Text + "' where id ='" + ViewState["idViaCmd"] + "'", con);
                cmd.ExecuteNonQuery();
                con.Close();
                txtName.Text = "";
                txtAge.Text = "";
                txtRollno.Text = "";
                txtMobile.Text = "";
                txtCollege.Text = "";
                ShowData();
                btnsubmit.Text = "Submit";
            }
        }

        protected void gvstudents_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "del")
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("delete from Students where id='"+e.CommandArgument+"'",con);
                cmd.ExecuteNonQuery();
                con.Close();
                ShowData();
            }
            else if(e.CommandName == "editdata")
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("select * from Students where id='"+e.CommandArgument+"'",con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                con.Close();
                txtName.Text = dt.Rows[0]["name"].ToString();
                txtAge.Text = dt.Rows[0]["Rollno"].ToString();
                txtRollno.Text = dt.Rows[0]["age"].ToString();
                txtMobile.Text = dt.Rows[0]["MobileNumber"].ToString();
                txtCollege.Text = dt.Rows[0]["college"].ToString();
                btnsubmit.Text = "Update";
                ViewState["idViaCmd"] = e.CommandArgument;
                ShowData();
            }
        }
    }
}