import 'package:playing/base/base_viewmodel.dart';
import 'package:playing/configs.dart';
import 'package:playing/http/http_util.dart';
import 'package:playing/http/urls.dart';
import 'package:playing/model/home_banner.dart';

class HomeBannerViewModel extends BaseViewModel{

  HomeBanner homeBanner;

  loadHomeBanner(){
    HttpUtil().get(Configs.baseUrl+Urls.homeBanner, (data) {
      homeBanner = HomeBanner.fromJson(data);
      notifyListeners();
    }, () {
      loadHomeBanner();
    }, (msg) {
      print(msg);
    });
  }
}