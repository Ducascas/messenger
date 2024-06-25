import 'package:chat_app/core/constant/colors.dart';
import 'package:chat_app/core/constant/constant.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MessageTile extends StatelessWidget {
  const MessageTile({
    super.key,
    required this.content,
    required this.timestamp,
    required this.isCurrentUser,
    // this.isRead,
  });

  final String content;
  final Timestamp timestamp;
  final bool isCurrentUser;

  // bool isRead;

  @override
  Widget build(BuildContext context) {
    final formattedTime = DateFormat('HH:mm').format(timestamp.toDate());

    final color = isCurrentUser ? AppColors.black : AppColors.darkGreen;

    const isRead = false;

    return Container(
      padding: _padding(),
      decoration: _decoration(),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            content,
            style: TextStyle(
              color: color,
              fontSize: 14,
            ),
          ),
          const SizedBox(width: 12),
          Text(
            formattedTime,
            style: TextStyle(
              color: color,
              fontSize: 12,
            ),
          ),
          const SizedBox(width: 4),
          Icon(
            isRead ? Icons.done_all : Icons.done,
            size: 12,
            color: isCurrentUser ? AppColors.black : AppColors.darkGreen,
          ),
        ],
        // ),
      ),
    );
  }

  _padding() => const EdgeInsets.symmetric(vertical: 12, horizontal: 16);

  _decoration() => BoxDecoration(
        color: isCurrentUser ? AppColors.grey : AppColors.green,
        borderRadius: isCurrentUser
            ? const BorderRadius.only(
                topLeft: Radius.circular(21),
                topRight: Radius.circular(21),
                bottomRight: Radius.circular(21),
              )
            : const BorderRadius.only(
                topLeft: Radius.circular(21),
                topRight: Radius.circular(21),
                bottomLeft: Radius.circular(21),
              ),
      );
}
