import 'package:flutter_modular/flutter_modular.dart';
import 'package:noticias123/src/article/article_module.dart';
import 'package:noticias123/src/article/ui/view_models/article_viewmodel.dart';
import 'package:noticias123/src/article/ui/widgets/article_screen.dart';
import 'package:noticias123/src/article/ui/widgets/form_screen.dart';
import 'package:noticias123/src/auth/auth_module.dart';
import 'package:noticias123/src/auth/data/repositories/auth_repository.dart';
import 'package:noticias123/src/home/ui/widgets/home_page.dart';
import 'package:noticias123/src/profile/profile_module.dart';
import 'package:noticias123/src/profile/ui/widget/profile_screen.dart';

class HomeModule extends Module {
  @override
  List<Module> get imports => [AuthModule(), ProfileModule(), ArticleModule()];

  @override
  void routes(RouteManager r) {
    r.child(
      '/',
      child: (_) => const HomeScreen(),
      children: [
        ChildRoute(
          '/profile/',
          child: (_) =>
              ProfileScreen(authRepository: Modular.get<AuthRepository>()),
        ),
        ChildRoute('/articles/',
            child: (_) => ArticlesScreen(
                articleViewModel: Modular.get<ArticleViewModel>())),
        ChildRoute('/form/', child: (_) => const FormScreen())
      ],
    );
  }
}
