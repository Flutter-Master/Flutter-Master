/*

Don't forget to add dependency in  pubspec.yaml

dependencies:
  cupertino_icons: ^0.1.3
  flutter_screenutil: ^2.3.1

 */

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // initialising with iPhone 11 dimensions
    ScreenUtil.init(context, width: 414.0, height: 896.0);
    return ResponsiveScreen();
  }
}

class ResponsiveScreen extends StatelessWidget {
  // creating ScreenUtil object, which
  // will be used everywhere
  final ScreenUtil _screenUtil = ScreenUtil();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // responsive container
            Container(
              height: _screenUtil.setHeight(200.0),
              width: _screenUtil.setWidth(100.0),
              color: Colors.blue,
            ),
            SizedBox(
              width: 30.0,
            ),
            // non responsive container
            Container(
              height: 200.0,
              width: 100.0,
              color: Colors.lightBlue,
            ),
          ],
        ),
      ),
    );
  }
}
