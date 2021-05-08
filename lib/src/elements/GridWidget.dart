import 'package:flutter/material.dart';

import '../elements/GridItemWidget.dart';
import '../models/market.dart';

class GridWidget extends StatelessWidget {
  List<Market> marketsList;
  String heroTag;
  GridWidget({Key key, this.marketsList, this.heroTag});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      primary: false,
      padding: EdgeInsets.symmetric(vertical: 10),
      crossAxisCount: MediaQuery.of(context).orientation == Orientation.portrait ? 2 : 4,
      children: List.generate(marketsList.length, (index) {
        return GridItemWidget(market: marketsList.elementAt(index), heroTag: heroTag);
      }),
    );
  }
}
