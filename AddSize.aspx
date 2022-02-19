<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMaster.master" AutoEventWireup="true" CodeFile="AddSize.aspx.cs" Inherits="AddSize" %>
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
            <div class=" col-md-5">
                <div class="card">
                    <div class=" card-body">
                        <div class="row">
                            <div class="col">
                                <center><img src="photo/meter.png" height="200px" width="250px" />
                                       <%--<img width="120px" src="imgs/generaluser.png" />--%>
                               </center>
                            </div>
                        </div>
                        <div class="row">
                            <div class=" col">
                                <center>
                                       <h2>Add Size</h2>
                                </center>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <hr />
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label>Size Name </label>
                                    <asp:TextBox ID="txtSizeName" CssClass="form-control" placeholder="name" runat="server"></asp:TextBox>

                                </div>
                            </div>

                            <div class="col-md-6">
                                <div class="form-group">
                                    <label>Brand</label>
                                    <asp:DropDownList ID="ddlBrand" AutoPostBack="true" CssClass="form-control" runat="server"></asp:DropDownList>

                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label>Category</label>
                                    <asp:DropDownList ID="ddlCategory" OnSelectedIndexChanged="ddlCategory_SelectedIndexChanged" AutoPostBack="true" CssClass="form-control" runat="server"></asp:DropDownList>

                                </div>
                            </div>

                            <div class="col-md-4">
                                <div class="form-group">
                                    <label>Sub Category </label>
                                    <asp:DropDownList ID="ddlSubCat" CssClass="form-control" runat="server"></asp:DropDownList>


                                </div>
                            </div>

                            <div class="col-md-4">
                                <div class="form-group">
                                    <label>Gender</label>
                                    <asp:DropDownList ID="ddlGender" CssClass="form-control" runat="server"></asp:DropDownList>

                                </div>
                            </div>
                        </div>
                
                        <hr />
                        <div class="form-group">

                            <asp:Button ID="btnAdd" runat="server" Text="Add" CssClass="btn btn-lg btn-block btn-primary" OnClick="btnAdd_Click" />
                        </div>
                                 </div>
             
                </div>

            </div>

            <div class="col-md-7">
                <div class="card">
                    <div class=" card-body">
                        <div class="row">
                            <div class="col">
                                <div class="form-group">
                                    <asp:GridView ID="grid_files" runat="server"
                                        AutoGenerateColumns="False" CssClass="table table-striped  table-bordered table-primary mx-auto"
                                        OnRowCommand="grid_files_RowCommand">

                                        <Columns>
                                            <asp:BoundField DataField="SizeID" HeaderText="ID" SortExpression="f" />
                                            <asp:BoundField DataField="SizeName" HeaderText="Name" />
                                            <asp:BoundField DataField="Name" HeaderText="Brand" />
                                            <asp:BoundField DataField="CatName" HeaderText="Category" />
                                            <asp:BoundField DataField="SubCatName" HeaderText="SubCategory" />
                                            <asp:BoundField DataField="GenderName" HeaderText="Gender" />

                                            <asp:ButtonField ButtonType="Button" CommandName="del" Text="Delete" ControlStyle-CssClass="badge-danger badge-pill">

                                                <ControlStyle CssClass=" btn btn-danger badge-pill" />
                                            </asp:ButtonField>
                                            <asp:TemplateField HeaderText="lbl1" Visible="False">
                                                <ItemTemplate>
                                                    <asp:Label ID="lbl1" runat="server" Text='<%# Bind("SizeID") %>'></asp:Label>
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


            <br />
        </div>
        </div>
    
</asp:Content>

