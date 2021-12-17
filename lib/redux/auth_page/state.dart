import 'package:shop_flutter_app/models/user.dart';

class AuthPageState {
  static AuthPageState initState = const AuthPageState(
    user: null,
  );

  final User? user;

  const AuthPageState({
    required this.user,
  });

  AuthPageState copyWith({
    User? user,
  }) =>
      AuthPageState(
        user: user ?? this.user,
      );
}
