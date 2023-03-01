part of actions;

@freezed
class Register with _$Register implements AppAction {
  const factory Register(String email, String password, String fullName, String phoneNumber, ActionResult result) =
      RegisterStart;

  const factory Register.successful(AppUser user) = RegisterSuccessful;

  @Implements<StackTrace>()
  const factory Register.error(Object error, StackTrace stackTrace) = RegisterError;
}
