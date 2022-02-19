<%@ Page Title="" Language="C#" MasterPageFile="~/GeneralLayout.master" AutoEventWireup="true" CodeFile="joincompany.aspx.cs" Inherits="joincompany" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
        <script src="js/JavaScriptfor%20pay.js"></script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="container">

        <div class="row">
            <div class="col-md-7 mx-auto">
                <div class="card">
                    <div class="card-body">
                        <div class="row">
                            <div class="col-12">
                                <center><img src="photo/company.png" width="200px" height="200px" />
                   
                    </center>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-12">
                                <center>
                            <h1>Contact Us to JoinWithUS</h1>
                        </center>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-6">
                                <div class="form-group">
                                    <label>Your Company</label>
                                    <asp:TextBox runat="server" ID="txt_fn" CssClass="form-control"></asp:TextBox>
                                </div>

                            </div>
                            <div class="col-6">
                                <div class="form-group">
                                    <label>Your Brand</label>
                                    <asp:TextBox runat="server" ID="txt_ln" CssClass="form-control"></asp:TextBox>
                                </div>

                            </div>
                        </div>
                        <div class="row">
                            <div class="col-6">
                                <div class="form-group">
                                    <label>Your phone</label>
                                    <asp:TextBox runat="server" ID="txt_mail" CssClass="form-control" TextMode="Phone" />
                                </div>
                            </div>
                        
                          
                            <div class="col-6">
                                <div class="form-group">
                                    <label>Your email</label>
                                    <asp:TextBox runat="server" ID="TextBox1" CssClass="form-control" TextMode="Email"></asp:TextBox>
                                </div>

                            </div>
                       </div>
                         <div class="row">
                            <div class="col-md-12 mx-auto">
                                                                <div class="form-group">

                                <label>SubScribe</label>
                                <asp:TextBox runat="server" ID="txtsub" placeholder="Tell us what do you choose 20prouducts for free or Full Add prouducts  for 400$ in 1year" CssClass="form-control" TextMode="MultiLine"></asp:TextBox>
                            </div></div>
                        </div>
                        <div class="row">
                            <div class="col-12">
                                <asp:Button runat="server" ID="btn00" Text="Submit Request" OnClick="btn00_Click" CssClass="btn btn-block btn-success"  />
                            </div>
                        </div>
                        <asp:Label runat="server" ID="label1" Font-Size="X-Large" Text=""></asp:Label>

                    </div>
                </div>

            </div>
            <div class="col-m-5 ">
             <div id="paypal-button-container"></div>
                <span class="badge badge-primary" style="font-size:xx-large;">For Subscribe for 1 year</span>
<script src="https://www.paypal.com/sdk/js?client-id=AdvSn0pk3llLdt9R607fDatjKy2wXvCaokSP363BAY_K3sCTTcC-JxMQSn5dOKvSl_91HZKfO8tSFKpS&vault=true" data-sdk-integration-source="button-factory"></script>
<script>
  paypal.Buttons({
      style: {
          shape: 'rect',
          color: 'gold',
          layout: 'vertical',
          label: 'subscribe'
      },
      createSubscription: function(data, actions) {
        return actions.subscription.create({
          'plan_id': 'P-12143276LD6019701L6EAHTA'
        });
      },
      onApprove: function(data, actions) {
        alert(data.subscriptionID);
      }
  }).render('#paypal-button-container');
</script>
    </div></div>
        <br /></div>
    
</asp:Content>

