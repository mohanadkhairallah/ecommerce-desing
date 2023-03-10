import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {
  const CustomIconButton({Key? key, this.onPressed, required this.icon})
      : super(key: key);

  final void Function()? onPressed;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: 50,
        height: 50,
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(12),
            ),
            boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 5)],
            color: Colors.white),
        child: Icon(icon),
      ),
    );
  }
}
