import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:pcv/blocs/education_bloc/education_bloc.dart';
import 'package:pcv/views/home/education/add_education.dart';
import 'package:pcv/widgets/title_widget.dart';

class GetEducation extends StatelessWidget {
  const GetEducation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TitlesWidget(
              titles: 'Education', onPressed: () => addEducation(context)),
          BlocBuilder<EducationBloc, EducationState>(
            buildWhen: (oldState, newState) {
              if (newState is ChangeStateEducaion) {
                return false;
              }
              return true;
            },
            builder: (context, state) {
              if (state is GetEducationState) {
                return GridView.count(
                    physics: const NeverScrollableScrollPhysics(),
                    crossAxisCount: 1,
                    childAspectRatio: 5,
                    crossAxisSpacing: 4,
                    mainAxisSpacing: 4,
                    shrinkWrap: true,
                    children: state.education[0].data!
                        .map((e) => Container(
                              decoration: const BoxDecoration(
                                  color: Color(0xffff6700),
                                  borderRadius: BorderRadius.horizontal(
                                      left: Radius.circular(15),
                                      right: Radius.circular(15))),
                              child: ListTile(
                                leading: Text("${e.level}",
                                    style:
                                        const TextStyle(color: Colors.white)),
                                title: Text(
                                  "${e.university}",
                                  style: const TextStyle(color: Colors.white),
                                ),
                                subtitle: Text("${e.specialization}",
                                    style:
                                        const TextStyle(color: Colors.white)),
                                trailing: IconButton(
                                    onPressed: () {
                                      showBottomSheet(
                                          constraints: const BoxConstraints(
                                              maxHeight: 200),
                                          context: context,
                                          builder: (contxt) => AlertDialog(
                                                content: const Text(
                                                    "Do You Want Delete This Education?"),
                                                actions: [
                                                  TextButton(
                                                      onPressed: () {
                                                        Navigator.pop(context);
                                                      },
                                                      child:
                                                          const Text("Cancel")),
                                                  IconButton(
                                                      onPressed: () {
                                                        context
                                                            .read<
                                                                EducationBloc>()
                                                            .add(
                                                                DeleteEducationEvent(
                                                                    id: e.id!));
                                                        Navigator.pop(context);
                                                      },
                                                      icon: const Icon(
                                                        Icons.delete_forever,
                                                        color: Colors.red,
                                                      ))
                                                ],
                                              ));
                                    },
                                    icon: const Icon(Icons.delete)),
                              ),
                            ))
                        .toList());
              }
              return const Center(child: CircularProgressIndicator());
            },
          )
        ],
      ),
    );
  }
}
