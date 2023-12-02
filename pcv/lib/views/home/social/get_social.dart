import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pcv/blocs/social_bloc/social_bloc.dart';
import 'package:pcv/views/home/social/add_social.dart';
import 'package:pcv/widgets/title_widget.dart';

class GetSocial extends StatelessWidget {
  GetSocial({super.key});

  final socialList = <String>[
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

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      TitlesWidget(
        titles: 'Social',
        onPressed: () => addSocial(context),
      ),
      BlocBuilder<SocialBloc, SocialState>(
        buildWhen: (oldState, newState) {
          if (newState is ChangeState) {
            return false;
          }
          return true;
        },
        builder: (context, state) {
          if (state is GetSocialState) {
            return GridView.count(
                physics: const NeverScrollableScrollPhysics(),
                childAspectRatio: 1.7,
                shrinkWrap: true,
                crossAxisCount: 2,
                mainAxisSpacing: 4,
                crossAxisSpacing: 4,
                children: state.social[0].data!
                    .map((e) => Container(
                          decoration: BoxDecoration(
                              color: const Color(0xffff6700),
                              borderRadius: BorderRadius.circular(10)),
                          child: ListTile(
                            subtitle: Column(
                              children: [
                                Text(
                                  "${e.username}",
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white),
                                ),
                                Image.asset(
                                  "assets/${e.social}.png",
                                  cacheHeight: 50,
                                  cacheWidth: 50,
                                ),
                              ],
                            ),
                            trailing: IconButton(
                              icon: const Icon(Icons.delete),
                              onPressed: () {
                                showBottomSheet(
                                    constraints:
                                        const BoxConstraints(maxHeight: 200),
                                    context: context,
                                    builder: (contxt) => AlertDialog(
                                          content: const Text(
                                              "Do You Want Delete This Project?"),
                                          actions: [
                                            TextButton(
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                },
                                                child: const Text("Cancel")),
                                            IconButton(
                                                onPressed: () {
                                                  context
                                                      .read<SocialBloc>()
                                                      .add(DeleteSocialEvent(
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
                            ),
                          ),
                        ))
                    .toList());
          }
          return const SizedBox();
        },
      )
    ]);
  }
}
