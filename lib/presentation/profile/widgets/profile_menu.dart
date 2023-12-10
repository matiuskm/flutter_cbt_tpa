import 'package:cbt_tpa_app/core/constants/theme.dart';
import 'package:flutter/material.dart';

class ProfileMenu extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;

  const ProfileMenu({
    super.key,
    required this.label,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              label,
              style: const TextStyle(
                color: primaryColor,
              ),
            ),
            const Icon(
              Icons.chevron_right,
              color: primaryColor,
            ),
          ],
        ),
      ),
    );
  }
}
