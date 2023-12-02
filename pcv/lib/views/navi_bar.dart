// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pcv/blocs/page_bloc/page_bloc.dart';
import 'package:pcv/views/home/home_screen.dart';
import 'package:pcv/views/home/about/profile.dart';
import 'package:pcv/views/home/user.dart';

class NaviBar extends StatelessWidget {
  NaviBar({super.key});
  final List page = [
    const HomeScreen(),
    const UserScreen(),
    const ProfileScreen()
  ];
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PageBloc, PageState>(
      builder: (context, state) {
        if (state is ChangePageState) {
          return Scaffold(
            bottomNavigationBar: NavigationBar(
                height: 50,
                labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
                indicatorColor: const Color(0xffff6700),
                backgroundColor: const Color.fromARGB(255, 255, 126, 40),
                onDestinationSelected: (int page) {
                  context.read<PageBloc>().add(ChangePageEvent(index: page));
                },
                selectedIndex: state.index,
                destinations: const [
                  NavigationDestination(
                    selectedIcon: Icon(
                      Icons.home,
                      color: Colors.white,
                    ),
                    icon: Icon(
                      Icons.home_outlined,
                      color: Colors.white,
                    ),
                    label: "",
                  ),
                  NavigationDestination(
                    selectedIcon: Icon(
                      Icons.group,
                      color: Colors.white,
                    ),
                    icon: Icon(
                      Icons.group_outlined,
                      color: Colors.white,
                    ),
                    label: 'User',
                  ),
                  NavigationDestination(
                    selectedIcon: Icon(
                      Icons.person,
                      color: Colors.white,
                    ),
                    icon: Icon(
                      Icons.person_outline,
                      color: Colors.white,
                    ),
                    label: 'profile',
                  ),
                ]),
            body: page[state.index],
          );
        }
        return Scaffold(
          bottomNavigationBar: NavigationBar(
              indicatorColor: const Color(0xffff6700),
              surfaceTintColor: Colors.white,
              backgroundColor: const Color.fromARGB(255, 251, 126, 42),
              onDestinationSelected: (int page) {
                context.read<PageBloc>().add(ChangePageEvent(index: page));
              },
              selectedIndex: index,
              destinations: const [
                NavigationDestination(
                  selectedIcon: Icon(
                    Icons.home,
                    color: Colors.white,
                  ),
                  icon: Icon(
                    Icons.home_outlined,
                    color: Colors.white,
                  ),
                  label: 'Home',
                ),
                NavigationDestination(
                  selectedIcon: Icon(Icons.group),
                  icon: Icon(Icons.group_outlined),
                  label: 'User',
                ),
                NavigationDestination(
                  selectedIcon: Icon(Icons.person),
                  icon: Icon(Icons.person_outline),
                  label: 'profile',
                ),
              ]),
          body: page[index],
        );
      },
    );
  }
}
