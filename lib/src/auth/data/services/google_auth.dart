import 'package:google_sign_in/google_sign_in.dart';
import 'package:noticias123/src/app_config.dart';
import 'package:noticias123/src/auth/domian/models/user/user.dart' as AuthUser;
import 'package:supabase_auth_ui/supabase_auth_ui.dart';

class GoogleAuthException implements Exception {
  final String message;
  GoogleAuthException(this.message);
  @override
  String toString() => message;
}

class GoogleAuth {
  final GoogleSignIn googleSignIn;
  GoogleAuth(this.googleSignIn);
  Future<AuthUser.User> signInWithGoogle() async {
    final googleUser = await googleSignIn.signIn();

    if (googleUser == null) {
      throw GoogleAuthException('Sign-in cancelled by user.');
    }

    final googleAuth = await googleUser.authentication;
    final accessToken = googleAuth.accessToken;
    final idToken = googleAuth.idToken;

    if (accessToken == null || idToken == null) {
      throw GoogleAuthException(
          'Failed to obtain Google authentication tokens.');
    }

    final user = await _authenticateWithSupabase(accessToken, idToken);
    return user;
  }
}

Future<AuthUser.User> _authenticateWithSupabase(
    String accessToken, String idToken) async {
  await supabase.auth.signInWithIdToken(
    provider: OAuthProvider.google,
    idToken: idToken,
    accessToken: accessToken,
  );

  final supabaseUser = supabase.auth.currentUser;
  if (supabaseUser == null) {
    throw GoogleAuthException('Failed to authenticate with Supabase.');
  }

  return AuthUser.User(
    uid: supabaseUser.id,
    email: supabaseUser.email!,
    name: supabaseUser.userMetadata!['full_name'],
    avatarUrl: supabaseUser.userMetadata!['avatar_url'],
    bio: '',
  );
}
