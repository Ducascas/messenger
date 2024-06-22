import 'package:chat_app/services/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BlocProviders {
  static final listProviders = [
    BlocProvider<LoginCubit>(
      create: (context) => LoginCubit(),
    ),
    BlocProvider<MessageCubit>(
      create: (context) => MessageCubit(),
    ),
  ];
}
