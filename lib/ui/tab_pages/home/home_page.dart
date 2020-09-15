import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:playing/base/provider_widget.dart';
import 'package:playing/ui/tab_pages/home/home_article_viewmodel.dart';
import 'package:playing/ui/tab_pages/home/home_banner_viewmodel.dart';
import 'package:playing/widget/article_item_widget.dart';
import 'package:playing/widget/common_appbar.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      home: Scaffold(
        appBar: CommonAppBar("首页").build(context),
        body: ListView(
          children: <Widget>[
            Column(
              children: [
                Container(
                  height: 180,
                  child: ProviderWidget<HomeBannerViewModel>(
                    model: HomeBannerViewModel(),
                    onReady: (model) {
                      model.loadHomeBanner();
                    },
                    builder: (context, model, child) {
                      if (model.homeBanner == null) {
                        return Container(
                          alignment: Alignment.center,
                          child: Text("正在加载···"),
                        );
                      } else {
                        return Container(
                          child: Swiper(
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
                                        model.homeBanner
                                            .data[config.activeIndex].title,
                                        style: TextStyle(
                                            fontSize: 15.0, color: Colors.grey),
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 1,
                                        textAlign: TextAlign.end,
                                      ),
                                      constraints:
                                          BoxConstraints(maxWidth: 300),
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
                          ),
                        );
                      }
                    },
                  ),
                ),
                Expanded(
                  child: ProviderWidget<HomeArticleViewModel>(
                    model: HomeArticleViewModel(),
                    onReady: (model) {
                      model.loadHomeArticle(1);
                    },
                    builder: (context, model, child) {
                      if (model.homeArticle == null) {
                        return Container(
                          alignment: Alignment.center,
                          child: Text("正在加载···"),
                        );
                      }
                      return Container(
                        height: double.infinity,
                        child: ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: model.homeArticle.datas == null
                              ? 0
                              : model.homeArticle.datas.length,
                          itemBuilder: (context, index) {
                            return ArticleItem(
                              model.homeArticle.datas[index].fresh,
                              model.homeArticle.datas[index].author,
                              model.homeArticle.datas[index].publishTime,
                              model.homeArticle.datas[index].title,
                              model.homeArticle.datas[index].superChapterName,
                              onTap: () => {print(index)},
                            );
                          },
                        ),
                      );
                    },
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
  }
}
