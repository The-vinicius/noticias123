import 'package:flutter/material.dart';
import 'package:noticias123/src/auth/data/repositories/auth_repository.dart';

class LoginViewmodel extends ChangeNotifier {
  final AuthRepository _authRepository;
  var estado = '';

  LoginViewmodel(this._authRepository);

  Future<void> login() async {
    // se o resultado for sucesso, redireciona para a home, mas se for erro, exibe uma mensagem de erro snakbar
    final result = await _authRepository.signIn();

    result.fold(
      (user) {
        estado = 'success';
      },
      (error) {
        estado = error.toString();
      },
    );
    notifyListeners();
  }
}
