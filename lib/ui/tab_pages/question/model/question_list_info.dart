import 'package:json_annotation/json_annotation.dart';
import 'package:playing/ui/tab_pages/question/model/question_info.dart';
part 'question_list_info.g.dart';

@JsonSerializable(explicitToJson: true)
class QuestionListInfo{
  int curPage;
  List<QuestionInfo> datas;
  int offset;
  bool over;
  int pageCount;
  int size;
  int total;

  QuestionListInfo(this.curPage, this.datas, this.offset, this.over,
      this.pageCount, this.size, this.total);

  factory QuestionListInfo.fromJson(Map<String, dynamic> json) => _$QuestionListInfoFromJson(json);

  Map<String, dynamic> toJson() => _$QuestionListInfoToJson(this);
}