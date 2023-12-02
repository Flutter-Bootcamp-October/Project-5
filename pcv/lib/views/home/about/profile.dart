import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pcv/blocs/about_bloc/about_bloc.dart';
import 'package:pcv/main.dart';
import 'package:pcv/method/app_bar_mathod.dart';
import 'package:pcv/views/auth/sign_in_screen.dart';
import 'package:pcv/widgets/profile_widget.dart';
import 'package:pcv/widgets/button_widget.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: appBarMethod(title: "Profile"),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                children: [
                  BlocConsumer<AboutBloc, AboutState>(
                    listener: (context, state) {
                      if (state is ErrorAboutState) {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(SnackBar(content: Text(state.msg)));
                      }
                      if (state is SuccessAboutState) {
                        showDialog(
                            context: context,
                            builder: (context) => const Center(
                                  child: Text("Complate"),
                                ));
                        Future.delayed(const Duration(seconds: 3), () {
                          Navigator.of(context).pop();
                        });
                      }
                    },
                    builder: (context, state) {
                      return BlocBuilder<AboutBloc, AboutState>(
                        builder: (context, state) {
                          if (state is GetAboutState) {
                            return ProfileWidget(
                              birthdayController: TextEditingController(
                                  text: state.about.data?.birthday),
                              usernameController: TextEditingController(
                                  text: state.about.data?.name),
                              titPoController: TextEditingController(
                                  text: state.about.data?.titlePosition),
                              locationController: TextEditingController(
                                  text: state.about.data?.location),
                              phoneController: TextEditingController(
                                  text: state.about.data?.phone),
                              aboutController: TextEditingController(
                                  text: state.about.data?.about),
                            );
                          }
                          return ProfileWidget(
                            birthdayController: TextEditingController(),
                            usernameController: TextEditingController(),
                            titPoController: TextEditingController(),
                            locationController: TextEditingController(),
                            phoneController: TextEditingController(),
                            aboutController: TextEditingController(),
                          );
                        },
                      );
                    },
                  ),
                  ButtonWidget(
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                                title: const Text(
                                  "LogOut",
                                  style: TextStyle(color: Colors.red),
                                ),
                                content:
                                    const Text("Are You Sure want Logout?"),
                                actions: [
                                  TextButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: const Text(
                                        "CANCEL",
                                      )),
                                  TextButton(
                                      onPressed: () {
                                        prefs?.clear();
                                        Navigator.pushAndRemoveUntil(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const SignInScreen()),
                                            (route) => false);
                                      },
                                      child: const Text("Logout",
                                          style: TextStyle(color: Colors.red)))
                                ],
                              ));
                    },
                    text: "Logout",
                    color: Colors.red,
                  ),
                  BlocListener<AboutBloc, AboutState>(
                    listener: (context, state) {
                      if (state is SuccessDeleteAccount) {
                        prefs?.clear();
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SignInScreen()),
                            (route) => false);
                      } else if (state is ErrorAboutState) {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(SnackBar(content: Text(state.msg)));
                      }
                    },
                    child: ButtonWidget(
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                                  title: const Text(
                                    "DELETE ACCOUNT",
                                    style: TextStyle(color: Colors.red),
                                  ),
                                  content:
                                      const Text("Are You Sure Delete Account"),
                                  actions: [
                                    TextButton(
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        child: const Text(
                                          "CANCEL",
                                        )),
                                    TextButton(
                                        onPressed: () {
                                          context
                                              .read<AboutBloc>()
                                              .add(DeleteAccount());
                                        },
                                        child: const Text("DELETE",
                                            style:
                                                TextStyle(color: Colors.red)))
                                  ],
                                ));
                      },
                      text: "DELETE ACCOUNT",
                      color: Colors.red,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
