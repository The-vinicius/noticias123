import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'article.freezed.dart';
part 'article.g.dart';

@freezed
class Article with _$Article {
  const factory Article({
    required String title,
    required String content,
    required String authorId, // Referência ao usuário
    required String thumbnailUrl,
    required DateTime publishedAt,
    required String category,
    required String status,
    required int views,
    required int likes,
  }) = _Article;

  const factory Article.done({
    required int id,
    required String title,
    required String content,
    required String authorId, // Referência ao usuário
    required String thumbnailUrl,
    required DateTime publishedAt,
    required String category,
    required String status,
    required int views,
    required int likes,
  }) = ArticleDone;

  factory Article.fromJson(Map<String, dynamic> json) =>
      _$ArticleFromJson(json);
}
