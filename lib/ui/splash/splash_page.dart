import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:playing/common/routes/app_routes.dart';

class SplashPage extends StatefulWidget {
  @override
  SplashPageState createState() => SplashPageState();
}

class SplashPageState extends State<SplashPage> {
  int _count = 3;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body: Container(
      child: Text("这个是启动页$_count"),
      alignment: Alignment.center,
    ));
  }

  @override
  void initState() {
    super.initState();
    Timer.periodic(Duration(seconds: 3), (timer) {
      setState(() {
        if (_count <= 1) {
          timer.cancel();
          timer = null;
          Navigator.of(context).pushNamed(
            AppRouter.mainPage,
          );
        } else {
          _count = _count - 1;
        }
      });
    });
  }
}
