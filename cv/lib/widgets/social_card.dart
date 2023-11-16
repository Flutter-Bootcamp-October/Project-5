import 'package:cv/widgets/single_social.dart';
import 'package:flutter/material.dart';

class SocailCard extends StatefulWidget {
   SocailCard({super.key});


  @override
  State<SocailCard> createState() => _SocailCardState();
}


class _SocailCardState extends State<SocailCard> {
  
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
      ),
      width: MediaQuery.of(context).size.width - 32,
      height: MediaQuery.of(context).size.height * 0.2,
      child: const Padding(
        padding: EdgeInsets.only(left: 16, top: 16, right: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            singleSocial(
              SocailName: "socail",
              userName: " userName",
            ),
            singleSocial(
              SocailName: "socail",
              userName: " userName",
            ),
            singleSocial(
              SocailName: "socail",
              userName: " userName",
            ),
          ],
        ),
      ),
    );
  }
}
