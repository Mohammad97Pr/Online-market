<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/GeneralLayout.master" CodeFile="RecoverPassword.aspx.cs" Inherits="RecoverPassword" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="container">
  
        <div class="row">
            <div class=" col-md-6 mx-auto">
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
                            <div class="col">
                                                             
                                  <center>
                                       <h3>Reset Password</h3>
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
                                    <label>New Password</label>
                    <asp:TextBox ID="tbNewPass" CssClass="form-control" TextMode="Password" runat="server" Visible="False"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorPass" CssClass="text-danger" runat="server" ErrorMessage="Please enter your new Password !" ControlToValidate="tbNewPass"></asp:RequiredFieldValidator>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <div class="form-group">
                                    <label>R-write NewPassword</label>
                    <asp:TextBox ID="tbConfirmPass" CssClass="form-control" TextMode="Password" runat="server" Visible="False"></asp:TextBox>
                    <asp:CompareValidator ID="CompareValidatorPass" runat="server" CssClass="text-danger" ErrorMessage="Both Password must be same !" ControlToCompare="tbConfirmPass" ControlToValidate="tbNewPass"></asp:CompareValidator>
                                </div>
                        </div>
                    </div>
                        
                              
                                  <div class="form-group">

                    <asp:Button ID="btRecPass" runat="server" CssClass="btn btn-block btn-primary" Text="Reset" Visible="False" OnClick="btRecPass_Click" />
                <asp:Label ID="lblMsg" runat="server" CssClass="col-md-2 control-label" Font-Size="XX-Large" Font-Bold="True"></asp:Label>

                                </div>
                            </div>
                    
                </div>
            </div>
        </div>
  
    </div>
</asp:Content>
