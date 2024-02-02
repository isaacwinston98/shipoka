import 'package:flutter/material.dart';
import 'package:shipoka/app/styles/app_color.dart';
import 'package:shipoka/app/styles/fonts.dart';

class BusyButton2 extends StatelessWidget {
  const BusyButton2({
    required this.title,
    required this.onTap,
    this.disabled = false,
    this.color = AppColors.primaryColor,
    this.borderRadius,
    Key? key,
  }) : super(key: key);
  final String title;
  final Color? color;
  final VoidCallback onTap;
  final bool disabled;
  final BorderRadius? borderRadius;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: disabled ? null : onTap,
      child: Container(
        height: 48,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: borderRadius ?? BorderRadius.circular(20),
          color: disabled ? AppColors.buttonPink : color,
        ),
        child: Center(
          child: TextBody(
            title,
            color: disabled? AppColors.primaryColor : AppColors.white,
            style: const TextStyle(
              decoration: TextDecoration.none,
            ),
          ),
        ),
      ),
    );
  }
}
