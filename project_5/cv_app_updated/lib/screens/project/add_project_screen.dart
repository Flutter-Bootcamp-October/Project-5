import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_5/blocs/post/bloc/post_bloc.dart';
import 'package:project_5/screens/components/button_widget.dart';
import 'package:project_5/screens/components/input_text_fields.dart';

class AddProjectScreen extends StatelessWidget {
  const AddProjectScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController projectNameController = TextEditingController(),
        stateController = TextEditingController(),
        descriptionController = TextEditingController();
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
              "Add New Project",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
            ),
            const SizedBox(
              height: 10,
            ),
            InputTextFields(
              title: 'Enter project name',
              controller: projectNameController,
              lines: 1,
            ),
            InputTextFields(
              title: 'Enter project description',
              controller: descriptionController,
              lines: 1,
            ),
            InputTextFields(
              title: 'Enter project state',
              controller: stateController,
              lines: 1,
            ),
            const SizedBox(
              height: 15,
            ),
            BlocListener<PostBloc, PostState>(
              listener: (context, state) {
                // add this states to bloc builder on listview
                if (state is PostProjectState) {
                  Navigator.pop(context);
                } else if (state is PostErrorState) {
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(state.message.toString())));
                }
              },
              child: ButtonWidget(
                textEntry: 'Add project',
                onpress: () async {
                  // add project api function

                  context.read<PostBloc>().add(PostProjectEvent(
                      projectName: projectNameController.text,
                      projectDescription: descriptionController.text,
                      projectState: stateController.text,
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
