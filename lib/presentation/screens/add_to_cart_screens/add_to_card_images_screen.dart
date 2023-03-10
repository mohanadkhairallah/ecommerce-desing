import 'package:ecomm_design/models/product_color.dart';
import 'package:ecomm_design/models/product_model.dart';
import 'package:ecomm_design/presentation/resources/color_manager.dart';
import 'package:ecomm_design/presentation/screens/add_to_cart_screens/add_to_cart_colors_screen.dart';
import 'package:flutter/material.dart';

import '../../widgets/custom_button.dart';
import '../../widgets/custom_icon_button.dart';

class AddToCardImagesScreen extends StatefulWidget {
  const AddToCardImagesScreen({Key? key}) : super(key: key);

  @override
  State<AddToCardImagesScreen> createState() => _AddToCardImagesScreenState();
}

class _AddToCardImagesScreenState extends State<AddToCardImagesScreen> {
  ProductModel product = DummyProducts.dummyProduct1;

  int selectedImageIndex = 0;

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
                  CustomIconButton(
                    icon: Icons.search,
                  ),
                ],
              ),
            ),
            Expanded(
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 500),
                transitionBuilder: (Widget child, Animation<double> animation) {
                  return ScaleTransition(scale: animation, child: child);
                },
                child: Image.asset(
                  product.productColors![selectedImageIndex].image,
                  key: ValueKey<int>(selectedImageIndex),
                ),
              ),
            ),
            Container(
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
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Column(
                  children: [
                    Text(
                      product.name,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(product.desc),
                    ),
                    SizedBox(
                      height: 100,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemCount: product.productColors!.length,
                        itemBuilder: (context, index) {
                          return ImageCard(
                            isSelected: selectedImageIndex == index,
                            productColor: product.productColors![index],
                            onPressed: () {
                              setState(() {
                                selectedImageIndex = index;
                              });
                            },
                          );
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: CustomButton(
                        color: ColorManager.primaryColor,
                        label: 'Add To Cart',
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const AddToCardColorsScreen()),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ImageCard extends StatelessWidget {
  const ImageCard(
      {Key? key,
      required this.isSelected,
      required this.productColor,
      required this.onPressed})
      : super(key: key);
  final bool isSelected;
  final ProductColor productColor;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Stack(
          alignment: AlignmentDirectional.topEnd,
          children: [
            Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(12),
                ),
                boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 5)],
                color: Colors.white,
              ),
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Image.asset(productColor.image),
              ),
            ),
            if (isSelected)
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(
                  Icons.circle,
                  color: ColorManager.primaryColor,
                  size: 8,
                ),
              )
          ],
        ),
      ),
    );
  }
}
