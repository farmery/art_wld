import 'package:flutter/material.dart';

import '../utils/app_colors.dart';
import '../utils/text_styles.dart';

class Btn extends StatelessWidget {
  const Btn({
    Key? key,
    this.onTap,
    required this.label,
    this.color,
    this.width,
    this.icon,
  }) : super(key: key);
  final VoidCallback? onTap;
  final String label;
  final Color? color;
  final double? width;
  final Widget? icon;

  @override
  Widget build(BuildContext context) {
    final colors = AppColors();
    final styles = TextStyles();
    return InkWell(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 400),
        height: 50,
        width: width ?? double.infinity,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(icon == null ? 5 : 100),
          color: color ?? colors.accent,
        ),
        child: icon ??
            Text(label, style: styles.bodyBold.copyWith(color: colors.white)),
      ),
    );
  }
}
