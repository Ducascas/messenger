import 'package:chat_app/core/core.dart';
import 'package:chat_app/models/models.dart';
import 'package:chat_app/services/services.dart';
import 'package:chat_app/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserTile extends StatelessWidget {
  const UserTile({
    super.key,
    required this.user,
    this.onTap,
    // this.message,
    // this.timeMessage
  });

  final User user;
  final Function()? onTap;
  final String? message = 'Сообщение';
  final String? timeMessage = 'Время';

  @override
  Widget build(BuildContext context) {
    final currentUser = context.read<LoginCubit>().state.user;
    bool isCurrentUser = false;

    if (user.id == currentUser.id) {
      isCurrentUser = true;
    }

    return ListTile(
        contentPadding: const EdgeInsets.only(right: 12),
        leading: IconInitials(
          name: isCurrentUser ? 'S' : user.name,
          surName: isCurrentUser ? 'M' : user.surname,
        ),
        title: Text(
          isCurrentUser ? 'Saved Messages' : '${user.name} ${user.surname}',
          style: const TextStyle(color: AppColors.black),
        ),
        subtitle: Text(
          message ?? '',
          style: const TextStyle(color: AppColors.darkGrey),
        ),
        trailing: Column(
          children: [
            Text(
              timeMessage ?? '',
              style: const TextStyle(color: AppColors.darkGrey),
            ),
          ],
        ),
        onTap: onTap);
  }
}
