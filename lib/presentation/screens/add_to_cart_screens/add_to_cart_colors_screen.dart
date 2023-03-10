import 'package:ecomm_design/models/product_color.dart';
import 'package:ecomm_design/models/product_model.dart';
import 'package:ecomm_design/presentation/resources/color_manager.dart';
import 'package:flutter/material.dart';

import '../../widgets/custom_button.dart';
import '../../widgets/custom_icon_button.dart';

class AddToCardColorsScreen extends StatefulWidget {
  const AddToCardColorsScreen({Key? key}) : super(key: key);

  @override
  State<AddToCardColorsScreen> createState() => _AddToCardColorsScreenState();
}

class _AddToCardColorsScreenState extends State<AddToCardColorsScreen> {
  ProductModel product = DummyProducts.dummyProduct1;

  int selectedColorIndex = 0;
  int selectedSizeIndex = 0;

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
                  product.productColors![selectedColorIndex].image,
                  key: ValueKey<int>(selectedColorIndex),
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
                      height: 50,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemCount: product.productColors!.length,
                        itemBuilder: (context, index) {
                          return ColorPickerItem(
                            isSelected: selectedColorIndex == index,
                            productColor: product.productColors![index],
                            onPressed: () {
                              setState(() {
                                selectedColorIndex = index;
                              });
                            },
                          );
                        },
                      ),
                    ),
                    SizedBox(
                      height: 64,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemCount: 9,
                        itemBuilder: (context, index) {
                          return SizePickerItem(
                            isSelected: selectedSizeIndex == index,
                            onPressed: () {
                              setState(() {
                                selectedSizeIndex = index;
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

class SizePickerItem extends StatelessWidget {
  const SizePickerItem(
      {Key? key, required this.isSelected, required this.onPressed})
      : super(key: key);
  final bool isSelected;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: isSelected
                  ? Colors.white
                  : ColorManager.primaryColor.withOpacity(0.6),
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(12),
            ),
            color: Colors.white,
            boxShadow: isSelected
                ? [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 5,
                    )
                  ]
                : [],
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'M',
              style: TextStyle(
                color: isSelected ? Colors.black : ColorManager.primaryColor,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ColorPickerItem extends StatelessWidget {
  const ColorPickerItem(
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
          alignment: Alignment.center,
          children: [
            Icon(
              Icons.circle,
              color: productColor.color,
              size: 38,
            ),
            if (isSelected)
              Padding(
                padding: const EdgeInsets.only(top: 4.0),
                child: Icon(
                  Icons.check,
                  color: Colors.white,
                  size: 22,
                ),
              )
          ],
        ),
      ),
    );
  }
}
