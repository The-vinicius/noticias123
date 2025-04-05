import 'package:noticias123/src/app_config.dart';
import 'package:noticias123/src/article/domian/models/article.dart';

class RemoteDataSource {
  Future<void> createArticle(Article article) async {
    await supabase.from('articles').insert(article);
  }

  Future<List<ArticleDone>> getArticles(int page, int limit) async {
    final response = await supabase.from('articles').select();
    return response.map((e) => ArticleDone.fromJson(e)).toList();
  }

  Future<void> deleteArticle(int id) async {
    await supabase.from('articles').delete().eq('id', id);
  }

  Future<void> updateArticle(Article article) async {
    await supabase.from('articles').update(article.toJson());
  }

  Future<List<ArticleDone>> getArticlesByCategory(String category) async {
    final response =
        await supabase.from('articles').select().eq('category', category);
    return response.map((e) => ArticleDone.fromJson(e)).toList();
  }

  Future<List<ArticleDone>> searchArticles(String query) async {
    final response =
        await supabase.from('articles').select().ilike('title', '%$query%');
    return response.map((e) => ArticleDone.fromJson(e)).toList();
  }

  Future<List<ArticleDone>> getArticleByAuthorId(String id) async {
    final response =
        await supabase.from('articles').select().eq('authorId', id);
    return response.map((e) => ArticleDone.fromJson(e)).toList();
  }

  Future<ArticleDone> getArticleById(String id) async {
    throw '';
  }
}
