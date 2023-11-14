import 'package:flutter/material.dart';

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
// Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 10.0),
//                 child: ListView(
//                   children: [
//                     const SizedBox(height: 30),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         const Text(
//                           "Skills",
//                           style: TextStyle(color: Colors.black, fontSize: 40),
//                         ),
//                         Row(
//                           children: [
//                             IconButton(
//                                 onPressed: () {},
//                                 icon: const Icon(Icons.add)),
//                             IconButton(
//                                 onPressed: () {},
//                                 icon: const Icon(Icons.delete)),
//                           ],
//                         )
//                       ],
//                     ),
//                     SingleChildScrollView(
//                       scrollDirection: Axis.horizontal,
//                       child: Row(
//                           children: List.generate(
//                               userProjects.length,
//                               (index) => Container(
//                                       child: Column(children: [
//                                     Text(
//                                       userProjects[index].name,
//                                       style: const TextStyle(
//                                           color: Colors.amber),
//                                     ),
//                                     Text(
//                                       userProjects[index].description,
//                                       style: const TextStyle(
//                                           color: Colors.amber),
//                                     ),
//                                     Text(
//                                       userProjects[index].state,
//                                       style: const TextStyle(
//                                           color: Colors.amber),
//                                     ),
//                                   ])))),
//                     ),
//                     const Text(
//                       "Education",
//                       style: TextStyle(color: Colors.black, fontSize: 40),
//                     ),
//                     const Text(
//                       "Projects",
//                       style: TextStyle(color: Colors.black, fontSize: 40),
//                     ),
//                   ],
//                 ),