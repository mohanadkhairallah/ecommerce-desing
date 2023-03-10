import 'package:ecomm_design/presentation/screens/home_screen/widgets/account_tab.dart';
import 'package:ecomm_design/presentation/screens/home_screen/widgets/cart_tab.dart';
import 'package:ecomm_design/presentation/screens/home_screen/widgets/category_tab.dart';
import 'package:ecomm_design/presentation/screens/home_screen/widgets/favorite_tab.dart';
import 'package:ecomm_design/presentation/screens/home_screen/widgets/home_tab.dart';
import 'package:flutter/material.dart';

import '../../widgets/custome_navigation_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 5, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TabBarView(
        controller: tabController,
        children: [
          HomeTab(),
          CategoryTab(),
          CartTab(),
          FavoriteTab(),
          AccountTab(),
        ],
      ),
      bottomNavigationBar: CustomNavigationBar(
        tabController: tabController,
      ),
    );
  }
}
