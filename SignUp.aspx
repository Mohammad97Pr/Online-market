<%@ Page Language="C#" MasterPageFile="~/GeneralLayout.master" AutoEventWireup="true" CodeFile="SignUp.aspx.cs" Inherits="SignUp" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <!-- Sign Up -->
    <div class="container center-page">



        <div class="row">
            <div class=" col-md-6 mx-auto">
                <div class="card">
                    <div class=" card-body">
                        <div class="row">
                            <div class="col">
                                <center><img width="150px" src="photo/sssss.png" />
                                </center>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">

                                <center>
                                       <h3>User SignUp</h3>
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
                                <div class="form-group">
                                    <label>User Name</label>
                                    <asp:TextBox ID="tbUname" runat="server" Class="form-control" placeholder="Usename"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorUsername" CssClass="text-danger" runat="server" ErrorMessage="The Name field is Required !" ControlToValidate="tbUname"></asp:RequiredFieldValidator>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label>Password</label>
                                    <asp:TextBox ID="tbPass" runat="server" Class="form-control" placeholder="Password" TextMode="Password"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorPass" CssClass="text-danger" runat="server" ErrorMessage="The Password field is Required !" ControlToValidate="tbPass"></asp:RequiredFieldValidator>
                                </div>
                            </div>
                        
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label>R-writePassword</label>
                                    <asp:TextBox ID="tbCPass" runat="server" Class="form-control" placeholder="Confirm Password" TextMode="Password"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" CssClass="text-danger" runat="server" ErrorMessage="The Password field is Required !" ControlToValidate="tbCPass"></asp:RequiredFieldValidator>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label>Name</label>
                                    <asp:TextBox ID="tbName" runat="server" Class="form-control" placeholder="Name"></asp:TextBox>

                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                                                        <label>Email</label>

                                    <asp:TextBox ID="tbEmail" runat="server" Class="form-control" placeholder="Email" TextMode="Email"></asp:TextBox>

                                </div>
                            </div>
                        </div>
                        <hr />
                        <div class="form-group">
                            <asp:Button ID="btSignup" runat="server" Class="btn btn-block btn-success" Text="Sign Up" OnClick="btSignup_Click" />
                            <asp:Label ID="lblMsg" runat="server"></asp:Label>
                        </div>
                    </div>
                    <asp:Label ID="lblError" runat="server" CssClass="text-danger"></asp:Label>

                </div>
            </div>
        </div>

    </div>
    <!-- Sign Up -->
</asp:Content>
