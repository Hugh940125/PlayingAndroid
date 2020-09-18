import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:playing/base/provider_widget.dart';
import 'package:playing/common/local_colors.dart';
import 'package:playing/common/routes/app_routes.dart';
import 'package:playing/common/routes/webview_args.dart';
import 'package:playing/ui/tab_pages/home/model/home_article_info.dart';
import 'package:playing/ui/tab_pages/home/viewmodel/home_article_viewmodel.dart';
import 'package:playing/ui/tab_pages/home/viewmodel/home_banner_viewmodel.dart';
import 'package:playing/widget/article_item_widget.dart';
import 'package:playing/widget/common_appbar.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => HomePageState();
}

class HomePageState extends State<HomePage> with AutomaticKeepAliveClientMixin {
  ScrollController _scrollController;
  List<HomeArticleInfo> _articleList = List();
  HomeArticleViewModel _homeArticleViewModel;
  HomeBannerViewModel _homeBannerViewModel;
  RefreshController _refreshController;
  int pageIndex = 0;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      backgroundColor: LocalColors.allBackGround,
      appBar: CommonAppBar("首页", "home",canBack: false).build(context),
      body: SmartRefresher(
        enablePullDown: true,
        enablePullUp: true,
        onRefresh: () async {
          _articleList.clear();
          return _homeArticleViewModel?.loadHomeArticle(0, onFinish: () {
            _refreshController.refreshCompleted();
          });
        },
        onLoading: () async {
          pageIndex++;
          if(pageIndex<=_homeArticleViewModel.homeArticle.pageCount){
            _homeArticleViewModel?.loadHomeArticle(pageIndex, onFinish: () {
              _refreshController.loadComplete();
            });
          }else{
            _refreshController.loadComplete();
          }
        },
        controller: _refreshController,
        header: ClassicHeader(),
        footer: ClassicFooter(),
        child: SingleChildScrollView(
          controller: _scrollController,
          child: Column(
            children: [
              Container(
                height: 180,
                child: ProviderWidget<HomeBannerViewModel>(
                  model: HomeBannerViewModel(),
                  onReady: (model) {
                    model.loadHomeBanner();
                  },
                  builder: (context, model, child) {
                    _homeBannerViewModel = model;
                    if (model.homeBanner == null) {
                      return Container(
                        alignment: Alignment.center,
                        child: Text(""),
                      );
                    } else {
                      return Swiper(
                        itemCount: model.homeBanner.data.length,
                        autoplay: true,
                        duration: 800,
                        autoplayDelay: 3000,
                        scrollDirection: Axis.horizontal,
                        autoplayDisableOnInteraction: true,
                        pagination: SwiperPagination(builder:
                            SwiperCustomPagination(builder:
                                (BuildContext context,
                                    SwiperPluginConfig config) {
                          return Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Container(
                                  child: Text(
                                    model.homeBanner.data[config.activeIndex]
                                        .title,
                                    style: TextStyle(
                                        fontSize: 15.0, color: Colors.grey),
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                    textAlign: TextAlign.end,
                                  ),
                                  constraints: BoxConstraints(maxWidth: 300),
                                  margin: EdgeInsets.fromLTRB(0, 0, 10, 0),
                                ),
                                Text(
                                  "${config.activeIndex + 1}/${config.itemCount}",
                                  style: TextStyle(
                                      fontSize: 15.0, color: Colors.grey),
                                ),
                              ]);
                        })),
                        itemBuilder: (BuildContext context, int index) {
                          return Image.network(
                            model.homeBanner.data[index].imagePath,
                            fit: BoxFit.fill,
                          );
                        },
                      );
                    }
                  },
                ),
              ),
              ProviderWidget<HomeArticleViewModel>(
                model: HomeArticleViewModel(),
                onReady: (model) {
                  model.loadHomeArticle(pageIndex);
                },
                builder: (context, model, child) {
                  _homeArticleViewModel = model;
                  if (model.homeArticle == null) {
                    return Container(
                      alignment: Alignment.center,
                      child: Text("正在加载···"),
                    );
                  }
                  if (model.homeArticle.datas != null) {
                    _articleList.addAll(model.homeArticle.datas);
                  }
                  return ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: _articleList.length,
                    itemBuilder: (context, index) {
                      return ArticleItem(
                        _articleList[index].fresh,
                        _articleList[index].author,
                        _articleList[index].publishTime,
                        _articleList[index].title,
                        _articleList[index].superChapterName,
                        onTap: () => {
                          Navigator.pushNamed(context,
                              AppRouter.webviewPage,
                          arguments: WebviewArgs(
                            _articleList[index].link,
                            "详情",
                          ))
                        },
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _refreshController = RefreshController(initialRefresh: false);
    _scrollController = ScrollController();
  }

  @override
  bool get wantKeepAlive => true;

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
    _refreshController.dispose();
  }
}
