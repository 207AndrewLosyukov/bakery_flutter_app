import 'package:shop_flutter_app/models/user.dart';

abstract class AuthDao {
  void putUser(User user);
  void deleteUser();
  User? getCurrentUser();
}
