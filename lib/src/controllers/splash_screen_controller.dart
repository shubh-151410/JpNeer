import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

import '../../generated/i18n.dart';
import '../repository/settings_repository.dart' as settingRepo;
import '../repository/user_repository.dart';

class SplashScreenController extends ControllerMVC {
  ValueNotifier<Map<String, double>> progress = new ValueNotifier(new Map());
  GlobalKey<ScaffoldState> scaffoldKey;

  SplashScreenController() {
    this.scaffoldKey = new GlobalKey<ScaffoldState>();
    // Should define these variable before the app loaded
    progress.value = {"Setting": 0, "User": 0, "DeliveryAddress": 0};
  }
  @override
  void initState() {
    // final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();
    // _firebaseMessaging.configure(
    //   onMessage: (Map<String, dynamic> message) async {
    //     print("splash screen onMessage: $message");
    //   },
    //   onLaunch: (Map<String, dynamic> message) async {
    //     print("splash screen onLaunch: $message");
    //   },
    //   onResume: (Map<String, dynamic> message) async {
    //     print(" splash screen  onResume: $message");
    //   },
    //   onBackgroundMessage: myBackgroundMessageHandler,
    // );
    settingRepo.setting.addListener(() {
      if (settingRepo.setting.value.appName != null &&
          settingRepo.setting.value.appName != '' &&
          settingRepo.setting.value.mainColor != null) {
        progress.value["Setting"] = 41;
        progress.notifyListeners();
      }
    });
    settingRepo.deliveryAddress.addListener(() {
      if (settingRepo.deliveryAddress.value.address != null) {
        progress.value["DeliveryAddress"] = 29;
        progress?.notifyListeners();
      }
    });
    currentUser.addListener(() {
      if (currentUser.value.auth != null) {
        progress.value["User"] = 30;
        progress.notifyListeners();
      }
    });
    Timer(Duration(seconds: 20), () {
      scaffoldKey?.currentState?.showSnackBar(SnackBar(
        content: Text(S.current.verify_your_internet_connection),
      ));
    });

    super.initState();
  }

  static Future<dynamic> myBackgroundMessageHandler(
      Map<String, dynamic> message) {
    if (message.containsKey('data')) {
      // Handle data message
      final dynamic data = message['data'];
    }

    if (message.containsKey('notification')) {
      // Handle notification message
      final dynamic notification = message['notification'];
    }
  }
}
