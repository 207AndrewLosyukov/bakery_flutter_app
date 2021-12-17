import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';
import 'package:shop_flutter_app/dependencies.dart';
import 'package:shop_flutter_app/models/user.dart';

import '../state.dart';

class AddUser
    extends CallableThunkActionWithExtraArgument<GlobalState, Dependencies> {
  final User user;

  AddUser(this.user);

  @override
  call(Store<GlobalState> store, Dependencies extraArgument) {
    // Никита добавляет в БД

    // Не уверен, что это необходимо.
    //Dependencies.instance.authScreen.dispose();
  }
}
