import 'package:cv_app/constentes/colors.dart';
import 'package:cv_app/constentes/sized_box.dart';
import 'package:cv_app/widgets/home_tab_bar/social_media_tab_bar/socialmedia_widget.dart';
import 'package:flutter/material.dart';

class GridViewSocialMedia extends StatelessWidget {
  const GridViewSocialMedia({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      padding: EdgeInsets.only(top: 12),
      crossAxisCount: 4,
      children: [
        SocialMediaWidget(),
      ],
    );
  }
}
