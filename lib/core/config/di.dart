import 'package:chat_app/core/core.dart';
// import 'package:chat_app/datasources/datasources.dart';
import 'package:chat_app/firebase_options.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

abstract class Locator {
  static final _locator = GetIt.instance;

  static Future<void> init() async {
    WidgetsFlutterBinding.ensureInitialized();
    await _initFirebase();

    _locator.registerLazySingleton<FirebaseAuth>(() => FirebaseAuth.instance);
    _locator.registerLazySingleton<FirebaseFirestore>(
        () => FirebaseFirestore.instance);

    // _locator.registerSingleton<UserRepository>(
    //   UserRepository(
    //     _locator<FirebaseAuth>(),
    //   ),
    // );
    // _locator.registerSingleton<MessageRepository>(
    //   MessageRepository(
    //     _locator<FirebaseFirestore>(),
    //   ),
    // );

  }

  static Future<void> _initFirebase() async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  }

  // static UserRepository get userRepository => _locator<UserRepository>();
}
