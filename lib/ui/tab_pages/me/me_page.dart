import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:playing/widget/common_appbar.dart';

class MePage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => MePageState();

}

class MePageState extends State<MePage>{

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      home: Scaffold(
        appBar: CommonAppBar("我的").build(context),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
  }

}