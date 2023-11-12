import 'package:flutter/material.dart';

class SinUpWedget extends StatefulWidget {
  const SinUpWedget({
    super.key,
    required this.Controller,
    required this.labelText,
  });

  final TextEditingController Controller;
  final String labelText;

  @override
  _SinUpWedgetState createState() => _SinUpWedgetState();
}

class _SinUpWedgetState extends State<SinUpWedget> {
  late FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    _focusNode.addListener(_handleFocusChange);
  }

  void _handleFocusChange() {
    setState(() {}); // Rebuild the widget on focus change
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool shouldHideLabel =
        _focusNode.hasFocus || widget.Controller.text.isNotEmpty;

    return Container(
      width: 400,
      height: 40,
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(color: Colors.black, blurRadius: 1, offset: Offset(0, 1))
      ], borderRadius: BorderRadius.circular(20), color: Colors.white),
      child: TextField(
        focusNode: _focusNode,
        controller: widget.Controller,
        decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide.none),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide.none),
            contentPadding: EdgeInsets.only(left: 10),

            // border: InputBorder.none,
            // labelText: shouldHideLabel ? '' : widget.labelText,
            hintText: widget.labelText),
      ),
    );
  }
}
