import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pcv/blocs/about_bloc/about_bloc.dart';
import 'package:pcv/widgets/about_widget.dart';

class AboutData extends StatelessWidget {
  const AboutData({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(top: 8, left: 8, right: 8),
        child: Column(children: [
          BlocBuilder<AboutBloc, AboutState>(
            builder: (context, state) {
              if (state is GetAboutState) {
                return AboutWidget(
                  name: state.about.data!.name,
                  titlePosition: state.about.data?.titlePosition,
                  about: state.about.data?.about,
                  email: state.about.data?.email,
                  phone: state.about.data?.phone,
                  image: state.about.data?.image,
                  birthday: state.about.data?.birthday,
                );
              }
              return Container();
            },
          )
        ]));
  }
}
