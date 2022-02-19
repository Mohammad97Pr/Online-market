<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMaster.master" AutoEventWireup="true" CodeFile="AddProduct.aspx.cs" Inherits="AddProduct" %>
<asp:Content ID="Content2" ContentPlaceHolderID="head" Runat="Server">
         <script type="text/javascript">
        $(document).ready(function () {
            $(".table").prepend($("<thead></thead>").append($(this).find("tr:first"))).dataTable();
        }); 
    </script>


  
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="container">
        <div class="form-horizontal">



            <div class="row">
                <div class=" col-md-10 mx-auto">
                    <div class="card">
                        <div class=" card-body">
                            <div class="row">
                                <div class="col">
                                    <center><img src="photo/shipping.png" height="200px" width="250px" />
                                       <%--<img width="120px" src="imgs/generaluser.png" />--%>
                               </center>
                                </div>
                            </div>
                            <div class="row">
                                <div class=" col">
                                    <center>
                                       <h2>Add Product</h2>
                                </center>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col">
                                    <hr />
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label>Name </label>
                                        <asp:TextBox ID="txtPName" CssClass="form-control" runat="server"></asp:TextBox>

                                    </div>
                                </div>

                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label>Price</label>
                                        <asp:TextBox ID="txtPrice" CssClass="form-control" runat="server"></asp:TextBox>

                                    </div>
                                </div>


                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label>Selling Price</label>
                                        <asp:TextBox ID="txtSelPrice" CssClass="form-control" runat="server"></asp:TextBox>

                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-3">
                                    <div class="form-group">
                                        <label>Brand</label>
                                        <asp:DropDownList AutoPostBack="true" OnSelectedIndexChanged="ddlBrands_SelectedIndexChanged" ID="ddlBrands" DataTextField="Name" DataValueField="BrandID" CssClass="form-control" runat="server"></asp:DropDownList>

                       
                                    </div>
                                </div>

                                <div class="col-md-3">
                                    <div class="form-group">
                                        <label>Catoreagy</label>
                                        <asp:DropDownList ID="ddlCategory" OnSelectedIndexChanged="ddlCategory_SelectedIndexChanged" AutoPostBack="true" CssClass="form-control" runat="server"></asp:DropDownList>


                                    </div>
                                </div>

                                <div class="col-md-3">
                                    <div class="form-group">
                                        <label>Sub Catoreagy</label>
                                        <asp:DropDownList ID="ddlSubCategory" OnSelectedIndexChanged="ddlSubCategory_SelectedIndexChanged" AutoPostBack="true" CssClass="form-control" runat="server"></asp:DropDownList>

                                    </div>
                                </div>
                                <div class="col-md-3">
                                    <div class="form-group">
                                        <label>Gender</label>
                                        <asp:DropDownList ID="ddlGender" OnSelectedIndexChanged="ddlGender_SelectedIndexChanged" AutoPostBack="true" CssClass="form-control" runat="server"></asp:DropDownList>

                                    </div>
                                </div>
                            </div>


                            <div class=" row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                    
                                        <label>Size</label>
                                        <asp:ListBox SelectionMode="Multiple" Rows="3" ID="cblSize" CssClass="form-control" runat="server"></asp:ListBox>
                                            </div>
                                
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label>Quantinty</label>    
                                        <asp:TextBox ID="txtQuantity" CssClass="form-control" runat="server"></asp:TextBox>

                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label>Description</label>
                                        <asp:TextBox ID="txtDesc" TextMode="MultiLine" CssClass="form-control" runat="server"></asp:TextBox>

                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label>Product Details</label>
                                        <asp:TextBox ID="txtPDetails" TextMode="MultiLine" CssClass="form-control" runat="server"></asp:TextBox>

                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label>Material and Care</label>
                                        <asp:TextBox ID="txtMatCare" TextMode="MultiLine" CssClass="form-control" runat="server"></asp:TextBox>

                                    </div>
                                </div>

                            </div>

                            <div class="row">
                                <div class="col-md-12">
                                                                      <label>Upload Image</label>

                        <div class="input-group mb-3">
                              <div class="custom-file">

                                        <asp:FileUpload ID="fuImg01" AllowMultiple="true"  Width="100%" CssClass="custom-file-input" runat="server" />
                                            <asp:Label runat="server" ID="lbl154"  class="custom-file-label"  Text=""  for="fuImg01"></asp:Label>
                                  
                                    </div></div>
                                </div>
                                <div class="col-md-6">
                                    <%--<div class="form-group">
                                        <label>Upload Image</label>
                                        <asp:FileUpload ID="fuImg02" CssClass="form-control" runat="server" />
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator10" CssClass="text-danger" runat="server" ErrorMessage="This field is Required !" ControlToValidate="fuImg02"></asp:RequiredFieldValidator>

                                    </div>--%>
            
    

                                                        </div>

                            </div>
                            <div class="row">
                                <%--<div class="col-md-4">
                                    <div class="form-group">
                                        <label>Upload Image</label>
                                        <asp:FileUpload ID="fuImg03" CssClass="form-control" runat="server" />
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator11" CssClass="text-danger" runat="server" ErrorMessage="This field is Required !" ControlToValidate="fuImg03"></asp:RequiredFieldValidator>

                                    </div>
                                </div>--%>
                                <div class="col-md-4">
                                    <%--<div class="form-group">
                                        <label>Upload Image</label>
                                        <asp:FileUpload ID="fuImg04" CssClass="form-control" runat="server" />
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator12" CssClass="text-danger" runat="server" ErrorMessage="This field is Required !" ControlToValidate="fuImg03"></asp:RequiredFieldValidator>

                                    </div>--%>
                                </div>

                                <div class="col-md-4">
                                    <%--<div class="form-group">
                                        <label>Upload Image</label>
                                        <asp:FileUpload ID="fuImg05" CssClass="form-control" runat="server" />
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator13" CssClass="text-danger" runat="server" ErrorMessage="This field is Required !" ControlToValidate="fuImg05"></asp:RequiredFieldValidator>
                                    </div>--%>
                                </div>

                            </div>

                            <div class=" row">


                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label>Free Delivery</label>
                                        <asp:CheckBox ID="cbFD" runat="server" />
                                    </div>
                                </div>

                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label>30 Days Return</label>

                                        <asp:CheckBox ID="cb30Ret" runat="server" />
                                    </div>
                                </div>

                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label>COD</label>

                                        <asp:CheckBox ID="cbCOD" runat="server" />
                                    </div>
                                </div>

                            </div>
                            <br />
                            <hr />
                            <br />
                            <%-- <div class="row">--%>
                            <div class="form-group">

                                <asp:Button ID="btnAdd" runat="server" Text="Add" class="btn btn-success btn-block btn-lg" OnClick="btnAdd_Click" />
                            </div>
                        </div>


                    </div>

                </div>
                <br />
            </div>
        </div>




    </div>

</asp:Content>

