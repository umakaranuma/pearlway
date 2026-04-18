import 'package:flutter/material.dart';

class PearlButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final bool isGhost;
  
  const PearlButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.isGhost = false,
  });

  @override
  Widget build(BuildContext context) {
    if (isGhost) {
      return TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          foregroundColor: const Color(0xFF4A5E5C), // ink3
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 7),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: Text(text),
      );
    }
    
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(text),
    );
  }
}
