import 'package:covid19/src/constants/asset.dart';
import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 50.0),
      child: Image.asset(Asset.LOGO_IMAGE,
        width: 150,
      ),
    );;
  }
}
