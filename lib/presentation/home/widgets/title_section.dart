import 'package:cbt_tpa_app/core/constants/theme.dart';
import 'package:flutter/material.dart';

class TitleSection extends StatelessWidget {
  final String title;
  final VoidCallback onSeeAllTap;

  const TitleSection({
    super.key,
    required this.title,
    required this.onSeeAllTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: poppinsFont24semiBold,
          ),
          InkWell(
            onTap: onSeeAllTap,
            child: Text(
              'See all',
              style: poppinsLink16w500,
            ),
          ),
        ],
      ),
    );
  }
}
