import 'package:flutter/material.dart';

bool nameValidator(BuildContext context, String name) {
  if (name.isEmpty) {
    ScaffoldMessenger.of(context)
        .showSnackBar(const SnackBar(content: Text("Please Enter your name")));
    return false;
  } else {
    return true;
  }
}

bool emailValidation(bool validEmail, BuildContext context) {
  if (validEmail) {
    return true;
  } else {
    ScaffoldMessenger.of(context)
        .showSnackBar(const SnackBar(content: Text("Please Enter A valid email")));
    return false;
  }
}

bool phoneValidator(BuildContext context, String phone) {
  if (phone.trim().length < 10) {
    ScaffoldMessenger.of(context)
        .showSnackBar(const SnackBar(content: Text("Phone number is too short")));
    return false;
  } else if (phone.trim().length > 10) {
    ScaffoldMessenger.of(context)
        .showSnackBar(const SnackBar(content: Text("Phone number is too long")));
    return false;
  } else if (!phone.substring(0, 2).contains("05")) {
    ScaffoldMessenger.of(context)
        .showSnackBar(const SnackBar(content: Text("Phone number should start with 05")));
    return false;
  } else {
    return true;
  }
}

bool confirmPasswordValidator(BuildContext context, String password, String confirmPassword) {
  if (confirmPassword != password) {
    ScaffoldMessenger.of(context)
        .showSnackBar(const SnackBar(content: Text("Password do not match")));
    return false;
  } else {
    return true;
  }
}

bool passwordValidator(BuildContext context, String password) {
  if (password.length <= 3) {
    ScaffoldMessenger.of(context)
        .showSnackBar(const SnackBar(content: Text("Password is too short")));
    return false;
  } else {
    return true;
  }
}
