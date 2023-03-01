part of actions;

@freezed
abstract class ResetPassword with _$ResetPassword implements AppAction {
  const factory ResetPassword(String email) = ResetPasswordStart;

  const factory ResetPassword.successful() = ResetPasswordSuccessful;

  @Implements<StackTrace>()
  const factory ResetPassword.error(Object error, StackTrace stackTrace) = ResetPasswordError;
}
