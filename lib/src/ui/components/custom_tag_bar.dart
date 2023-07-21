import 'package:flutter/material.dart';

class CustomTagBar extends StatelessWidget {
  const CustomTagBar({
    super.key,
    required this.backgroundColor,
    required this.children,
  });

  final Color backgroundColor;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: children,
      ),
    );
  }
}
