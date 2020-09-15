import 'package:playing/base/base_viewmodel.dart';
import 'package:playing/configs.dart';
import 'package:playing/http/http_util.dart';
import 'package:playing/http/urls.dart';
import 'package:playing/model/home_article.dart';

class HomeArticleViewModel extends BaseViewModel{

  HomeArticle homeArticle;

  loadHomeArticle(int pageIndex){
      HttpUtil().get(Configs.baseUrl+Urls.getHomeArticles(pageIndex), (data) {
        print(data.toString());
        Map<String, dynamic> mmap = data["data"];
        homeArticle = HomeArticle.fromJson(mmap);
        notifyListeners();
      }, () {
        loadHomeArticle(pageIndex);
      }, (msg) {
        print(msg);
      });
  }
}