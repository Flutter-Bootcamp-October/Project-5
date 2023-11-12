import 'package:cv/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class OtpTextFiled extends StatelessWidget {
  OtpTextFiled(
      {super.key,
      required TextEditingController controller,
      required this.hint});

  TextEditingController controller = TextEditingController();
  final String hint;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width - 44,
      height: 100,
      child: TextField(
        textAlign: TextAlign.left,
        keyboardType: TextInputType.number,
        autofocus: true,
        controller: controller,
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: const TextStyle(color: Color.fromARGB(105, 138, 140, 141)),
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
        inputFormatters: [
          FilteringTextInputFormatter.digitsOnly,
        ],
      ),
    );
  }
}
