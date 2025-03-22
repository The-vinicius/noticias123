import 'package:noticias123/src/article/domian/models/article.dart';
import 'package:noticias123/src/article/data/services/constants.dart';

class LocalDataSource {
  List<Article> getArticles() {
    return articles;
  }

  Future<void> saveArticle(Article article) async {
    articles.add(article);
  }
}
