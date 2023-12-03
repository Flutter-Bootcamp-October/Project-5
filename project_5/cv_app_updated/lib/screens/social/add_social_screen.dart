import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_5/blocs/post/bloc/post_bloc.dart';
import 'package:project_5/screens/components/button_widget.dart';
import 'package:project_5/screens/components/input_text_fields.dart';

class AddSocialScreen extends StatelessWidget {
  const AddSocialScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController accountusernameController = TextEditingController(),
        socialController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: InkWell(
          onTap: () => Navigator.pop(context),
          child: Icon(
            Icons.arrow_back_ios_new,
            color: Colors.blue.shade900,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 75, bottom: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Add Social account",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
            ),
            const SizedBox(
              height: 15,
            ),
            InputTextFields(
              title: 'Enter username',
              controller: accountusernameController,
              lines: 1,
            ),
            InputTextFields(
              title: 'Enter social media app name',
              controller: socialController,
              lines: 1,
            ),
            const SizedBox(
              height: 15,
            ),
            BlocListener<PostBloc, PostState>(
              listener: (context, state) {
                if (state is PostSocialState) {
                  Navigator.pop(context);
                } else if (state is PostErrorState) {
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(state.message.toString())));
                }
              },
              child: ButtonWidget(
                textEntry: 'Add account',
                onpress: () async {
                  context.read<PostBloc>().add(PostSocialEvent(
                      username: accountusernameController.text,
                      social: socialController.text,
                      context: context));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
