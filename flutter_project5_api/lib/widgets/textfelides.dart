import 'package:flutter/material.dart';
import 'package:glass/glass.dart';

class CustomTextField extends StatefulWidget {
  final String hint;

  final bool obscureText;
  final TextEditingController controller;

  CustomTextField({
    required this.hint,
    this.obscureText = false,
    required this.controller,
    int? maxLines,

  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: TextField(
            controller: widget.controller,
            obscureText: widget.obscureText,
            decoration: InputDecoration(
              hintText: widget.hint,

              floatingLabelBehavior:
                  FloatingLabelBehavior.always, 
              border: OutlineInputBorder(
                borderRadius:
                    BorderRadius.circular(10), 
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius:
                    BorderRadius.circular(10), 
                borderSide: BorderSide(
                    color: Colors.grey), 
              ),
            ),
          ).asGlass(
            tintColor: Colors.transparent,
          )),
    );
  }
}
