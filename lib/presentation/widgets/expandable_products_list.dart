import 'package:ecomm_design/models/product_model.dart';
import 'package:ecomm_design/presentation/screens/product_details/product_details_screen.dart';
import 'package:flutter/material.dart';

import '../resources/color_manager.dart';

class ExpandableProductsList extends StatefulWidget {
  const ExpandableProductsList(
      {Key? key, this.isExpanded = true, required this.title})
      : super(key: key);

  final String title;
  final bool isExpanded;

  @override
  State<ExpandableProductsList> createState() => _ExpandableProductsListState();
}

class _ExpandableProductsListState extends State<ExpandableProductsList> {
  bool expanded = true;
  @override
  void initState() {
    expanded = widget.isExpanded;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
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
                child: const Icon(
                  Icons.local_fire_department_outlined,
                  color: ColorManager.primaryColor,
                  size: 28,
                ),
              ),
              const SizedBox(
                width: 16,
              ),
              Text(
                widget.title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Expanded(child: Container()),
              GestureDetector(
                onTap: () {
                  setState(() {
                    expanded = !expanded;
                  });
                },
                child: Container(
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
                    expanded
                        ? Icons.arrow_forward_ios_rounded
                        : Icons.open_in_full,
                    color: ColorManager.primaryColor,
                  ),
                ),
              ),
            ],
          ),
        ),
        if (expanded)
          GridView.builder(
              primary: false,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, mainAxisExtent: 313),
              itemCount: DummyProducts.dummyList.length,
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index) {
                return ProductCard(
                  productModel: DummyProducts.dummyList[index],
                );
              }),
      ],
    );
  }
}

class ProductCard extends StatelessWidget {
  const ProductCard({required this.productModel, Key? key}) : super(key: key);
  final ProductModel productModel;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const ProductDetailsScreen()),
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              alignment: AlignmentDirectional.topEnd,
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(12),
                  ),
                  child: Container(
                    color: ColorManager.primaryColor.withOpacity(0.1),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset(
                        productModel.image,
                        width: double.infinity,
                        height: 200,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),
                const Positioned(
                  right: 5,
                  top: 3,
                  child: Icon(
                    Icons.more_horiz,
                    color: ColorManager.primaryColor,
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(2.0),
              child: Text(
                productModel.name,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(2.0),
              child: Text(
                productModel.desc,
                style: TextStyle(
                  color: ColorManager.primaryColor.withOpacity(0.6),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(2.0),
              child: Row(
                children: [
                  Text(
                    productModel.price,
                    style: const TextStyle(
                      color: ColorManager.primaryColor,
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  Text(
                    productModel.oldPrice,
                    style: const TextStyle(
                      color: Colors.grey,
                      decoration: TextDecoration.lineThrough,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
