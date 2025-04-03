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
      $type: json['runtimeType'] as String?,
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
      'runtimeType': instance.$type,
    };

_$ArticleDoneImpl _$$ArticleDoneImplFromJson(Map<String, dynamic> json) =>
    _$ArticleDoneImpl(
      id: (json['id'] as num).toInt(),
      title: json['title'] as String,
      content: json['content'] as String,
      authorId: json['authorId'] as String,
      thumbnailUrl: json['thumbnailUrl'] as String,
      publishedAt: DateTime.parse(json['publishedAt'] as String),
      category: json['category'] as String,
      status: json['status'] as String,
      views: (json['views'] as num).toInt(),
      likes: (json['likes'] as num).toInt(),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$ArticleDoneImplToJson(_$ArticleDoneImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'content': instance.content,
      'authorId': instance.authorId,
      'thumbnailUrl': instance.thumbnailUrl,
      'publishedAt': instance.publishedAt.toIso8601String(),
      'category': instance.category,
      'status': instance.status,
      'views': instance.views,
      'likes': instance.likes,
      'runtimeType': instance.$type,
    };
