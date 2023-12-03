import 'package:cbt_tpa_app/core/constants/theme.dart';
import 'package:flutter/material.dart';

class ButtonCircle extends StatelessWidget {
  final VoidCallback onPressed;
  final Widget child;

  const ButtonCircle({
    super.key,
    required this.onPressed,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      borderRadius: const BorderRadius.all(Radius.circular(50.0)),
      child: Container(
        padding: const EdgeInsets.all(12.0),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(50.0)),
          color: whiteColor,
          border: Border.all(
            color: lightColor,
          ),
        ),
        child: child,
      ),
    );
  }
}
