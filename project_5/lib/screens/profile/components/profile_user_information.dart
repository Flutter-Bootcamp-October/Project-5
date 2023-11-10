import 'package:flex_list/flex_list.dart';
import 'package:flutter/material.dart';

class ProfileUserInformation extends StatelessWidget {
  const ProfileUserInformation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: InkWell(
            onLongPress: () {
              //TODO: CHANGE IMAGE ON LONG PRESS
              print("Change Image");
            },
            child: const CircleAvatar(
              radius: 50,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("{UserName}"),
                  const Text("{About/Bio}"),
                  SizedBox(
                      width: 300,
                      child: FlexList(
                        horizontalSpacing: 4,
                        verticalSpacing: 5,
                        children: const [
                          Text("{Social Media}"),
                          Text("{Social Media}"),
                          Text("{Social Media}"),
                        ],
                      )),
                ],
              ),
              IconButton(
                  onPressed: () {}, icon: const Icon(Icons.edit_outlined)),
            ],
          ),
        ),
        const Divider(
            thickness: .8, indent: 16, endIndent: 16, color: Color(0xffded3fc)),
      ],
    );
  }
}
