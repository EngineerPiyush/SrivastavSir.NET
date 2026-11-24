<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="UserForm.aspx.cs" Inherits="DynamicList.UserForm" %>

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
                    </asp:RadioButtonList>
                </td>
            </tr>
            <tr>
                <td>User Course</td>
                <td>
                    <asp:DropDownList runat="server" ID="ddlcourse">
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td>User City</td>
                <td>
                    <asp:DropDownList runat="server" ID="ddlcity">
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
                                    <%#Eval("gendername") %>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="User Course">
                                <ItemTemplate>
                                    <%#Eval("coursename")%>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="User City">
                                <ItemTemplate>
                                    <%#Eval("cityname")%>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField>
                                <ItemTemplate>
                                    <asp:Button Text="Delete" runat="server" ID="delete" CommandName="del" CommandArgument='<%#Eval("id") %>' />
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField>
                                <ItemTemplate>
                                    <asp:Button Text="Edit" ID="update" CommandArgument='<%#Eval("id") %>' runat="server" CommandName="updateUser" />
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                </td>
            </tr>
        </tbody>
    </table>
</asp:Content>
