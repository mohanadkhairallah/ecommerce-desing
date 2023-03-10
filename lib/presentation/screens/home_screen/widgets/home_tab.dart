import 'package:ecomm_design/presentation/resources/assets_manager.dart';
import 'package:ecomm_design/presentation/widgets/custom_icon_button.dart';
import 'package:flutter/material.dart';

import '../../../widgets/expandable_products_list.dart';
import '../../../widgets/filter_header.dart';
import '../../../widgets/free_shipping_card.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({Key? key}) : super(key: key);

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
                  'Hi, ProTech',
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
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: Row(
              children: const [
                Expanded(
                  child: Center(
                    child: SizedBox(
                      height: 40,
                      child: FilterHeader(
                        filters: ['All', 'Men', 'Women', 'Kids'],
                      ),
                    ),
                  ),
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
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: ClipRRect(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(12),
                        ),
                        child: Image.asset(
                          ImageManager.banner,
                          width: double.infinity,
                          height: 200,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const ExpandableProductsList(
                      title: 'New Arrivals',
                    ),
                    const Padding(
                      padding: EdgeInsets.all(16.0),
                      child: FreeShippingCard(),
                    ),
                    const ExpandableProductsList(
                      title: 'Most Popular',
                    ),
                    const SizedBox(
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
