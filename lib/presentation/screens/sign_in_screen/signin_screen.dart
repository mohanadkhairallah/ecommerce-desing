import 'package:ecomm_design/presentation/resources/color_manager.dart';
import 'package:ecomm_design/presentation/screens/home_screen/home_screen.dart';
import 'package:ecomm_design/presentation/widgets/custom_button.dart';
import 'package:flutter/material.dart';

import '../../resources/assets_manager.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 64.0),
                  child: Container(
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
                ),
                Column(
                  children: [
                    SignInCustomInputField(
                      label: 'Full Name',
                      icon: Icons.person_outline_rounded,
                      textEditingController: TextEditingController()
                        ..text = 'Protech Group',
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    SignInCustomInputField(
                      label: 'Email address',
                      icon: Icons.email_outlined,
                      textInputType: TextInputType.emailAddress,
                      textEditingController: TextEditingController(),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    SignInCustomInputField(
                      label: 'Phone number',
                      icon: Icons.local_phone_outlined,
                      textInputType: TextInputType.phone,
                      textEditingController: TextEditingController(),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    SignInCustomInputField(
                      label: 'Password',
                      icon: Icons.lock_outline,
                      isPassword: true,
                      textEditingController: TextEditingController(),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8.0, vertical: 24),
                      child: CustomButton(
                          color: ColorManager.primaryColor,
                          label: 'Create an Account',
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const HomeScreen()),
                            );
                          }),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 64.0, vertical: 24),
                      child: RichText(
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        text: const TextSpan(
                          children: <TextSpan>[
                            TextSpan(
                              text: "By signing up, you agree to our ",
                              style: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                            TextSpan(
                              text: "Terms ",
                              style: TextStyle(
                                fontWeight: FontWeight.normal,
                                color: ColorManager.primaryColor,
                              ),
                            ),
                            TextSpan(
                              text: "And ",
                              style: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                            TextSpan(
                              text: "Conditions of use. ",
                              style: TextStyle(
                                fontWeight: FontWeight.normal,
                                color: ColorManager.primaryColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SignInCustomInputField extends StatefulWidget {
  const SignInCustomInputField({
    Key? key,
    required this.icon,
    required this.label,
    this.textInputType,
    this.initValue,
    required this.textEditingController,
    this.isPassword = false,
  }) : super(key: key);
  final IconData icon;
  final String label;
  final TextInputType? textInputType;
  final String? initValue;
  final TextEditingController textEditingController;
  final bool isPassword;

  @override
  State<SignInCustomInputField> createState() => _SignInCustomInputFieldState();
}

class _SignInCustomInputFieldState extends State<SignInCustomInputField> {
  bool _obscure = false;
  bool _fieldIsSat = false;
  @override
  void initState() {
    if (widget.isPassword) _obscure = true;
    if (!widget.isPassword) {
      if (widget.textEditingController.text != '') {
        setState(() {
          _fieldIsSat = true;
        });
      }
      widget.textEditingController.addListener(() {
        setState(() {
          _fieldIsSat = widget.textEditingController.text != '';
        });
      });
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(
              Radius.circular(12),
            ),
            color: ColorManager.primaryColor.withOpacity(0.2),
          ),
          child: Icon(
            widget.icon,
            color: ColorManager.primaryColor,
            size: 28,
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: TextField(
              controller: widget.textEditingController,
              obscureText: _obscure,
              keyboardType: widget.textInputType,
              style: const TextStyle(
                color: ColorManager.primaryColor,
              ),
              decoration: InputDecoration(
                filled: true,
                contentPadding: const EdgeInsets.symmetric(vertical: 8),
                fillColor: Colors.transparent,
                hintText: widget.label,
                suffixIcon: widget.isPassword
                    ? GestureDetector(
                        onTap: () {
                          setState(() => _obscure = !_obscure);
                        },
                        child: _obscure
                            ? const Icon(
                                Icons.remove_red_eye_outlined,
                                color: ColorManager.primaryColor,
                              )
                            : const Icon(
                                Icons.remove_red_eye,
                                color: ColorManager.primaryColor,
                              ),
                      )
                    : Icon(
                        Icons.check,
                        color: _fieldIsSat ? Colors.green : Colors.transparent,
                      ),
                label: Text(
                  widget.label,
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                hintStyle: const TextStyle(color: Colors.black45),
                enabledBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.black45),
                ),
                focusedBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: ColorManager.primaryColor,
                  ),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
