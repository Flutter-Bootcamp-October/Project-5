import 'package:flutter/material.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 8,
        height: 50,
        elevation: 0,
        color: Colors.amber,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.home_filled)),
            IconButton(
                onPressed: () {}, icon: const Icon(Icons.data_exploration)),
            const SizedBox(width: 24),
            IconButton(
                onPressed: () {}, icon: const Icon(Icons.people_alt_rounded)),
            IconButton(
                onPressed: () {},
                icon: const Icon(Icons.person_pin_circle_rounded)),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.amber,
        elevation: 0,
        child: const Icon(
          Icons.add_circle_outline_sharp,
          size: 35,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
