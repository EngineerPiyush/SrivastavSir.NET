<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="UserForm.aspx.cs" Inherits="MasterPageProject.UserForm" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table id="user_form">
        <tbody>
            <tr>
                <td>User Name</td>
                <td>
                    <asp:TextBox ID="txtname" runat="server" />
                </td>
            </tr>
            <tr>
                <td>User Gender</td>
                <td>
                    <asp:RadioButtonList runat="server" ID="rblgender">
                        <asp:ListItem Text="Male" Value="1" />
                        <asp:ListItem Text="Female" Value="2" />
                        <asp:ListItem Text="Transgender" Value="3" />
                    </asp:RadioButtonList>
                </td>
            </tr>
            <tr>
                <td>User Course</td>
                <td>
                    <asp:DropDownList runat="server" ID="ddlcourse">
                        <asp:ListItem Text="--Select--" Value="0" />
                        <asp:ListItem Text="MCA" Value="1" />
                        <asp:ListItem Text="B.Tech" Value="2" />
                        <asp:ListItem Text="M.Tech" Value="3" />
                        <asp:ListItem Text="BCA" Value="4" />
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td>User City</td>
                <td>
                    <asp:DropDownList runat="server" ID="ddlcity">
                        <asp:ListItem Text="--Select--" Value="0" />
                        <asp:ListItem Text="Lucknow" Value="1" />
                        <asp:ListItem Text="Siddharth Nagar" Value="2" />
                        <asp:ListItem Text="Ayodhya" Value="3" />
                        <asp:ListItem Text="Noida" Value="4" />
                        <asp:ListItem Text="Delhi" Value="5" />
                        <asp:ListItem Text="Mumbai" Value="6" />
                        <asp:ListItem Text="Gorakhpur" Value="7" />
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td></td>
                <td>
                    <asp:Button ID="btninsert" Text="Insert" runat="server" OnClick="btninsert_Click" />
                </td>
            </tr>
            <tr>
                <td></td>
                <td>
                    <asp:GridView runat="server" ID="gvusers" AutoGenerateColumns="false" OnRowCommand="gvusers_RowCommand">
                        <Columns>
                            <asp:TemplateField HeaderText="User ID">
                                <ItemTemplate>
                                    <%#Eval("id")%>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="User Name">
                                <ItemTemplate>
                                    <%#Eval("name") %>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="User Gender">
                                <ItemTemplate>
                                    <%#Eval("gender").ToString() == "1" ? "Male" : Eval("gender").ToString() == "2" ? "Female" : "Transgender" %>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="User City">
                                <ItemTemplate>
                                    <%#Eval("city").ToString() == "1" ? "Lucknow" : Eval("city").ToString() == "2" ? "Siddharth Nagar" : Eval("city").ToString() == "3" ? "Ayodhya" : Eval("city").ToString() == "4" ? "Noida" : Eval("city").ToString() == "5" ? "Delhi" : Eval("city").ToString() == "6" ? "Mumbai" : "Gorakhpur"%>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="User Course">
                                <ItemTemplate>
                                    <%#Eval("course").ToString() == "1" ?"MCA" : Eval("course").ToString() == "2" ? "B.Tech" : Eval("course").ToString() == "3" ? "M.Tech" : "BCA" %>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField>
                                <ItemTemplate>
                                    <asp:LinkButton Text="Delete" runat="server" ID="delete" CommandName="del" CommandArgument='<%#Eval("id") %>' />
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField>
                                <ItemTemplate>
                                    <asp:LinkButton Text="Edit" ID="update" CommandArgument='<%#Eval("id") %>' runat="server" CommandName="updateUser" />
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                </td>
            </tr>
        </tbody>
    </table>
</asp:Content>
