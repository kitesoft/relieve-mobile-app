import 'package:flutter/material.dart';
import 'package:relieve_app/res/res.dart';

typedef RelieveBottomAction = void Function(int index, bool isCall);

class RelieveBottomNavigationBar extends StatefulWidget {
  RelieveBottomNavigationBar({this.onPress});

  final RelieveBottomAction onPress;

  @override
  RelieveBottomNavigationBarState createState() {
    return new RelieveBottomNavigationBarState();
  }
}

class RelieveBottomNavigationBarState
    extends State<RelieveBottomNavigationBar> {
  int currentIndex = 0;

  static const CALL_INDEX = 3;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      decoration: BoxDecoration(color: Colors.white),
      child: buildRow(),
    );
  }

  Widget buildItem(int index, LocalImage icon, String text) {
    final isActive = currentIndex == index;
    return ClipOval(
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            this.setState(() {
              currentIndex = index;
            });
            if (widget.onPress != null) {
              widget.onPress(index, false);
            }
          },
          child: buildIconItem(icon, isActive, text),
        ),
      ),
    );
  }

  Container buildIconItem(LocalImage icon, bool isActive, String text) {
    return Container(
      width: 56,
      height: 56,
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            width: 20,
            height: 20,
            margin: EdgeInsets.only(bottom: 4),
            child: icon.toSvg(color: isActive ? Colors.blue : Colors.grey),
          ),
          isActive
              ? Text(text, style: TextStyle(fontSize: 10, color: Colors.blue))
              : null
        ].where((o) => o != null).toList(),
      ),
    );
  }

  Widget buildCallWidget() {
    return Container(
      decoration: BoxDecoration(
          color: Colors.blue, borderRadius: BorderRadius.circular(8)),
      child: IconButton(
        onPressed: () {
          if (widget.onPress != null) {
            widget.onPress(CALL_INDEX, true);
          }
        },
        iconSize: 10,
        icon: LocalImage.ic_call.toSvg(width: 20, height: 20),
      ),
    );
  }

  Row buildRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        buildItem(0, LocalImage.ic_home, 'Home'),
        buildItem(1, LocalImage.ic_discover, 'Discover'),
        buildCallWidget(),
        buildItem(3, LocalImage.ic_chat, 'Chat'),
        buildItem(4, LocalImage.ic_profile, 'Profile')
      ],
    );
  }
}