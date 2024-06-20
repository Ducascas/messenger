import 'package:chat_app/services/services.dart';
import 'package:chat_app/core/core.dart';
import 'package:chat_app/screens/screens.dart';
import 'package:chat_app/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

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
              ),
              const SizedBox(height: 20),
              TextFieldCustom(
                controller: loginCubit.surNameController,
                labelText: AppText.surname,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (loginCubit.isFormValid()) {
                    loginCubit.login();
                    _navigateToHome(context);
                  }
                },
                child: const Text(AppText.chat),
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
