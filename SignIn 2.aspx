<%@ Page Language="C#" MasterPageFile="~/GeneralLayout.master" AutoEventWireup="true" CodeFile="SignIn 2.aspx.cs" Inherits="SignIn" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <!--- Sign in start  -->
    <div class="container">








        <div class="row">
            <div class=" col-md-6 mx-auto">
                <div class="card">
                    <div class=" card-body">
                        <div class="row">
                            <div class="col">
                                <center><img width="150px" src="photo/adminuser.png" />
                                </center>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                                             
                                  <center>
                                       <h3>Account Login</h3>
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
                   <asp:TextBox ID="UserName" CssClass="form-control" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorUsername" CssClass="text-danger" runat="server" ErrorMessage="The Username field is Required !" ControlToValidate="UserName"></asp:RequiredFieldValidator>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <div class="form-group">
                                    <label>Password</label>
                    <asp:TextBox ID="Password" CssClass="form-control" runat="server" TextMode="Password"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorPass" CssClass="text-danger" runat="server" ErrorMessage="The Password field is Required !" ControlToValidate="Password"></asp:RequiredFieldValidator>
                                </div>
                        </div>
                    </div>
                        <div class="row">
                            <div class="col">
                                <div class="form-group">
      <%--                                     <asp:CheckBox ID="CheckBox1" runat="server" />
                    <asp:Label ID="Label3" runat="server" CssClass="control-label" Text="Remember me ?"></asp:Label>--%>
            
                                </div>
                            </div>
                        </div>
                              
                                  <div class="form-group">
                    <asp:Button ID="Button1" runat="server" Text="Login" CssClass="btn btn-block btn-primary" OnClick="Button1_Click" />
                                </div>
                                  <div class="form-group">
      
                                                               </div>
                            </div>
                    <asp:Label ID="lblError" runat="server" CssClass="text-danger"></asp:Label>
                    
                </div>
            </div>
        </div>



        
    </div>
    <!--- Sign in end  -->
</asp:Content>