import 'package:flutter/material.dart';

import '../../../resources/color_manager.dart';

class ProductDetailsFieldHeader extends StatelessWidget {
  const ProductDetailsFieldHeader(
      {Key? key, required this.title, required this.icon})
      : super(key: key);
  final String title;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        children: [
          Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(
                Radius.circular(12),
              ),
              color: ColorManager.primaryColor.withOpacity(0.1),
            ),
            child: Icon(
              icon,
              color: ColorManager.primaryColor,
              size: 28,
            ),
          ),
          const SizedBox(
            width: 16,
          ),
          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          Expanded(child: Container()),
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(
                  Radius.circular(12),
                ),
                border: Border.all(
                  color: ColorManager.primaryColor.withOpacity(0.6),
                  width: 1.5,
                ),
                color: Colors.white),
            child: Icon(
              Icons.arrow_forward_ios_rounded,
              color: ColorManager.primaryColor,
            ),
          ),
        ],
      ),
    );
  }
}
