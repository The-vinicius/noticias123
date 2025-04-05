import 'dart:io';

import 'package:flutter/material.dart';
import 'package:noticias123/src/article/data/repositories/article_repository.dart';
import 'package:noticias123/src/article/domian/models/article.dart';
import 'package:result_dart/result_dart.dart';

class ArticleViewModel extends ChangeNotifier {
  final ArticleRepository _articleRepository;
  ArticleViewModel(this._articleRepository);

  List<ArticleDone> _articles = [];
  List<ArticleDone> get articles => _articles;
  String _message = '';
  bool _noData = false;
  bool get noData => _noData;
  String get message => _message;
  bool _error = false;
  bool _loading = false;
  bool get loading => _loading;
  bool get error => _error;

  Future<void> getArticles() async {
    _loading = true;
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
    _loading = false;
  }

  Future<void> deleteArticle(int id) async {
    final result = await _articleRepository.deleteArticle(id);
    result.fold((s) {
      articles.removeWhere((article) => article.id == id);
      notifyListeners();
    }, (f) {
      _message = f.toString();
      notifyListeners();
    });
  }
}
