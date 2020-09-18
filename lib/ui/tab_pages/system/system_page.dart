import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:playing/base/provider_widget.dart';
import 'package:playing/ui/tab_pages/system/model/group_info.dart';
import 'package:playing/ui/tab_pages/system/system_viewmodel.dart';
import 'package:playing/widget/common_appbar.dart';
import 'package:playing/widget/system_group_widget.dart';
import 'package:toast/toast.dart';

class SystemPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => SystemPageState();
}

class SystemPageState extends State<SystemPage> with AutomaticKeepAliveClientMixin{
  SystemViewModel _systemViewModel;
  List<GroupInfo> _groupList = List();

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      home: Scaffold(
        appBar: CommonAppBar("体系", "sys").build(context),
        body: ProviderWidget<SystemViewModel>(
          model: SystemViewModel(),
          onReady: (model) {
            model.loadSystemInfo();
          },
          builder: (context, model, child) {
            _systemViewModel = model;
            if (model.outlineInfo == null) {
              return Container(
                alignment: Alignment.center,
                child: Text("正在加载···"),
              );
            }
            if (model.outlineInfo.data != null) {
              _groupList.addAll(model.outlineInfo.data);
            }
            return ListView.builder(
              physics: BouncingScrollPhysics(),
              itemCount: _groupList.length,
              itemBuilder: (context, index) {
                return SystemGroupWidget(
                  _groupList[index].name,
                  _groupList[index].children,
                  onTap: (id){
                    Toast.show(id, context);
                  },
                );
              },
            );
          },
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  bool get wantKeepAlive => true;
}
