<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMaster.master" AutoEventWireup="true" CodeFile="Sub.aspx.cs" Inherits="Sub" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="container">
        <div class="row">
            <div class="col-6">
                <h3>200 Dollar for +100 products in month</h3>
                <div id="paypal-button-container"></div>
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
          'plan_id': 'P-5UE94321SF144244NL6D6ZVQ'
        });
      },
      onApprove: function(data, actions) {
        alert(data.subscriptionID);
      }
  }).render('#paypal-button-container');
</script>
            </div>
            <div class="col-6">
                <h3>Free for 20 products in month</h3>
            </div>
        </div>
    </div>
</asp:Content>

