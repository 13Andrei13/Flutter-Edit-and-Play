part of actions;

@freezed
abstract class VerifyEmail with _$VerifyEmail implements AppAction {
  const factory VerifyEmail() = VerifyEmailStart;

  const factory VerifyEmail.successful() = VerifyEmailSuccessful;

  @Implements<StackTrace>()
  const factory VerifyEmail.error(Object error, StackTrace stackTrace) = VerifyEmailError;
}
