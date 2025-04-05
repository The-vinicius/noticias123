import 'package:noticias123/src/auth/data/services/user_service.dart';
import 'package:noticias123/src/auth/domian/models/user/user.dart';

class SupabaseUserMock implements UserService {
  @override
  User getUser() {
    return const User(
        uid: 'si',
        name: 'napo',
        email: 'vin@amh',
        avatarUrl:
            'https://wallpapers.com/images/hd/waifu-2ptkmpduy31thxuq.jpg',
        bio: 'jaca');
  }
}
