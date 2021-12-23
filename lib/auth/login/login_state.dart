
import 'package:login/auth/form_submission_status.dart';

class LoginState {
  late String username;
  bool get isValidUserName=>username.length>3;
  late String password;
  bool get isValidUserpassword=>password.length>3;

  late final FormSubmissionStatus formSubmissionStatus;

  LoginState({
    this.username = '',
    this.password = '',
    this.formSubmissionStatus = const InitialFormStatus(),
  });

  LoginState copyWith({
    String? username,
    String? password,
    FormSubmissionStatus? formSubmissionStatus,
  }) {
    return LoginState(
      username: username ?? this.username,
      password: password ?? this.password,
      formSubmissionStatus: formSubmissionStatus ?? this.formSubmissionStatus,
    );
  }
}
