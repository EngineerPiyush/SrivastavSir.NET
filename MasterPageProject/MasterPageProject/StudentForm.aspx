<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="StudentForm.aspx.cs" Inherits="MasterPageProject.StudentForm" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table id="student_form">
        <tbody>
            <tr>
                <td>Name</td>
                <td>
                    <asp:TextBox ID="txtName" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>Roll No.</td>
                <td>
                    <asp:TextBox ID="txtRollno" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>Age</td>
                <td>
                    <asp:TextBox ID="txtAge" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>Contact No.</td>
                <td>
                    <asp:TextBox ID="txtMobile" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>College</td>
                <td>
                    <asp:TextBox ID="txtCollege" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td></td>
                <td>
                    <asp:Button ID="btnsubmit" Text="Submit" runat="server" OnClick="btnsubmit_Click" />
                </td>
            </tr>
        </tbody>
    </table>
    <asp:GridView ID="gvstudents" runat="server" AutoGenerateColumns="false" OnRowCommand="gvstudents_RowCommand">
        <Columns>
            <asp:TemplateField HeaderText="Student ID">
                <ItemTemplate>
                    <%#Eval("id")%>
                </ItemTemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="Student Name">
                <ItemTemplate>
                    <%#Eval("name")%>
                </ItemTemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="Student RollNo">
                <ItemTemplate>
                    <%#Eval("Rollno")%>
                </ItemTemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="Student Age">
                <ItemTemplate>
                    <%#Eval("age")%>
                </ItemTemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="Contact No">
                <ItemTemplate>
                    <%#Eval("MobileNumber")%>
                </ItemTemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="College Name">
                <ItemTemplate>
                    <%#Eval("college")%>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField>
                <ItemTemplate>
                    <asp:LinkButton ID="btndelete" runat="server" Text="Delete" CommandName="del" CommandArgument=' <%#Eval("id")%>'></asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField>
                <ItemTemplate>
                    <asp:LinkButton ID="btnedit" runat="server" Text="Update" CommandName="editdata" CommandArgument=' <%#Eval("id")%>'></asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
</asp:Content>
