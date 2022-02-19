<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMaster.master" AutoEventWireup="true" CodeFile="AddSubCategory.aspx.cs" Inherits="AddSubCategory" %>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     
            <script type="text/javascript">
        $(document).ready(function () {
            $(".table").prepend($("<thead></thead>").append($(this).find("tr:first"))).dataTable();
        });

        
    </script>

    <div class="container-fluid">
        <div class="row">
            <div class=" col-md-3">
                <div class="card">
                    <div class=" card-body">
                        <div class="row">
                            <div class="col">
                                <center><img src="photo/category%20(1).png" height="200px" width="250px" />
<%--                                       <img width="120px" src="imgs/generaluser.png" />--%>
                                </center>
                            </div>
                        </div>
                        <div class="row">
                            <div class=" col">
                                <center>
                                       <h3>Add SubCategory</h3>
                                </center>
                            </div>
                        </div>
                        <hr />
                        <div class="row">
                            <div class="col">
                                <div class="form-group">
                                    <label>Main Category</label>
                                       <asp:DropDownList ID="ddlCategory" AutoPostBack="true" OnSelectedIndexChanged="ddlCategory_SelectedIndexChanged" CssClass="form-control" runat="server"></asp:DropDownList>
              
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <div class="form-group">
                                    <label>SubCategory</label>
                                       <asp:TextBox ID="txtSubCatName" CssClass="form-control" runat="server"></asp:TextBox>
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
                                <asp:GridView ID="grid_files" runat="server"
                                    AutoGenerateColumns="False" CssClass="table table-striped  table-bordered table-primary mx-auto"
                                    OnRowCommand="grid_files_RowCommand">
                                    
                                    <Columns>
                                        <asp:BoundField DataField="SubCatID" HeaderText="ID" SortExpression="f" />
                                        <asp:BoundField DataField="SubCatName" HeaderText="SubName" />
                                                                                <asp:BoundField DataField="MainCatID" HeaderText="CategoryName" />

                                        <asp:ButtonField ButtonType="Button" CommandName="del" Text="Delete" ControlStyle-CssClass="badge-danger badge-pill">

                                            <ControlStyle CssClass=" btn btn-danger badge-pill" />
                                        </asp:ButtonField>
                                        <asp:TemplateField HeaderText="lbl1" Visible="False">
                                            <ItemTemplate>
                                                <asp:Label ID="lbl1" runat="server" Text='<%# Bind("SubCatID") %>'></asp:Label>
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
    
    
    
    
    <div class="container">
        <div class="form-horizontal">
            <h2>Add Sub Category</h2>
            <hr />
            <div class="form-group">
                <asp:Label ID="Label1" runat="server" CssClass="col-md-2 control-label" Text="Main Category"></asp:Label>
                <div class="col-md-3">
                   </div>
            </div>
             <div class="form-group">
                <asp:Label ID="Label2" runat="server" CssClass="col-md-2 control-label" Text="Sub Category"></asp:Label>
                <div class="col-md-3">
                </div>
            </div>
            <div class="form-group">
                <div class="col-md-2"></div>
                <div class="col-md-6">
                </div>
            </div>
        </div>
          <h1>Sub Categories</h1>
        <hr />
        <div class="panel panel-default">
            <!-- Default panel contents -->
            <div class="panel-heading">All Sub Categories</div>

            <asp:Repeater ID="rptrCategory" runat="server">
                <HeaderTemplate>
                    <table class="table">
                        <thead>
                            <tr>
                                <th>#</th>
                                <th>Sub Category</th>
                                <th>Category</th>
                                <th>Edit</th>
                            </tr>
                        </thead>
                        <tbody>
                </HeaderTemplate>
                <ItemTemplate>
                    <tr>
                        <th><%# Eval("SubCatID") %></th>
                        <td><%# Eval("SubCatName") %></td>
                        <td><%# Eval("CatName") %></td>
                        <td>Edit</td>
                    </tr>
                </ItemTemplate>
                <FooterTemplate>
                    </tbody>
            </table>
                </FooterTemplate>
            </asp:Repeater>
        </div>
    </div>
</asp:Content>

