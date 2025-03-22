// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'article.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ArticleImpl _$$ArticleImplFromJson(Map<String, dynamic> json) =>
    _$ArticleImpl(
      title: json['title'] as String,
      content: json['content'] as String,
      authorId: json['authorId'] as String,
      thumbnailUrl: json['thumbnailUrl'] as String,
      publishedAt: DateTime.parse(json['publishedAt'] as String),
      category: json['category'] as String,
      status: json['status'] as String,
      views: (json['views'] as num).toInt(),
      likes: (json['likes'] as num).toInt(),
    );

Map<String, dynamic> _$$ArticleImplToJson(_$ArticleImpl instance) =>
    <String, dynamic>{
      'title': instance.title,
      'content': instance.content,
      'authorId': instance.authorId,
      'thumbnailUrl': instance.thumbnailUrl,
      'publishedAt': instance.publishedAt.toIso8601String(),
      'category': instance.category,
      'status': instance.status,
      'views': instance.views,
      'likes': instance.likes,
    };
