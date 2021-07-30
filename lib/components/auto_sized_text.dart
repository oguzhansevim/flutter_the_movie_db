import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class AutoSizedText extends StatelessWidget {
  final String text;
  final TextStyle? style;

  const AutoSizedText({required this.text, this.style});

  @override
  Widget build(BuildContext context) {
    return AutoSizeText(
      text,
      style: style,
      overflow: TextOverflow.ellipsis,
      maxLines: 5,
    );
  }
}
