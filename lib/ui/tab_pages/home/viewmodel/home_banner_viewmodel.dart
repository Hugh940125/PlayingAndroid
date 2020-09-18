import 'package:playing/base/base_viewmodel.dart';
import 'package:playing/common/configs.dart';
import 'package:playing/http/http_util.dart';
import 'package:playing/http/urls.dart';
import 'package:playing/ui/tab_pages/home/model/home_banner.dart';

class HomeBannerViewModel extends BaseViewModel{

  HomeBanner homeBanner;

  loadHomeBanner(){
    HttpUtil().get(Configs.baseUrl+Urls.homeBanner,
    onSuccess: (data){
      homeBanner = HomeBanner.fromJson(data);
      notifyListeners();
    },
    onRefreshToken: (){
      loadHomeBanner();
    },
    onError: (msg){
      print(msg);
    });
  }
}