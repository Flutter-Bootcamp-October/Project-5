import 'package:cv_app/constentes/colors.dart';
import 'package:cv_app/models/globals.dart';
import 'package:cv_app/models/social_media/social_media_data_model.dart';
import 'package:flutter/material.dart';

class SocialMediaWidget extends StatefulWidget {
  SocialMediaWidget({
    super.key,
    required this.socialMedia,
  });
  final SocialMediaData socialMedia;
  @override
  State<SocialMediaWidget> createState() => _SocialMediaWidgetState();
}

class _SocialMediaWidgetState extends State<SocialMediaWidget> {
  bool _isSelected = false;
  @override
  Widget build(BuildContext context) {
    return Chip(
      padding: EdgeInsets.all(8),
      backgroundColor: eggShell,
      shadowColor: Colors.black,
      label: Column(
        children: [
          Text(
            widget.socialMedia.username,
            style: TextStyle(fontSize: 16),
          ),
          Text(
            widget.socialMedia.social,
            style: TextStyle(fontSize: 14),
          ),
        ],
      ),
      deleteIcon: Icon(Icons.delete_outline_outlined),
      onDeleted: () {
        setState(() async {
          final result = await network
              .removeSkillsMethod(body: {'id_social': widget.socialMedia.id});
          _isSelected = false;
        });
      },
      deleteIconColor: richBlack,
      deleteButtonTooltipMessage: 'Delete',
    );
  }
}
