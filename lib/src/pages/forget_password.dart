import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

import '../../generated/i18n.dart';
import '../controllers/user_controller.dart';
import '../elements/BlockButtonWidget.dart';
import '../helpers/app_config.dart' as config;

class ForgetPasswordWidget extends StatefulWidget {
  @override
  _ForgetPasswordWidgetState createState() => _ForgetPasswordWidgetState();
}

class _ForgetPasswordWidgetState extends StateMVC<ForgetPasswordWidget> {
  UserController _con;

  _ForgetPasswordWidgetState() : super(UserController()) {
    _con = controller;
  }
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        key: _con.scaffoldKey,
        resizeToAvoidBottomPadding: false,
        body: Stack(
          alignment: AlignmentDirectional.topCenter,
          children: <Widget>[
//            Positioned(
//              top: 0,
//              child: Container(
//                width: config.App(context).appWidth(100),
//                height: config.App(context).appHeight(37),
//                decoration: BoxDecoration(color: Theme.of(context).accentColor),
//              ),
//            ),

            Positioned(
              // top: config.App(context).appHeight(37) - 120,
              top: config.App(context).appHeight(45) - 250,
              child: Container(
                width: config.App(context).appWidth(84),
                // height: config.App(context).appHeight(37),
                child: Column(
                  children: <Widget>[
                    Image.asset(
                      'assets/img/lock.png',
                      height: 100.0,
                      fit: BoxFit.fill,
                    ),
                    SizedBox(
                      height: 30.0,
                    ),
                    Text(
                      S.of(context).email_to_reset_password,
                      style: Theme.of(context)
                          .textTheme
                          .headline2
                          .merge(TextStyle(color: Theme.of(context).hintColor)),
                      //    style: Theme.of(context).textTheme.display3.merge(TextStyle(color: Theme.of(context).primaryColor)),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      S.of(context)
                          .enter_your_email_id_below_to_receive_your_password_reset_instructions,
                      textAlign: TextAlign.center,
                      style:
                          Theme.of(context).textTheme.headline6.merge(TextStyle(
                                color: Colors.grey,
                              )),
                      //style: Theme.of(context).textTheme.headline2.merge(TextStyle(color: Theme.of(context).primaryColor)),
                    ),
                  ],
                ),
              ),
            ),

            Positioned(
              top: config.App(context).appHeight(45),
              child: Container(
//                decoration: BoxDecoration(
//                    color: Theme.of(context).primaryColor,
//                    borderRadius: BorderRadius.all(Radius.circular(10)),
//                    boxShadow: [
//                      BoxShadow(
//                        blurRadius: 50,
//                        color: Theme.of(context).hintColor.withOpacity(0.2),
//                      )
//                    ]),
                margin: EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                padding: EdgeInsets.symmetric(vertical: 50, horizontal: 27),
                width: config.App(context).appWidth(88),
//              height: config.App(context).appHeight(55),
                child: Form(
                  key: _con.loginFormKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.grey,
                            ),
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                        child: TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          onSaved: (input) => _con.user.email = input,
                          validator: (input) => !input.contains('@')
                              ? S.of(context).should_be_a_valid_email
                              : null,
                          decoration: InputDecoration(
                            labelText: S.of(context).email,
                            labelStyle:
                                TextStyle(color: Theme.of(context).hintColor),
                            contentPadding: EdgeInsets.all(12),
                            hintText: 'johndoe@gmail.com',
                            hintStyle: TextStyle(
                                color: Theme.of(context)
                                    .focusColor
                                    .withOpacity(0.7)),
                            prefixIcon: Icon(Icons.alternate_email,
                                color: Theme.of(context).hintColor),
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                          ),
                        ),
                      ),
                      SizedBox(height: 30),
                      BlockButtonWidget(
                        text: Text(
                          S.of(context).send_password_reset_link,
                          style:
                              TextStyle(color: Theme.of(context).primaryColor),
                        ),
                        // color: Theme.of(context).accentColor,
                        color: Colors.red,
                        onPressed: () {
                          _con.resetPassword();
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 10,
              child: Column(
                children: <Widget>[
                  FlatButton(
                    onPressed: () {
                      Navigator.of(context).pushReplacementNamed('/Login');
                    },
                    textColor: Theme.of(context).hintColor,
                    child: Text(
                        S.of(context).i_remember_my_password_return_to_login),
                  ),
                  FlatButton(
                    onPressed: () {
                      Navigator.of(context).pushReplacementNamed('/SignUp');
                    },
                    textColor: Theme.of(context).hintColor,
                    child: Text(S.of(context).i_dont_have_an_account),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
