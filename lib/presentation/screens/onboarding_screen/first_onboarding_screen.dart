import 'package:ecomm_design/presentation/resources/assets_manager.dart';
import 'package:ecomm_design/presentation/resources/color_manager.dart';
import 'package:ecomm_design/presentation/screens/onboarding_screen/sec_onboarding_screen.dart';
import 'package:flutter/material.dart';

import '../../widgets/avatars_stack.dart';
import '../../widgets/custom_button.dart';

class FirstOnBoardingScreen extends StatelessWidget {
  const FirstOnBoardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(ImageManager.backgroud2),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        children: [
          const Expanded(child: SizedBox()),
          Container(
            height: 400,
            width: double.infinity,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(14),
                topRight: Radius.circular(14),
              ),
            ),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 32.0, horizontal: 32),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  AvatarsStack(),
                  const Text(
                    'Lets Start active cooperation!',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 32,
                    ),
                  ),
                  const Text(
                    'We have been proud to supp people who use our platform to reach for their dreams.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                    ),
                  ),
                  CustomButton(
                      label: 'Next',
                      color: ColorManager.primaryColor,
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const SecOnBoardingScreen()),
                        );
                      }),
                ],
              ),
            ),
          )
        ],
      ),
    ));
  }
}
