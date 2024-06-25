import 'package:chat_app/models/models.dart';
import 'package:chat_app/services/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit()
      : super(
          LoginState(
            user: User(
              id: '',
              name: '',
              surname: '',
              password: '',
              status: false,
            ),
          ),
        );

  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final surNameController = TextEditingController();
  final passwordController = TextEditingController();

  void dispose() {
    nameController.dispose();
    surNameController.dispose();
    passwordController.dispose();
  }

  bool isFormValid() => formKey.currentState!.validate();

  void login() async {
    final name = nameController.text.trim();
    final surName = surNameController.text.trim();
    final password = passwordController.text.trim();

    if (isFormValid()) {
      final user = await FirebaseService.getUser(name + surName + password);
      if (user != null && user.password == password) {
        logIn();
        emit(
          state.copyWith(user: user),
        );
      } else {
        final newUser = state.user.copyWith(
            id: name + surName + password,
            name: name,
            surname: surName,
            password: password,
            status: false);

        await FirebaseService.saveUser(newUser);
        logIn();
        emit(
          state.copyWith(user: newUser),
        );
      }
    }
  }

  void logIn() async {
    final user = state.user;
    await FirebaseService.updateStatus(user, true);
  }

  void logOut() async {
    final user = state.user;
    FirebaseService.updateStatus(user, false);
  }
}
