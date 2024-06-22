import 'package:chat_app/core/core.dart';
import 'package:chat_app/screens/screens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MessengerApp extends StatelessWidget {
  const MessengerApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: BlocProviders.listProviders,
      child: const MaterialApp(
        home: LoginScreen(),
      ),
    );
  }
}
