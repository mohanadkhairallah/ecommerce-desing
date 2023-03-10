import 'package:ecomm_design/presentation/resources/color_manager.dart';
import 'package:ecomm_design/presentation/screens/product_details/widgets/product_details_field_header.dart';
import 'package:flutter/material.dart';

class ProductDetailsItem extends StatelessWidget {
  const ProductDetailsItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ProductDetailsFieldHeader(
          title: 'Details',
          icon: Icons.settings_suggest_outlined,
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              ProductDetailsLine(
                title: 'Material',
                content: '70% texttile',
                isColored: true,
              ),
              ProductDetailsLine(
                title: 'Sizes',
                content: '7.5, 8, 8.5, 9',
                isColored: false,
              ),
              ProductDetailsLine(
                title: 'Gender',
                content: 'Men',
                isColored: true,
              ),
              ProductDetailsLine(
                title: 'Country',
                content: 'Syria',
                isColored: false,
              ),
              ProductDetailsLine(
                title: 'Code',
                content: 'AD-65151',
                isColored: true,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class ProductDetailsLine extends StatelessWidget {
  const ProductDetailsLine(
      {Key? key,
      required this.title,
      required this.content,
      required this.isColored})
      : super(key: key);
  final String title;
  final String content;
  final bool isColored;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: isColored
            ? ColorManager.primaryColor.withOpacity(0.2)
            : Colors.white,
      ),
      child: Row(
        children: [
          SizedBox(
            width: 75,
            child: Text(
              title,
            ),
          ),
          Text(content),
        ],
      ),
    );
  }
}
