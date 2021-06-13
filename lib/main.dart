import 'package:covid19/src/config/theme.dart';
import 'package:covid19/src/header.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Stack(
          fit: StackFit.expand,
          children: [
            Container(
              decoration: BoxDecoration(gradient: Theme2.gradient),
            ),
            Column(
              children: [
                Header(),
                IconButton(onPressed: (){
                  print('okok');
                }, icon: FaIcon(FontAwesomeIcons.gamepad)),
                Text('form'),
                Text('forgot'),
                Text('SSO'),
                Text('register')
              ],
            ),
          ],
        ),
      ),
    );
  }
}
