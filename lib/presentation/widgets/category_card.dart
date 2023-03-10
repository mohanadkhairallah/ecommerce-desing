import 'package:ecomm_design/presentation/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard(
      {Key? key, required this.title, required this.color, required this.image})
      : super(key: key);
  final String title;
  final Color color;
  final String image;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16.0,
        vertical: 8,
      ),
      child: Container(
        height: 200,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(12),
          ),
          color: color.withOpacity(0.2),
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                children: [
                  SizedBox(
                    height: 32,
                  ),
                  Text(
                    title,
                    style: TextStyle(
                      color: color,
                      fontSize: 24,
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text('1.7k Products'),
                  SizedBox(
                    height: 24,
                  ),
                  SizedBox(
                    width: 100,
                    child: CustomButton(
                      color: color,
                      label: 'View All',
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16.0, right: 16, top: 16),
              child: Image.asset(image),
            )
          ],
        ),
      ),
    );
  }
}
