import 'package:flutter/material.dart';

import '../../../resources/assets_manager.dart';
import '../../../resources/color_manager.dart';
import '../../../widgets/custom_icon_button.dart';

class AccountTab extends StatelessWidget {
  const AccountTab({Key? key}) : super(key: key);

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
                  'Profile',
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
          CircleAvatar(
            radius: 40,
            child: ClipOval(
              child: Image.asset(
                ImageManager.avatar0,
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(bottom: 32.0, top: 16),
            child: Text(
              'ProTech Group',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
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
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Column(
                    children: const [
                      AccountNavigationItem(
                        icon: Icons.notifications_none,
                        label: 'Notifications',
                      ),
                      AccountNavigationItem(
                        icon: Icons.receipt,
                        label: 'My Orders',
                      ),
                      AccountNavigationItem(
                        icon: Icons.location_on_sharp,
                        label: 'Address',
                      ),
                      AccountNavigationItem(
                        icon: Icons.payment_outlined,
                        label: 'Payment',
                      ),
                      AccountNavigationItem(
                        icon: Icons.favorite_border,
                        label: 'WishList',
                      ),
                      AccountNavigationItem(
                        icon: Icons.settings,
                        label: 'Settings',
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class AccountNavigationItem extends StatelessWidget {
  const AccountNavigationItem(
      {Key? key, required this.icon, required this.label})
      : super(key: key);
  final IconData icon;
  final String label;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
      child: Row(
        children: [
          Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(
                Radius.circular(12),
              ),
              color: ColorManager.primaryColor.withOpacity(0.1),
            ),
            child: Icon(
              icon,
              color: ColorManager.primaryColor,
              size: 24,
            ),
          ),
          const SizedBox(
            width: 16,
          ),
          Expanded(
            child: Text(
              label,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(
                  Radius.circular(12),
                ),
                border: Border.all(
                  color: ColorManager.primaryColor.withOpacity(0.6),
                  width: 1.5,
                ),
                color: Colors.white),
            child: const Icon(
              Icons.arrow_forward_ios_rounded,
              color: ColorManager.primaryColor,
              size: 18,
            ),
          ),
        ],
      ),
    );
  }
}
