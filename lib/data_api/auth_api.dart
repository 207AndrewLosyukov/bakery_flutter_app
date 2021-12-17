import 'package:shop_flutter_app/models/user.dart';

abstract class AuthApi {
  Future<User> auth(String email, String password);
}

class AuthApiMock extends AuthApi {
  @override
  Future<User> auth(String email, String password) async {
    await Future.delayed(
      const Duration(seconds: 3),
    );
    return const User(
      "Дмитрий",
      "email",
      "https://flomaster.club/uploads/posts/2021-11/1635833030_1-flomaster-club-p-narisovannii-yeltsin-krasivii-risunok-1.png",
    );
  }
}
