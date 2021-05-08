import 'package:mvc_pattern/mvc_pattern.dart';

import '../models/market.dart';

class WalkthroughController extends ControllerMVC {
  List<Market> topMarkets = <Market>[];

  WalkthroughController() {
    //listenForTopMarkets();
  }
//  void listenForTopMarkets() async {
//    LocationData _locationData = await getCurrentLocation();
//    final Stream<Market> stream = await getNearMarkets(_locationData, _locationData);
//    stream.listen((Market _market) {
//      setState(() => topMarkets.add(_market));
//    }, onError: (a) {}, onDone: () {});
//  }
}
