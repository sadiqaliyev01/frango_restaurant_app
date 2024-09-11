import 'package:flutter/material.dart';

class CustomExpansionPanel extends StatelessWidget {
  final String title;
  final IconData leadingIcon;
  final List<Widget> children;

  const CustomExpansionPanel({
    super.key,
    required this.title,
    required this.leadingIcon,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey[900],
        borderRadius: BorderRadius.circular(15),
      ),
      child: ExpansionTile(
        title: Row(
          children: [
            Icon(leadingIcon, color: Colors.white),
            const SizedBox(width: 10),
            Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: children,
            ),
          ),
        ],
      ),
    );
  }
}
