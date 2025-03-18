import 'package:flutter_modular/flutter_modular.dart';
import 'package:noticias123/src/auth/data/repositories/auth_repository.dart';
import 'package:noticias123/src/auth/data/repositories/auth_repository_remote.dart';
import 'package:noticias123/src/auth/ui/auth_page.dart';
import 'package:noticias123/src/auth/ui/viewmodels/login_viewmodel.dart';
import 'package:noticias123/src/auth/data/services/supabe_user.dart';

class AuthModule extends Module {
  @override
  void exportedBinds(Injector i) {
    super.exportedBinds(i);
    i.addSingleton(LoginViewmodel.new);
    i.add<AuthRepository>(AuthRepositoryRemote.new);
  }

  @override
  void binds(Injector i) {
    i.addSingleton(SupabaseUser.new);
  }

  @override
  void routes(RouteManager r) {
    r.child('/', child: (_) => const AuthPage());
  }
}
