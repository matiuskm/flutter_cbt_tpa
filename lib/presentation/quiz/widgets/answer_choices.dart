import 'package:cbt_tpa_app/core/constants/theme.dart';
import 'package:flutter/material.dart';

enum AnswerCorrection { none, selected }

class AnswerChoices extends StatelessWidget {
  final String label;
  final void Function(String value) onChanged;
  final bool isSelected;
  final AnswerCorrection answerCorrection;

  const AnswerChoices({
    super.key,
    required this.label,
    required this.onChanged,
    this.isSelected = false,
    this.answerCorrection = AnswerCorrection.none,
  });

  @override
  Widget build(BuildContext context) {
    if (answerCorrection == AnswerCorrection.selected) {
      return Container(
        padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          color: Colors.lightGreen,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              label,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
            Container(
              width: 24,
              height: 24,
              decoration: const ShapeDecoration(
                color: whiteColor,
                shape: OvalBorder(
                  side: BorderSide(width: 1, color: Colors.lightGreen),
                ),
              ),
            ),
          ],
        ),
      );
    }

    return GestureDetector(
      onTap: () => onChanged(label),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          color: whiteColor,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              label,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
            Container(
              width: 24,
              height: 24,
              decoration: ShapeDecoration(
                color: isSelected ? Colors.red.withOpacity(0.4) : whiteColor,
                shape: OvalBorder(
                  side: BorderSide(
                      width: isSelected ? 0 : 2, color: primaryColor),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
