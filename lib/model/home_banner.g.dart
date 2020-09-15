// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_banner.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomeBanner _$HomeBannerFromJson(Map<String, dynamic> json) {
  return HomeBanner(
    (json['data'] as List)
        ?.map((e) =>
            e == null ? null : BannerInfo.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$HomeBannerToJson(HomeBanner instance) =>
    <String, dynamic>{
      'data': instance.data?.map((e) => e?.toJson())?.toList(),
    };
