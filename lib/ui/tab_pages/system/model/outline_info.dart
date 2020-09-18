import 'package:json_annotation/json_annotation.dart';
import 'group_info.dart';
part 'outline_info.g.dart';

@JsonSerializable(explicitToJson: true)
class OutlineInfo{
  List<GroupInfo> data;
  int errorCode;
  String errorMsg;

  OutlineInfo(this.data, this.errorCode, this.errorMsg);

  factory OutlineInfo.fromJson(Map<String, dynamic> json) => _$OutlineInfoFromJson(json);

  Map<String, dynamic> toJson() => _$OutlineInfoToJson(this);
}