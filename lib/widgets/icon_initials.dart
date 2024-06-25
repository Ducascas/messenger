import 'dart:math';
import 'package:chat_app/core/constant/colors.dart';
import 'package:flutter/material.dart';

class IconInitials extends StatelessWidget {
  IconInitials({
    super.key,
    required this.name,
    required this.surName,
  });

  final String name;
  final String surName;
  final _randomColor =
      Colors.primaries[Random().nextInt(Colors.primaries.length)];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 50,
      decoration: BoxDecoration(
        color: _randomColor,
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
