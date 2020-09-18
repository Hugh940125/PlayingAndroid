import 'package:json_annotation/json_annotation.dart';
part 'group_child_info.g.dart';

@JsonSerializable()
class GroupChildInfo{
  int courseId;
  int id;
  String name;
  int order;
  int parentChapterId;
  bool userControlSetTop;
  int visible;

  GroupChildInfo(this.courseId, this.id, this.name, this.order,
      this.parentChapterId, this.userControlSetTop, this.visible);

  factory GroupChildInfo.fromJson(Map<String, dynamic> json) => _$GroupChildInfoFromJson(json);

  Map<String, dynamic> toJson() => _$GroupChildInfoToJson(this);
}