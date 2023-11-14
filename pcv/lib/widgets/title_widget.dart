import 'package:flutter/material.dart';

class TitlesWidget extends StatelessWidget {
  const TitlesWidget({
    super.key,
    required this.titles,
  });
  final String titles;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 40,
            width: MediaQuery.of(context).size.width * 0.4,
            decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.5),
                borderRadius: const BorderRadius.horizontal(
                    left: Radius.circular(15), right: Radius.circular(15))),
            child: Center(
                child: Text(
              titles,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            )),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.48,
            child: const Divider(
              height: 20,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
