import 'package:cv_app/constentes/colors.dart';
import 'package:flutter/material.dart';

class TextFelidWidget extends StatefulWidget {
  TextFelidWidget(
      {super.key,
      required this.onChanged,
      required this.title,
      required this.hintTitle,
      TextEditingController? controller});
  final Function(String) onChanged;
  final String title;
  final String hintTitle;
  late TextEditingController controller = TextEditingController();
  @override
  State<TextFelidWidget> createState() => _TextFelidWidgetState();
}

class _TextFelidWidgetState extends State<TextFelidWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.title,
          style: const TextStyle(
              fontSize: 16, fontWeight: FontWeight.w600, color: prussianBlue),
        ),
        const SizedBox(height: 10),
        SizedBox(
          height: 50,
          child: TextField(
            onChanged: widget.onChanged,
            controller: widget.controller,
            decoration: InputDecoration(
              hintText: widget.hintTitle,
              hintStyle: const TextStyle(
                fontWeight: FontWeight.w600,
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.grey),
                borderRadius: BorderRadius.circular(10),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.grey),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
