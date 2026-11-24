<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="StudentForm.aspx.cs" Inherits="firstprojectasp.StudentForm" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table>
                <tr>
                    <td>Student Name:</td>
                    <td>
                        <asp:TextBox ID="txtname" runat="server" /></td>
                </tr>
                <tr>
                    <td>Roll No:</td>
                    <td>
                        <asp:TextBox ID="txtRollno" runat="server" /></td>
                </tr>
                <tr>
                    <td>Age:</td>
                    <td>
                        <asp:TextBox ID="txtage" runat="server" /></td>
                </tr>
                <tr>
                    <td>Mobile:</td>
                    <td>
                        <asp:TextBox ID="txtMobile" runat="server" /></td>
                </tr>
                <tr>
                    <td>College:</td>
                    <td>
                        <asp:TextBox ID="txtCollege" runat="server" /></td>
                </tr>
                <tr>
                    <td></td>
                    <td>
                        <asp:Button ID="btnInsert" runat="server" Text="Insert" OnClick="btnInsert_Click" /></td>
                </tr>
            </table>
            <asp:GridView ID="gvStudents" AutoGenerateColumns="false" runat="server" OnRowCommand="gvStudents_RowCommand">
                <Columns>
                    <asp:TemplateField HeaderText="Student ID">
                        <ItemTemplate>
                            <%#Eval("id") %>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Student Name">
                        <ItemTemplate>
                            <%#Eval("name") %>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Student Roll No.">
                        <ItemTemplate>
                            <%#Eval("Rollno") %>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Student Age">
                        <ItemTemplate>
                            <%#Eval("age") %> Years
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Mobile No">
                        <ItemTemplate>
                            +91 - <%#Eval("MobileNumber") %>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="College Name">
                        <ItemTemplate>
                            <%#Eval("college") %>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:LinkButton runat="server" ID="delete" commandName="Del" Text="Delete" CommandArgument='<%#Eval("id") %>'></asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:LinkButton runat="server" ID="edit" Text="Edit" CommandName="Updt" CommandArgument='<%#Eval("id") %>'></asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>

                </Columns>
            </asp:GridView>
        </div>
    </form>
</body>
</html>
