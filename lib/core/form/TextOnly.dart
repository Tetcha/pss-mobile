import 'package:flutter/material.dart';
import 'package:pss_mobile/core/extensions/string.dart';

class TextOnly extends StatelessWidget {
  final String label;
  final String value;
  const TextOnly({super.key, this.label = '', this.value = ''});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 5),
        Text(
          label.capitalize(),
          textAlign: TextAlign.left,
          style: const TextStyle(
            fontSize: 12,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 5),
        Text(
          value,
          textAlign: TextAlign.left,
          style: const TextStyle(
            fontSize: 16,
          ),
        ),
      ],
    );
  }
}
