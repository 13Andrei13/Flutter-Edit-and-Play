part of actions;

@freezed
abstract class SignOut with _$SignOut implements AppAction {
  const factory SignOut() = SignOutStart;

  const factory SignOut.successful() = SignOutSuccessful;

  @Implements<StackTrace>()
  const factory SignOut.error(Object error, StackTrace stackTrace) = SignOutError;
}
