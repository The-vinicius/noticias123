import 'package:noticias123/src/auth/domian/models/user/user.dart';
import 'package:result_dart/result_dart.dart';

abstract interface class AuthRepository {
  AsyncResult<User, Exception> signIn();
  AsyncResult<Unit, Exception> logout();
  void getUser();
  void dispose();
  Stream<User> get observerUser;
}
