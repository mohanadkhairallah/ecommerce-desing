import 'package:ecomm_design/presentation/resources/color_manager.dart';
import 'package:flutter/material.dart';

enum NavigationBarTabs { home, category, cart, favorite, account }

class CustomNavigationBar extends StatefulWidget {
  const CustomNavigationBar({required this.tabController, Key? key})
      : super(key: key);
  final TabController tabController;
  @override
  State<CustomNavigationBar> createState() => _CustomNavigationBarState();
}

class _CustomNavigationBarState extends State<CustomNavigationBar> {
  // NavigationBarTabs selectedTab = NavigationBarTabs.home;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.only(left: 16.0, right: 16, bottom: 16),
        child: Container(
          height: 50,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(
              Radius.circular(12),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.grey,
                blurRadius: 5,
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              NavigationBarItem(
                icon: Icons.home_outlined,
                isSelected: widget.tabController.index == 0,
                onTap: () {
                  setState(() {
                    widget.tabController.index = 0;
                  });
                },
              ),
              NavigationBarItem(
                icon: Icons.list_alt,
                isSelected: widget.tabController.index == 1,
                onTap: () {
                  setState(() {
                    widget.tabController.index = 1;
                  });
                },
              ),
              NavigationBarItem(
                icon: Icons.shopping_cart_outlined,
                isSelected: widget.tabController.index == 2,
                onTap: () {
                  setState(() {
                    widget.tabController.index = 2;
                  });
                },
              ),
              NavigationBarItem(
                icon: Icons.favorite_border,
                isSelected: widget.tabController.index == 3,
                onTap: () {
                  setState(() {
                    widget.tabController.index = 3;
                  });
                },
              ),
              NavigationBarItem(
                icon: Icons.person_outline_rounded,
                isSelected: widget.tabController.index == 4,
                onTap: () {
                  setState(() {
                    widget.tabController.index = 4;
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class NavigationBarItem extends StatelessWidget {
  const NavigationBarItem(
      {Key? key,
      required this.isSelected,
      required this.onTap,
      required this.icon})
      : super(key: key);
  final bool isSelected;
  final IconData icon;
  final void Function() onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Icon(
        icon,
        size: 28,
        color: isSelected ? ColorManager.primaryColor : Colors.grey,
      ),
    );
  }
}
