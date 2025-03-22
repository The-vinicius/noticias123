import 'package:noticias123/src/article/data/exceptions/exceptions.dart';
import 'package:noticias123/src/article/data/repositories/article_repository.dart';
import 'package:noticias123/src/article/data/services/local_data_source.dart';
import 'package:noticias123/src/article/data/services/remote_data_source.dart';
import 'package:noticias123/src/article/domian/models/article.dart';
import 'package:result_dart/result_dart.dart';
import 'package:result_dart/src/async_result.dart';
import 'package:result_dart/src/unit.dart';

class ArticleRepositoryRemote implements ArticleRepository {
  final RemoteDataSource _remoteDataSource;
  final LocalDataSource _localDataSource;

  ArticleRepositoryRemote(this._remoteDataSource, this._localDataSource);

  @override
  AsyncResult<Unit, ArticleException> deleteArticle(String id) {
    // TODO: implement deleteArticle
    throw UnimplementedError();
  }

  @override
  AsyncResult<Article, ArticleException> getArticleById(String id) {
    // TODO: implement getArticleById
    throw UnimplementedError();
  }

  @override
  AsyncResult<List<Article>, ArticleException> getArticles(
      int page, int limit) async {
    try {
      final articles = _localDataSource.getArticles();
      return Success(articles);
    } catch (e) {
      return Failure(ArticleException(e.toString()));
    }
  }

  @override
  AsyncResult<List<Article>, ArticleException> getArticlesByCategory(
      String category) {
    // TODO: implement getArticlesByCategory
    throw UnimplementedError();
  }

  @override
  AsyncResult<List<Article>, ArticleException> getSavedArticles() {
    // TODO: implement getSavedArticles
    throw UnimplementedError();
  }

  @override
  Stream<List<Article>> observeArticles() {
    // TODO: implement observeArticles
    throw UnimplementedError();
  }

  @override
  AsyncResult<Unit, ArticleException> saveArticle(Article article) async {
    try {
      await _localDataSource.saveArticle(article);
      return const Success(unit);
    } catch (e) {
      return Failure(ArticleException(e.toString()));
    }
  }

  @override
  AsyncResult<List<Article>, ArticleException> searchArticles(String query) {
    // TODO: implement searchArticles
    throw UnimplementedError();
  }
}
