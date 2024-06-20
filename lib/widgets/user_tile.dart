import 'package:chat_app/core/constant/colors.dart';
import 'package:chat_app/widgets/widgets.dart';
import 'package:flutter/material.dart';

class UserTile extends StatelessWidget {
  const UserTile({super.key, required this.name, required this.surName});

  final String name;
  final String surName;
  final String message = 'Сообщение';
  final String timeMessage = 'Время';

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: IconInitials(
        name: name,
        surName: surName,
      ),
      title: Text(
        '$name $surName',
        style: const TextStyle(color: AppColors.black),
      ),
      subtitle: Text(
        message,
        style: const TextStyle(color: AppColors.darkGrey),
      ),
      trailing: Column(
        children: [
          Text(
            timeMessage,
            style: const TextStyle(color: AppColors.darkGrey),
          ),
        ],
      ),
    );
  }
}
