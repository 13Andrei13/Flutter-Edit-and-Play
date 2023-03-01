library actions;

import 'package:am_proiect/models/index.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'index.freezed.dart';
part 'initialize_app.dart';
part 'login.dart';
part 'register.dart';
part 'verify_email.dart';
part 'reset_password.dart';
part 'sign_out.dart';
part 'delete_profile_url.dart';
part 'update_photo_edited.dart';

abstract class AppAction {}

abstract class ErrorAction implements AppAction {
  Object get error;

  StackTrace get stackTrace;
}

typedef ActionResult = void Function(AppAction action);
