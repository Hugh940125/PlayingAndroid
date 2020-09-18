import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:playing/base/provider_widget.dart';
import 'package:playing/common/local_colors.dart';
import 'package:playing/common/routes/app_routes.dart';
import 'package:playing/common/routes/webview_args.dart';
import 'package:playing/ui/tab_pages/question/question_viewmodel.dart';
import 'package:playing/widget/common_appbar.dart';
import 'package:playing/widget/question_item_widget.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:playing/ui/tab_pages/question/model/question_info.dart';

class QuestionPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => QuestionPageState();
}

class QuestionPageState extends State<QuestionPage>
    with AutomaticKeepAliveClientMixin {
  RefreshController _refreshController;
  List<QuestionInfo> _questionList = List();
  QuestionViewModel _questionViewModel;
  int pageIndex = 0;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      backgroundColor: LocalColors.allBackGround,
      appBar: CommonAppBar("问答","q&a").build(context),
      body: ProviderWidget<QuestionViewModel>(
          model: QuestionViewModel(),
          onReady: (model) {
            model.loadQAList(pageIndex);
          },
          builder: (context, model, child) {
            _questionViewModel = model;
            if (model.questionListInfo == null) {
              return Container(
                alignment: Alignment.center,
                child: Text("正在加载···"),
              );
            }
            if(model.questionListInfo.datas != null){
              _questionList.addAll(model.questionListInfo.datas);
            }
            return SmartRefresher(
              controller: _refreshController,
              header: ClassicHeader(),
              footer: ClassicFooter(),
              enablePullUp: true,
              enablePullDown: true,
              onLoading: () async {
                pageIndex++;
                if (pageIndex <=
                    _questionViewModel.questionListInfo.pageCount) {
                  _questionViewModel?.loadQAList(pageIndex, onFinish: () {
                    _refreshController.loadComplete();
                  });
                } else {
                  _refreshController.loadComplete();
                }
              },
              onRefresh: () async {
                _questionList.clear();
                return _questionViewModel?.loadQAList(0, onFinish: () {
                  _refreshController.refreshCompleted();
                });
              },
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: _questionList.length,
                itemBuilder: (context, index) {
                  return QuestionItem(
                    _questionList[index].author,
                    _questionList[index].publishTime,
                    _questionList[index].title,
                    _questionList[index].superChapterName,
                    _questionList[index].desc,
                    _questionList[index].tags,
                    onTap: () => {
                      Navigator.pushNamed(context,
                          AppRouter.webviewPage,
                          arguments: WebviewArgs(
                            _questionList[index].link,
                            "详情",
                          ))
                    },
                  );
                },
              ),
            );
          }),
    );
  }

  @override
  void initState() {
    super.initState();
    _refreshController = RefreshController();
  }

  @override
  void dispose() {
    super.dispose();
    _refreshController.dispose();
  }

  @override
  bool get wantKeepAlive => true;
}
