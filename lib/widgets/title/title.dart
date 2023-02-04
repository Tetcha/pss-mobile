import 'package:flutter/cupertino.dart';
import 'package:pss_mobile/core/constants/style.dart';
import 'package:pss_mobile/core/extensions/string.dart';

class SectionTitle extends StatelessWidget {
  final String label;
  const SectionTitle({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return Text(
      label.capitalize(),
      textAlign: TextAlign.left,
      style: TextStyle(
        fontSize: StyleTheme.titleSize,
        color: StyleTheme.titleColor,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
