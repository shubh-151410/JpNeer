import 'package:flutter/material.dart';
import 'package:markets/generated/i18n.dart';

class AboutUs extends StatefulWidget {
  @override
  _AboutUsState createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text(
          S.of(context).about_us,
          style: Theme.of(context)
              .textTheme
              .title
              .merge(TextStyle(letterSpacing: 1.3)),
        ),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 40.0, horizontal: 8.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            S.of(context).about_us_content,
            style: Theme.of(context).textTheme.body2.merge(TextStyle(fontSize: 18.0,color:Colors.black)),
            textAlign: TextAlign.left,
          ),
          SizedBox(
            height: 10.0,
          ),
          Text(
            "Contact Us",
            style: Theme.of(context).textTheme.title.merge(
                  TextStyle(letterSpacing: 1.3,fontSize: 15.0,color: Colors.black),
                ),
          ),
          SizedBox(
            height: 10.0,
          ),
          Text(
            "Email: info@piscout.com",
            style: Theme.of(context).textTheme.title.merge(
                  TextStyle(letterSpacing: 1.3,fontSize: 15.0,color: Colors.black),
                ),
          ),
          SizedBox(
            height: 10.0,
          ),
          Text(
            "Phone No: 9306293885",
            style: Theme.of(context).textTheme.title.merge(
                  TextStyle(letterSpacing: 1.3,fontSize: 15.0,color: Colors.black),
                  
                )
          ),
        ]),
      ),
    );
  }
}
