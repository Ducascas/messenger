import 'package:chat_app/models/user.dart';
import 'package:chat_app/services/services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
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
            ),
          ),
        );

  // final _firestore = FirebaseFirestore.instance;

  final formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController surNameController = TextEditingController();

  bool isFormValid() => formKey.currentState!.validate();

  void login() {
    if (isFormValid()) {
      final user = state.user.copyWith(
          id: DateTime.now().toString(),
          name: nameController.text,
          surname: surNameController.text);

      // _firestore.collection("users").doc(user.id).set(
      //   {
      //     'name': user.name,
      //     'surName': user.surname,
      //   },
      // );

      FirebaseService.saveUser(user);

      emit(state.copyWith(user: user));
    }
  }
}
