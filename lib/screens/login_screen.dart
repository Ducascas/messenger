import 'package:chat_app/services/services.dart';
import 'package:chat_app/core/core.dart';
import 'package:chat_app/screens/screens.dart';
import 'package:chat_app/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  @override
  void dispose() {
    context.read<LoginCubit>().dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final LoginCubit loginCubit = context.read<LoginCubit>();

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(40.0),
        child: Form(
          key: loginCubit.formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFieldCustom(
                controller: loginCubit.nameController,
                labelText: AppText.name,
                validator: (value) => value == null || value.isEmpty
                    ? AppText.nameTextFieldError
                    : null,
              ),
              const SizedBox(height: 20),
              TextFieldCustom(
                controller: loginCubit.surNameController,
                labelText: AppText.surname,
                validator: (value) => value == null || value.isEmpty
                    ? AppText.surnameTextFieldError
                    : null,
              ),
              const SizedBox(height: 20),
              TextFieldCustom(
                controller: loginCubit.passwordController,
                labelText: AppText.password,
                obscureText: true,
                validator: (value) => value == null || value.isEmpty
                    ? AppText.passTextFieldError
                    : null,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (loginCubit.isFormValid()) {
                    loginCubit.login();
                    _navigateToHome(context);
                  }
                },
                child: const Text(AppText.input),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _navigateToHome(BuildContext context) {
    return Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const HomeScreen()),
    );
  }
}
