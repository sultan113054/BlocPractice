abstract class LoginEvent {}

class UserNameChanged extends LoginEvent {
  late final String username;

  UserNameChanged({required this.username});
}

class PasswordChanged extends LoginEvent {
  late final String password;

  PasswordChanged({required this.password});
}

class LoginSubmitted extends LoginEvent {}
