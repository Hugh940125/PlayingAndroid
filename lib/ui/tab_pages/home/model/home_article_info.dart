import 'package:json_annotation/json_annotation.dart';
part 'home_article_info.g.dart';

@JsonSerializable()
class HomeArticleInfo{
  String apkLink;
  num audit;
  String author;
  bool canEdit;
  num chapterId;
  String chapterName;
  bool collect;
  num courseId;
  String desc;
  String descMd;
  String envelopePic;
  bool fresh;
  num id;
  String link;
  String niceDate;
  String niceShareDate;
  String origin;
  String prefix;
  String projectLink;
  num publishTime;
  num realSuperChapterId;
  num selfVisible;
  num shareDate;
  String shareUser;
  num superChapterId;
  String superChapterName;
  List tags;
  String title;
  num type;
  num userId;
  num visible;
  num zan;

  HomeArticleInfo(
      this.apkLink,
      this.audit,
      this.author,
      this.canEdit,
      this.chapterId,
      this.chapterName,
      this.collect,
      this.courseId,
      this.desc,
      this.descMd,
      this.envelopePic,
      this.fresh,
      this.id,
      this.link,
      this.niceDate,
      this.niceShareDate,
      this.origin,
      this.prefix,
      this.projectLink,
      this.publishTime,
      this.realSuperChapterId,
      this.selfVisible,
      this.shareDate,
      this.shareUser,
      this.superChapterId,
      this.superChapterName,
      this.tags,
      this.title,
      this.type,
      this.userId,
      this.visible,
      this.zan);

  factory HomeArticleInfo.fromJson(Map<String, dynamic> json) => _$HomeArticleInfoFromJson(json);

  Map<String, dynamic> toJson() => _$HomeArticleInfoToJson(this);
}