import 'package:flutter/material.dart';

class OTPField extends StatelessWidget {
  const OTPField({
    super.key,
    required this.focusNodeList,
    required this.index,
    required this.controller,
  });

  final List<FocusNode> focusNodeList;
  final int index;
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15), color: Colors.black12),
      height: 60,
      width: 60,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: TextField(
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        autofocus: true,
        focusNode: focusNodeList[index],
        onChanged: (value) {
          if (index < focusNodeList.length - 1) {
            reqFocus(focusNode: focusNodeList[index + 1]);
          } else {
            focusNodeList[index].unfocus();
          }
          controller.text += value;
        },
      ),
    );
  }

  void reqFocus({required FocusNode focusNode}) {
    focusNode.requestFocus();
  }
}
