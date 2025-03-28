import 'package:flutter/material.dart';
import 'package:noticias123/src/article/data/repositories/article_repository.dart';
import 'package:noticias123/src/article/domian/models/article.dart';
import 'package:result_dart/result_dart.dart';

class ArticleViewModel extends ChangeNotifier {
  final ArticleRepository _articleRepository;
  ArticleViewModel(this._articleRepository);
  List<Article> _articles = [];
  List<Article> get articles => _articles;
  bool _success = false;
  String _message = '';
  bool _noData = false;
  bool get noData => _noData;
  String get message => _message;
  bool _error = false;
  bool _loading = false;
  bool get loading => _loading;
  bool get success => _success;
  bool get error => _error;

  Future<void> getArticles() async {
    final result = _articleRepository.getArticles(1, 10);
    result.fold(
      (ar) {
        _articles = ar;
        _noData = _articles.isEmpty;
        notifyListeners();
      },
      (f) {
        _error = true;
        _message = f.toString();
        notifyListeners();
      },
    );
  }

  Future<void> createArticle(Article article) async {
    _loading = true;
    final result = _articleRepository.saveArticle(article);
    result.fold(
      (s) {
        _success = true;
        notifyListeners();
      },
      (f) {
        _error = true;
        _message = f.toString();
        notifyListeners();
      },
    );
    _loading = false;
  }
}
