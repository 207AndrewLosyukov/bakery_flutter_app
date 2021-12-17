import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';
import 'package:shop_flutter_app/dependencies.dart';
import 'package:shop_flutter_app/models/user.dart';
import 'package:shop_flutter_app/redux/auth_page/actions.dart';

import '../state.dart';

class AddUser
    extends CallableThunkActionWithExtraArgument<GlobalState, Dependencies> {
  final User user;

  AddUser(this.user);

  @override
  call(Store<GlobalState> store, Dependencies extraArgument) {
    print(user.email);
      extraArgument.authDao.putUser(user);
      store.dispatch(SetAddUserAction(user));
  }
}

class GetUserBeforeAuth
    extends CallableThunkActionWithExtraArgument<GlobalState, Dependencies> {

  GetUserBeforeAuth();

  @override
  call(Store<GlobalState> store, Dependencies extraArgument) {
    User? user = extraArgument.authDao.getCurrentUser();
    if (user != null) {
      Dependencies.instance.navigator.replaceMainPage();
    }
  }
}

