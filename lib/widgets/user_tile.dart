import 'package:chat_app/core/core.dart';
import 'package:chat_app/models/models.dart';
import 'package:chat_app/services/services.dart';
import 'package:chat_app/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class UserTile extends StatelessWidget {
  const UserTile({
    super.key,
    required this.user,
    this.onTap,
    this.message,
    required this.showStatus,
  });

  final User user;
  final Function()? onTap;
  final Message? message;
  final bool showStatus;

  @override
  Widget build(BuildContext context) {
    final currentUser = context.read<LoginCubit>().state.user;
    final formattedTime = _getTime(message);
    bool isCurrentUser = false;

    if (user.id == currentUser.id) {
      isCurrentUser = true;
    }

    return ListTile(
        contentPadding: const EdgeInsets.only(right: 12),
        leading: _leading(isCurrentUser),
        title: _title(isCurrentUser),
        subtitle: showStatus ? _status(user.status) : _subtitle(currentUser),
        trailing: _trailing(formattedTime),
        onTap: onTap);
  }

  _status(bool isLoading) {
    return isLoading
        ? const Text(
            AppText.isOnline,
            style: AppTextStyle.textSmallDarkGrey,
          )
        : const Text(
            AppText.isNotOnline,
            style: AppTextStyle.textSmallDarkGrey,
          );
  }

  _leading(bool isCurrentUser) {
    return IconInitials(
      name: isCurrentUser ? 'S' : user.name,
      surName: isCurrentUser ? 'M' : user.surname,
    );
  }

  _title(bool isCurrentUser) {
    return Text(
      isCurrentUser ? AppText.saveMessage : '${user.name} ${user.surname}',
      style: AppTextStyle.textMediumBlack,
    );
  }

  _subtitle(User currentUser) {
    final msg = message?.content ?? '';
    return msg.isNotEmpty
        ? Text.rich(
            currentUser.id == message?.senderId
                ? TextSpan(text: msg)
                : TextSpan(
                    children: [
                      const TextSpan(
                        text: '${AppText.you}: ',
                        style: AppTextStyle.textSmallBlack,
                      ),
                      TextSpan(
                        text: msg,
                        style: AppTextStyle.textSmallDarkGrey,
                      )
                    ],
                  ),
            style: AppTextStyle.textSmallDarkGrey,
          )
        : const Text('');
  }

  _trailing(formattedTime) {
    return Column(
      children: [
        Text(
          formattedTime ?? '',
          style: AppTextStyle.textSmallDarkGrey,
        ),
      ],
    );
  }

  _getTime(Message? message) {
    final timeMessage = message?.timestamp.toDate();
    if (timeMessage != null) {
      return DateFormat('HH:mm').format(timeMessage);
    }
  }
}
