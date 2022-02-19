<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMaster.master" AutoEventWireup="true" CodeFile="AdminHome.aspx.cs" Inherits="AdminHome" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
    <div class="container-lg">
        <div class="row">
            <div class="col mx-auto">
                <br />
                <center>
                <span class="badge badge-warning badge-pill" style="font-size:xx-large;">Welcome Admin</span>
             <br />  <br /> <span class="badge badge-warning badge-pill" style="font-size:x-large;">This is what you can do</span>
           </center> </div>
        </div><hr />
        <div class="row">

            <div class="col-md-4">

                <div class=" card">
                    <div class="card-body">
                        <div class="row">
                            <div class="col">
                                <center>
                                    <img src="photo/brand.png" height="200px" width="250px" />
                        </center>
                            </div>
                        </div>
                        <hr />

                        <div class="row">
                            <div class="col">
                                <asp:Button CssClass="btn btn-block btn-success" OnClick="btn_profadd_Click" runat="server" ID="btn_profadd" Text="Add Brand"  />
                                <hr />
                            </div>
                        </div>
                    </div>
                </div>
                </div>
          
            <br />
            <div class="col-md-4">

                <div class=" card">
                    <div class="card-body">
                        <div class="row">
                            <div class="col">
                                <center>
                           <img src="photo/category.png" height="200px" width="250px" />
                        </center>
                            </div>
                        </div>
                        <hr />
                        <div class="row">

                            <div class="col">
                                <asp:Button CssClass="btn btn-block btn-success" runat="server" ID="btn_addcat" OnClick="btn_addcat_Click" Text="Add Category"  />
                                <hr />
                            </div>
                        </div>
                    </div>
                </div>
                <br />

            </div>
        
    
            <div class="col-md-4">

                <div class=" card">
                    <div class="card-body">
                        <div class="row">
                            <div class="col">
                                <center>
                           <img src="photo/category%20(1).png" height="200px" width="250px"/>
                        </center>
                            </div>
                        </div>
                        <hr />

                        <div class="row">
                            <div class="col">
                                <asp:Button CssClass="btn btn-block btn-success" runat="server" ID="btnaddsub" OnClick="btnaddsub_Click" Text="Add SubCategory" AccessKey="1"  />
                                <hr />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
            <br />
        <div class="row">

            <div class="col-md-4">

                <div class=" card">
                    <div class="card-body">
                        <div class="row">
                            <div class="col">
                                <center>
                                  <img src="photo/lavatory.png" height="200px" width="250px"/>
                        </center>
                            </div>
                        </div>
                        <hr />

                        <div class="row">
                            <div class="col">
                                <asp:Button CssClass="btn btn-block btn-success" runat="server" ID="btnaddgend" OnClick="btnaddgend_Click" Text="Add Gender"  />
                                <hr />
                            </div>
                        </div>
                    </div>
                </div>
                </div>
          
            <br />
            <div class="col-md-4">

                <div class=" card">
                    <div class="card-body">
                        <div class="row">
                            <div class="col">
                                <center>
                          <img src="photo/meter.png" height="200px" width="250px"/>
                        </center>
                            </div>
                        </div>
                        <hr />
                        <div class="row">

                            <div class="col">
                                <asp:Button CssClass="btn btn-block btn-success" runat="server" ID="btnaddsize" OnClick="btnaddsize_Click" Text="Add Size"  />
                                <hr />
                            </div>
                        </div>
                    </div>
                </div>
                <br />

            </div>
        
    
            <div class="col-md-4">

                <div class=" card">
                    <div class="card-body">
                        <div class="row">
                            <div class="col">
                                <center>
                            <img src="photo/shipping.png" height="200px" width="250px" />
                        </center>
                            </div>
                        </div>
                        <hr />

                        <div class="row">
                            <div class="col">
                                <asp:Button CssClass="btn btn-block btn-success" runat="server" ID="btnaddpro" OnClick="btnaddpro_Click" Text="Add Prouduct" AccessKey="1"  />
                                <hr />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    <div class="row">    
        <div class="col-md-4">

                <div class=" card">
                    <div class="card-body">
                        <div class="row">
                            <div class="col">
                                <center>
                           <img src="photo/inventory.png" height="200px" width="250px" />
                        </center>
                            </div>
                        </div>
                        <hr />
                        <div class="row">

                            <div class="col">
                                <asp:Button CssClass="btn btn-block btn-success" runat="server" ID="btnmanpro" OnClick="btnmanpro_Click" Text="Management Products" AccessKey="2"  />
                                <hr />
                            </div>
                        </div>
                    </div>
                </div>
                <br />

            </div>
            <div class="col-md-4">

                <div class=" card">
                    <div class="card-body">
                        <div class="row">
                            <div class="col">
                                <center>
                   <img src="photo/company.png" height="200px" width="250px" />
                        </center>
                            </div>
                        </div>
                        <hr />
                        <div class="row">

                            <div class="col">
                                <asp:Button CssClass="btn btn-block btn-success" runat="server" ID="btnaddacc" OnClick="btnaddacc_Click" Text="Add Account"  />
                                <hr />
                            </div>
                        </div>
                    </div>
                </div>
                <br />

            </div>
            <div class="col-md-4">

                <div class=" card" style="visibility:hidden;">
                    <div class="card-body"> 
                        <div class="row">
                            <div class="col">
                                <center>
                        <img src="imgs/study.png" height="200px" width="250px" />
                        </center>
                            </div>
                        </div>
                        <hr />
                        <div class="row">

                            <div class="col">
                                <asp:Button CssClass="btn btn-block btn-success" runat="server" ID="btnmanacc" OnClick="btnmanacc_Click" Text="Add Books" />
                                <hr />
                            </div>
                        </div>
                    </div>
                </div>
                <br />

            </div></div>
        
        </div>
        </div>
</asp:Content>

