<%@ Page Title="" Language="C#" MasterPageFile="~/GeneralLayout.master" AutoEventWireup="true" CodeFile="Payment.aspx.cs" Inherits="Payment" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script ></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:HiddenField ID="hdCartAmount" runat="server" />
    <asp:HiddenField ID="hdCartDiscount" runat="server" />
    <asp:HiddenField ID="hdTotalPayed" runat="server" />
    <asp:HiddenField ID="hdPidSizeID" runat="server" />

    <div class="container">
        <div class="row" style="padding-top: 20px;">
            <div class="col-md-9">
                <h3>Choose Payment Mode</h3>
                <hr />
                <ul class="nav nav-tabs">
                    <li class="nav-item"><a class="nav-link active alert-primary border-success" data-toggle="tab" href="#wallets">PayPal</a></li>
                    <li class="nav-item"><a class="nav-link alert-primary border-success" data-toggle="tab" href="#cod">COD</a></li>
                </ul>

                <div class="tab-content">
                    <div id="wallets" class="tab-pane fade show active">
                        <div class="card">
                            <div class="card-body">
                                <div class="col">
                                    <div class="form-group">
                                        <div class="row">
                                            <center>
                                       <h3>Delivery Address</h3>
             </center>
                                        </div>

                                        <div class="row">
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <asp:Label ID="Label1" runat="server" CssClass="control-label" Text="Name"></asp:Label>
                                                    <asp:TextBox ID="txtName" CssClass="form-control" runat="server"></asp:TextBox>
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <asp:Label ID="Label2" runat="server" CssClass="control-label" Text="Address"></asp:Label>
                                                    <asp:TextBox ID="txtAddress" TextMode="MultiLine" CssClass="form-control" runat="server"></asp:TextBox>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-6">

                                                <div class="form-group">
                                                    <asp:Label ID="Label4" runat="server" CssClass="control-label" Text="Mobile Number"></asp:Label>
                                                    <asp:TextBox ID="txtMobileNumber" CssClass="form-control" runat="server"></asp:TextBox>
                                                </div>
                                            </div>
                                            <div class="col-md-6">

                                                <div class="form-group">
                                                    <asp:Label ID="Label8" runat="server" CssClass="control-label" Text="pay by"></asp:Label>
                                                    <asp:TextBox ID="TextBox1" CssClass="form-control" placeholder="write name of card or your account" runat="server"></asp:TextBox>
                                                </div>
                                            </div>
                                        </div>
                                        <hr />
                                        <br />
                                        <div class="row">
                                            <div class="col">

                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>


                        <div class="form-group">
                            <asp:Label ID="Label3" Visible="false" runat="server" CssClass="control-label" Text="Pin Code"></asp:Label>
                            <asp:TextBox ID="txtPinCode" Visible="false" CssClass="form-control" runat="server"></asp:TextBox>
                        </div>

                        <%--<form target="paypal" action="https://www.sandbox.paypal.com/cgi-bin/webscr" method="post">
<input type="hidden" name="cmd" value="_s-xclick">
<input type="hidden" name="hosted_button_id" value="LLTKGRD8BY97A">
<input type="image" src="https://www.sandbox.paypal.com/en_GB/i/btn/btn_cart_LG.gif" border="0" name="submit" alt="PayPal – The safer, easier way to pay online!">
<img alt="" border="0" src="https://www.sandbox.paypal.com/en_GB/i/scr/pixel.gif" width="1" height="1">
</form>--%>
                      <div id="smart-button-container">
    <div style="text-align: center"><label for="description">Why? </label><input type="text" name="descriptionInput" id="description" maxlength="127" value=""></div>
      <p id="descriptionError" style="visibility: hidden; color:red; text-align: center;">Please enter a description</p>
    <div style="text-align: center"><label for="amount">Amount </label><input name="amountInput" type="number" id="amount" value="" ><span> AUD</span></div>
      <p id="priceLabelError" style="visibility: hidden; color:red; text-align: center;">Please enter a price</p>
    <div id="invoiceidDiv" style="text-align: center; display: none;"><label for="invoiceid"> </label><input name="invoiceid" maxlength="127" type="text" id="invoiceid" value="" ></div>
      <p id="invoiceidError" style="visibility: hidden; color:red; text-align: center;">Please enter an Invoice ID</p>
    <div style="text-align: center; margin-top: 0.625rem;" id="paypal-button-container"></div>
  </div>
  <script  src="https://www.paypal.com/sdk/js?client-id=AdvSn0pk3llLdt9R607fDatjKy2wXvCaokSP363BAY_K3sCTTcC-JxMQSn5dOKvSl_91HZKfO8tSFKpS&currency=AUD" data-sdk-integration-source="button-factory"></script>
  <script>
  function initPayPalButton() {
    var description = document.querySelector('#smart-button-container #description');
    var amount = document.querySelector('#smart-button-container #amount');
    var descriptionError = document.querySelector('#smart-button-container #descriptionError');
    var priceError = document.querySelector('#smart-button-container #priceLabelError');
    var invoiceid = document.querySelector('#smart-button-container #invoiceid');
    var invoiceidError = document.querySelector('#smart-button-container #invoiceidError');
    var invoiceidDiv = document.querySelector('#smart-button-container #invoiceidDiv');

    var elArr = [description, amount];

    if (invoiceidDiv.firstChild.innerHTML.length > 1) {
      invoiceidDiv.style.display = "block";
    }

    var purchase_units = [];
    purchase_units[0] = {};
    purchase_units[0].amount = {};

    function validate(event) {
      return event.value.length > 0;
    }

    paypal.Buttons({
      style: {
        color: 'gold',
        shape: 'rect',
        label: 'paypal',
        layout: 'vertical',
        
      },

      onInit: function (data, actions) {
        actions.disable();

        if(invoiceidDiv.style.display === "block") {
          elArr.push(invoiceid);
        }

        elArr.forEach(function (item) {
          item.addEventListener('keyup', function (event) {
            var result = elArr.every(validate);
            if (result) {
              actions.enable();
            } else {
              actions.disable();
            }
          });
        });
      },

      onClick: function () {
        if (description.value.length < 1) {
          descriptionError.style.visibility = "visible";
        } else {
          descriptionError.style.visibility = "hidden";
        }

        if (amount.value.length < 1) {
          priceError.style.visibility = "visible";
        } else {
          priceError.style.visibility = "hidden";
        }

        if (invoiceid.value.length < 1 && invoiceidDiv.style.display === "block") {
          invoiceidError.style.visibility = "visible";
        } else {
          invoiceidError.style.visibility = "hidden";
        }

        purchase_units[0].description = description.value;
        purchase_units[0].amount.value = amount.value;

        if(invoiceid.value !== '') {
          purchase_units[0].invoice_id = invoiceid.value;
        }
      },

      createOrder: function (data, actions) {
        return actions.order.create({
          purchase_units: purchase_units,
        });
      },

      onApprove: function (data, actions) {
        return actions.order.capture().then(function (details) {
          alert('Transaction completed by ' + details.payer.name.given_name + '!');
        });
      },

      onError: function (err) {
        console.log(err);
      }
    }).render('#paypal-button-container');
  }
  initPayPalButton();
  </script>
                        <asp:Button ID="btnPaytm" OnClick="btnPaytm_Click" runat="server" Visible="true" CssClass="btn btn-success btn-block" Text="Pay with paypal" />
                    </div>

                    <div id="cod" class="tab-pane fade">
                        <div class="form-group">
                            <asp:Label ID="Label5" runat="server" CssClass="control-label" Text="Name"></asp:Label>
                            <asp:TextBox ID="txtname1" CssClass="form-control" runat="server"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <asp:Label ID="Label6" runat="server" CssClass="control-label" Text="Address"></asp:Label>
                            <asp:TextBox ID="txtadres1" TextMode="MultiLine" CssClass="form-control" runat="server"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <asp:Label ID="Label7" runat="server" CssClass="control-label" Text="Mobile Number"></asp:Label>
                            <asp:TextBox ID="txtphone" CssClass="form-control" runat="server"></asp:TextBox>
                        </div>
                        <asp:Button ID="btncod" OnClick="btncod_Click" CssClass="btn btn-block btn-success" runat="server" Text="Cash On Delivery " />

                    </div>
                </div>


            </div>
            <div class="col-md-3" runat="server" id="divPriceDetails">
                <div style="border-bottom: 1px solid #eaeaec;">
                    <h5 class="proNameViewCart">PRICE DETAILS</h5>
                    <div>
                        <label>Cart Total</label>
                        <span class="float-right priceGray" id="spanCartTotal" runat="server"></span>
                    </div>
                    <div>
                        <label>Cart Discount</label>
                        <span class="float-right priceGreen" id="spanDiscount" runat="server"></span>
                    </div>
                </div>
                <div>
                    <div class="proPriceView">
                        <label>Total</label>
                        <span class="float-right" id="spanTotal" runat="server"></span>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
