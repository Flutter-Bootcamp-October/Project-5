import 'package:flutter/material.dart';
import 'package:resume_app/globals/global.dart';
import 'package:resume_app/main.dart';
import 'package:badges/badges.dart' as badges;
import 'package:resume_app/models/social_model.dart';
import 'package:resume_app/services/social_services.dart';
import 'package:resume_app/views/signin_screen.dart';
import 'package:resume_app/views/skills_screen.dart';

bool showDelete = false;

class SocialWidget extends StatefulWidget {
  const SocialWidget({
    super.key,
    required this.social,
  });
  final Social social;

  @override
  State<SocialWidget> createState() => SocialWidgetState();
}

class SocialWidgetState extends State<SocialWidget> {
  Map<String, String> mediaPaths = {
    'facebook':
        'https://upload.wikimedia.org/wikipedia/commons/thumb/f/fb/Facebook_icon_2013.svg/300px-Facebook_icon_2013.svg.png',
    'youtube': 'https://cdn-icons-png.flaticon.com/256/1384/1384060.png',
    'whatsapp':
        'https://static-00.iconduck.com/assets.00/whatsapp-icon-2048x2048-wo3g2qq0.png',
    'instagram':
        'https://upload.wikimedia.org/wikipedia/commons/thumb/5/58/Instagram-Icon.png/1024px-Instagram-Icon.png',
    'twitter':
        'https://www.veeforu.com/wp-content/uploads/2023/07/Twitter-new-cross-mark-Icon-PNG-X-1024x576.jpg',
    'tiktok':
        'https://images.rawpixel.com/image_png_800/cHJpdmF0ZS9sci9pbWFnZXMvd2Vic2l0ZS8yMDIyLTA1L2pvYjkwOC1jYS03Ml8xLnBuZw.png',
    'telegram':
        'https://upload.wikimedia.org/wikipedia/commons/thumb/8/82/Telegram_logo.svg/2048px-Telegram_logo.svg.png',
    'snapchat':
        'https://pbs.twimg.com/profile_images/1607410723227054082/RaQz46j7_400x400.jpg',
    'other': ""
  };

  @override
  Widget build(BuildContext context) {
    String imagePath = mediaPaths[widget.social.social]!;
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: InkWell(
        onTap: () async {
          try {
            await SocialServ().deleteSocial(
                token: getToken(), socialID: widget.social.id!.toString());
            userSocials = await SocialServ().getSocials(token: getToken());
            showDelete = false;
            context
                .findAncestorStateOfType<SkillScreenState>()!
                .setState(() {});
          } on FormatException catch (error) {
            if (error.message.toString().contains("token") ||
                error.message.toString().contains("Token")) {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => const SignInScreen()),
                  ModalRoute.withName("/screen"));
            }
            ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(error.message.toString())));
          }
        },
        child: badges.Badge(
          badgeStyle: badges.BadgeStyle(
              badgeColor: showDelete ? Colors.grey : Colors.transparent),
          badgeContent: showDelete
              ? const Icon(
                  Icons.remove,
                  color: Colors.white,
                )
              : null,
          child: GestureDetector(
            onLongPress: () {
              showDelete = true;
              setState(() {});
            },
            child: Column(
              children: [
                Container(
                    decoration: BoxDecoration(
                        color: Colors.amber,
                        borderRadius: BorderRadius.circular(100)),
                    width: 120,
                    height: 120,
                    child: Image.network(imagePath, fit: BoxFit.cover)),
                const SizedBox(height: 5),
                Center(
                  child: Text(
                    widget.social.username,
                    style: const TextStyle(color: Colors.black, fontSize: 16),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  String getToken() {
    return prefs.getString("token") ?? "";
  }
}
