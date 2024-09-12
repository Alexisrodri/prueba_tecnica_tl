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
          IconButton(
            icon: const Icon(Icons.chevron_left),
            onPressed: null,
            color: Theme.of(context).disabledColor,
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            decoration: BoxDecoration(
                color: Theme.of(context).indicatorColor,
                borderRadius: BorderRadius.circular(8)),
            child: Text(
              name,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.chevron_right),
            onPressed: onRightArrowPressed,
            color: Theme.of(context).primaryColor,
          ),
        ],
      ),
    );
  }
}
