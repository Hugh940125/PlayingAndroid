import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:playing/widget/common_appbar.dart';

class QuestionPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => QuestionPageState();

}

class QuestionPageState extends State<QuestionPage>{

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      home: Scaffold(
        appBar: CommonAppBar("问答").build(context),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
  }

}