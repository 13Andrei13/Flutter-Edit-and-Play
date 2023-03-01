import 'package:am_proiect/actions/index.dart';
import 'package:am_proiect/models/index.dart';
import 'package:redux/redux.dart';

Reducer<AppState> reducer = combineReducers(<Reducer<AppState>>[
  (AppState state, dynamic action) {
    print(action);
    return state;
  },
  TypedReducer<AppState, InitializeAppSuccessful>(_initializeAppSuccessful),
  TypedReducer<AppState, RegisterSuccessful>(_registerSuccessful),
  TypedReducer<AppState, LoginSuccessful>(_loginSuccessful),
  TypedReducer<AppState, SignOutSuccessful>(_signOutSuccessful),
  TypedReducer<AppState, DeleteProfileUrlSuccessful>(_deleteProfileUrlSuccessful),
  TypedReducer<AppState, UpdatePhotoEditedSuccessful>(_updatePhotoEditedSuccessful),
]);

AppState _initializeAppSuccessful(AppState state, InitializeAppSuccessful action) {
  return state.rebuild((AppStateBuilder b) {
    b.user = action.user?.toBuilder();
  });
}

AppState _registerSuccessful(AppState state, RegisterSuccessful action) {
  return state.rebuild((AppStateBuilder b) => b.user = action.user.toBuilder());
}

AppState _loginSuccessful(AppState state, LoginSuccessful action) {
  return state.rebuild((AppStateBuilder b) {
    b.user = action.user.toBuilder();
  });
}

AppState _signOutSuccessful(AppState state, SignOutSuccessful action) {
  return state.rebuild((AppStateBuilder b) {
    b.user = null;
  });
}

AppState _deleteProfileUrlSuccessful(AppState state, DeleteProfileUrlSuccessful action) {
  return state.rebuild((AppStateBuilder b) {
    b.user.photoUrl = null;
  });
}

AppState _updatePhotoEditedSuccessful(AppState state, UpdatePhotoEditedSuccessful action) {
  return state.rebuild((AppStateBuilder b) {
    b.user.editPhoto.add(action.path);
  });
}
