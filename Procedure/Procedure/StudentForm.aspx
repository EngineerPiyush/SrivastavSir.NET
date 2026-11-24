<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="StudentForm.aspx.cs" Inherits="Procedure.StudentForm" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table>
        <tr>
            <td>Student Name :</td>
            <td>
                <asp:TextBox ID="txtname" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>Student Gender :</td>
            <td>
                <asp:radiobuttonlist runat="server" ID="rblgender">
                    <asp:listitem text="Male" />
                    <asp:listitem text="Female" />
                    <asp:listitem text="Other" />
                </asp:radiobuttonlist>
            </td>
        </tr>
        <tr>
            <td>Student Country :</td>
            <td>
                <asp:DropDownList ID="ddlcountry" runat="server" OnSelectedIndexChanged="ddlcountry_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td>Student State :</td>
            <td>
                <asp:DropDownList ID="ddlstate" runat="server"></asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td></td>
            <td>
                <asp:Button runat="server" ID="btnsave" Text="Save" OnClick="btnsave_Click" />
            </td>
        </tr>

        <tr>
            <td></td>
            <td>
                <asp:GridView runat="server" ID="gv_student" AutoGenerateColumns="false" OnRowCommand="gv_student_RowCommand">
                    <columns>
                        <asp:TemplateField HeaderText="Student ID">
                            <itemtemplate>
                                <%#Eval("Studentid")%>
                            </itemtemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Student Name">
                            <itemtemplate>
                                <%#Eval("StudentName")%>
                            </itemtemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Student Country">
                            <itemtemplate>
                                <%#Eval("CountryName")%>
                            </itemtemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Student State">
                            <itemtemplate>
                                <%#Eval("StateName")%>
                            </itemtemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Student Gender">
                            <itemtemplate>
                                <%#Eval("StudentGender") %>
                            </itemtemplate>
                        </asp:TemplateField>
                        <asp:TemplateField>
                            <itemtemplate>
                                <asp:Button Text="Delete" runat="server" CommandArgument='<%#Eval("Studentid") %>' CommandName="DeleteData" />
                            </itemtemplate>
                        </asp:TemplateField>
                        <asp:TemplateField>
                            <itemtemplate>
                                <asp:Button Text="update" runat="server" CommandArgument='<%#Eval("Studentid")%>' CommandName="UpdateData" />
                            </itemtemplate>
                        </asp:TemplateField>
                    </columns>
                </asp:GridView>
            </td>
        </tr>
    </table>
</asp:Content>
