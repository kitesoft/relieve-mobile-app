import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_stetho/flutter_stetho.dart';

import 'screen/boarding/boarding_home.dart';
import 'res/res.dart';

void main() {
  Stetho.initialize();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of my application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);

    return MaterialApp(
        title: 'Relieve ID',
        theme: ThemeData(
          primaryColor: AppColor.colorPrimary,
          primaryColorDark: AppColor.colorPrimaryDark,
          accentColor: AppColor.colorAccent,
          backgroundColor: Colors.white,
          canvasColor: Colors.transparent,
          fontFamily: CircularStdFont.book.fontFamily,
        ),
        home: BoardingHomeScreen());
  }
}
