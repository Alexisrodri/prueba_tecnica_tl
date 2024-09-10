import 'package:flutter/material.dart';

class CustomSelect extends StatelessWidget {
  final String name;
  final VoidCallback onLeftArrowPressed;
  final VoidCallback onRightArrowPressed;

  const CustomSelect({
    super.key,
    required this.name,
    required this.onLeftArrowPressed,
    required this.onRightArrowPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.transparent,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const IconButton(
            icon: Icon(Icons.chevron_left),
            onPressed: null,
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(8)),
            child: Text(
              name,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.chevron_right),
            onPressed: onRightArrowPressed,
            color: Colors.black,
          ),
        ],
      ),
    );
  }
}
