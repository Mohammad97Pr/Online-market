<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMaster - Dilev.master" AutoEventWireup="true" CodeFile="ManagDelivery.aspx.cs" Inherits="ManagDelivery" %>

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
                           <h4>Dilevery Inventory List</h4>
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
                                     AutoGenerateColumns="False" CssClass="table table-striped table-primary  table-bordered mx-auto" AllowSorting="True">
                                    <Columns>
<%--                                                                            <asp:TemplateField HeaderText="lbl01" Visible="true">--%>

                                                <asp:BoundField  runat="server" DataField="PurchaseID" ></asp:BoundField>
                                         
<%--                                        </asp:TemplateField>--%>
                                        <asp:TemplateField HeaderText="lbl01" Visible="False">
                                            <ItemTemplate>
                                                <asp:Label ID="lbl01" runat="server" Text='<%# Bind("PurchaseID") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>

                                        <asp:TemplateField>

                                            <ItemTemplate>
                                                <div class="container-fluid">
                                                    <div class="row">

                                                        <div class="col-lg-10">
                                                            <div class="row">
                                                                <div class="col">
                                                                    <asp:Label runat="server" ID="Label1" Font-Bold="True" Font-Italic="True" Font-Size="X-Large" Text='<%# Eval("Name") %>'></asp:Label>
                                                                </div>
                                                            </div>
                                                            <div class="row">
                                                                <div class="col-12">
                                                                    Address:
                                                                <asp:Label ID="Label2" runat="server" Font-Bold="True" Font-Italic="True" Text='<%# Eval("Address") %>'></asp:Label>
                                                                    &nbsp;|&nbsp; MobileNumber:
                                                                <asp:Label ID="Label3" runat="server" Font-Bold="True" Font-Italic="True" Text='<%# Eval("MobileNumber") %>'></asp:Label>
                                                               </div>
                                                            <div class="row">
                                                                <div class="col-12">
                                                                          ProductName and size: 
                                                                <asp:Label ID="Label4" runat="server" Font-Bold="True" Font-Italic="True" Text='<%# Eval("PIDSizeID") %>'></asp:Label>
                                                                </div>
                                                           
                                                                </div>
                                                            </div>
                                                            <div class="row">
                                                                <div class="col-12">
                                                                    Category:
                                                                <asp:Label ID="Label5" runat="server" Font-Bold="True" Font-Italic="True" Text='<%# Eval("TotalPayed") %>'></asp:Label>
                                                                    &nbsp;| SubCategory:
                                                                <asp:Label ID="Label6" runat="server" Font-Bold="True" Font-Italic="True" Text='<%# Eval("PaymentType") %>'></asp:Label>
                                                                    &nbsp;
                                                                </div>
                                                            </div>
                                                            <div class="row">
                                                                <div class="col-12">
                                                                  DateOfPurchase:
                                                                <asp:Label ID="Label8" runat="server" Font-Bold="True" Font-Italic="True" Text='<%# Eval("DateOfPurchase") %>'></asp:Label>
                                                                </div>
                                                            </div>
                                                             <div class="row">
                                                                <div class="col-12">
                                                                  |DileveryNumber:
                                                                <asp:Label ID="Label7" runat="server" Font-Size="XX-Large" ForeColor="Red" Font-Bold="True" Font-Italic="True" Text='<%# Eval("PinCode") %>'></asp:Label>
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
                                        <asp:ButtonField ButtonType="Button" CommandName="view" Text="Confirm" ControlStyle-CssClass="badge-success badge-pill">

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