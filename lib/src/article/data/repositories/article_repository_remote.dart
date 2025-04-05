import 'dart:io';

import 'package:noticias123/src/article/data/exceptions/exceptions.dart';
import 'package:noticias123/src/article/data/repositories/article_repository.dart';
import 'package:noticias123/src/article/data/services/local_data_source.dart';
import 'package:noticias123/src/article/data/services/remote_data_source.dart';
import 'package:noticias123/src/article/data/services/storage_service.dart';
import 'package:noticias123/src/article/domian/models/article.dart';
import 'package:result_dart/result_dart.dart';
import 'package:result_dart/src/async_result.dart';
import 'package:result_dart/src/unit.dart';

class ArticleRepositoryRemote implements ArticleRepository {
  final RemoteDataSource _remoteDataSource;
  final LocalDataSource _localDataSource;
  final StorageService _storageService;

  ArticleRepositoryRemote(
      this._remoteDataSource, this._localDataSource, this._storageService);

  @override
  AsyncResult<Unit, ArticleException> deleteArticle(int id) async {
    try {
      await _remoteDataSource.deleteArticle(id);
      return const Success(unit);
    } catch (e) {
      return Failure(ArticleException(e.toString()));
    }
  }

  @override
  AsyncResult<List<ArticleDone>, ArticleException> getArticleByAuthorId(
      String id) async {
    try {
      final articles = await _remoteDataSource.getArticleByAuthorId(id);
      return Success(articles);
    } catch (e) {
      return Failure(ArticleException(e.toString()));
    }
  }

  @override
  AsyncResult<List<ArticleDone>, ArticleException> getArticles(
      int page, int limit) async {
    try {
      final articles = await _remoteDataSource.getArticles(1, 10);
      return Success(articles);
    } catch (e) {
      return Failure(ArticleException(e.toString()));
    }
  }

  @override
  AsyncResult<List<ArticleDone>, ArticleException> getArticlesByCategory(
      String category) async {
    try {
      final articles = await _remoteDataSource.getArticlesByCategory(category);
      return Success(articles);
    } catch (e) {
      return Failure(ArticleException(e.toString()));
    }
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
  AsyncResult<Unit, ArticleException> saveArticle(
      Article article, File image) async {
    final urlResult = await _storageService.uploadFile(image, 'thumbnail');
    if (urlResult.isError()) {
      return Failure(ArticleException('Error uploading image'));
    }
    try {
      final newArticle = article.copyWith(thumbnailUrl: urlResult.getOrThrow());
      await _localDataSource.saveArticle(newArticle);
      return const Success(unit);
    } catch (e) {
      return Failure(ArticleException(e.toString()));
    }
  }

  @override
  AsyncResult<List<ArticleDone>, ArticleException> searchArticles(
      String query) async {
    try {
      final articles = await _remoteDataSource.searchArticles(query);
      return Success(articles);
    } catch (e) {
      return Failure(ArticleException(e.toString()));
    }
  }

  @override
  AsyncResult<ArticleDone, ArticleException> getArticleById(String id) async {
    try {
      final article = await _remoteDataSource.getArticleById(id);
      return Success(article);
    } catch (e) {
      return Failure(ArticleException(e.toString()));
    }
  }
}
