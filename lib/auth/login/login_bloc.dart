import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login/auth/auth_repository.dart';
import 'package:login/auth/form_submission_status.dart';
import 'package:login/auth/login/login_event.dart';
import 'package:login/auth/login/login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  late final AuthRepository authRepository;


  LoginBloc({ required this.authRepository}) : super(LoginState()) {
    on<UserNameChanged>(
        (event, emit) => emit(state.copyWith(username: event.username)));

    on<PasswordChanged>(
        (event, emit) => emit(state.copyWith(password: event.password)));

    on<LoginSubmitted>((event, emit) async {
      emit(state.copyWith(formSubmissionStatus: FormSubmitting()));

      try {
        await authRepository.login();
        emit(state.copyWith(formSubmissionStatus: SubmissionSuccess()));
      } catch (ex) {
        emit(state.copyWith(
            formSubmissionStatus: SubmissionFailed(exception: Exception(ex))));
      }
    });
  }
}
