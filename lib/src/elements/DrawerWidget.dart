import 'package:dynamic_theme/dynamic_theme.dart';
import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

import '../../generated/i18n.dart';
import '../controllers/profile_controller.dart';
import '../repository/settings_repository.dart';
import '../repository/user_repository.dart';

class DrawerWidget extends StatefulWidget {
  @override
  _DrawerWidgetState createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends StateMVC<DrawerWidget> {
  ProfileController _con;

  _DrawerWidgetState() : super(ProfileController()) {
    _con = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          Container(  color: Color(0xFFFFCDD2),
            child: GestureDetector(
              onTap: () {
                currentUser.value.apiToken != null
                    ? Navigator.of(context).pushNamed('/Profile')
                    : Navigator.of(context).pushNamed('/Login');
              },
              child: currentUser.value.apiToken != null
                  ?

//              UserAccountsDrawerHeader(
//                      decoration: BoxDecoration(
//                        color: Theme.of(context).hintColor.withOpacity(0.1),
//                      ),
//                      accountName: Text(
//                        currentUser.value.name,
//                        style: Theme.of(context).textTheme.title,
//                      ),
//                      accountEmail: Text(
//                        currentUser.value.email,
//                        style: Theme.of(context).textTheme.caption,
//                      ),
//                      currentAccountPicture: CircleAvatar(
//                        backgroundColor: Theme.of(context).accentColor,
//                        backgroundImage: NetworkImage(currentUser.value.image.thumb),
//                      ),
//                    )

                Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        CircleAvatar(
                          radius: 40.0,
                          backgroundColor: Theme.of(context).accentColor,
                          backgroundImage:
                          NetworkImage(currentUser.value.image.thumb),
                        ),
                        SizedBox(
                          height: 5.0,
                        ),
                        Text(
                          currentUser.value.name,
                          // style: Theme.of(context).textTheme.headline6,
                          style: TextStyle(
                              color: Colors.black, fontSize: 16.0),
                        ),
                        Text(
                          currentUser.value.email,
                          // style: Theme.of(context).textTheme.caption,
                          style: TextStyle(
                              color: Colors.black, fontSize: 12.0),
                        ),
                      ],
                    ),
                  ),
                )

                  : Container(
                      padding: EdgeInsets.symmetric(vertical: 30, horizontal: 15),
                      decoration: BoxDecoration(
                        color: Theme.of(context).hintColor.withOpacity(0.1),
                      ),
                      child: Row(
                        children: <Widget>[
                          Icon(
                            Icons.person,
                            size: 32,
                            color: Theme.of(context).accentColor.withOpacity(1),
                          ),
                          SizedBox(width: 30),
                          Text(
                            S.of(context).guest,
                            style: Theme.of(context).textTheme.title,
                          ),
                        ],
                      ),
                    ),
            ),
          ),
          ListTile(
            onTap: () {
              Navigator.of(context).pushNamed('/Pages', arguments: 2);
            },
            leading: Icon(
              Icons.home,
              color: Theme.of(context).focusColor.withOpacity(1),
            ),
            title: Text(
              S.of(context).home,
              style: Theme.of(context).textTheme.subhead,
            ),
          ),
          ListTile(
            onTap: () {
              Navigator.of(context).pushNamed('/Pages', arguments: 0);
            },
            leading: Icon(
              Icons.notifications,
              color: Theme.of(context).focusColor.withOpacity(1),
            ),
            title: Text(
              S.of(context).notifications,
              style: Theme.of(context).textTheme.subhead,
            ),
          ),
          ListTile(
            onTap: () {
              Navigator.of(context).pushNamed('/Pages', arguments: 3);
            },
            leading: Icon(
              Icons.local_mall,
              color: Theme.of(context).focusColor.withOpacity(1),
            ),
            title: Text(
              S.of(context).my_orders,
              style: Theme.of(context).textTheme.subhead,
            ),
          ),
          ListTile(
            onTap: () {
              Navigator.of(context).pushNamed('/Pages', arguments: 4);
            },
            leading: Icon(
              Icons.favorite,
              color: Theme.of(context).focusColor.withOpacity(1),
            ),
            title: Text(
              S.of(context).favorite_products,
              style: Theme.of(context).textTheme.subhead,
            ),
          ),
          ListTile(
            dense: true,
            title: Text(
              S.of(context).application_preferences,
              style: Theme.of(context).textTheme.body1,
            ),
            trailing: Icon(
              Icons.remove,
              color: Theme.of(context).focusColor.withOpacity(0.3),
            ),
          ),
          ListTile(
            onTap: () {
              Navigator.of(context).pushNamed('/Help');
            },
            leading: Icon(
              Icons.help,
              color: Theme.of(context).focusColor.withOpacity(1),
            ),
            title: Text(
              S.of(context).help__support,
              style: Theme.of(context).textTheme.subhead,
            ),
          ),
          ListTile(
            onTap: () {
              if (currentUser.value.apiToken != null) {
                Navigator.of(context).pushNamed('/Settings');
              } else {
                Navigator.of(context).pushReplacementNamed('/Login');
              }
            },
            leading: Icon(
              Icons.settings,
              color: Theme.of(context).focusColor.withOpacity(1),
            ),
            title: Text(
              S.of(context).settings,
              style: Theme.of(context).textTheme.subhead,
            ),
          ),
           ListTile(
            onTap: () {
              if (currentUser.value.apiToken != null) {
                Navigator.of(context).pushNamed('/Aboutus');
              } else {
                Navigator.of(context).pushReplacementNamed('/Login');
              }
            },
           
            title: Text(
            S.of(context).about_us,
              style: Theme.of(context).textTheme.subhead,
            ),
          ),
           ListTile(
            onTap: () {
              if (currentUser.value.apiToken != null) {
                Navigator.of(context).pushNamed('/privacyandpolicy');
              } else {
                Navigator.of(context).pushReplacementNamed('/Login');
              }
            },
           
            title: Text(
           "Privacy Policy",
              style: Theme.of(context).textTheme.subhead,
            ),
          ),

          GestureDetector(
            onTap: () {
              logout().then((value) {
                Navigator.of(context).pushNamedAndRemoveUntil(
                    '/Login', (Route<dynamic> route) => false);
              });
            },
            child: Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(
                  left: 50.0, right: 50.0, top: 10, bottom: 10),
              padding:
              EdgeInsets.only(top: 8, left: 12, right: 12, bottom: 8),
              decoration: new BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.red),
                  borderRadius: BorderRadius.circular(25.0)),
              child: Text(
                S.of(context).log_out,
                style: Theme.of(context).textTheme.subtitle1,
              ),
            ),
          ),
          setting.value.enableVersion
              ? ListTile(
                  dense: true,
                  title: Text(
                    S.of(context).version + " " + setting.value.appVersion,
                    style: Theme.of(context).textTheme.body1,
                  ),
                  trailing: Icon(
                    Icons.remove,
                    color: Theme.of(context).focusColor.withOpacity(0.3),
                  ),
                )
              : SizedBox(),
        ],
      ),
    );
  }
}
