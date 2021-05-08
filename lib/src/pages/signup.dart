import 'package:flutter/material.dart';
import 'package:markets/src/models/language.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

import '../../generated/i18n.dart';
import '../controllers/user_controller.dart';
import '../elements/BlockButtonWidget.dart';
import '../helpers/app_config.dart' as config;
import '../repository/settings_repository.dart' as settingRepo;
class SignUpWidget extends StatefulWidget {
  @override
  _SignUpWidgetState createState() => _SignUpWidgetState();
}

class _SignUpWidgetState extends StateMVC<SignUpWidget> {
  UserController _con;

  _SignUpWidgetState() : super(UserController()) {
    _con = controller;
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
//                height: config.App(context).appHeight(29.5),
//                decoration: BoxDecoration(color: Theme.of(context).accentColor),
//              ),
//            ),
            Positioned(
              top: config.App(context).appHeight(29.5) - 150,
              child: Container(
                width: config.App(context).appWidth(80),
                height: config.App(context).appHeight(20.5),
                child: Text(
                  S.of(context).lets_start_with_register,
                  style: Theme.of(context).textTheme.headline2.merge(TextStyle(color: Theme.of(context).hintColor)),
                ),
              ),
            ),
      Container(
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
                      Container(decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.grey,
                          ),
                          borderRadius:
                          BorderRadius.all(Radius.circular(20))),    child: TextFormField(
                          keyboardType: TextInputType.text,
                          onSaved: (input) => _con.user.name = input,
                          validator: (input) => input.length < 3 ? S.of(context).should_be_more_than_3_letters : null,
                          decoration: InputDecoration(
                            labelText: S.of(context).full_name,
                            labelStyle: TextStyle(color: Theme.of(context).hintColor),
                            contentPadding: EdgeInsets.all(12),
                            hintText: S.of(context).john_doe,
                            hintStyle: TextStyle(color: Theme.of(context).focusColor.withOpacity(0.7)),
                            prefixIcon: Icon(Icons.person_outline, color: Theme.of(context).hintColor),
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                          ),
                        ),
                      ),
                      SizedBox(height: 30),
                      Container(  decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.grey,
                          ),
                          borderRadius:
                          BorderRadius.all(Radius.circular(20))),
                        child: TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          onSaved: (input) => _con.user.email = input,
                          validator: (input) => !input.contains('@') ? S.of(context).should_be_a_valid_email : null,
                          decoration: InputDecoration(
                            labelText: S.of(context).email,
                            labelStyle: TextStyle(color: Theme.of(context).hintColor),
                            contentPadding: EdgeInsets.all(12),
                            hintText: 'johndoe@gmail.com',
                            hintStyle: TextStyle(color: Theme.of(context).focusColor.withOpacity(0.7)),
                            prefixIcon: Icon(Icons.alternate_email, color: Theme.of(context).hintColor),
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                          ),
                        ),
                      ),
                      SizedBox(height: 30),
                      Container(
                        decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.grey,
                            ),
                            borderRadius: BorderRadius.all(Radius.circular(20))
                        ),
                        child: TextFormField(
                          keyboardType: TextInputType.text,
                          onSaved: (input) => _con.user.name = input,
                          validator: (input) => input.length < 3 ? S.of(context).should_be_more_than_3_letters : null,
                          decoration: InputDecoration(
                            labelText: S.of(context).phone,
                            labelStyle: TextStyle(color: Theme.of(context).hintColor),
                            contentPadding: EdgeInsets.all(12),
                            //hintText: S.of(context).john_doe,
                            hintStyle: TextStyle(color: Theme.of(context).focusColor.withOpacity(0.7)),
                            prefixIcon: Icon(Icons.phone, color: Theme.of(context).hintColor),
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                          ),
                        ),
                      ),
                      SizedBox(height: 30),
                      Container(  decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.grey,
                          ),
                          borderRadius:
                          BorderRadius.all(Radius.circular(20))),
                        child: TextFormField(
                          obscureText: _con.hidePassword,
                          onSaved: (input) => _con.user.password = input,
                          validator: (input) => input.length < 6 ? S.of(context).should_be_more_than_6_letters : null,
                          decoration: InputDecoration(
                            labelText: S.of(context).password,
                            labelStyle: TextStyle(color: Theme.of(context).hintColor),
                            contentPadding: EdgeInsets.all(12),
                            hintText: '••••••••••••',
                            hintStyle: TextStyle(color: Theme.of(context).focusColor.withOpacity(0.7)),
                            prefixIcon: Icon(Icons.lock_outline, color: Theme.of(context).hintColor),
                            suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  _con.hidePassword = !_con.hidePassword;
                                });
                              },
                              color: Theme.of(context).focusColor,
                              icon: Icon(_con.hidePassword ? Icons.visibility : Icons.visibility_off),
                            ),
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
                          S.of(context).register,
                          style: TextStyle(color: Theme.of(context).primaryColor),
                        ),
                        //color: Theme.of(context).accentColor,
                        color: Colors.red,
                        onPressed: () {
                          _con.register();
                        },
                      ),
                      SizedBox(height: 25),

                      LanguageDropDownWidget(),
//                      FlatButton(
//                        onPressed: () {
//                          Navigator.of(context).pushNamed('/MobileVerification');
//                        },
//                        padding: EdgeInsets.symmetric(vertical: 14),
//                        color: Theme.of(context).accentColor.withOpacity(0.1),
//                        shape: StadiumBorder(),
//                        child: Text(
//                          'Register with Google',
//                          textAlign: TextAlign.start,
//                          style: TextStyle(
//                            color: Theme.of(context).accentColor,
//                          ),
//                        ),
//                      ),
                    ],
                  ),
                ),
              ),

            Positioned(
              bottom: 10,
              child: FlatButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('/Login');
                },
                textColor: Theme.of(context).hintColor,
                child: Text(S.of(context).i_have_account_back_to_login),
              ),
            )
          ],
        ),
      ),
    );
  }
}
class LanguageDropDownWidget extends StatefulWidget {
  @override
  _LanguageDropDownWidgetState createState() => _LanguageDropDownWidgetState();
}

class _LanguageDropDownWidgetState extends State<LanguageDropDownWidget> {
  LanguagesList languagesList;
  // Language _selectedLanguage;
  String _selectedLanguageCode;

  @override
  void initState() {
    super.initState();
    _getDefaultLanguageCode();
  }

  Future<void> _getDefaultLanguageCode() async {
    _selectedLanguageCode = await settingRepo.getDefaultLanguage(
        settingRepo.setting.value.mobileLanguage.value.languageCode);
    print('_selectedLanguageCode: $_selectedLanguageCode');
  }

  Future<void> _setDefaultLanguageCode() async {
    settingRepo.setting.value.mobileLanguage.value =
    new Locale(_selectedLanguageCode, '');
    settingRepo.setting.notifyListeners();
    settingRepo.setDefaultLanguage(_selectedLanguageCode);
  }

  @override
  Widget build(BuildContext context) {
    languagesList = new LanguagesList();
    List<DropdownMenuItem> languagesMenuItemList = languagesList.languages
        .map(
          (language) => DropdownMenuItem(
        value: language.code,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(language.englishName),
            SizedBox(
              width: 20.0,
            ),
            Container(
              height: 20,
              width: 20,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(40)),
                image: DecorationImage(
                    image: AssetImage(language.flag), fit: BoxFit.cover),
              ),
            ),
          ],
        ),
      ),
    )
        .toList();

    return DropdownButton(
      hint: Text('Select Language'),
      value: _selectedLanguageCode,
      onChanged: (selectedValue) {
        setState(() {
          _selectedLanguageCode = selectedValue;
          _setDefaultLanguageCode();
        });
      },
      items: languagesMenuItemList,
    );
  }
}