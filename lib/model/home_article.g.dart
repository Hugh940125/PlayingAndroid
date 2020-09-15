// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_article.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomeArticle _$HomeArticleFromJson(Map<String, dynamic> json) {
  return HomeArticle(
    json['curPage'] as int,
    (json['datas'] as List)
        ?.map((e) => e == null
            ? null
            : HomeArticleInfo.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$HomeArticleToJson(HomeArticle instance) =>
    <String, dynamic>{
      'curPage': instance.curPage,
      'datas': instance.datas?.map((e) => e?.toJson())?.toList(),
    };
