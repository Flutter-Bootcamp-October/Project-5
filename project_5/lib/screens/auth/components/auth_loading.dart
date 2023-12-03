import 'package:flutter/material.dart%20';
import 'package:flutter/services.dart';

Widget showLoadingIndicator() {
  SystemChannels.textInput.invokeMethod('TextInput.hide');
  return const Padding(
    padding: EdgeInsets.all(8.0),
    child: LinearProgressIndicator(),
  );
}
