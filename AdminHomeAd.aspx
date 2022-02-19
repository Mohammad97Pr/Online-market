<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMaster.master" AutoEventWireup="true" CodeFile="AdminHomeAd.aspx.cs" Inherits="AdminHome" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <div class="container-lg">
        <div class="row">
            <div class="col mx-auto">
                <br />
                <center>
                <span class="badge badge-warning badge-pill" style="font-size:xx-large;">Welcome Admin</span>
             <br />  <br /> <span class="badge badge-warning badge-pill" style="font-size:x-large;">This is what you can do</span>
           </center>
            </div>
        </div>
        <hr />
        <div class="row">

            <div class="col-md-6">

                <div class=" card">
                    <div class="card-body">
                        <div class="row">
                            <div class="col">
                                <center><img src="photo/category.png"  height="225px" width="250px" />
                        </center>
                            </div>
                        </div>
                        <hr />

                        <div class="row">
                            <div class="col">
                                <asp:Button CssClass="btn btn-block btn-success" runat="server" ID="btnaddcat" OnClick="btnaddcat_Click" Text="Add Category" />
                                <hr />
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <br />
            <div class="col-md-6">

                <div class=" card">
                    <div class="card-body">
                        <div class="row">
                            <div class="col">
                                <center>
<img src="photo/category%20(1).png"  height="225px" width="250px" />
                        </center>
                            </div>
                        </div>
                        <hr />
                        <div class="row">

                            <div class="col">
                                <asp:Button CssClass="btn btn-block btn-success" runat="server" ID="btnaddsub" OnClick="btnaddsub_Click" Text="Add SubCategory" />
                                <hr />
                            </div>
                        </div>
                    </div>
                </div>
                <br />
                </div>
           
            </div>

        <div class="row">
            <div class="col-md-6">

                <div class=" card">
                    <div class="card-body">
                        <div class="row">
                            <div class="col">
                                <center>
<img src="photo/meter.png"  height="225px" width="250px" />
                        </center>
                            </div>
                        </div>
                        <hr />

                        <div class="row">
                            <div class="col">
                                <asp:Button CssClass="btn btn-block btn-success" runat="server" ID="btnaddsize" OnClick="btnaddsize_Click" Text="Add Size" AccessKey="1" />
                                <hr />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        
        <br />

            <div class="col-md-6">

                <div class=" card">
                    <div class="card-body">
                        <div class="row">
                            <div class="col">
                                <center><img src="photo/shipping.png"  height="225px" width="250px" />
                        </center>
                            </div>
                        </div>
                        <hr />

                        <div class="row">
                            <div class="col">
                                <asp:Button CssClass="btn btn-block btn-success" runat="server" ID="btnaddpro" OnClick="btnaddpro_Click" Text="Add Product" />
                                <hr />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            </div>
            <br />

        <div class="row">
            <div class="col-md-6">

                <div class=" card">
                    <div class="card-body">
                        <div class="row">
                            <div class="col">
                                <center>
<img src="photo/inventory.png"  height="225px" width="250px" />
                        </center>
                            </div>
                        </div>
                        <hr />
                        <div class="row">

                            <div class="col">
                                <asp:Button CssClass="btn btn-block btn-success" runat="server" ID="btnmanapro" OnClick="btnmanapro_Click" Text="Management Products" AccessKey="2" />
                                <hr />
                            </div>
                        </div>
                    </div>
                </div>
                <br />

            </div>
        </div>
    </div>
</asp:Content>

