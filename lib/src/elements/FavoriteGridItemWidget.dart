import 'package:flutter/material.dart';
import 'package:markets/src/helpers/helper.dart';

import '../models/favorite.dart';
import '../models/route_argument.dart';

class FavoriteGridItemWidget extends StatelessWidget {
  String heroTag;
  Favorite favorite;

  FavoriteGridItemWidget({Key key, this.heroTag, this.favorite})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      highlightColor: Colors.transparent,
      splashColor: Theme.of(context).accentColor.withOpacity(0.08),
      onTap: () {
        Navigator.of(context).pushNamed('/Product',
            arguments: new RouteArgument(
                heroTag: this.heroTag, id: this.favorite.product.id));
      },
      child: Stack(
        alignment: AlignmentDirectional.topEnd,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Expanded(
                child: Hero(
                  tag: heroTag + favorite.product.id,
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image:
                          NetworkImage(this.favorite.product.image.thumb),
                          fit: BoxFit.cover),
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 5),
              Text(
                favorite.product.name,
                style: Theme.of(context).textTheme.body2,
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(height: 2),
              Text(
                favorite.product.market.name,
                style: Theme.of(context).textTheme.caption,
                overflow: TextOverflow.ellipsis,
              )
            ],
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Container(
              decoration: BoxDecoration(
                color: Theme.of(context).accentColor,
                borderRadius: BorderRadius.all(
                  Radius.circular(6.0),
                ),
              ),
              child: Padding(
                padding:
                const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
                child: Helper.getPrice(favorite.product.price, context,
                    style: Theme.of(context).textTheme.display1),
              ),
            ),
          ),
          // Container(
          //   margin: EdgeInsets.all(10),
          //   width: 40,
          //   height: 40,
          //   child: FlatButton(
          //     padding: EdgeInsets.all(0),
          //     onPressed: () {},
          //     child: Icon(
          //       Icons.favorite,
          //       color: Theme.of(context).primaryColor,
          //       size: 24,
          //     ),
          //     color: Theme.of(context).accentColor.withOpacity(0.9),
          //     shape: StadiumBorder(),
          //   ),
          // ),
        ],
      ),
    );
  }
}
