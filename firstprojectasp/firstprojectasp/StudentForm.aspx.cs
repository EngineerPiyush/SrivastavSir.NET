using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace firstprojectasp
{
    public partial class StudentForm : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection("Data Source=DESKTOP-J30HFG9\\SQLEXPRESS; initial catalog=first_sqlserver_project; Integrated Security = true");
        protected void Page_Load(object sender, EventArgs e)
        {
            displayStudents();
        }

        public void displayStudents()
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("select * from Students", con);
            SqlDataAdapter adpt = new SqlDataAdapter(cmd);
            DataTable dtb = new DataTable();
            adpt.Fill(dtb);
            con.Close();
            gvStudents.DataSource = dtb;
            gvStudents.DataBind();
        }

        protected void btnInsert_Click(object sender, EventArgs e)
        {
            if(btnInsert.Text == "Insert")
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("insert into Students (name,Rollno,age,MobileNumber,college) values('" + txtname.Text + "', '" + txtRollno.Text + "','" + txtage.Text + "','" + txtMobile.Text + "','" + txtCollege.Text + "')", con);
                cmd.ExecuteNonQuery();
                con.Close();
                displayStudents();
                txtname.Text = "";
                txtRollno.Text = "";
                txtage.Text = "";
                txtMobile.Text = "";
                txtCollege.Text = "";
            }
            else if(btnInsert.Text == "Update")
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("Update Students set name='"+txtname.Text+"',Rollno='"+txtRollno.Text+"',age='"+txtage.Text+"',MobileNumber='"+txtMobile.Text+"',college='"+txtCollege.Text+"' where id ='"+ ViewState["idViaCmd"] + "'", con);
                cmd.ExecuteNonQuery();
                con.Close();
                displayStudents();
                txtname.Text = "";
                txtRollno.Text = "";
                txtage.Text = "";
                txtMobile.Text = "";
                txtCollege.Text = "";
                btnInsert.Text = "Insert";
            }
        }

        protected void gvStudents_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Del")
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("delete from students where id='" + e.CommandArgument + "'", con);
                cmd.ExecuteNonQuery();
                con.Close();
                displayStudents();
            }
            else if (e.CommandName == "Updt")
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("select * from Students where id ='"+e.CommandArgument+"'", con);
                SqlDataAdapter adpt = new SqlDataAdapter(cmd);
                DataTable dtb = new DataTable();
                adpt.Fill(dtb);
                con.Close();
                txtname.Text=dtb.Rows[0]["name"].ToString();
                txtage.Text = dtb.Rows[0]["Rollno"].ToString();
                txtRollno.Text = dtb.Rows[0]["age"].ToString();
                txtMobile.Text = dtb.Rows[0]["MobileNumber"].ToString();
                txtCollege.Text = dtb.Rows[0]["college"].ToString();
                btnInsert.Text = "Update";
                ViewState["idViaCmd"] = e.CommandArgument;
            }
        }
    }
}