import "package:flutter/material.dart";
class Button extends StatelessWidget {
   final String text;
   final Color textColor;
  final VoidCallback onPressed;
  final Color color;
  final double fontSize;
  final double borderRadius;
  const Button({
    super.key,
    required this.text,
    required this.onPressed,
    this.color = Colors.brown,
    this.fontSize = 16,
    this.borderRadius = 12,  this.textColor=Colors.black,  
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: textColor,
          fontSize: fontSize,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}