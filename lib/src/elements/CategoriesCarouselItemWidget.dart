import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../models/category.dart';
import '../models/route_argument.dart';

// ignore: must_be_immutable
class CategoriesCarouselItemWidget extends StatelessWidget {
  double marginLeft;
  Category category;
  CategoriesCarouselItemWidget({Key key, this.marginLeft, this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Theme.of(context).accentColor.withOpacity(0.08),
      highlightColor: Colors.transparent,
      onTap: () {
        Navigator.of(context).pushNamed('/Category', arguments: RouteArgument(id: category.id));
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Hero(
            tag: category.id,
            child: Container(
              margin: EdgeInsetsDirectional.only(start: this.marginLeft, end: 20),
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                  boxShadow: [
                    BoxShadow(
                        color: Theme.of(context).focusColor.withOpacity(0.2), offset: Offset(0, 2), blurRadius: 7.0)
                  ]),
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Image.network(
                  getImageUrl(category.image.url),
                  // color: Theme.of(context).accentColor,
                ),
              ),
            ),
          ),
          SizedBox(height: 5),
          Container(
            margin: EdgeInsetsDirectional.only(start: this.marginLeft, end: 20),
            child: Text(
              category.name,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.body1,
            ),
          ),
        ],
      ),
    );
  }
   String getImageUrl(String imageurl){
   
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
