import 'package:flutter/material.dart';

class CloseButton extends StatelessWidget {
  final Color color;

  const CloseButton({
    super.key,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).pop(),
      child: Container(
        height: 45,
        width: 45,
        decoration: BoxDecoration(
          color: color,
          borderRadius: const BorderRadius.only(
            topRight: Radius.circular(20),
            bottomLeft: Radius.circular(20),
          ),
        ),
        child: const Icon(Icons.close, color: Colors.white),
      ),
    );
  }
}
