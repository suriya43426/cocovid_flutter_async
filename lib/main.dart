import 'package:covid19/src/config/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

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
                Text('header'),
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
