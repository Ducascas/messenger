import 'package:chat_app/core/core.dart';
import 'package:chat_app/messenger_app.dart';
import 'package:flutter/material.dart';

void main() async {
  await Locator.init();
  runApp(const MessengerApp());
}
