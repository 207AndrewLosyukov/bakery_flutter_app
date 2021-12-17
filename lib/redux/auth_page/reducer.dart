import 'package:redux/redux.dart';
import 'package:shop_flutter_app/redux/auth_page/state.dart';

import 'actions.dart';

final Reducer<AuthPageState> authPageReducer = combineReducers<AuthPageState>(
  [
    TypedReducer<AuthPageState, SetAddUserAction>(
      _setAddUserAction,
    ),
    TypedReducer<AuthPageState, SetRemoveUserAction>(
      _setRemoveUserAction,
    ),
  ],
);

AuthPageState _setAddUserAction(AuthPageState state, SetAddUserAction action) =>
    state.copyWith(user: action.user);

AuthPageState _setRemoveUserAction(AuthPageState state, SetRemoveUserAction action) =>
    state.copyWith(user: null);