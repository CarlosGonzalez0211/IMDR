import 'package:flutter/material.dart';

class TitleText extends StatelessWidget {
  final double size;
  final FontWeight fontWeight;
  final Color? colors;
  final String text;
  final String upperText;
  final double upperTextSize;

  const TitleText({
    super.key,
    required this.size,
    required this.fontWeight,
    required this.colors,
    required this.upperText,
    required this.text,
    required this.upperTextSize
  });

  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
          Text(
            upperText,
            textAlign: TextAlign.left, // Aligns text to the left
            style: TextStyle(
              color: Colors.grey,
              fontSize: upperTextSize,
            ),
          ),
          Text(
            text,
            textAlign: TextAlign.left, // Aligns text to the left
            style: TextStyle(
              color: colors,
              fontWeight: fontWeight,
              fontSize: size,
            ),
          ),
        ],
      );
  }
}
