<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMaster.master" AutoEventWireup="true" CodeFile="AddBrand.aspx.cs" Inherits="AddBrand" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
         <script type="text/javascript">
        $(document).ready(function () {
            $(".table").prepend($("<thead></thead>").append($(this).find("tr:first"))).dataTable();
        });
    
    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="container-fluid">
        <div class="row">
            <div class=" col-md-3">
                <div class="card">
                    <div class=" card-body">
                        <div class="row">
                            <div class="col">
                                <center><img src="photo/brand.png" height="200px" width="250px" />
<%--                                       <img width="120px" src="imgs/generaluser.png" />--%>
                                </center>
                            </div>
                        </div>
                        <div class="row">
                            <div class=" col">
                                <center>
                                       <h3>Add Brand</h3>
                                </center>
                            </div>
                        </div>
                        <hr />
                        <div class="row">
                            <div class="col">
                                <div class="form-group">
                                    <label>Name</label>
                    <asp:TextBox ID="txtBrandName" CssClass="form-control" placeholder="name" runat="server"></asp:TextBox>
           
                                </div>
                            </div>
                        </div>

                        <div class="form-group">
                    <asp:Button ID="btnAdd" runat="server" Text="Add" CssClass="btn btn-lg btn-block btn-primary" OnClick="btnAdd_Click" />
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-9">
                <div class="card">
                    <div class=" card-body">
            <div class="row">
                <div class="col">
                    <div class="col">
                        <center>
                            <label>
                                GRid
                            </label>
                        </center>
                    </div>
                </div>
            </div>
                        
                                    <div class="row">
                            <div class="col mx-auto">
                                <asp:GridView ID="grid_files" runat="server"
                                    AutoGenerateColumns="False" CssClass="table table-striped  table-primary mx-auto"
                                    OnRowCommand="grid_files_RowCommand">

                                    <Columns>
                                        <asp:BoundField DataField="BrandID" HeaderText="ID" SortExpression="f" />
                                        <asp:BoundField DataField="Name" HeaderText="Name" />
                                        <asp:ButtonField ButtonType="Button" CommandName="del" Text="Delete" ControlStyle-CssClass="badge-danger badge-pill">

                                            <ControlStyle CssClass=" btn btn-danger badge-pill" />
                                        </asp:ButtonField>
                                        <asp:TemplateField HeaderText="lbl1" Visible="False">
                                            <ItemTemplate>
                                                <asp:Label ID="lbl1" runat="server" Text='<%# Bind("BrandID") %>'></asp:Label>
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

