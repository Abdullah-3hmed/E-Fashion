import 'package:flutter/material.dart';

class AccountCustomSwitch extends StatelessWidget {
  const AccountCustomSwitch({
    super.key,
    required this.switchValue,
    required this.onChanged,
    required this.enabledIcon,
    required this.disabledIcon,
    this.enabledIconColor,
    this.disabledIconColor,
    this.switchActiveColor,
  });

  final bool switchValue;
  final void Function(bool) onChanged;
  final IconData enabledIcon;
  final IconData disabledIcon;
  final Color? enabledIconColor;
  final Color? disabledIconColor;
  final Color? switchActiveColor;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Switch(
          activeColor: switchActiveColor,
          value: switchValue,
          onChanged: onChanged,
        ),
        switchValue
            ? Positioned(
                left: 10.0,
                top: 16.0,
                child: Icon(
                  disabledIcon,
                  color: disabledIconColor,
                  size: 16.0,
                ),
              )
            : Positioned(
                top: 16.0,
                right: 10.0,
                child: Icon(
                  enabledIcon,
                  color: enabledIconColor,
                  size: 16.0,
                ),
              ),
      ],
    );
  }
}
