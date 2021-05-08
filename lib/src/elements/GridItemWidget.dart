import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../helpers/helper.dart';
import '../models/market.dart';
import '../models/route_argument.dart';

class GridItemWidget extends StatelessWidget {
  Market market;
  String heroTag;

  GridItemWidget({Key key, this.market, this.heroTag}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      highlightColor: Colors.transparent,
      splashColor: Theme.of(context).accentColor.withOpacity(0.08),
      onTap: () {
        Navigator.of(context).pushNamed('/Details',
            arguments: RouteArgument(id: market.id, heroTag: heroTag));
      },
      child: Container(
        margin: EdgeInsets.all(5),
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            borderRadius: BorderRadius.all(Radius.circular(5)),
            boxShadow: [
              BoxShadow(
                  color: Theme.of(context).focusColor.withOpacity(0.05),
                  offset: Offset(0, 5),
                  blurRadius: 5)
            ]),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              child: Hero(
                tag: heroTag + market.id,
                child: CachedNetworkImage(
                  height: 82,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  imageUrl: (market.image.url),
                  placeholder: (context, url) => Image.asset(
                    'assets/img/loading.gif',
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: 82,
                  ),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                ),
              ),
            ),
            SizedBox(height: 5),
            Text(
              market.name,
              style: Theme.of(context).textTheme.body1,
              softWrap: false,
              overflow: TextOverflow.fade,
            ),
            SizedBox(height: 2),
            Row(
              children: Helper.getStarsList(double.parse(market.rate)),
            ),
          ],
        ),
      ),
    );
  }

  String getImageUrl(String imageurl) {
   var imagename = imageurl.split("/");
    imagename[2] = "admin.jpneer.com";

    imagename.removeAt(3);
    imagename.removeAt(3);
    // imagename.removeAt(4);

    var demostring = imagename.reduce((value, element) => value + '/' + element);

    print(demostring);


    // String name = imagename.last;
    // String id = imagename[imagename.length -2];
    // String jpneerurl = "http://admin.jpneer.com/storage/app/public/165/conversions/bisleri-at-doorstep-video-icon.jpg";

    //  String mainurl = "http://admin.hdapna.com/storage/app/public/21/conversions/$imagename";
    // String newimageurl = "http://admin.hdapna.com/public/storage/app/public/$id/$name";


    
     return demostring;

}
}