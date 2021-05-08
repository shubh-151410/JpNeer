import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

import '../../generated/i18n.dart';
import '../controllers/walkthrough_controller.dart';
import '../helpers/app_config.dart' as config;

class Walkthrough extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: new WalkthroughWidget(),
    );
  }

  AppBar buildAppBar(context) {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
      leading: MaterialButton(
        padding: EdgeInsets.all(0),
        onPressed: () {
          Navigator.of(context).pushReplacementNamed('/Pages', arguments: 2);
        },
        child: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Text(
            S.of(context).skip,
            style: TextStyle(color: Theme.of(context).accentColor),
          ),
        ),
      ),
      actions: <Widget>[
        MaterialButton(
            padding: EdgeInsets.all(0),
            onPressed: () {
              Navigator.of(context).pushReplacementNamed('/Login');
            },
            child: Row(
              children: <Widget>[
                Text(
                  S.of(context).login,
                  style: TextStyle(color: Theme.of(context).accentColor),
                ),
                SizedBox(width: 5),
                Icon(
                  Icons.account_circle,
                  color: Theme.of(context).accentColor,
                ),
              ],
            )),
      ],
    );
  }
}

class WalkthroughWidget extends StatefulWidget {
  WalkthroughWidget({
    Key key,
  }) : super(key: key);

  @override
  _WalkthroughWidgetState createState() => _WalkthroughWidgetState();
}

class _WalkthroughWidgetState extends StateMVC<WalkthroughWidget> {
  WalkthroughController _con;

  _WalkthroughWidgetState() : super(WalkthroughController()) {
    _con = controller;
  }

  @override
  Widget build(BuildContext context) {
    final _ac = config.App(context);
    return Container(
      height: _ac.appHeight(100),
      child: Swiper(
        itemCount: 3,
        pagination: SwiperPagination(
          margin: EdgeInsets.only(bottom: _ac.appHeight(10)),
          builder: DotSwiperPaginationBuilder(
            activeColor: Theme.of(context).accentColor,
            color: Theme.of(context).accentColor.withOpacity(0.2),
          ),
        ),
        itemBuilder: (context, index) {
          return new WalkthroughItemWidget();
        },
      ),
    );
  }
}

class WalkthroughItemWidget extends StatelessWidget {
  WalkthroughItemWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _ac = config.App(context);
    return Stack(
      children: <Widget>[
        Positioned(
          top: 140,
          child: Container(
            decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.all(Radius.circular(3)),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 50,
                    color: Theme.of(context).hintColor.withOpacity(0.2),
                  )
                ]),
            margin: EdgeInsets.symmetric(
              horizontal: _ac.appHorizontalPadding(10),
            ),
            padding: EdgeInsets.symmetric(horizontal: 20),
            width: _ac.appWidth(80),
            height: _ac.appHeight(55),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: 150),
                Text(
                  S.of(context).maps_explorer,
                  style: Theme.of(context).textTheme.title,
                ),
                SizedBox(height: 10),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Icon(
                      Icons.map,
                      color: Theme.of(context).focusColor.withOpacity(1),
                      size: 28,
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        S.of(context).discover__explorer,
                        overflow: TextOverflow.fade,
                        softWrap: false,
                        maxLines: 1,
                        style: Theme.of(context).textTheme.caption,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 25),
                Text(
                  S.of(context).you_can_discover_markets,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 4,
                  style: Theme.of(context).textTheme.body2,
                )
              ],
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('assets/img/product0.jpg'),
              ),
              borderRadius: BorderRadius.all(Radius.circular(10)),
              boxShadow: [
                BoxShadow(
                  blurRadius: 50,
                  color: Theme.of(context).hintColor.withOpacity(0.2),
                )
              ]),
          margin: EdgeInsets.symmetric(
            horizontal: _ac.appHorizontalPadding(16),
            vertical: _ac.appVerticalPadding(10),
          ),
          width: _ac.appWidth(100),
          height: 220,
        ),
      ],
    );
  }
}
