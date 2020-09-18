import 'package:flutter/cupertino.dart';
import 'package:playing/ui/tab_pages/system/model/group_child_info.dart';

class GroupItemWidget extends StatelessWidget{
  final List<GroupChildInfo> childList;

  GroupItemWidget(this.childList);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: tagViews,
      alignment: WrapAlignment.start,
      crossAxisAlignment: WrapCrossAlignment.center,
    )),
  }

}