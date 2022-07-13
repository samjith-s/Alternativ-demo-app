import 'package:demo/core/colors.dart';
import 'package:flutter/material.dart';

class AnimationScreen extends StatefulWidget {
  const AnimationScreen({Key? key}) : super(key: key);

  @override
  State<AnimationScreen> createState() => _AnimationScreenState();
}

class _AnimationScreenState extends State<AnimationScreen> {
  bool isSmall = true;
  void animateWidget() {
    setState(() {
      isSmall = !isSmall;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GestureDetector(
          onTap: animateWidget,
          child: AnimatedSize(
            curve: Curves.bounceIn,
            duration: const Duration(milliseconds: 1000),
            child: CircleAvatar(
              radius: isSmall ? 50 : 100,
              backgroundColor: primary,
              child: const Icon(
                Icons.back_hand,
                color: kWhite,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
