import 'package:cv_app/globals/colors.dart';
import 'package:flutter/material.dart';

class SigninBar extends StatelessWidget {
  const SigninBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 140,
      decoration: const BoxDecoration(
        color: mainColor,
        borderRadius: BorderRadius.only(bottomRight: Radius.circular(50)),
      ),
      child: Column(
        children: [
          const SizedBox(height: 65),
          Row(
            children: [
              const SizedBox(width: 16),
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: ClipOval(
                  child: Container(
                    width: 40,
                    height: 40,
                    color: midColor,
                    child: const Icon(Icons.arrow_back_rounded,
                        color: Colors.white),
                  ),
                ),
              ),
              const SizedBox(width: 24),
              const Text(
                "Create Account",
                style: TextStyle(color: Colors.white, fontSize: 20),
              )
            ],
          ),
        ],
      ),
    );
  }
}
