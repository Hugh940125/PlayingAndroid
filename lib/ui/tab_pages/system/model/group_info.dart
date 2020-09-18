import 'package:json_annotation/json_annotation.dart';
import 'group_child_info.dart';
part 'group_info.g.dart';

@JsonSerializable(explicitToJson: true)
class GroupInfo{
  int courseId;
  int id;
  String name;
  int parentChapterId;
  bool userControlSetTop;
  int visible;
  List<GroupChildInfo> children;

  GroupInfo(this.children, this.courseId, this.id, this.name,this.parentChapterId,
      this.userControlSetTop, this.visible);

  factory GroupInfo.fromJson(Map<String, dynamic> json) => _$GroupInfoFromJson(json);

  Map<String, dynamic> toJson() => _$GroupInfoToJson(this);
}