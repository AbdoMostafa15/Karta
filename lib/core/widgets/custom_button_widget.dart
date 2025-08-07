import 'package:flutter/material.dart';
// import 'package:karta_app/core/utils/colors.dart';
import 'package:karta/core/utils/colors.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Color color;
  final double width;
  final double height;
  final VoidCallback onPressed;

  const CustomButton({
    super.key,
    required this.text,
    this.color = AppColors.primaryColor,
    this.width = 200,
    this.height = 50,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        child: Text(
          text,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
