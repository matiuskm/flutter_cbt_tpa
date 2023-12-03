import 'package:cbt_tpa_app/core/constants/theme.dart';
import 'package:flutter/material.dart';

class DotIndicator extends StatelessWidget {
  const DotIndicator({
    Key? key,
    this.isActive = false,
  }) : super(key: key);

  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      height: 12,
      width: isActive ? 36 : 12,
      decoration: BoxDecoration(
          color: isActive ? primaryColor : primaryColor.withOpacity(0.4),
          borderRadius: BorderRadius.circular(12)),
    );
  }
}
