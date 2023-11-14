import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

class ProfileDetailRow extends StatelessWidget {
  const ProfileDetailRow({
    Key? key,
    required this.title,
    required this.value,
  }) : super(key: key);

  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200, // Replace with your desired width
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _buildTextColumn(context),
          const SizedBox(width: 10), // Adjust spacing as needed
          const Icon(
            Icons.lock_outline,
            size: 20, // Adjust icon size as needed
          ),
        ],
      ),
    );
  }

  Widget _buildTextColumn(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.subtitle1!.copyWith(
                color: Colors.black, // Replace with your desired color
                fontSize: 14, // Replace with your desired font size
              ),
        ),
        const SizedBox(height: 4), // Adjust spacing as needed
        Text(
          value,
          style: Theme.of(context).textTheme.caption,
        ),
        const SizedBox(height: 4), // Adjust spacing as needed
        Container(
          width: 150, // Replace with your desired width
          child: const Divider(
            thickness: 1.0,
          ),
        ),
      ],
    );
  }
}
