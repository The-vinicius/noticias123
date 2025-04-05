import 'package:flutter_modular/flutter_modular.dart';
import 'package:noticias123/src/article/data/repositories/article_repository.dart';
import 'package:noticias123/src/article/data/repositories/article_repository_remote.dart';
import 'package:noticias123/src/article/data/services/local_data_source.dart';
import 'package:noticias123/src/article/data/services/remote_data_source.dart';
import 'package:noticias123/src/article/data/services/storage_service.dart';
import 'package:noticias123/src/article/ui/view_models/article_viewmodel.dart';
import 'package:noticias123/src/article/ui/view_models/post_article_viewmodel.dart';
import 'package:noticias123/src/article/ui/widgets/article_detail_screen.dart';
import 'package:noticias123/src/article/ui/widgets/article_screen.dart';
import 'package:noticias123/src/article/ui/widgets/form_screen.dart';

class ArticleModule extends Module {
  @override
  void binds(Injector i) {
    i.addSingleton(LocalDataSource.new);
    i.addSingleton(RemoteDataSource.new);
    i.addSingleton(StorageService.new);
    i.addSingleton<ArticleRepository>(ArticleRepositoryRemote.new);
    i.addSingleton(ArticleViewModel.new);
    i.addSingleton(PostArticleViewmodel.new);
  }

  @override
  void routes(RouteManager r) {
    r.child(
      '/',
      child: (_) => ArticlesScreen(
        articleViewModel: Modular.get<ArticleViewModel>(),
      ),
    );
    r.child('/detail', child: (_) => const ArticleDetailPage());
    r.child('/form', child: (_) => const FormScreen());
  }
}
