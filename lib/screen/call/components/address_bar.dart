import 'package:flutter/material.dart';
import 'package:recase/recase.dart';
import 'package:relieve_app/res/res.dart';
import 'package:relieve_app/service/model/address.dart';

class AddressBar extends StatelessWidget {
  final List<Address> addressList;

  const AddressBar({Key key, @required this.addressList}) : super(key: key);

  String getCurrentAddress() {
    if (addressList.length > 0) {
      return addressList[0].name;
    } else
      return '';
  }

  @override
  Widget build(BuildContext context) {
    final widgets = <Widget>[
      Expanded(
        child: Text(
          ReCase(getCurrentAddress()).titleCase,
          overflow: TextOverflow.ellipsis,
        ),
      )
    ];
    if (addressList.length > 1)
      widgets.add(LocalImage.ic_drop_down.toSvg(width: Dimen.x12));

    return Card(
      margin: EdgeInsets.symmetric(horizontal: Dimen.x16),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: Dimen.x21,
          vertical: Dimen.x18,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: widgets,
        ),
      ),
    );
  }
}
