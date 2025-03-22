import 'package:flutter_modular/flutter_modular.dart';
import 'package:noticias123/src/auth/auth_module.dart';
import 'package:noticias123/src/auth/data/repositories/auth_repository.dart';
import 'package:noticias123/src/profile/ui/widget/profile_screen.dart';

class ProfileModule extends Module {
  @override
  List<Module> get imports => [AuthModule()];

  @override
  void routes(RouteManager r) {
    r.child('/',
        child: (_) => ProfileScreen(
              authRepository: Modular.get<AuthRepository>(),
            ));
  }
}
