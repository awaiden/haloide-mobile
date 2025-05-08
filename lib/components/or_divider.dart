import 'package:flutter/material.dart';

class OrDivider extends StatelessWidget {
  final String text;
  final Color lineColor;
  final TextStyle? textStyle;
  final double thickness;
  final double spacing;

  const OrDivider({
    super.key,
    this.text = 'OR',
    this.lineColor = Colors.grey,
    this.textStyle,
    this.thickness = 1.0,
    this.spacing = 8.0,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: Divider(color: lineColor, thickness: thickness)),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: spacing),
          child: Text(text, style: textStyle ?? TextStyle(color: lineColor)),
        ),
        Expanded(child: Divider(color: lineColor, thickness: thickness)),
      ],
    );
  }
}
