import 'package:am_proiect/actions/index.dart';
import 'package:am_proiect/data/auth_api.dart';
import 'package:am_proiect/models/index.dart';
import 'package:redux_epics/redux_epics.dart';
import 'package:rxdart/rxdart.dart';

class AppEpics {
  const AppEpics({required AuthApi authApi}) : _authApi = authApi;

  final AuthApi _authApi;

  Epic<AppState> get epics {
    return combineEpics<AppState>(<Epic<AppState>>[
      TypedEpic<AppState, InitializeAppStart>(_initializeApp),
      TypedEpic<AppState, RegisterStart>(_register),
      TypedEpic<AppState, LoginStart>(_login),
      TypedEpic<AppState, VerifyEmailStart>(_verifyEmail),
      TypedEpic<AppState, ResetPasswordStart>(_resetPassword),
      TypedEpic<AppState, SignOutStart>(_signOut),
      TypedEpic<AppState, DeleteProfileUrlStart>(_deleteProfileUrlStart),
      TypedEpic<AppState, UpdatePhotoEditedStart>(_updatePhotoEditedStart),
    ]);
  }

  Stream<AppAction> _initializeApp(Stream<InitializeAppStart> actions, EpicStore<AppState> store) {
    return actions
        .asyncMap((InitializeAppStart action) => _authApi.getCurrentUser())
        .map((AppUser? user) => InitializeApp.successful(user))
        .onErrorReturnWith((Object error, StackTrace stackTrace) => InitializeApp.error(error, stackTrace));
  }

  Stream<AppAction> _register(Stream<RegisterStart> actions, EpicStore<AppState> store) {
    return actions.flatMap((RegisterStart action) => Stream<void>.value(null)
        .asyncMap((_) => _authApi.register(action.email, action.password, action.fullName, action.phoneNumber))
        .map((AppUser user) => Register.successful(user))
        .onErrorReturnWith((Object error, StackTrace stackTrace) => Register.error(error, stackTrace))
        .doOnData(action.result));
  }

  Stream<AppAction> _login(Stream<LoginStart> actions, EpicStore<AppState> store) {
    return actions.flatMap((LoginStart action) => Stream<void>.value(null)
        .asyncMap((_) => _authApi.login(action.email, action.password))
        .map((AppUser user) => Login.successful(user))
        .onErrorReturnWith((Object error, StackTrace stackTrace) => Login.error(error, stackTrace))
        .doOnData(action.result));
  }

  Stream<AppAction> _verifyEmail(Stream<VerifyEmailStart> actions, EpicStore<AppState> store) {
    return actions
        .asyncMap((VerifyEmailStart action) => _authApi.verifyEmail())
        .map((_) => const VerifyEmail.successful())
        .onErrorReturnWith((Object error, StackTrace stackTrace) => VerifyEmail.error(error, stackTrace));
  }

  Stream<AppAction> _resetPassword(Stream<ResetPasswordStart> actions, EpicStore<AppState> store) {
    return actions
        .asyncMap((ResetPasswordStart action) => _authApi.resetPassword(action.email))
        .map((_) => const ResetPassword.successful())
        .onErrorReturnWith((Object error, StackTrace stackTrace) => ResetPassword.error(error, stackTrace));
  }

  Stream<AppAction> _signOut(Stream<SignOutStart> actions, EpicStore<AppState> store) {
    return actions
        .asyncMap((SignOutStart action) => _authApi.signOut())
        .map((_) => const SignOut.successful())
        .onErrorReturnWith((Object error, StackTrace stackTrace) => SignOut.error(error, stackTrace));
  }

  Stream<AppAction> _deleteProfileUrlStart(Stream<DeleteProfileUrlStart> actions, EpicStore<AppState> store) {
    return actions
        .asyncMap((DeleteProfileUrlStart action) => _authApi.deleteProfileUrl(store.state.user!.uid))
        .map((_) => const DeleteProfileUrl.successful())
        .onErrorReturnWith((Object error, StackTrace stackTrace) => DeleteProfileUrl.error(error, stackTrace));
  }

  Stream<AppAction> _updatePhotoEditedStart(Stream<UpdatePhotoEditedStart> actions, EpicStore<AppState> store) {
    return actions //
        .flatMap((UpdatePhotoEditedStart action) => Stream<void>.value(null)
        .asyncMap((_) => _authApi.addPhotoEdited(store.state.user!.uid, action.path))
        .map((String profileUrl) => UpdatePhotoEdited.successful(profileUrl))
        .onErrorReturnWith((Object error, StackTrace stackTrace) => UpdatePhotoEdited.error(error, stackTrace)));

  }
}
