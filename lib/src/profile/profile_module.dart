import 'package:flutter_modular/flutter_modular.dart';
import 'package:noticias123/src/article/article_module.dart';
import 'package:noticias123/src/article/ui/view_models/article_viewmodel.dart';
import 'package:noticias123/src/auth/auth_module.dart';
import 'package:noticias123/src/auth/data/repositories/auth_repository.dart';
import 'package:noticias123/src/profile/ui/widget/profile_screen.dart';

class ProfileModule extends Module {
  @override
  List<Module> get imports => [AuthModule(), ArticleModule()];

  @override
  void routes(RouteManager r) {
    r.child('/',
        child: (_) => ProfileScreen(
              authRepository: Modular.get<AuthRepository>(),
              articleViewModel: Modular.get<ArticleViewModel>(),
            ));
  }
}
