part of 'login_cubit.dart';

class LoginState {
  final User user;

  LoginState({
    required this.user,
  });

  LoginState copyWith({User? user}) {
    return LoginState(
      user: user ?? this.user,
    );
  }
}
