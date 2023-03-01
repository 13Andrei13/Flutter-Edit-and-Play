part of actions;

@freezed
class DeleteProfileUrl with _$DeleteProfileUrl implements AppAction {
  const factory DeleteProfileUrl() = DeleteProfileUrlStart;

  const factory DeleteProfileUrl.successful() = DeleteProfileUrlSuccessful;

  @Implements<StackTrace>()
  const factory DeleteProfileUrl.error(Object error, StackTrace stackTrace) = DeleteProfileUrlError;
}
