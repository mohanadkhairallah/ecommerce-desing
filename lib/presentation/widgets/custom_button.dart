import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {this.onPressed,
      required this.color,
      required this.label,
      this.filled = true,
      Key? key})
      : super(key: key);
  final void Function()? onPressed;
  final String label;
  final Color color;
  final bool filled;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          foregroundColor:
              MaterialStateProperty.all<Color>(filled ? Colors.white : color),
          backgroundColor:
              MaterialStateProperty.all<Color>(filled ? color : Colors.white),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
              // side: BorderSide(color: Colors.red)
            ),
          ),
          side: MaterialStateProperty.all<BorderSide>(
            BorderSide(color: color),
          ),
        ),
        child: Text(label),
      ),
    );
  }
}
