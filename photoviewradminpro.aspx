<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMaster.master" AutoEventWireup="true" CodeFile="photoviewradminpro.aspx.cs" Inherits="photoviewradminpro" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="container">
        <div class="row">
            <div class="col-md-6 mx-auto">
                <center>
                <div class="card">
                    <div class="card-body">
                          <center>
                  <div  class="img-thumbnail">
                    <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
                        <!-- Indicators -->
                        <ol class="carousel-indicators">
                            <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
                            <li data-target="#carousel-example-generic" data-slide-to="1"></li>
                            <li data-target="#carousel-example-generic" data-slide-to="2"></li>
                            <li data-target="#carousel-example-generic" data-slide-to="3"></li>
                            <li data-target="#carousel-example-generic" data-slide-to="4"></li>
                        </ol>

                        <!-- Wrapper for slides -->
                        <div class="carousel-inner">
                            <asp:Repeater ID="rptrImages" runat="server">
                                <ItemTemplate>
                                    <div class="carousel-item <%# GetActiveClass(Container.ItemIndex) %>">
                                        <img class="d-block w-100" src="Images/ProductImages/<%#Eval("PID") %>/<%#Eval("Name") %><%#Eval("Extention") %>" alt="<%#Eval("Name") %>" onerror="this.src='images/noimage.jpg'">
                                    </div>
                                </ItemTemplate>
                            </asp:Repeater>
                        </div>
                        <!-- Controls -->
                        <a class="carousel-control-prev" href="#carousel-example-generic" role="button" data-slide="prev">
                            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                            <span class="sr-only">Previous</span>
                        </a>
                        <a class="carousel-control-next" href="#carousel-example-generic" role="button" data-slide="next">
                            <span class="carousel-control-next-icon" aria-hidden="true"></span>
                            <span class="sr-only">Next</span>
                        </a>
                    </div>
                </div>
                              </center>
            </div>
                    </div>
                    </center>
                </div>
            </div>
        </div>
    
</asp:Content>

