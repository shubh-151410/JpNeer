import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

import '../../generated/i18n.dart';
import '../controllers/profile_controller.dart';
import '../elements/CircularLoadingWidget.dart';
import '../elements/DrawerWidget.dart';
import '../elements/OrderItemWidget.dart';
import '../elements/PermissionDeniedWidget.dart';
import '../elements/ProfileAvatarWidget.dart';
import '../elements/ShoppingCartButtonWidget.dart';
import '../repository/user_repository.dart';

class ProfileWidget extends StatefulWidget {
  final GlobalKey<ScaffoldState> parentScaffoldKey;

  ProfileWidget({Key key, this.parentScaffoldKey}) : super(key: key);
  @override
  _ProfileWidgetState createState() => _ProfileWidgetState();
}

class _ProfileWidgetState extends StateMVC<ProfileWidget> {
  ProfileController _con;

  _ProfileWidgetState() : super(ProfileController()) {
    _con = controller;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).copyWith(dividerColor: Colors.transparent);
    return Scaffold(
      key: _con.scaffoldKey,
      drawer: DrawerWidget(),
      appBar: AppBar(
        leading: new IconButton(
          icon: new Icon(Icons.sort, color: Theme.of(context).primaryColor),
          onPressed: () => _con.scaffoldKey.currentState.openDrawer(),
        ),
        automaticallyImplyLeading: false,
        // backgroundColor: Theme.of(context).accentColor,
        elevation: 0,
        centerTitle: true,
        title: Text(
          S.of(context).profile,
          style: Theme.of(context).textTheme.headline6.merge(TextStyle(
              letterSpacing: 1.3, color: Theme.of(context).primaryColor)),
        ),
        actions: <Widget>[
          new ShoppingCartButtonWidget(
              iconColor: Theme.of(context).primaryColor,
              labelColor: Colors.red),
        ],
      ),
      body: currentUser.value.apiToken == null
          ? PermissionDeniedWidget()
          : SingleChildScrollView(
//              padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
              child: Column(
                children: <Widget>[
                  Stack(
                    children: <Widget>[
                      Container(
                        height: 60,
                        decoration: BoxDecoration(
                          color: Color(0xFFFFCDD2),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Column(
                          children: <Widget>[
                            SizedBox(
                              height: 6.0,
                            ),
                            Container(
                              // color: Colors.green[100],
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Column(
                                    children: <Widget>[
                                      ProfileAvatarWidget(
                                          user: currentUser.value),
                                      // ListTile(
                                      //   contentPadding: EdgeInsets.symmetric(
                                      //       horizontal: 20, vertical: 10),
                                      //   leading: Icon(
                                      //     Icons.person,
                                      //     color: Theme.of(context).hintColor,
                                      //   ),
                                      //   title: Text(
                                      //     S.of(context).about,
                                      //     style: Theme.of(context)
                                      //         .textTheme
                                      //         .display1,
                                      //   ),
                                      // ),
                                      Container(
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: <Widget>[
                                            Container(
                                              child: Text(
                                                currentUser.value.email,
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .caption
                                                    .merge(
                                                      TextStyle(
                                                        color: Colors.black,
                                                      ),
                                                    ),
                                              ),
                                            ),
                                            // Expanded(child: SizedBox()),
                                          ],
                                        ),
                                      ),
                                      // Padding(
                                      //   padding: const EdgeInsets.symmetric(
                                      //       horizontal: 20),
                                      //   child: Text(
                                      //     currentUser.value?.bio ?? "",
                                      //     style:
                                      //         Theme.of(context).textTheme.body1,
                                      //   ),
                                      // ),
                                    ],
                                  ),
                                  Column(
                                    children: <Widget>[
                                      Container(
                                        height: 30.0,
                                        width: 120.0,
                                        decoration: BoxDecoration(
                                          // border: Border.all(
                                          //   color: Colors.red[500],
                                          // ),
                                          color: Colors.grey[400],
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(30),
                                          ),
                                        ),
                                        child: Center(
                                          child: Text(
                                            'Edit Profile',
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 30.0,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 30.0,
                            ),
                            Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              elevation: 3.0,
                              child: Container(
                                height: 150.0,
                                width: double.maxFinite,
                                decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20)),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16.0, vertical: 8.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        S.of(context).about,
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline4,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 20, vertical: 10.0),
                                        child: Text(
                                          currentUser.value.bio,
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyText2,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            ListTile(
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 10),
                              leading: Icon(
                                Icons.shopping_basket,
                                color: Theme.of(context).hintColor,
                              ),
                              title: Text(
                                S.of(context).recent_orders,
                                style: Theme.of(context).textTheme.display1,
                              ),
                            ),
                            _con.recentOrders.isEmpty
                                ? CircularLoadingWidget(height: 200)
                                : ListView.builder(
                                    scrollDirection: Axis.vertical,
                                    shrinkWrap: true,
                                    primary: false,
                                    itemCount: _con.recentOrders.length,
                                    itemBuilder: (context, index) {
                                      return Theme(
                                        data: theme,
                                        child: ExpansionTile(
                                          initiallyExpanded: true,
                                          title: Row(
                                            children: <Widget>[
                                              Expanded(
                                                  child: (_con.recentOrders
                                                              .elementAt(index)
                                                              ?.id !=
                                                          null)
                                                      ? Text(
                                                          '${S.of(context).order_id}: #${_con.recentOrders.elementAt(index).id}')
                                                      : Text('')),
                                              Text(
                                                '${_con.recentOrders.elementAt(index).orderStatus.status}',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .caption,
                                              ),
                                            ],
                                          ),
                                          children: List.generate(
                                              _con.recentOrders
                                                  .elementAt(index)
                                                  .productOrders
                                                  .length, (indexProduct) {
                                            return OrderItemWidget(
                                                heroTag: 'recent_orders',
                                                order: _con.recentOrders
                                                    .elementAt(index),
                                                productOrder: _con.recentOrders
                                                    .elementAt(index)
                                                    .productOrders
                                                    .elementAt(indexProduct));
                                          }),
                                        ),
                                      );
                                    },
                                  ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
    );
  }
}
