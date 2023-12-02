import 'package:cv_app/globals/colors.dart';
import 'package:flutter/material.dart';

class NavBarItem extends StatelessWidget {
  const NavBarItem({
    super.key,
    required this.onPressed,
    required this.selectedIcon,
    required this.unselectedIcon,
    required this.isSelected,
  });
  final Function() onPressed;
  final IconData selectedIcon;
  final IconData unselectedIcon;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: Icon(
        isSelected ? selectedIcon : unselectedIcon,
        color: isSelected ? Colors.white : midColor,
      ),
    );
  }
}
