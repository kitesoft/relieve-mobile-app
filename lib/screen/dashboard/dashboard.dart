import 'package:flutter/material.dart';
import 'components/dashboard_bottom_bar.dart';

import '../../widget/relieve_scaffold.dart';
import '../call/call.dart';
import './dashboard_home.dart';

class DashboardScreen extends StatefulWidget {
  DashboardScreen({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int currentIndex = 0;

  void _goToCall(BuildContext context) {
    Navigator.of(context).push(
        MaterialPageRoute(builder: (builder) => CallScreen(title: 'Test')));
  }

  @override
  Widget build(BuildContext context) {
    return RelieveScaffold(
      hasAppBarScreen: currentIndex == 0, // only first screen has app bar
      bottomNavigationBar: RelieveBottomNavigationBar(onPress: (index, isCall) {
        if (isCall) {
          _goToCall(context);
        } else {
          setState(() {
            currentIndex = index;
          });
        }
      }),
      childs: <Widget>[
        buildBody(),
      ],
    );
  }

  Widget buildBody() {
    switch (currentIndex) {
      case 0:
        return DashboardHomeScreen();
      case 1:
        return Text('This is discover');
      case 3:
        return Text('This is chat');
      case 4:
        return Text('This is profile');
      default:
        return Text('Dashboard');
    }
  }
}
