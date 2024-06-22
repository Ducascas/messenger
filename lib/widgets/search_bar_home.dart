import 'package:chat_app/core/core.dart';
import 'package:chat_app/widgets/widgets.dart';
import 'package:flutter/material.dart';

class SearchBarHome extends StatelessWidget {
  const SearchBarHome({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(
        left: 20,
        top: 60,
        right: 20,
        bottom: 24,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppText.chat,
            style: TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.w400,
              color: AppColors.blackBlue,
            ),
          ),
          SizedBox(height: 6),
          TextFieldCustom(
            labelText: AppText.search,
            prefixIcon: Icon(Icons.search),
            obscureText: false,
          ),
        ],
      ),
    );
  }
}
