import 'package:flutter/material.dart';

class WelcomeBack extends StatelessWidget {
  const WelcomeBack({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height * 0.45;
    return Stack(
      children: [
        Container(
          width: width,
          height: height,
          decoration: const BoxDecoration(
            color: Color(0xff0c3a2d),
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(50),
            ),
          ),
        ),
        Opacity(
          opacity: 0.15,
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
              bottomRight: Radius.circular(50),
            ),
            child: SizedBox(
              width: width,
              height: height,
              child: Image.asset(
                "assets\\welcome.jpg",
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        SizedBox(
          width: width,
          height: height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ClipOval(
                child: Container(
                  width: 60,
                  height: 60,
                  color: const Color(0xffffb902),
                  child: const Icon(
                    Icons.bubble_chart_outlined,
                    size: 40,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                "Welcome Back",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
