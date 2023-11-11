import 'package:flutter/material.dart';

bool nameValidator(BuildContext context, TextEditingController nameController) {
  if (nameController.text.isEmpty) {
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
    ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please Enter A valid email")));
    return false;
  }
}

bool phoneValidator(
    BuildContext context, TextEditingController phoneController) {
  if (phoneController.text.length < 10) {
    ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Phone number is too short")));
    return false;
  } else if (phoneController.text.length > 10) {
    ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Phone number is too long")));
    return false;
  } else if (!phoneController.text.substring(0, 2).contains("05")) {
    ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Phone number should start with 05")));
    return false;
  } else {
    return true;
  }
}

bool confirmPasswordValidator(
    BuildContext context,
    TextEditingController passwordController,
    TextEditingController confirmPasswordController) {
  if (confirmPasswordController.text != passwordController.text) {
    ScaffoldMessenger.of(context)
        .showSnackBar(const SnackBar(content: Text("Password do not match")));
    return false;
  } else {
    return true;
  }
}

bool passwordValidator(
    BuildContext context, TextEditingController passwordController) {
  if (passwordController.text.length <= 3) {
    ScaffoldMessenger.of(context)
        .showSnackBar(const SnackBar(content: Text("Password is too short")));
    return false;
  } else {
    return true;
  }
}
