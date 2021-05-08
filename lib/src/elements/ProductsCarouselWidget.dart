import 'package:flutter/material.dart';

import '../elements/CircularLoadingWidget.dart';
import '../elements/ProductsCarouselItemWidget.dart';
import '../models/product.dart';

class ProductsCarouselWidget extends StatelessWidget {
  List<Product> productsList;
  String heroTag;

  ProductsCarouselWidget({Key key, this.productsList, this.heroTag}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return productsList.isEmpty
        ? CircularLoadingWidget(height: 210)
        : Container(
            height: 210,
            color: Theme.of(context).primaryColor,
            padding: EdgeInsets.symmetric(vertical: 10),
            child: ListView.builder(
              itemCount: productsList.length,
              itemBuilder: (context, index) {
                double _marginLeft = 0;
                (index == 0) ? _marginLeft = 20 : _marginLeft = 0;
                return ProductsCarouselItemWidget(
                  heroTag: heroTag,
                  marginLeft: _marginLeft,
                  product: productsList.elementAt(index),
                );
              },
              scrollDirection: Axis.horizontal,
            ));
  }
}
