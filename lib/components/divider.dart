import 'package:flutter/material.dart';

class CustomDivider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Divider(
        color: Colors.grey.withOpacity(0.4),
        thickness: 0.5,
        indent: 16,
        endIndent: 16,
      ),
    );
  }
}
