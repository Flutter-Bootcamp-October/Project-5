import 'package:flutter/material.dart';

class TitlesWidget extends StatelessWidget {
  const TitlesWidget({
    super.key,
    required this.titles,
    this.onPressed,
  });
  final String titles;
  final Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            height: 40,
            width: MediaQuery.of(context).size.width * 0.5,
            decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.5),
                borderRadius: const BorderRadius.horizontal(
                    left: Radius.circular(15), right: Radius.circular(15))),
            child: Row(
              children: [
                Text(
                  titles,
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.w600),
                ),
                const Spacer(),
                IconButton(onPressed: onPressed, icon: const Icon(Icons.add))
              ],
            ),
          ),
          const Divider(
            height: 20,
            color: Colors.black,
          ),
        ],
      ),
    );
  }
}
