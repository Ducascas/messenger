import 'package:chat_app/models/user.dart';
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
        emit(state.copyWith(user: user));
      } else {
        final newUser = state.user.copyWith(
            id: name + surName + password,
            name: name,
            surname: surName,
            password: password);

        FirebaseService.saveUser(newUser);

        emit(state.copyWith(user: newUser));
      }
    }
  }
}
