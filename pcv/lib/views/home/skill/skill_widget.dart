import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pcv/blocs/skill_bloc/skill_bloc.dart';
import 'package:pcv/views/home/skill/add_skill.dart';
import 'package:pcv/widgets/title_widget.dart';

class GetSkill extends StatelessWidget {
  const GetSkill({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TitlesWidget(
          titles: 'Skill',
          onPressed: () => addSkill(context),
        ),
        BlocBuilder<SkillBloc, SkillState>(
          builder: (context, state) {
            if (state is GetSkillState) {
              return GridView.count(
                  physics: const NeverScrollableScrollPhysics(),
                  crossAxisCount: 3,
                  childAspectRatio: 2,
                  crossAxisSpacing: 4,
                  mainAxisSpacing: 4,
                  shrinkWrap: true,
                  children: state.data[0].data!
                      .map(
                        (e) => Padding(
                          padding: const EdgeInsets.symmetric(vertical: 4),
                          child: InkWell(
                            onLongPress: () {
                              showBottomSheet(
                                  constraints:
                                      const BoxConstraints(maxHeight: 200),
                                  context: context,
                                  builder: (contxt) => AlertDialog(
                                        content: const Text(
                                            "do you want delete this Skill?"),
                                        actions: [
                                          TextButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                              child: const Text("Cancel")),
                                          IconButton(
                                              onPressed: () {
                                                context.read<SkillBloc>().add(
                                                    DeleteSkill(id: e.id!));
                                                    
                                                Navigator.pop(context);
                                              },
                                              icon: const Icon(
                                                Icons.delete_forever,
                                                color: Colors.red,
                                              ))
                                        ],
                                      ));
                            },
                            child: Container(
                              width: 70,
                              height: 50,
                              decoration: BoxDecoration(
                                  color: const Color(0xffff6700),
                                  borderRadius: BorderRadius.circular(10)),
                              child: Center(
                                child: Text(
                                  "${e.skill}",
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ),
                        ),
                      )
                      .toList());
            }
            return const Center(child: Text("ADD SKill"));
          },
        ),
      ],
    );
  }
}
