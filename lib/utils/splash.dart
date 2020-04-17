import 'dart:async';

import 'package:flutter/material.dart';
import 'package:isuzu/dashboard/dashboard.dart';
import 'package:isuzu/utils/widget-model.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Timer timer;

  _SplashScreenState() {
    timer = new Timer(const Duration(seconds: 5), () async {
      navigationManager(context, Dashboard(), isPushReplaced: true);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              // decoration: BoxDecoration(
              //   borderRadius: BorderRadius.circular(100.0),
              //   border: Border.all(
              //     color: Colors.black12,
              //     style: BorderStyle.solid,
              //     width: 6.0,
              //   ),
              //   // image: DecorationImage(
              //   //   image: AssetImage("assets/images/logo/logo.png"),
              //   //   fit: BoxFit.cover,
              //   // ),
              // ),
              padding: EdgeInsets.all(0),
              child: Image.asset('assets/images/logo/logo.png'),
            ),
            Container(
              width: MediaQuery.of(context).size.width / 2,
              child: LinearProgressIndicator()
            ),
          ],
        ),
      ),
    );
  }
}
