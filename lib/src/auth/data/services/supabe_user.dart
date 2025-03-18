import 'package:noticias123/src/app_config.dart';
import 'package:noticias123/src/auth/domian/models/user/user.dart';

class SupabaseUser {
  User getUser() {
    final user = User(
      uid: supabase.auth.currentUser?.id ?? '',
      email: supabase.auth.currentUser?.email ?? '',
      name: supabase.auth.currentUser?.userMetadata?['full_name'] ?? '',
      avatarUrl: supabase.auth.currentUser?.userMetadata?['avatar_url'] ?? '',
      bio: '',
    );
    return user;
  }
}
