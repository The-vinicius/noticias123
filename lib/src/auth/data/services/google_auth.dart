import 'package:google_sign_in/google_sign_in.dart';
import 'package:noticias123/src/app_config.dart';
import 'package:noticias123/src/auth/domian/models/user/user.dart' as AuthUser;
import 'package:supabase_auth_ui/supabase_auth_ui.dart';

Future<AuthUser.User> signInWithGoogle() async {
  final GoogleSignIn googleSignIn = GoogleSignIn(
    scopes: ['email', 'profile'],
    clientId: const String.fromEnvironment('clientId'),
  );

  final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
  final GoogleSignInAuthentication googleAuth =
      await googleUser!.authentication;

  final accessToken = googleAuth.accessToken;
  final idToken = googleAuth.idToken;

  if (accessToken == null || idToken == null) {
    throw 'Erro ao autenticar com o Google';
  }

  // Autentique no Supabase usando o token
  await supabase.auth.signInWithIdToken(
    provider: OAuthProvider.google,
    idToken: idToken,
    accessToken: accessToken,
  );

  return AuthUser.User(
      uid: supabase.auth.currentUser!.id,
      email: supabase.auth.currentUser!.email!,
      name: supabase.auth.currentUser!.userMetadata!['full_name'],
      avatarUrl: supabase.auth.currentUser!.userMetadata!['avatar_url'],
      bio: '');
}
