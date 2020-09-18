import 'package:json_annotation/json_annotation.dart';
part 'question_tag.g.dart';

@JsonSerializable()
class QuestionTag{
  String name;
  String url;

  QuestionTag(this.name, this.url);

  factory QuestionTag.fromJson(Map<String, dynamic> json) => _$QuestionTagFromJson(json);

  Map<String, dynamic> toJson() => _$QuestionTagToJson(this);
}