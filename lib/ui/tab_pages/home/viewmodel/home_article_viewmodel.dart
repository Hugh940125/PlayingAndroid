import 'package:dio/dio.dart';
import 'package:playing/base/base_viewmodel.dart';
import 'package:playing/common/configs.dart';
import 'package:playing/http/http_util.dart';
import 'package:playing/http/urls.dart';
import 'package:playing/ui/tab_pages/home/model/home_article.dart';

class HomeArticleViewModel extends BaseViewModel{

  HomeArticle homeArticle;

  loadHomeArticle(int pageIndex,{VoidCallback onStart,VoidCallback onFinish}){
      HttpUtil().get(Configs.baseUrl+Urls.getHomeArticles(pageIndex),
      onSuccess: (data){
        Map<String, dynamic> map = data["data"];
        homeArticle = HomeArticle.fromJson(map);
        notifyListeners();
      },
      onRefreshToken: (){
        loadHomeArticle(pageIndex,onStart: onStart,onFinish: onFinish);
      },
      onError: (msg){
        print(msg);
      },
      onStart: (){
        onStart?.call();
      },
      onFinish: (){
        onFinish?.call();
      });
  }
}