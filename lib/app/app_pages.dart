import 'package:get/get.dart';
import 'package:petshop_app/app/ui/ui.dart';

import 'app_routes.dart';

class AppPages {
  static final routes = [
    GetPage(
      name: Routes.INITIAL,
      page: () => SplashPage(),
    ),
    /*   GetPage(
        name: Routes.DETAILS,
        page: () => DetailsPage(),
        binding: DetailsBinding()), //dependencias de details via rota*/
  ];
}
