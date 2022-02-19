<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMaster.master" AutoEventWireup="true" CodeFile="company.aspx.cs" Inherits="company" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="container">
        <div class="row">
            <div class=" col-md-5 mx-auto">
                <div class="card">
                    <div class=" card-body">
                        <div class="row">
                            <div class="col">
                                <center>
                            <h3>Add Company account</h3>
                        </center>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label>User Name</label>
                                    <asp:TextBox runat="server" ID="txtuser" CssClass="form-control"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label>Password</label>
                                    <asp:TextBox runat="server" ID="pass" CssClass="form-control"></asp:TextBox>
                                </div>
                            </div>
                            </div>

                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label>Company</label>
                                        <asp:TextBox runat="server" ID="txtcompany" CssClass="form-control"></asp:TextBox>
                                    </div>
                                </div>

                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label>email</label>
                                        <asp:TextBox runat="server" ID="email" CssClass="form-control"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label>phone</label>
                                        <asp:TextBox runat="server" ID="phone" CssClass="form-control"></asp:TextBox>
                                    </div>
                                </div>

                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label>Brand</label>
                                        <asp:DropDownList runat="server" AutoPostBack="true" DataValueField="BrandID" DataTextField="Name" ID="ddlbrand" CssClass="form-control"></asp:DropDownList>
                                    </div>
                                </div>
                                   <div class="col-md-4">
                                    <div class="form-group">
                                        <label>Type</label>
                                        <asp:DropDownList runat="server"  ID="DropDownList1" CssClass="form-control">
                                            <asp:ListItem Text="Full" Value="1"></asp:ListItem>
                                      <asp:ListItem Text="Limit" Value="2"></asp:ListItem>
                                              </asp:DropDownList>
                                    </div>
                                </div>

                            </div>
                       

                        <div class="form-group">
                            <asp:Button runat="server" ID="btnaddacc" Text="Add" CssClass="btn btn-primary btn-block btn-lg" OnClick="btnaddacc_Click" />
                        </div>
                  
                    </div>
                </div>
            </div>
        </div>
        

    </div>
</asp:Content>

