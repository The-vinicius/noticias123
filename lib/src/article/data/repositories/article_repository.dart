import 'package:noticias123/src/article/data/exceptions/exceptions.dart';
import 'package:noticias123/src/article/domian/models/article.dart';
import 'package:result_dart/result_dart.dart';

abstract class ArticleRepository {
  // Busca
  AsyncResult<List<Article>, ArticleException> getArticles(int page, int limit);
  AsyncResult<Article, ArticleException> getArticleById(String id);

  // Filtros
  AsyncResult<List<Article>, ArticleException> searchArticles(String query);
  AsyncResult<List<Article>, ArticleException> getArticlesByCategory(
      String category);

  // Persistência
  AsyncResult<Unit, ArticleException> saveArticle(Article article);
  AsyncResult<Unit, ArticleException> deleteArticle(String id);
  AsyncResult<List<Article>, ArticleException> getSavedArticles();

  // Atualizações em Tempo Real
  Stream<List<Article>> observeArticles();
}
