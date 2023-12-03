import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_5/blocs/post/bloc/post_bloc.dart';
import 'package:project_5/screens/components/button_widget.dart';
import 'package:project_5/screens/components/input_text_fields.dart';

class AddEducationScreen extends StatelessWidget {
  const AddEducationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController graduationController = TextEditingController(),
        universityController = TextEditingController(),
        collegeController = TextEditingController(),
        specializationController = TextEditingController(),
        levelController = TextEditingController();
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
        padding: const EdgeInsets.only(top: 10, bottom: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Add New Education",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
            ),
            const SizedBox(
              height: 10,
            ),
            InputTextFields(
              title: 'Enter university name',
              controller: universityController,
              lines: 1,
            ),
            InputTextFields(
              title: 'Enter college name',
              controller: collegeController,
              lines: 1,
            ),
            InputTextFields(
              title: 'Enter specialization',
              controller: specializationController,
              lines: 1,
            ),
            InputTextFields(
              title: 'Enter level',
              controller: levelController,
              lines: 1,
            ),
            InputTextFields(
              title: 'Enter graduation date',
              controller: graduationController,
              lines: 1,
            ),
            const SizedBox(
              height: 15,
            ),
            BlocListener<PostBloc, PostState>(
              listener: (context, state) {
                if (state is PostEducationState) {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text("education added sucsesfuly")));
                } else {
                  if (state is PostErrorState) {
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text(state.message.toString())));
                  }
                }
              },
              child: ButtonWidget(
                textEntry: 'Add Education',
                onpress: () async {
                  context.read<PostBloc>().add(PostEducationEvent(
                      universityController.text,
                      collegeController.text,
                      specializationController.text,
                      levelController.text,
                      graduationController.text,
                      context));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
