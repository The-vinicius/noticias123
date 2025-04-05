import 'dart:io';

import 'package:flutter/widgets.dart';
import 'package:noticias123/src/article/data/repositories/article_repository.dart';
import 'package:noticias123/src/article/domian/models/article.dart';

class PostArticleViewmodel extends ChangeNotifier {
  PostArticleViewmodel(this._articleRepository);
  final ArticleRepository _articleRepository;
  bool _loading = false;
  bool _success = false;
  String _message = '';
  bool _error = false;

  bool get loading => _loading;
  bool get success => _success;
  bool get error => _error;
  String get message => _message;

  Future<void> createArticle(Article article, File image) async {
    _loading = true;
    notifyListeners();
    final result = await _articleRepository.saveArticle(article, image);
    result.fold(
      (s) {
        _success = true;
      },
      (f) {
        _error = true;
        _message = f.toString();
      },
    );
    _loading = false;
    notifyListeners();
  }
}
