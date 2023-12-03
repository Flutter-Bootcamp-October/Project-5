import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_5/blocs/post/bloc/post_bloc.dart';
import 'package:project_5/screens/about/component/delete_button.dart';
import 'package:project_5/screens/auth/signin_screen.dart';
import 'package:project_5/screens/components/input_text_fields.dart';

class AboutScreen extends StatefulWidget {
  const AboutScreen({super.key});

  @override
  State<AboutScreen> createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  TextEditingController userController = TextEditingController(text: ""),
      titleController = TextEditingController(text: ""),
      phoneController = TextEditingController(text: ""),
      locationController = TextEditingController(text: ""),
      birthdayController = TextEditingController(text: ""),
      aboutController = TextEditingController(text: "");

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: InkWell(
              onTap: () => Navigator.pop(context),
              child: const Icon(
                Icons.arrow_back_ios_new,
                color: Colors.black,
              ),
            ),
            actions: [
              BlocListener<PostBloc, PostState>(
                  listener: (context, state) {
                    if (state is PostErrorState) {
                      ScaffoldMessenger.of(context)
                          .showSnackBar(SnackBar(content: Text(state.message)));
                    } else if (state is PostAboutState) {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text("Your information is up-to-date")));
                    }
                  },
                  child: IconButton(
                    onPressed: () async {
                      context.read<PostBloc>().add(PostUpdateEvent(
                            user: userController.text,
                            title: titleController.text,
                            phone: phoneController.text,
                            location: locationController.text,
                            birthday: birthdayController.text,
                            about: aboutController.text,
                            context: this.context,
                          ));
                    },
                    icon: const Icon(
                      Icons.edit,
                      color: Colors.black,
                    ),
                  )),
              const SizedBox(
                width: 15,
              ),
            ],
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              InputTextFields(
                lines: 1,
                controller: userController,
                title: 'name',
              ),
              InputTextFields(
                lines: 1,
                controller: titleController,
                title: 'title position',
              ),
              InputTextFields(
                lines: 1,
                controller: phoneController,
                title: 'phone',
              ),
              InputTextFields(
                lines: 1,
                controller: locationController,
                title: 'location',
              ),
              InputTextFields(
                lines: 1,
                controller: birthdayController,
                title: 'birthday',
              ),
              InputTextFields(
                lines: 1,
                controller: aboutController,
                title: 'about',
              ),
              const SizedBox(
                height: 10,
              ),
              DeleteButtonWidget(
                  textEntry: "Delete Account",
                  onpress: () async {
                    // UserDeleteMethods delete = UserDeleteMethods();

                    // await delete.deleteAccount(
                    //     aboutId: widget.about.data.data[index].id);
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SigninScreen()),
                        (route) => false);
                  }),
            ],
          )),
    );
  }
}
