import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pcv/blocs/social_bloc/social_bloc.dart';
import 'package:pcv/widgets/text_field_widget.dart';
import '../../../widgets/button_widget.dart';

Future<void> addSocial(BuildContext context) {
  const List<String> socialList = <String>[
    'facebook',
    'youtube',
    'whatsapp',
    'instagram',
    'twitter',
    'tiktok',
    'telegram',
    'snapchat',
    'other'
  ];
  String dropdownValue = socialList.first;
  final usernameController = TextEditingController();
  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return BlocListener<SocialBloc, SocialState>(
        listener: (context, state) {
          if (state is ErrorSocialState) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(state.msg)));
          }
        },
        child: AlertDialog(
          title: const Text('Add Project'),
          content: Column(
            children: [
              TextFieldWidget(
                text: 'name',
                obscure: false,
                controller: usernameController,
              ),
              BlocBuilder<SocialBloc, SocialState>(
                builder: (context, state) {
                  if (state is ChangeState) {
                    return DropdownMenu<String>(
                      width: 250,
                      inputDecorationTheme: InputDecorationTheme(
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20))),
                      initialSelection: socialList.first,
                      onSelected: (String? value) {
                        context
                            .read<SocialBloc>()
                            .add(ChangeStateSocialEvent(state: value!));
                        dropdownValue = state.state;
                      },
                      dropdownMenuEntries: socialList
                          .map<DropdownMenuEntry<String>>((String value) {
                        return DropdownMenuEntry(value: value, label: value);
                      }).toList(),
                    );
                  }
                  return DropdownMenu<String>(
                    width: 250,
                    inputDecorationTheme: InputDecorationTheme(
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20))),
                    initialSelection: socialList.first,
                    onSelected: (String? value) {
                      context
                          .read<SocialBloc>()
                          .add(ChangeStateSocialEvent(state: value!));
                    },
                    dropdownMenuEntries: socialList
                        .map<DropdownMenuEntry<String>>((String value) {
                      return DropdownMenuEntry(value: value, label: value);
                    }).toList(),
                  );
                },
              ),
              ButtonWidget(
                onPressed: () async {
                  context.read<SocialBloc>().add(AddSocialEvent(
                      userName: usernameController.text,
                      social: dropdownValue));
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
