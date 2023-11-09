import 'package:timelines/timelines.dart';
import 'package:flutter/material.dart';

class Skills extends StatelessWidget {
  const Skills({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Timeline.tileBuilder(
        builder: TimelineTileBuilder.fromStyle(
          contentsBuilder: (context, index) => Padding(
            padding: const EdgeInsets.all(24.0),
            child: Text('Timeline Event $index'),
          ),
          itemCount: 3,
        ),
      ),
    );
  }
}
