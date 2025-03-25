import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:noticias123/src/auth/data/repositories/auth_repository_remote.dart';
import 'package:noticias123/src/auth/data/services/google_auth.dart';
import 'package:noticias123/src/auth/data/services/supabe_user.dart';
import 'package:noticias123/src/auth/domian/models/user/user.dart';

class MockSupabaseUser extends Mock implements SupabaseUser {}

class MockGoogleAuth extends Mock implements GoogleAuth {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  late MockSupabaseUser supabaseUser;
  late AuthRepositoryRemote repository;
  late MockGoogleAuth googleAuth;
  setUp(() {
    supabaseUser = MockSupabaseUser();
    googleAuth = MockGoogleAuth();
    repository = AuthRepositoryRemote(supabaseUser, googleAuth);
  });

  test(
    'auth repository remote ...',
    () async {
      const user = User(
          uid: '1',
          name: 'vic',
          email: 'exemplo@gmail.com',
          avatarUrl: 'https://pic.com/a.jpg',
          bio: 'a');
      when(() => supabaseUser.getUser()).thenReturn(user);

      final stream = repository.observerUser;
      repository.getUser();
      expect(stream, emits(user));
    },
  );

  test(
    'auth sign in google success',
    () async {
      const user = User(
          uid: '1',
          name: 'vic',
          email: 'exemplo@gmail.com',
          avatarUrl: 'https://pic.com/a.jpg',
          bio: 'a');

      when(() => googleAuth.signInWithGoogle()).thenAnswer((_) async => user);
      final result = await repository.signIn();

      result.isError();
      expect(result.getOrThrow(), isA<User>());
    },
  );

  test(
    'auth sign in google failure',
    () async {
      const user = User(
          uid: '1',
          name: 'vic',
          email: 'exemplo@gmail.com',
          avatarUrl: 'https://pic.com/a.jpg',
          bio: 'a');

      when(() => googleAuth.signInWithGoogle())
          .thenThrow(GoogleAuthException('error google auth'));
      final result = await repository.signIn();

      expect(result.getOrThrow(), isA<GoogleAuthException>());
    },
  );
}
