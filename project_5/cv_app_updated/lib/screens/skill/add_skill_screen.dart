import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_5/blocs/post/bloc/post_bloc.dart';
import 'package:project_5/screens/components/button_widget.dart';
import 'package:project_5/screens/components/input_text_fields.dart';

class AddSkillScreen extends StatelessWidget {
  const AddSkillScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController skillController = TextEditingController();

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
              "Add New Skill",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
            ),
            const SizedBox(
              height: 10,
            ),
            InputTextFields(
              title: 'Enter skill name',
              controller: skillController,
              lines: 1,
            ),
            const SizedBox(
              height: 15,
            ),
            BlocListener<PostBloc, PostState>(
              listener: (context, state) {
                if (state is PostSkillState) {
                  ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("skill added sucsefuly")));
                } else if (state is PostErrorState) {
                  ScaffoldMessenger.of(context)
                      .showSnackBar(SnackBar(content: Text(state.message)));
                }
              },
              child: ButtonWidget(
                textEntry: 'Add Skill',
                onpress: () async {
                  context.read<PostBloc>().add(PostSkillEvent(
                      context: context, skill: skillController.text));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
