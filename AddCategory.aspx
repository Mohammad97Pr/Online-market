<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMaster.master" AutoEventWireup="true" CodeFile="AddCategory.aspx.cs" Inherits="AddCategory" %>
<asp:Content ID="Content2" ContentPlaceHolderID="head" Runat="Server">
         <script type="text/javascript">
        $(document).ready(function () {
            $(".table").prepend($("<thead></thead>").append($(this).find("tr:first"))).dataTable();
        });

        
    </script>
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <div class="container-fluid">
        <div class="row">
            <div class=" col-md-3">
                <div class="card">
                    <div class=" card-body">
                        <div class="row">
                            <div class="col">
                                <center><img src="photo/category.png" height="200px" width="250px" />
<%--                                       <img width="120px" src="imgs/generaluser.png" />--%>
                                </center>
                            </div>
                        </div>
                        <div class="row">
                            <div class=" col">
                                <center>
                                       <h3>Add Category</h3>
                                </center>
                            </div>
                        </div>
                        <hr />
                        <div class="row">
                            <div class="col">
                                <div class="form-group">
                                    <label>Brands</label>
                                    <asp:DropDownList ID="ddlbrands" OnSelectedIndexChanged="ddlbrands_SelectedIndexChanged" AutoPostBack="true" DataTextField="Name" DataValueField="BrandID" CssClass="form-control" runat="server"></asp:DropDownList>

                                </div>
                            </div>
                        </div>

                         <div class="row">
                            <div class="col">
                                <div class="form-group">
                                    <label>Name</label>
                                    <asp:TextBox ID="txtCatName" CssClass="form-control" placeholder="Name" runat="server"></asp:TextBox>

                                </div>
                            </div>
                        </div>

                        <div class="form-group">
                            <asp:Button ID="btnAdd" runat="server" Text="Add" CssClass="btn btn-primary btn-block btn-lg" OnClick="btnAdd_Click" />

                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-9">
                <div class="card">
                    <div class=" card-body">
                        <div class="row">
                            <div class="col">
                                <asp:GridView ID="grid_files" runat="server"
                                    AutoGenerateColumns="False" CssClass="table table-striped  table-bordered table-primary mx-auto"
                                    OnRowCommand="grid_files_RowCommand">

                                    <Columns>
                                        <asp:BoundField DataField="CatID" HeaderText="ID" SortExpression="f" />
                                        <asp:BoundField DataField="CatName" HeaderText="Name" />
                                        <asp:ButtonField ButtonType="Button" CommandName="del" Text="Delete" ControlStyle-CssClass="badge-danger badge-pill">

                                            <ControlStyle CssClass=" btn btn-danger badge-pill" />
                                        </asp:ButtonField>
                                        <asp:TemplateField HeaderText="lbl1" Visible="False">
                                            <ItemTemplate>
                                                <asp:Label ID="lbl1" runat="server" Text='<%# Bind("CatID") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>

                                    </Columns>
                                </asp:GridView>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </div>




    
</asp:Content>

