import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:playing/ui/tab_pages/system/model/group_child_info.dart';

class SystemGroupWidget extends StatelessWidget {
  final String groupTitle;
  final List<GroupChildInfo> childList;

  @required
  final Function(String id) onTap;

  SystemGroupWidget(
    this.groupTitle,
    this.childList, {
    this.onTap,
  });

  BoxDecoration textBoxDecoration() {
    return BoxDecoration(
        border: Border.all(
          width: 1,
          color: Colors.blue,
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(4),
        ));
  }

  @override
  Widget build(BuildContext context) {
    List<InkWell> tagViews = List();
    for (GroupChildInfo child in childList) {
      InkWell inkWell = InkWell(
        child: Container(
          decoration: textBoxDecoration(),
          child: Text(
            child.name,
            style: TextStyle(fontSize: 12, color: Colors.blue),
            textAlign: TextAlign.center,
          ),
          margin: EdgeInsets.fromLTRB(0, 0, 6, 6),
          padding: EdgeInsets.all(5),
        ),
        //onTap: onTap("点击"),
      );
      tagViews.add(inkWell);
    }
    return Container(
      color: Colors.white,
      padding: EdgeInsets.fromLTRB(12, 6, 12, 6),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            groupTitle,
            style: TextStyle(color: Colors.grey, fontSize: 15),
          ),
          Container(
              margin: EdgeInsets.fromLTRB(0, 5, 0, 0),
              width: double.infinity,
              child: Wrap(
                children: tagViews,
                alignment: WrapAlignment.start,
                crossAxisAlignment: WrapCrossAlignment.center,
              )),
        ],
      ),
    );
  }
}
