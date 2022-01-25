import 'package:get/get.dart';

import 'package:pos_rest/app/modules/dashboard/bindings/dashboard_binding.dart';
import 'package:pos_rest/app/modules/dashboard/views/dashboard_view.dart';
import 'package:pos_rest/app/modules/home/bindings/home_binding.dart';
import 'package:pos_rest/app/modules/home/views/home_view.dart';
import 'package:pos_rest/app/modules/reciept/bindings/reciept_binding.dart';
import 'package:pos_rest/app/modules/reciept/views/reciept_view.dart';
import 'package:pos_rest/app/modules/reciept_preview/bindings/reciept_preview_binding.dart';
import 'package:pos_rest/app/modules/reciept_preview/views/reciept_preview_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.DASHBOARD,
      page: () => DashboardView(),
      binding: DashboardBinding(),
    ),
    GetPage(
      name: _Paths.RECIEPT_PREVIEW,
      page: () => RecieptPreviewView(),
      binding: RecieptPreviewBinding(),
    ),
    GetPage(
      name: _Paths.RECIEPT,
      page: () => RecieptView(),
      binding: RecieptBinding(),
    ),
  ];
}
