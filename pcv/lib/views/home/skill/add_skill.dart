import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pcv/blocs/skill_bloc/skill_bloc.dart';
import 'package:pcv/widgets/button_widget.dart';
import 'package:pcv/widgets/text_field_widget.dart';

Future<void> addSkill(BuildContext context) {
  final skillController = TextEditingController();
  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        onDoubleTap: () => Navigator.pop(context),
        child: AlertDialog(
          title: const Text('Add Skill'),
          content: Column(
            children: [
              TextFieldWidget(
                text: 'skill',
                obscure: false,
                controller: skillController,
              ),
              ButtonWidget(
                onPressed: () async {
                  context
                      .read<SkillBloc>()
                      .add(AddSkill(skill: skillController.text));
                  Navigator.of(context).pop();
                },
                text: 'Add',
              ),
            ],
          ),
        ),
      );
    },
  );
}
