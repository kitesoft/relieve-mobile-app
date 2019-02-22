import 'package:flutter/material.dart';
import 'package:recase/recase.dart';
import 'package:relieve_app/app_config.dart';
import 'package:relieve_app/service/model/user.dart';
import 'package:relieve_app/service/source/api/api.dart';

import '../../../res/res.dart';
import '../../../service/model/family.dart';
import '../../dashboard/components/dashboard_title.dart';
import '../../../widget/item/user_location.dart';

class Greeting extends StatelessWidget {
  final String name;

  const Greeting({Key key, this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.only(
          left: Dimen.x16, right: Dimen.x16, top: Dimen.x8, bottom: Dimen.x8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Halo',
            style: CircularStdFont.book
                .getStyle(size: Dimen.x24)
                .apply(color: Colors.white),
          ),
          Container(height: Dimen.x4),
          Text(
            name,
            style: CircularStdFont.black
                .getStyle(size: Dimen.x24)
                .apply(color: Colors.white),
          )
        ],
      ),
    );
  }
}

class UserAppBar extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => UserAppBarState();
}

class UserAppBarState extends State {
  String location = 'Dago, Bandung';
  bool isSafe = false;

  User user = User(fullname: '');

  void loadUser() async {
    final userResponse = await BakauApi(AppConfig.of(context)).getUser();
    if (userResponse.status == REQUEST_SUCCESS) {
      setState(() {
        user = userResponse.content;
      });
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    loadUser();
  }

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 250,
      floating: false,
      pinned: true,
      centerTitle: false,
      title: RelieveTitle(
        style: RelieveTitleStyle.light,
      ),
      flexibleSpace: FlexibleSpaceBar(
        background: Stack(
          children: <Widget>[
            Positioned.fill(
              child: buildBgImage(),
            ),
            buildBlueLayer(),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Greeting(name: ReCase(user.fullname).titleCase),
                Padding(
                  padding: EdgeInsets.only(top: Dimen.x24, bottom: Dimen.x18),
                  child: UserLocation(
                    location: location,
                    icon: LocalImage.ic_live,
                    personHealth: PersonHealth.Fine,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Container buildBlueLayer() {
    return Container(
      color: HexColor(
        AppColor.colorPrimary.hexColor,
        transparancy: 0.65,
      ),
    );
  }

  Container buildBgImage() {
    return Container(
      width: double.infinity,
      child: RemoteImage.bg_jawa_barat.toImage(fit: BoxFit.fitHeight),
    );
  }
}
