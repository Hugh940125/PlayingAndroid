import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:playing/widget/common_appbar.dart';

class SystemPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => SystemPageState();

}

class SystemPageState extends State<SystemPage>{

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      home: Scaffold(
        appBar: CommonAppBar("体系").build(context),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
  }

}