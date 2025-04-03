import 'dart:io';
import 'package:noticias123/src/article/data/exceptions/exceptions.dart';
import 'package:noticias123/src/article/domian/models/article.dart';
import 'package:result_dart/result_dart.dart';

abstract class ArticleRepository {
  // Busca
  AsyncResult<List<ArticleDone>, ArticleException> getArticles(
      int page, int limit);
  AsyncResult<ArticleDone, ArticleException> getArticleById(String id);
  AsyncResult<List<ArticleDone>, ArticleException> getArticleByAuthorId(
      String id);

  // Filtros
  AsyncResult<List<ArticleDone>, ArticleException> searchArticles(String query);
  AsyncResult<List<ArticleDone>, ArticleException> getArticlesByCategory(
      String category);

  // Persistência
  AsyncResult<Unit, ArticleException> saveArticle(Article article, File image);
  AsyncResult<Unit, ArticleException> deleteArticle(int id);
  AsyncResult<List<Article>, ArticleException> getSavedArticles();

  // Atualizações em Tempo Real
  Stream<List<Article>> observeArticles();
}
