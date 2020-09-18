import 'package:json_annotation/json_annotation.dart';
import 'package:playing/ui/tab_pages/question/model/question_tag.dart';
part 'question_info.g.dart';

@JsonSerializable(explicitToJson: true)
class QuestionInfo{
  String apkLink;
  int audit;
  String author;
  bool canEdit;
  int chapterId;
  String chapterName;
  bool collect;
  int courseId;
  String desc;
  String descMd;
  String envelopePic;
  bool fresh;
  int id;
  String link;
  String niceDate;
  String niceShareDate;
  String origin;
  String prefix;
  String projectLink;
  num publishTime;
  int realSuperChapterId;
  int selfVisible;
  num shareDate;
  String shareUser;
  int superChapterId;
  String superChapterName;
  List<QuestionTag> tags;
  String title;
  int type;
  int userId;
  int visible;
  int zan;

  QuestionInfo(
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


  factory QuestionInfo.fromJson(Map<String, dynamic> json) => _$QuestionInfoFromJson(json);

  Map<String, dynamic> toJson() => _$QuestionInfoToJson(this);
}