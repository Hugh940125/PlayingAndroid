import 'package:dio/dio.dart';
import 'package:playing/base/base_viewmodel.dart';
import 'package:playing/common/configs.dart';
import 'package:playing/http/http_util.dart';
import 'package:playing/http/urls.dart';
import 'package:playing/ui/tab_pages/question/model/question_list_info.dart';

class QuestionViewModel extends BaseViewModel{
  QuestionListInfo questionListInfo;

  loadQAList(int pageIndex,{VoidCallback onStart,VoidCallback onFinish}){
    HttpUtil().get(Configs.baseUrl+Urls.getQAList(pageIndex),
    onFinish: onFinish?.call(),
    onStart: onStart?.call(),
    onSuccess: (data){
      Map<String, dynamic> map = data["data"];
      questionListInfo = QuestionListInfo.fromJson(map);
      notifyListeners();
    },
    onError: (msg){
      print(msg);
    },
    onRefreshToken: (){
      loadQAList(pageIndex,onStart: onStart,onFinish: onFinish);
    });
  }
}