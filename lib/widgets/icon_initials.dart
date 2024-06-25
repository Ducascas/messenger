import 'dart:math';
import 'package:chat_app/core/core.dart';
import 'package:flutter/material.dart';

class IconInitials extends StatelessWidget {
  const IconInitials({
    super.key,
    required this.name,
    required this.surName,
  });

  final String name;
  final String surName;

  @override
  Widget build(BuildContext context) {
    final randomColor =
        Colors.primaries[Random().nextInt(Colors.primaries.length)];
    return Container(
      height: 50,
      width: 50,
      decoration: BoxDecoration(
        color: randomColor,
        shape: BoxShape.circle,
      ),
      child: Center(
        child: Text(
          name.substring(0, 1).toUpperCase() +
              surName.substring(0, 1).toUpperCase(),
          style: const TextStyle(
            color: AppColors.white,
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}
