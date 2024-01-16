import 'package:flutter/material.dart';

import '../const/color.dart';
class TileWidget extends StatelessWidget {
  const TileWidget({
    super.key,
    required this.title,
    required this.isOff,
  });
  final String title;
  final bool isOff;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 6, bottom: 6, left: 8, right: 8),
      width: 90,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: isOff ? null : lightGoldenColor),
      child: Text(
        title,
        style: TextStyle(
            color: isOff ? Colors.grey.shade400 : goldenColor,
            fontWeight: isOff ? FontWeight.w400 : FontWeight.w700,
            fontSize: 14),
      ),
    );
  }
}