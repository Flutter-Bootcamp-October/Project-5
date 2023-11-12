import 'package:cv_app/models/social_media/social_media_data_model.dart';
import 'package:cv_app/models/social_media/social_media_model.dart';
import 'package:cv_app/widgets/home_tab_bar/social_media_tab_bar/socialmedia_widget.dart';
import 'package:flutter/material.dart';

class GridViewSocialMedia extends StatelessWidget {
  const GridViewSocialMedia({
    super.key, required SocialMediaData socialmedia, 
  });

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      padding: const EdgeInsets.only(top: 12),
      crossAxisCount: 1,
      children:  [
        SocialMediaWidget(),
      ],
    );
  }
}
