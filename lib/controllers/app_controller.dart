// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:klshi_mall/app/enums.dart';
// import 'package:klshi_mall/data/api_call/home_data_Api.dart';
// import 'package:klshi_mall/presentation/screens/auth_screen/auth_screen.dart';
// import 'package:klshi_mall/presentation/widgets/dialogs/close_app_dialog.dart';
//
// import '../app/global_controllers.dart';
// import '../models/home_data_model.dart';
//
// class AppController extends GetxController
//     with GetSingleTickerProviderStateMixin {
//   @override
//   Future<void> onInit() async {
//     super.onInit();
//   }
//
//   @override
//   void onClose() {}
//
//   @override
//   Future<void> onReady() async {
//     getHomeData();
//   }
//
//   bool isMember = false;
//
//   final GlobalKey<ScaffoldState> homeScaffoldKey = GlobalKey();
//
//   RxBool searchFiledIsShown = true.obs;
//   RxBool appBarEdges = false.obs;
//   RxBool appBarWithSearch = true.obs;
//
//   HomeDataModel? homeDataModel;
//
//   void test() {
//     CloseAppConfirmationDialog.openDialog();
//   }
//
//   void getHomeData() {
//     HomeDataApi.get(LanguageEnum.Ar).then((value) {
//       homeDataModel = value;
//       navigationController.initHomeTabController();
//       Get.off(AuthScreen());
//     });
//   }
// }
