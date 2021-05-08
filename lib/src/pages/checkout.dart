import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:global_configuration/global_configuration.dart';
import 'package:markets/src/models/payment.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
// import 'package:razorpay_flutter/razorpay_flutter.dart';

import '../../generated/i18n.dart';
import '../controllers/checkout_controller.dart';
import '../elements/CreditCardsWidget.dart';
import '../helpers/helper.dart';
import '../models/route_argument.dart';
import '../repository/settings_repository.dart';
import 'package:http/http.dart' as http;

class CheckoutWidget extends StatefulWidget {
  RouteArgument routeArgument;
  CheckoutWidget({Key key, this.routeArgument}) : super(key: key);
  @override
  _CheckoutWidgetState createState() => _CheckoutWidgetState();
}

class _CheckoutWidgetState extends StateMVC<CheckoutWidget> {
  CheckoutController _con;
  String stripeKey = "";
  // Razorpay _razorpay;

  _CheckoutWidgetState() : super(CheckoutController()) {
    _con = controller;
  }
  @override
  void initState() {
    // _razorpay = Razorpay();
    // _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    // _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    // _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
    listenforcart();
    _con.payment = new Payment(widget.routeArgument.param);
    _con.listenForCarts(withAddOrder: true);

    super.initState();
  }

  // void _handlePaymentSuccess(PaymentSuccessResponse response) {
  //   Fluttertoast.showToast(
  //     msg: "SUCCESS: " + response.paymentId,
  //   );
  // }

  // void _handlePaymentError(PaymentFailureResponse response) {
  //   print(response);
  //   Fluttertoast.showToast(
  //     msg: "ERROR: " + response.code.toString() + " - " + response.message,
  //   );
  // }

  // void _handleExternalWallet(ExternalWalletResponse response) {
  //   Fluttertoast.showToast(
  //     msg: "EXTERNAL_WALLET: " + response.walletName,
  //   );
  // }

  listenforcart() async {
    String url = '${GlobalConfiguration().getString('api_base_url')}';

    var response = await http.get("http://admin.piscout.com/api/settings");
    var data = jsonDecode(response.body);
    //stripe_key

    print(data);

    stripeKey = data['data']['stripe_key'];

    print(data);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _con.scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text(
          S.of(context).checkout,
          style: Theme.of(context)
              .textTheme
              .title
              .merge(TextStyle(letterSpacing: 1.3)),
        ),
      ),
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 10),
                  child: ListTile(
                    contentPadding: EdgeInsets.symmetric(vertical: 0),
                    leading: Icon(
                      Icons.payment,
                      color: Theme.of(context).hintColor,
                    ),
                    title: Text(
                      S.of(context).payment_mode,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.display1,
                    ),
                    subtitle: Text(
                      S.of(context).select_your_preferred_payment_mode,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.caption,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                new CreditCardsWidget(
                    creditCard: _con.creditCard,
                    onChanged: (creditCard) {
                      _con.updateCreditCard(creditCard);
                    }),
                SizedBox(height: 40),
                setting.value.payPalEnabled
                    ? Text(
                        S.of(context).or_checkout_with,
                        style: Theme.of(context).textTheme.caption,
                      )
                    : SizedBox(
                        height: 0,
                      ),
                SizedBox(height: 40),
                setting.value.payPalEnabled
                    ? SizedBox(
                        width: 320,
                        child: FlatButton(
                          onPressed: () {
                            Navigator.of(context)
                                .pushReplacementNamed('/PayPal');
                          },
                          padding: EdgeInsets.symmetric(vertical: 12),
                          color: Theme.of(context).focusColor.withOpacity(0.2),
                          shape: StadiumBorder(),
                          child: Image.asset(
                            'assets/img/paypal2.png',
                            height: 28,
                          ),
                        ),
                      )
                    : SizedBox(
                        height: 0,
                      ),
                SizedBox(height: 20),
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              height: 230,
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(20),
                      topLeft: Radius.circular(20)),
                  boxShadow: [
                    BoxShadow(
                        color: Theme.of(context).focusColor.withOpacity(0.15),
                        offset: Offset(0, -2),
                        blurRadius: 5.0)
                  ]),
              child: SizedBox(
                width: MediaQuery.of(context).size.width - 40,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: Text(
                            S.of(context).subtotal,
                            style: Theme.of(context).textTheme.body2,
                          ),
                        ),
                        Helper.getPrice(_con.subTotal, context,
                            style: Theme.of(context).textTheme.subhead)
                      ],
                    ),
                    SizedBox(height: 5),
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: Text(
                            '${S.of(context).tax} (${setting.value.defaultTax}%)',
                            style: Theme.of(context).textTheme.body2,
                          ),
                        ),
                        Helper.getPrice(_con.taxAmount, context,
                            style: Theme.of(context).textTheme.subhead)
                      ],
                    ),
                    Divider(height: 30),
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: Text(
                            S.of(context).total,
                            style: Theme.of(context).textTheme.title,
                          ),
                        ),
                        Helper.getPrice(_con.total, context,
                            style: Theme.of(context).textTheme.title)
                      ],
                    ),
                    SizedBox(height: 20),
                    SizedBox(
                      width: MediaQuery.of(context).size.width - 40,
                      child: FlatButton(
                        onPressed: () {
                          checkOutFunction();
                          // Navigator.of(context).pushNamed('/OrderSuccess',
                          //     arguments: new RouteArgument(
                          //         param: 'Credit Card (Stripe Gateway)'),);
//
                        },
                        padding: EdgeInsets.symmetric(vertical: 14),
                        color: Theme.of(context).accentColor,
                        shape: StadiumBorder(),
                        child: Text(
                          S.of(context).confirm_payment,
                          textAlign: TextAlign.start,
                          style:
                              TextStyle(color: Theme.of(context).primaryColor),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }


  checkOutFunction() async {
    print(stripeKey);
    var options = {
      'key': stripeKey,
      'amount': 2823,
      'name': 'Picsout',
      'description': 'Payment',
      'prefill': {'contact': '+919306293885', 'email': 'info@piscout.com'},
      'external': {
        'wallets': ['paytm']
      }
    };

    // try {
    //   _razorpay.open(options);
    // } catch (e) {
    //   debugPrint(e);
    // }
  }
}
