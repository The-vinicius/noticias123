import 'dart:async';

import 'package:noticias123/src/app_config.dart';
import 'package:noticias123/src/auth/data/repositories/auth_repository.dart';
import 'package:noticias123/src/auth/data/services/google_auth.dart';
import 'package:noticias123/src/auth/data/services/supabe_user.dart';
import 'package:noticias123/src/auth/domian/models/user/user.dart';
import 'package:result_dart/result_dart.dart';

class AuthRepositoryRemote implements AuthRepository {
  final SupabaseUser _supabeUser;
  final _streamController = StreamController<User>();
  AuthRepositoryRemote(this._supabeUser);

  @override
  void getUser() {
    final user = _supabeUser.getUser();
    _streamController.sink.add(user);
  }

  @override
  AsyncResult<Unit, Exception> logout() async {
    try {
      await supabase.auth.signOut();
      return const Success(unit);
    } catch (e) {
      return Failure(e as Exception);
    }
  }

  @override
  Stream<User> get observerUser {
    return _streamController.stream;
  }

  @override
  dispose() {
    _streamController.close();
  }

  @override
  AsyncResult<User, Exception> signIn() async {
    try {
      final user = await signInWithGoogle();
      return Success(user);
    } catch (e) {
      return Failure(Exception(e.toString()));
    }
  }
}
