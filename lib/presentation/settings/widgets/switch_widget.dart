import 'package:demo/core/colors.dart';
import 'package:flutter/material.dart';

class SwitchWidget extends StatelessWidget {
  const SwitchWidget({Key? key, required this.onChanged,required this.valueListenable}) : super(key: key);
  final void Function(bool) onChanged;
  final ValueNotifier<bool> valueListenable;
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: valueListenable,
      builder: (BuildContext context, bool value, Widget? child) {
        return SizedBox(
          width: 30,
          child: Switch(
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            value: value,
            onChanged: onChanged,
            trackColor: MaterialStateProperty.all(kBlack),
            activeColor: primary,
          ),
        );
      },
    );
  }
}

ValueNotifier<bool> isNotificationON = ValueNotifier(true);
