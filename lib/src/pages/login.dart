import 'package:flutter/material.dart';
import 'package:markets/src/models/language.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

import '../../generated/i18n.dart';
import '../controllers/user_controller.dart';
import '../elements/BlockButtonWidget.dart';
import '../helpers/app_config.dart' as config;
import '../repository/user_repository.dart' as userRepo;

import '../repository/settings_repository.dart' as settingRepo;
class LoginWidget extends StatefulWidget {
  @override
  _LoginWidgetState createState() => _LoginWidgetState();
}

class _LoginWidgetState extends StateMVC<LoginWidget> {
  UserController _con;

  _LoginWidgetState() : super(UserController()) {
    _con = controller;
  }
  @override
  void initState() {
    super.initState();
    if (userRepo.currentUser.value.apiToken != null) {
      Navigator.of(context).pushReplacementNamed('/Pages', arguments: 2);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _con.scaffoldKey,
      resizeToAvoidBottomPadding: false,
      body: Stack(
        alignment: AlignmentDirectional.topCenter,
        children: <Widget>[
//          Positioned(
//            top: 0,
//            child: Container(
//              width: config.App(context).appWidth(100),
//              height: config.App(context).appHeight(37),
//              decoration: BoxDecoration(color: Theme.of(context).accentColor),
//            ),
//          ),
//          Positioned(
//            top: config.App(context).appHeight(37) - 120,
//            child: Container(
//              width: config.App(context).appWidth(84),
//              height: config.App(context).appHeight(37),
//              child: Text(
//                S.of(context).lets_start_with_login,
//                style: Theme.of(context).textTheme.display3.merge(TextStyle(color: Theme.of(context).primaryColor)),
//              ),
//            ),
//          ),
          Positioned(
           // top: config.App(context).appHeight(37) - 50,
            child: Container(
//              decoration: BoxDecoration(
//                  color: Theme.of(context).primaryColor,
//                  borderRadius: BorderRadius.all(Radius.circular(10)),
//                  boxShadow: [
//                    BoxShadow(
//                      blurRadius: 50,
//                      color: Theme.of(context).hintColor.withOpacity(0.2),
//                    )
//                  ]),
              margin: EdgeInsets.symmetric(
                horizontal: 20,
              ),
              padding: EdgeInsets.only(top: 50, right: 27, left: 27, bottom: 20),
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
                    child:

                    TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      onSaved: (input) => _con.user.email = input,
                      validator: (input) => !input.contains('@') ? S.of(context).should_be_a_valid_email : null,
                      decoration: InputDecoration(
                        labelText: S.of(context).email,
                        labelStyle: TextStyle(color: Theme.of(context).hintColor),
                        contentPadding: EdgeInsets.all(12),
                        hintText: 'johndoe@gmail.com',
                        hintStyle: TextStyle(color: Theme.of(context).focusColor.withOpacity(0.7)),
                        prefixIcon: Icon(Icons.email, color: Theme.of(context).hintColor),
                        border: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
//                        border: OutlineInputBorder(
//                            borderSide: BorderSide(color: Theme.of(context).focusColor.withOpacity(0.2))),
//                        focusedBorder: OutlineInputBorder(
//                            borderSide: BorderSide(color: Theme.of(context).focusColor.withOpacity(0.5))),
//                        enabledBorder: OutlineInputBorder(
//                            borderSide: BorderSide(color: Theme.of(context).focusColor.withOpacity(0.2))),
                      ),
                    ) ),
                    SizedBox(height: 30),
                    Container(
                    decoration: BoxDecoration(
                    border: Border.all(
                    color: Colors.grey,
                    ),
                    borderRadius:
                    BorderRadius.all(Radius.circular(20))),
                    child:
                    TextFormField(
                      keyboardType: TextInputType.text,
                      onSaved: (input) => _con.user.password = input,
                      validator: (input) => input.length < 3 ? S.of(context).should_be_more_than_3_characters : null,
                      obscureText: _con.hidePassword,
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
                    )),
                    SizedBox(height: 30),

                    BlockButtonWidget(
                      text: Text(
                        S.of(context).login,
                        style: TextStyle(color: Theme.of(context).primaryColor),
                      ),
                     // color: Theme.of(context).accentColor,
                      color: Colors.red,
                      onPressed: () {
                        _con.login();
                      },
                    ),
                    SizedBox(height: 15),
                    LanguageDropDownWidget(),
                    FlatButton(
                      onPressed: () {
                        Navigator.of(context).pushReplacementNamed('/Pages', arguments: 2);
                      },
                      shape: StadiumBorder(),
                      textColor: Theme.of(context).hintColor,
                      child: Text(S.of(context).skip),
                      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 14),
                    ),

                FlatButton(
                  onPressed: () {
                    Navigator.of(context).pushReplacementNamed('/ForgetPassword');
                  },
                  textColor: Theme.of(context).hintColor,
                  child: Text(S.of(context).i_forgot_password),
                ),
//                      SizedBox(height: 10),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
//            bottom: 10,
            top: 50,
            right: 5,
            child: Column(
              children: <Widget>[
//                FlatButton(
//                  onPressed: () {
//                    Navigator.of(context).pushReplacementNamed('/ForgetPassword');
//                  },
//                  textColor: Theme.of(context).hintColor,
//                  child: Text(S.of(context).i_forgot_password),
//                ),
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
