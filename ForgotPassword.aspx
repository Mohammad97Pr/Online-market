<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/GeneralLayout.master" CodeFile="ForgotPassword.aspx.cs" Inherits="ForgotPassword" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="container">



        <div class="row">
            <div class=" col-md-7 mx-auto">
                <div class="card">
                    <div class=" card-body">
                        <div class="row">
                            <div class="col">
                                <center>
                                       <img width="150px" src="imgs/generaluser.png" />
                                          </center>   
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12 mx-auto">
                                                             
                                  <center>
                                       <h3>Rcover password</h3>
                            
                <span class="  badge badge-primary badge-pill  mx-auto " style="font-size:medium;">Please enter your email address,<br />
                    <br /> We will send you the instrutions to reset your password</span>
                                           
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
                                    <label>Your Email</label>
                    <asp:TextBox ID="tbEmailId" CssClass="form-control" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorEmail" CssClass="text-danger" runat="server" ErrorMessage="Please enter your email ID !" ControlToValidate="tbEmailId"></asp:RequiredFieldValidator>
                                </div>
                            </div>
                        </div>
                                  <div class="form-group">
                    <asp:Button ID="btPassRec" runat="server" CssClass="btn btn-block btn-primary" Text="Send" OnClick="btPassRec_Click" />
                    <asp:Label ID="lblPassRec" runat="server"></asp:Label>
                                </div>
                            </div>
                    
                </div>
            </div>
        </div>
        
    </div>
</asp:Content>
