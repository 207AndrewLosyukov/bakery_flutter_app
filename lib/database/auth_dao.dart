import 'package:hive/hive.dart';
import 'package:shop_flutter_app/data_api/auth_dao.dart';
import 'package:shop_flutter_app/models/user.dart';
import 'models/hive_user.dart';

class AuthDaoApi extends AuthDao {
  final Box<HiveUser> database;

  AuthDaoApi({required this.database});

  @override
  User? getCurrentUser() {
    HiveUser? userModel = database.get('user');
    if (userModel == null) {
      return null;
    }
    return userModel.toUser();
  }

  @override
  void putUser(User user) {
    database.put('user', HiveUser.fromUser(user));
  }

  @override
  void deleteUser() {
    database.delete('user');
  }
}
