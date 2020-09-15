import 'package:json_annotation/json_annotation.dart';
import 'package:playing/model/banner_info.dart';

part 'home_banner.g.dart';

@JsonSerializable(explicitToJson: true)
class HomeBanner {
  List<BannerInfo> data;

  HomeBanner(this.data);

  factory HomeBanner.fromJson(Map<String, dynamic> json) => _$HomeBannerFromJson(json);

  Map<String, dynamic> toJson() => _$HomeBannerToJson(this);
}