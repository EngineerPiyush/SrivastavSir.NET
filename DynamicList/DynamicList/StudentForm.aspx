<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="StudentForm.aspx.cs" Inherits="DynamicList.StudentForm" %>

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
                    <Columns>
                        <asp:TemplateField HeaderText="Student ID">
                            <ItemTemplate>
                                <%#Eval("Studentid")%>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Student Name">
                            <ItemTemplate>
                                <%#Eval("StudentName")%>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Student Country">
                            <ItemTemplate>
                                <%#Eval("countryname")%>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Student State">
                            <ItemTemplate>
                                <%#Eval("statename")%>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:Button Text="Delete" runat="server" CommandArgument='<%#Eval("Studentid") %>' CommandName="DeleteData" />
                            </ItemTemplate>
                         </asp:TemplateField>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:Button Text="update" runat="server" CommandArgument='<%#Eval("Studentid")%>' CommandName="UpdateData"/>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </td>
        </tr>
    </table>
</asp:Content>
