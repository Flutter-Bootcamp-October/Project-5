//The about api and education api it will be here in this screen

import 'package:cv_application_api/constant/constant.dart';
import 'package:cv_application_api/model/user_info.dart';
import 'package:cv_application_api/pages/update_info_user.dart';
import 'package:cv_application_api/services/api/user_info.dart';
import 'package:cv_application_api/widgets/custom_widget_for_all_screens/normal_text.dart';
import 'package:cv_application_api/widgets/custom_widget_for_all_screens/title.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  UserInfo? user;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUserInfoMethode();
  }

  Future<UserInfo> getUserInfoMethode() async {
    final UserInfo? response = await getUserInfo(context: context);
    print(response!.data!.name);
    user = response;
    setState(() {});
    return response;
  }

  @override
  Widget build(BuildContext context) {
    String title = '';
    return Scaffold(
      backgroundColor: Colors.transparent,
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: SafeArea(
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: const EdgeInsets.only(top: 100),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: 530,
                      width: 300,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: app2DarkGreenTrans),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                const TitleOfScreen(
                                  title: 'My Account',
                                  titleFontSize: 30,
                                  titleletterSpacing: 3,
                                  titlefontWeight: FontWeight.w300,
                                  titleColor: app3DarkGreen,
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 5, left: 40),
                                  child: IconButton(
                                      onPressed: () {
                                        Navigator.push(context,
                                            MaterialPageRoute(
                                                builder: (context) {
                                          return UpdateInfoUser();
                                        }));
                                      },
                                      icon: const Icon(
                                        Icons.mode_edit_outline_outlined,
                                        color: app3DarkGreen,
                                      )),
                                )
                              ],
                            ),
                            height14,
                            const TitleOfScreen(
                              title: 'Name :',
                              titleFontSize: 18,
                              titleletterSpacing: 0,
                              titlefontWeight: FontWeight.w300,
                              titleColor: appWhite,
                            ),
                            height4,
                            NormalText(
                              title: user!.data!.name!,
                              titleFontSize: 15,
                              titleletterSpacing: 0,
                              titlefontWeight: FontWeight.w300,
                              titleColor: appWhite,
                            ),
                            height14,
                            const TitleOfScreen(
                              title: 'Email :',
                              titleFontSize: 18,
                              titleletterSpacing: 0,
                              titlefontWeight: FontWeight.w300,
                              titleColor: appWhite,
                            ),
                            height4,
                            NormalText(
                              title: user!.data!.email!,
                              titleFontSize: 15,
                              titleletterSpacing: 0,
                              titlefontWeight: FontWeight.w300,
                              titleColor: appWhite,
                            ),
                            height14,
                            const TitleOfScreen(
                              title: 'Position :',
                              titleFontSize: 18,
                              titleletterSpacing: 0,
                              titlefontWeight: FontWeight.w300,
                              titleColor: appWhite,
                            ),
                            height4,
                            const NormalText(
                              title: 'user!.data!.titlePosition!',
                              titleFontSize: 15,
                              titleletterSpacing: 0,
                              titlefontWeight: FontWeight.w300,
                              titleColor: appWhite,
                            ),
                            height14,
                            const TitleOfScreen(
                              title: 'Phone Number :',
                              titleFontSize: 18,
                              titleletterSpacing: 0,
                              titlefontWeight: FontWeight.w300,
                              titleColor: appWhite,
                            ),
                            height4,
                            NormalText(
                              title: user!.data!.phone!,
                              titleFontSize: 15,
                              titleletterSpacing: 0,
                              titlefontWeight: FontWeight.w300,
                              titleColor: appWhite,
                            ),
                            height14,
                            const TitleOfScreen(
                              title: 'Location :',
                              titleFontSize: 18,
                              titleletterSpacing: 0,
                              titlefontWeight: FontWeight.w300,
                              titleColor: appWhite,
                            ),
                            height4,
                            const NormalText(
                              title: 'user!.data!.location!',
                              titleFontSize: 15,
                              titleletterSpacing: 0,
                              titlefontWeight: FontWeight.w300,
                              titleColor: appWhite,
                            ),
                            height14,
                            const TitleOfScreen(
                              title: 'Birthday :',
                              titleFontSize: 18,
                              titleletterSpacing: 0,
                              titlefontWeight: FontWeight.w300,
                              titleColor: appWhite,
                            ),
                            height4,
                            const NormalText(
                              title: 'user!.data!.birthday!',
                              titleFontSize: 15,
                              titleletterSpacing: 0,
                              titlefontWeight: FontWeight.w300,
                              titleColor: appWhite,
                            ),
                            height14,
                            const TitleOfScreen(
                              title: 'About :',
                              titleFontSize: 18,
                              titleletterSpacing: 0,
                              titlefontWeight: FontWeight.w300,
                              titleColor: appWhite,
                            ),
                            height4,
                            if (user?.data?.about == null)
                              NormalText(
                                title: title ?? user!.data!.about!,
                                titleFontSize: 15,
                                titleletterSpacing: 0,
                                titlefontWeight: FontWeight.w300,
                                titleColor: appWhite,
                              ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          )),
    );
  }
}

            // if (user?.data?.id != null)
            //   CardInfor(
            //     user: user!,
            //   )


// class CardInfor extends StatelessWidget {
//   const CardInfor({super.key, required this.user});
//   final UserInfo user;

//   @override
//   Widget build(BuildContext context) {
//     return Text(user.data!.name.toString());
//   }
// }


// FutureBuilder(
//             future: getUserInfo(),
//             builder: (context, snapshot) {
//               if (snapshot.hasData) {
//                 return SizedBox(
//                   height: MediaQuery.of(context).size.height,
//                   width: MediaQuery.of(context).size.width,
//                   child: Padding(
//                     padding: const EdgeInsets.only(top: 100),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.center,
//                       children: [
//                         Container(
//                           height: 530,
//                           width: 300,
//                           decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(20),
//                               color: app2DarkGreenTrans),
//                           child: Padding(
//                             padding: const EdgeInsets.symmetric(
//                                 vertical: 10, horizontal: 10),
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Row(
//                                   children: [
//                                      TitleOfScreen(
//                                       title: 'My Account',
//                                       titleFontSize: 30,
//                                       titleletterSpacing: 3,
//                                       titlefontWeight: FontWeight.w300,
//                                       titleColor: app3DarkGreen,
//                                     ),
//                                     Padding(
//                                       padding:  EdgeInsets.only(
//                                           top: 5, left: 40),
//                                       child: IconButton(
//                                           onPressed: () {
//                                             Navigator.push(context,
//                                                 MaterialPageRoute(
//                                                     builder: (context) {
//                                               return UpdateInfoUser(

//                                               );
//                                             }));
//                                           },
//                                           icon: const Icon(
//                                             Icons.mode_edit_outline_outlined,
//                                             color: app3DarkGreen,
//                                           )),
//                                     )
//                                   ],
//                                 ),
//                                 height14,
//                                 const TitleOfScreen(
//                                   title: 'Name :',
//                                   titleFontSize: 18,
//                                   titleletterSpacing: 0,
//                                   titlefontWeight: FontWeight.w300,
//                                   titleColor: appWhite,
//                                 ),
//                                 height4,
//                                 NormalText(
//                                   title: snapshot.data!.data!.name!,
//                                   titleFontSize: 15,
//                                   titleletterSpacing: 0,
//                                   titlefontWeight: FontWeight.w300,
//                                   titleColor: appWhite,
//                                 ),
//                                 height14,
//                                 const TitleOfScreen(
//                                   title: 'Email :',
//                                   titleFontSize: 18,
//                                   titleletterSpacing: 0,
//                                   titlefontWeight: FontWeight.w300,
//                                   titleColor: appWhite,
//                                 ),
//                                 height4,
//                                 NormalText(
//                                   title: snapshot.data!.data!.email!,
//                                   titleFontSize: 15,
//                                   titleletterSpacing: 0,
//                                   titlefontWeight: FontWeight.w300,
//                                   titleColor: appWhite,
//                                 ),
//                                 height14,
//                                 const TitleOfScreen(
//                                   title: 'Position :',
//                                   titleFontSize: 18,
//                                   titleletterSpacing: 0,
//                                   titlefontWeight: FontWeight.w300,
//                                   titleColor: appWhite,
//                                 ),
//                                 height4,
//                                 // NormalText(
//                                 //   title: snapshot.data!.data!.titlePosition!,
//                                 //   titleFontSize: 15,
//                                 //   titleletterSpacing: 0,
//                                 //   titlefontWeight: FontWeight.w300,
//                                 //   titleColor: appWhite,
//                                 // ),
//                                 height14,
//                                 const TitleOfScreen(
//                                   title: 'Phone Number :',
//                                   titleFontSize: 18,
//                                   titleletterSpacing: 0,
//                                   titlefontWeight: FontWeight.w300,
//                                   titleColor: appWhite,
//                                 ),
//                                 height4,
//                                 NormalText(
//                                   title: snapshot.data!.data!.phone!,
//                                   titleFontSize: 15,
//                                   titleletterSpacing: 0,
//                                   titlefontWeight: FontWeight.w300,
//                                   titleColor: appWhite,
//                                 ),
//                                 height14,
//                                 const TitleOfScreen(
//                                   title: 'Location :',
//                                   titleFontSize: 18,
//                                   titleletterSpacing: 0,
//                                   titlefontWeight: FontWeight.w300,
//                                   titleColor: appWhite,
//                                 ),
//                                 height4,
//                                 // NormalText(
//                                 //   title: snapshot.data!.data!.location!,
//                                 //   titleFontSize: 15,
//                                 //   titleletterSpacing: 0,
//                                 //   titlefontWeight: FontWeight.w300,
//                                 //   titleColor: appWhite,
//                                 // ),
//                                 height14,
//                                 const TitleOfScreen(
//                                   title: 'Birthday :',
//                                   titleFontSize: 18,
//                                   titleletterSpacing: 0,
//                                   titlefontWeight: FontWeight.w300,
//                                   titleColor: appWhite,
//                                 ),
//                                 height4,
//                                 // NormalText(
//                                 //   title: snapshot.data!.data!.name!,
//                                 //   titleFontSize: 15,
//                                 //   titleletterSpacing: 0,
//                                 //   titlefontWeight: FontWeight.w300,
//                                 //   titleColor: appWhite,
//                                 // ),
//                                 height14,
//                                 const TitleOfScreen(
//                                   title: 'About :',
//                                   titleFontSize: 18,
//                                   titleletterSpacing: 0,
//                                   titlefontWeight: FontWeight.w300,
//                                   titleColor: appWhite,
//                                 ),
//                                 height4,
//                                 // NormalText(
//                                 //   title: snapshot.data!.data!.name!,
//                                 //   titleFontSize: 15,
//                                 //   titleletterSpacing: 0,
//                                 //   titlefontWeight: FontWeight.w300,
//                                 //   titleColor: appWhite,
//                                 // ),
//                               ],
//                             ),
//                           ),
//                         )
//                       ],
//                     ),
//                   ),
//                 );
//               }
//               return Text(snapshot.connectionState.toString());
//             },
//           ),
