import 'package:ecomm_design/presentation/resources/color_manager.dart';
import 'package:ecomm_design/presentation/screens/welcome_screen/welcome_screen.dart';
import 'package:ecomm_design/presentation/widgets/custom_button.dart';
import 'package:flutter/material.dart';

import '../../resources/assets_manager.dart';

class SecOnBoardingScreen extends StatelessWidget {
  const SecOnBoardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFFf9fafc),
        body: SafeArea(
          child: Column(
            children: [
              SizedBox(
                height: 150,
                child: Padding(
                  padding: const EdgeInsets.all(32.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Welcome!',
                        style: TextStyle(fontSize: 32),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Text(
                        'We have been proud to supp people who use our platform to reach for their dreams.',
                        style: TextStyle(
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
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
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 32.0, horizontal: 32),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const _OnBoardingItem(
                          image: ImageManager.avatar0,
                        ),
                        const _OnBoardingItem(
                          image: ImageManager.avatar1,
                        ),
                        const _OnBoardingItem(
                          image: ImageManager.onBoardingImage1,
                        ),
                        CustomButton(
                            color: ColorManager.primaryColor,
                            label: 'Get Started!',
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const WelcomeScreen()),
                              );
                            }),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ));
  }
}

class _OnBoardingItem extends StatelessWidget {
  const _OnBoardingItem({required this.image, Key? key}) : super(key: key);
  final String image;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, bottom: 16, top: 16),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            height: 100,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(
                Radius.circular(18),
              ),
              border: Border.all(
                color: Colors.grey[400]!,
                width: 2,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(
                left: 80.0,
                right: 8,
                top: 8,
                bottom: 8,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: const [
                  Text(
                    'Travel',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text('Travel may be local, regional international')
                ],
              ),
            ),
          ),
          Positioned(
            left: -20,
            top: -20,
            child: Container(
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(12),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 10,
                    ),
                  ]),
              child: ClipRRect(
                borderRadius: const BorderRadius.all(
                  Radius.circular(12),
                ),
                child: Image.asset(
                  image,
                  width: 70,
                  height: 70,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
