import 'package:flutter/material.dart';
import 'package:project_5/extensions/size_extension.dart';
import 'package:project_5/screens/auth/components/auth_button.dart';
import 'package:project_5/screens/auth/components/auth_text_field.dart';

Future<dynamic> customModalBottomSheet(BuildContext context,
    {required TextEditingController controller,
    required String content,
    required Function() onPressedFunc}) {
  return showModalBottomSheet(
    showDragHandle: true,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    isScrollControlled: true,
    constraints: BoxConstraints(maxHeight: context.getHeight() * .45),
    isDismissible: true,
    context: context,
    builder: (context) => BottomSheet(
      onClosing: () {},
      builder: (context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const ListTile(
            title: Text("Current"),
            subtitle: Text("User Name"),
          ),
          SizedBox(height: context.getHeight() * .02),
          const Padding(
            padding: EdgeInsets.only(left: 16.0),
            child: Text(
              "New",
              style: TextStyle(fontSize: 16),
            ),
          ),
          SizedBox(height: context.getHeight() * .01),
          AuthTextField(
            isPassword: false,
            content: "Update $content",
            controller: controller,
          ),
          SizedBox(height: context.getHeight() * .04),
          AuthButton(
              content: "Update",
              color: Colors.grey[300]!,
              onPressedFunc: onPressedFunc,
              isDisabled: false)
        ],
      ),
    ),
  );
}
