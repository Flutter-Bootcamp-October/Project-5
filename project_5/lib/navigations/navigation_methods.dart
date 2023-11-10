import 'package:flutter/material.dart';

void navigationPush({required BuildContext context, required Widget screen}) {
  Navigator.push(context, MaterialPageRoute(builder: (context) => screen));
}
