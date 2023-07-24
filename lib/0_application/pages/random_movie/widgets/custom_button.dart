import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  
  final Widget child;
  final Color color;
  final double height;
  final double bordRadious;
  final Color textColor;
  final VoidCallback onPress;

  const CustomButton(
      {required this.child,
      required this.color,
      this.height = 60.0,
      this.bordRadious = 4.0,
      required this.textColor,
      required this.onPress});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPress,
        //style eleveted button
        style: ElevatedButton.styleFrom(
          foregroundColor: textColor,
          backgroundColor: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(bordRadious),
          ),
        ),
        //dispay text
        child: child,
      ),
    );
  }
}
