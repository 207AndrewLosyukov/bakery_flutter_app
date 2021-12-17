import 'package:hive/hive.dart';
import 'package:shop_flutter_app/models/tag.dart';
import 'package:shop_flutter_app/models/user.dart';

part 'hive_user.g.dart';

@HiveType(typeId: 4)
class HiveUser {
  @HiveField(0)
  final String nickname;
  @HiveField(1)
  final String email;
  @HiveField(2)
  final String imageURL;

  HiveUser({
    required this.nickname,
    required this.email,
    required this.imageURL,
  });

  static HiveUser fromUser(User user) {
    return HiveUser(
        nickname: user.nickname, email: user.email, imageURL: user.imageURL);
  }

  User toUser() {
    return User(nickname, email, imageURL);
  }
}
