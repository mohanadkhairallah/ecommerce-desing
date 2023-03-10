import 'package:ecomm_design/models/product_model.dart';
import 'package:ecomm_design/presentation/screens/add_to_cart_screens/add_to_card_images_screen.dart';
import 'package:ecomm_design/presentation/screens/product_details/widgets/about_brand_item.dart';
import 'package:ecomm_design/presentation/screens/product_details/widgets/product_details_item.dart';
import 'package:ecomm_design/presentation/screens/product_details/widgets/shipping_poduct_item.dart';
import 'package:ecomm_design/presentation/widgets/custom_button.dart';
import 'package:flutter/material.dart';

import '../../resources/color_manager.dart';
import '../../widgets/custom_icon_button.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
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
                    'Product Details',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  CustomIconButton(
                    icon: Icons.favorite_border,
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
                          child: Container(
                            color: ColorManager.primaryColor.withOpacity(0.1),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Image.asset(
                                DummyProducts.dummyProduct1.image,
                                width: double.infinity,
                                height: 200,
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  DummyProducts.dummyProduct1.name,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16),
                                ),
                                Text(DummyProducts.dummyProduct1.desc),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  DummyProducts.dummyProduct1.price,
                                  style: TextStyle(
                                      color: ColorManager.primaryColor,
                                      fontSize: 16),
                                ),
                                Text(
                                  DummyProducts.dummyProduct1.oldPrice,
                                  style: TextStyle(
                                    decoration: TextDecoration.lineThrough,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                          'Long Details desc Long Details desc Long Details desc Long Details desc Long Details desc Long Details desc Long Details desc Long Details desc Long Details desc Long Details desc Long Details desc Long Details desc ',
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Container(
                                  width: 50,
                                  height: 50,
                                  decoration: const BoxDecoration(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(12),
                                    ),
                                    color: Colors.yellow,
                                  ),
                                  child: Icon(
                                    Icons.star_border_outlined,
                                    color: Colors.white,
                                    size: 32,
                                  ),
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                                Text(
                                  '3.9',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Container(
                                  width: 50,
                                  height: 50,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(12),
                                      ),
                                      color: Colors.white,
                                      border: Border.all(
                                        color: ColorManager.primaryColor
                                            .withOpacity(0.4),
                                      )),
                                  child: Icon(
                                    Icons.remove,
                                    color: ColorManager.primaryColor,
                                    size: 32,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16.0),
                                  child: Text(
                                    '2',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Container(
                                  width: 50,
                                  height: 50,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(12),
                                      ),
                                      color: Colors.white,
                                      border: Border.all(
                                        color: ColorManager.primaryColor
                                            .withOpacity(0.4),
                                      )),
                                  child: Icon(
                                    Icons.add,
                                    color: ColorManager.primaryColor,
                                    size: 32,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: CustomButton(
                          color: ColorManager.primaryColor,
                          label: 'Add to Cart',
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const AddToCardImagesScreen()),
                            );
                          },
                        ),
                      ),
                      ProductDetailsItem(),
                      AboutBrandItem(),
                      ShippingProductItem(),
                      SizedBox(
                        height: 24,
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
