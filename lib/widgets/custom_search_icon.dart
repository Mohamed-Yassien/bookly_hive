import 'package:bookly_hive/utils/app_theme.dart';
import 'package:flutter/material.dart';

class CustomSearchIcon extends StatelessWidget {
  const CustomSearchIcon({super.key, required this.icon, this.onTap});

  final IconData icon;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 42,
      height: 42,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: AppTheme.isDarkTheme(context)
            ? Colors.white.withOpacity(.05)
            : Colors.black.withOpacity(.05),
      ),
      child: GestureDetector(
        onTap: onTap,
        child: Icon(
          icon,
          size: 22,
        ),
      ),
    );
  }
}
