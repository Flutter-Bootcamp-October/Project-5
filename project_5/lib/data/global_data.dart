import 'package:flutter/material.dart';
import 'package:project_5/main.dart';

bool isDarkTheme = pref.getTheme();
String placeHolderImage =
    "https://upload.wikimedia.org/wikipedia/commons/9/99/Sample_User_Icon.png";
List imgs = [];
final List<Map> socialMediaICons = [
  {"facebook": "https://www.facebook.com/images/fb_icon_325x325.png"},
  {
    "youtube":
        "https://play-lh.googleusercontent.com/lMoItBgdPPVDJsNOVtP26EKHePkwBg-PkuY9NOrc-fumRtTFP4XhpUNk_22syN4Datc=w600-h300-pc0xffffff-pd"
  },
  {
    "whatsapp":
        "https://upload.wikimedia.org/wikipedia/commons/thumb/6/6b/WhatsApp.svg/800px-WhatsApp.svg.png"
  },
  {"instagram": "https://www.unipile.com/wp-content/uploads/2022/09/logo_instagram.png"},
  {"twitter": "https://www.freepnglogos.com/uploads/twitter-x-logo-png/twitter-x-logo-png-9.png"},
  {
    "tiktok":
        "https://www.investopedia.com/thmb/vE2Lmd5C8dUW_7G75XDyKzQDc6A=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/tiktok-b003064e1dfa4459bd31c37e7db390a1.jpg"
  },
  {
    "telegram":
        "https://upload.wikimedia.org/wikipedia/commons/thumb/8/82/Telegram_logo.svg/2048px-Telegram_logo.svg.png"
  },
  {"snapchat": "https://digitallegacyassociation.org/wp-content/uploads/2018/09/Snapchat.jpg"},
  {
    "other":
        "https://banner2.cleanpng.com/20180629/wxr/kisspng-computer-icons-download-clip-art-help-other-5b36b2179a9dc9.4713445515303111916333.jpg"
  },
];
List<Map> iconsList = const [
  {
    "snapchat": Icon(Icons.snapchat),
  },
  {
    "telegram": Icon(Icons.telegram),
  },
  {
    "facebook": Icon(Icons.facebook),
  },
  {
    "tiktok": Icon(Icons.tiktok),
  },
  {
    "other": Icon(Icons.question_mark),
  },
  {
    "youtube": Icon(Icons.play_arrow),
  },
  {
    "instagram": Icon(Icons.camera),
  },
  {
    "twitter": Icon(Icons.flutter_dash_outlined),
  },
  {
    "whatsapp": Icon(Icons.call),
  },
];
