import 'package:calls/utils/theme.dart';
import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  final String? label;
  final bool isSelected;
  final Icon icon;
  final Color color;
  final VoidCallback? onTap;
  const PrimaryButton({
    Key? key,
    required this.icon,
    required this.color,
    this.onTap,
    this.isSelected = false,
    this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: onTap ?? () {},
          child: icon,
          style: ButtonStyle(
            shadowColor: MaterialStateProperty.resolveWith(
              (states) => CallTheme.white.withOpacity(
                0.2,
              ),
            ),
            foregroundColor: MaterialStateProperty.resolveWith(
              (states) => CallTheme.white,
            ),
            backgroundColor: MaterialStateProperty.resolveWith(
              (states) => color,
            ),
            overlayColor: MaterialStateProperty.resolveWith(
              (states) => CallTheme.white.withOpacity(0.1),
            ),
            elevation: MaterialStateProperty.resolveWith(
              (states) => 2,
            ),
            shape: MaterialStateProperty.resolveWith(
              (states) => CircleBorder(
                side: isSelected
                    ? BorderSide(color: CallTheme.white.withOpacity(0.2))
                    : BorderSide.none,
              ),
            ),
            padding: MaterialStateProperty.resolveWith(
              (states) => const EdgeInsets.all(22),
            ),
          ),
        ),
        if (label != null) ...[
          const SizedBox(height: 12),
          Text(
            label!,
            style: TextStyle(
              color: isSelected ? CallTheme.white : CallTheme.greyish,
              fontSize: 13,
            ),
          ),
        ]
      ],
    );
  }
}
