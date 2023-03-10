import 'package:ecomm_design/presentation/resources/assets_manager.dart';
import 'package:flutter/material.dart';

import '../../../widgets/category_card.dart';
import '../../../widgets/custom_icon_button.dart';
import '../../../widgets/expandable_products_list.dart';

class CategoryTab extends StatelessWidget {
  const CategoryTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 32.0,
              vertical: 16,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomIconButton(
                  icon: Icons.arrow_back_ios_new_rounded,
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                Text(
                  'Category',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                CustomIconButton(
                  icon: Icons.search,
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(14),
                    topRight: Radius.circular(14),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey[400]!,
                      blurRadius: 5,
                    )
                  ]),
              child: SingleChildScrollView(
                child: Column(
                  children: const [
                    CategoryCard(
                      color: Color(0xFF4a91bc),
                      image: ImageManager.product1,
                      title: 'Men',
                    ),
                    CategoryCard(
                      color: Color(0xFFf76b5f),
                      image: ImageManager.product2,
                      title: 'Women',
                    ),
                    CategoryCard(
                      color: Color(0xFF8e5fb8),
                      image: ImageManager.product3,
                      title: 'Kids',
                    ),
                    ExpandableProductsList(
                      title: 'Brand',
                      isExpanded: false,
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    ExpandableProductsList(
                      title: 'Brand',
                      isExpanded: false,
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    ExpandableProductsList(
                      title: 'Brand',
                      isExpanded: false,
                    ),
                    SizedBox(
                      height: 16,
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
