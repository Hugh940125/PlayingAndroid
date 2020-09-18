import 'package:json_annotation/json_annotation.dart';
import 'home_article_info.dart';
part 'home_article.g.dart';

@JsonSerializable(explicitToJson: true)
class HomeArticle{
  int curPage;
  List<HomeArticleInfo> datas;
  int pageCount;
  int total;

  HomeArticle(this.curPage, this.datas);

  factory HomeArticle.fromJson(Map<String, dynamic> json) => _$HomeArticleFromJson(json);

  Map<String, dynamic> toJson() => _$HomeArticleToJson(this);
}