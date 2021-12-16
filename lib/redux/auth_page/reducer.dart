import 'package:redux/redux.dart';
import 'package:shop_flutter_app/redux/auth_page/state.dart';

import 'actions.dart';

final Reducer<AuthPageState> authPageReducer = combineReducers<AuthPageState>(
  [
    TypedReducer<AuthPageState, AddUserAction>(
      _setAddUserAction,
    ),
  ],
);

AuthPageState _setAddUserAction(AuthPageState state, AddUserAction action) =>
    state.copyWith(user: action.user);
