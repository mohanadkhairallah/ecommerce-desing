import 'package:ecomm_design/presentation/screens/product_details/widgets/product_details_field_header.dart';
import 'package:flutter/material.dart';

class AboutBrandItem extends StatelessWidget {
  const AboutBrandItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ProductDetailsFieldHeader(
          title: 'About brand',
          icon: Icons.book,
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            'About brand text About brand text About brand text About brand text About brand text About brand text About brand text About brand text About brand text About brand text About brand text About brand text ',
          ),
        ),
      ],
    );
  }
}
