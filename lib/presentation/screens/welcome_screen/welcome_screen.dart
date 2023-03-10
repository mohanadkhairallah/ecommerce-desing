import 'package:ecomm_design/presentation/resources/color_manager.dart';
import 'package:ecomm_design/presentation/screens/sign_in_screen/signin_screen.dart';
import 'package:ecomm_design/presentation/widgets/custom_button.dart';
import 'package:flutter/material.dart';

import '../../resources/assets_manager.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
                ImageManager.whiteBackground,
              ),
              fit: BoxFit.cover),
        ),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey[400]!,
                      blurRadius: 10,
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Image.asset(
                    ImageManager.appLogo,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(64.0),
                child: Column(
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
              const SizedBox(
                height: 50,
              ),
              Padding(
                padding: const EdgeInsets.all(32.0),
                child: Row(
                  children: [
                    Expanded(
                      child: CustomButton(
                          color: ColorManager.primaryColor,
                          label: 'Sign up',
                          filled: false,
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const SignInScreen()),
                            );
                          }),
                    ),
                    const SizedBox(
                      width: 32,
                    ),
                    Expanded(
                      child: CustomButton(
                        color: ColorManager.primaryColor,
                        label: 'Sign in',
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SignInScreen()),
                          );
                        },
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
