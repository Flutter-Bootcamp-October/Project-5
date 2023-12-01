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
        builder: (context, state) {
          if (state is GetSocialState) {
            return GridView.count(
                physics: const NeverScrollableScrollPhysics(),
                childAspectRatio: 2,
                shrinkWrap: true,
                crossAxisCount: 2,
                mainAxisSpacing: 4,
                crossAxisSpacing: 4,
                children: state.social[0].data!
                    .map((e) => Container(
                          decoration: BoxDecoration(
                              color: Colors.grey.shade100.withOpacity(0.9),
                              borderRadius: BorderRadius.circular(10)),
                          child: ListTile(
                            subtitle: Column(
                              children: [
                                Text(
                                  "${e.username}",
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w500),
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
                                context
                                    .read<SocialBloc>()
                                    .add(DeleteSocialEvent(id: e.id!));
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
