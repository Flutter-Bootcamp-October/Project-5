import 'package:cv_app/globals/colors.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 8),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Hello Miqdad",
                        style: TextStyle(
                            color: secondaryColor,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "Welcome back!",
                        style: TextStyle(
                            color: mainColor,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Icon(
                    Icons.notifications,
                    color: mainColor,
                  )
                ],
              ),
              const SizedBox(height: 32),
              Container(
                height: 150,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: midColor, borderRadius: BorderRadius.circular(30)),
              ),
              const SizedBox(height: 32),
              const Text(
                "Fill your CV: ",
                style: TextStyle(
                    color: mainColor,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              const SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    FillCV(),
                    FillCV(),
                    FillCV(),
                    FillCV(),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              const Text(
                "Connect with: ",
                style: TextStyle(
                    color: mainColor,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              const ConnectWith(),
              const ConnectWith(),
            ],
          ),
        ),
      ),
    );
  }
}

class ConnectWith extends StatelessWidget {
  const ConnectWith({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Container(
        height: 115,
        width: double.infinity,
        decoration: BoxDecoration(
            color: midColor, borderRadius: BorderRadius.circular(30)),
      ),
    );
  }
}

class FillCV extends StatelessWidget {
  const FillCV({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Container(
        height: 120,
        width: 120,
        decoration: BoxDecoration(
            color: midColor, borderRadius: BorderRadius.circular(30)),
      ),
    );
  }
}
