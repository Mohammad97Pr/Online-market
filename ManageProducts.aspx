
<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMaster.master" AutoEventWireup="true" CodeFile="ManageProducts.aspx.cs" Inherits="ManageProducts" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
           <script type="text/javascript">
        $(document).ready(function () {
            $(".table").prepend($("<thead></thead>").append($(this).find("tr:first"))).dataTable();
        });
    
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="card">
                    <div class="card-body">
                          <div class="row">
                            <div class="col">
                                <center>
                           <h4>Products Inventory List</h4>
                        </center>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <hr />
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <asp:GridView ID="grid_Products" runat="server" OnRowCommand="grid_Products_RowCommand"
                                     AutoGenerateColumns="False" CssClass="table table-striped table-primary  table-bordered mx-auto">
                                    <Columns>
                                                                            <asp:TemplateField HeaderText="lbl01" Visible="False">

                                            <ItemTemplate>
                                                <asp:Label ID="lbl01" runat="server" Text='<%# Bind("PID") %>'></asp:Label>
                                            </ItemTemplate>

                                        </asp:TemplateField>
                                      <%--  <asp:TemplateField HeaderText="path" Visible="False">
                                            <ItemTemplate>
                                                <asp:Label ID="lbl_path1" runat="server" Text='<%# Bind("book_path") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>--%>

                                        <asp:TemplateField>

                                            <ItemTemplate>
                                                <div class="container-fluid">
                                                    <div class="row">

                                                        <div class="col-lg-10">
                                                            <div class="row">
                                                                <div class="col">
                                                                    <asp:Label runat="server" ID="Label1" Font-Bold="True" Font-Italic="True" Font-Size="X-Large" Text='<%# Eval("PName") %>'></asp:Label>
                                                                </div>
                                                            </div>
                                                            <div class="row">
                                                                <div class="col-12">
                                                                    PPrice:
                                                                <asp:Label ID="Label2" runat="server" Font-Bold="True" Font-Italic="True" Text='<%# Eval("PPrice") %>'></asp:Label>
                                                                    &nbsp;|&nbsp; PSelPrice:
                                                                <asp:Label ID="Label3" runat="server" Font-Bold="True" Font-Italic="True" Text='<%# Eval("PSelPrice") %>'></asp:Label>
                                                                    &nbsp;| Brand:
                                                                <asp:Label ID="Label4" runat="server" Font-Bold="True" Font-Italic="True" Text='<%# Eval("Name") %>'></asp:Label>
                                                                </div>
                                                            </div>
                                                            <div class="row">
                                                                <div class="col-12">
                                                                    Category:
                                                                <asp:Label ID="Label5" runat="server" Font-Bold="True" Font-Italic="True" Text='<%# Eval("CatName") %>'></asp:Label>
                                                                    &nbsp;| SubCategory:
                                                                <asp:Label ID="Label6" runat="server" Font-Bold="True" Font-Italic="True" Text='<%# Eval("SubCatName") %>'></asp:Label>
                                                                    &nbsp;
                                                                </div>
                                                            </div>
                                                            <div class="row">
                                                                <div class="col-12">
                                                                    Gender:
                                                                <asp:Label ID="Label7" runat="server" Font-Bold="True" Font-Italic="True" Text='<%# Eval("GenderName") %>'></asp:Label>
                                                                    &nbsp;| Description:
                                                                <asp:Label ID="Label8" runat="server" Font-Bold="True" Font-Italic="True" Text='<%# Eval("PDescription") %>'></asp:Label>
                                                                    &nbsp;| ProductDetails:
                                                                    <asp:Label ID="Label9" runat="server" Font-Bold="True" Font-Italic="True" Text='<%# Eval("PProductDetails") %>'></asp:Label>
                                                                </div>
                                                            </div>
                                                            <div class="row">
                                                                <div class="col-12">
                                                                    MaterialCare:
                                                                <asp:Label ID="Label10" runat="server" Font-Bold="True" Font-Italic="True" Text='<%# Eval("PMaterialCare") %>'></asp:Label>
                                                                </div>
                                                            </div>
                                                        </div>

                                                        <div class="col-lg-">
                                                        
                                                        
                                                        </div>

                                                </div>
                                            </ItemTemplate>
    </asp:TemplateField>
                                         
                                        
                                                        
                                        

                                        <asp:ButtonField ButtonType="Button" CommandName="del" Text="Delete" ControlStyle-CssClass="badge-danger badge-pill">

                                            <ControlStyle CssClass=" btn btn-danger badge-pill" />
                                        </asp:ButtonField>
                                        <asp:ButtonField ButtonType="Button" CommandName="view" Text="ViewPhotos" ControlStyle-CssClass="badge-success badge-pill">

                                            <ControlStyle CssClass=" btn btn-success badge-pill" />
                                        </asp:ButtonField>
                                      
                                        
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

