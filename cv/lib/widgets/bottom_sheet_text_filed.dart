import 'package:cv/constants/colors.dart';
import 'package:flutter/material.dart';

class BottomSheetFiled extends StatelessWidget {
  BottomSheetFiled(
      {super.key,
      required this.lable,
      required TextEditingController controller});

  TextEditingController controller = TextEditingController();
  final String lable;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 16),
      child: TextField(
        style: const TextStyle(color: Colors.black),
        controller: controller,
        decoration: InputDecoration(
          labelText: lable,
          labelStyle: const TextStyle(color: Color(0xff8a8c8d)),
          filled: true,
          fillColor: const Color(0xffECF0F1),
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(20),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.primaryColor),
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
    );
  }
}
