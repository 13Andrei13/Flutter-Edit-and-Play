part of actions;

@freezed
class UpdatePhotoEdited with _$UpdatePhotoEdited implements AppAction {
  const factory UpdatePhotoEdited(String path) = UpdatePhotoEditedStart;

  const factory UpdatePhotoEdited.successful(String path) = UpdatePhotoEditedSuccessful;

  @Implements<StackTrace>()
  const factory UpdatePhotoEdited.error(Object error, StackTrace stackTrace) = UpdatePhotoEditedError;
}





