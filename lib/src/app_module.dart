import 'package:flutter_modular/flutter_modular.dart';
import 'package:noticias123/src/article/article_module.dart';
import 'package:noticias123/src/auth/auth_module.dart';
import 'package:noticias123/src/core/ui/splash_screen.dart';
import 'package:noticias123/src/home/home_module.dart';
import 'package:noticias123/src/profile/profile_module.dart';

class AppModule extends Module {
  @override
  List<Module> get imports => [
        AuthModule(),
        HomeModule(),
        ArticleModule(),
        ProfileModule(),
      ];

  @override
  void routes(RouteManager r) {
    r.child('/', child: (_) => const SplashScreen());
    r.module('/auth', module: AuthModule());
    r.module('/article', module: ArticleModule());
    r.module('/home', module: HomeModule());
    // r.module('/profile', module: ProfileModule());
  }
}
