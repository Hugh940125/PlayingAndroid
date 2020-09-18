import 'package:dio/dio.dart';
import 'package:playing/base/base_viewmodel.dart';
import 'package:playing/common/configs.dart';
import 'package:playing/http/http_util.dart';
import 'package:playing/http/urls.dart';
import 'package:playing/ui/tab_pages/system/model/outline_info.dart';

class SystemViewModel extends BaseViewModel {
  OutlineInfo outlineInfo;

  loadSystemInfo({VoidCallback onStart, VoidCallback onFinish}) {
    HttpUtil().get(Configs.baseUrl + Urls.systemTree, onSuccess: (data) {
      outlineInfo = OutlineInfo.fromJson(data);
    }, onRefreshToken: () {
      loadSystemInfo(onStart: onStart, onFinish: onFinish);
    }, onError: (msg) {
      print(msg);
    }, onStart: () {
      onStart?.call();
    }, onFinish: () {
      onFinish?.call();
    });
  }
}
