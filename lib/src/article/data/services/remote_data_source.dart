import 'package:noticias123/src/app_config.dart';
import 'package:noticias123/src/article/domian/models/article.dart';

class RemoteDataSource {
  Future<void> createArticle(Article article) async {
    await supabase.from('articles').insert(article);
  }

  Future<List<Article>> getArticles(int page, int limit) async {
    final response =
        await supabase.from('articles').select().range(page, limit);
    return response.map((e) => Article.fromJson(e)).toList();
  }
}
