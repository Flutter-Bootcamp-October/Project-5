import 'package:flutter/material.dart';

class CardUser extends StatelessWidget {
  const CardUser({
    super.key,
    required this.title,
    required this.isUser,
  });

  final String title;
  final bool isUser;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
      child: Center(
        child: Container(
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.all(8),
          margin: isUser
              ? const EdgeInsets.only(top: 10, right: 16, left: 25)
              : const EdgeInsets.only(top: 10, right: 25, left: 16),
          alignment: Alignment.center,
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
              color: isUser
                  ? const Color.fromARGB(166, 96, 125, 139)
                  : const Color.fromARGB(222, 158, 158, 158),
              borderRadius: BorderRadius.circular(8)),
          child: Text(title),
        ),
      ),
    );
  }
}
