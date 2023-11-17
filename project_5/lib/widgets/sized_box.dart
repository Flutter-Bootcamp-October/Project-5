import 'package:flutter/material.dart';
import 'package:project_5/extensions/size_extension.dart';

Widget sizedBoxH({required BuildContext context, multiplier = 1}) {
  return SizedBox(height: context.getHeight() * multiplier);
}
