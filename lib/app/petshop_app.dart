import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:petshop_app/app/app_routes.dart';

import 'app_pages.dart';
import 'ui/splash/splash_page.dart';

class PetShopApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.INITIAL,
      defaultTransition: Transition.fade,
      getPages: AppPages.routes,
      home: SplashPage(),
    );
  }
}
