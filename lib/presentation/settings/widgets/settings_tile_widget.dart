import 'dart:math';

import 'package:demo/core/colors.dart';
import 'package:demo/core/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SettingsTileWidget extends StatelessWidget {
  const SettingsTileWidget({
    Key? key,
    this.trailing =const  Icon(Icons.keyboard_arrow_right),
    required this.title,
    required this.icon,
    required this.dSize,
    required this.onTap,
  }) : super(key: key);

  final Size dSize;
  final Widget trailing;
  final String title;
  final IconData icon;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: dSize.width,
        padding: const EdgeInsets.only(
          top: 10,
          bottom: 10,
          right: 5,
        ),
        child: Center(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                backgroundColor:
                    Colors.primaries[Random().nextInt(Colors.primaries.length)],
                child: Icon(
                  icon,
                  color: kWhite,
                ),
              ),
              kwidth10,
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      title,
                      style: Theme.of(context).textTheme.displayMedium,
                    ),
                    trailing,
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
