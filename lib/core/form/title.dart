import 'package:flutter/material.dart';
import 'package:pss_mobile/core/extensions/string.dart';

class FieldTitle extends StatelessWidget {
  final String label;
  const FieldTitle({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return Text(
      label.capitalize(),
      textAlign: TextAlign.left,
      style: const TextStyle(
        fontSize: 12,
        color: Colors.black87,
      ),
    );
  }
}
