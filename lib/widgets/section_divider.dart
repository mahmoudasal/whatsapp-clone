import 'package:flutter/material.dart';

class SectionDivider extends StatelessWidget {
  final double indent;
  final double height;

  const SectionDivider({super.key, this.indent = 0.0, this.height = 1.0});

  @override
  Widget build(BuildContext context) {
    return Divider(
      indent: indent,
      height: height,
      thickness: 1,
      color: const Color(0xFFE0E0E0),
    );
  }
}
